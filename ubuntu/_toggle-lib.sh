# shellcheck shell=bash
# _toggle-lib.sh — focus/toggle-or-launch helper, X11 + GNOME-Wayland compatible.
#
# Source this file, then call:
#     toggle_app "<wm_class_regex>" <launch-cmd> [args...]
#
# Behaviour:
#   - a matching window exists -> raise/activate it (never minimizes)
#   - no matching window -> launch the app
#
# How windows are found:
#   - X11 session            : wmctrl / xdotool (as before).
#   - GNOME Wayland          : the "Window Calls" shell extension
#                              (window-calls@domandoman.xyz), which exposes a
#                              List/Activate/Minimize D-Bus API. Install it with
#                              ./install-window-calls.sh (one log out/in needed).
#   - Wayland, no extension  : falls through to wmctrl (covers Xwayland windows
#                              only) and finally just launches the app.
#
# Rationale: on GNOME Wayland, wmctrl/xdotool only see Xwayland windows, and
# Mutter blocks every external focus D-Bus call (Eval, FocusApp, Introspect are
# all AccessDenied), so an in-shell extension is the only reliable way to focus
# native Wayland windows.

WC_UUID="window-calls@domandoman.xyz"
WC_DEST="org.gnome.Shell"
WC_PATH="/org/gnome/Shell/Extensions/Windows"
WC_IFACE="org.gnome.Shell.Extensions.Windows"

_is_wayland() {
  [ "${XDG_SESSION_TYPE:-}" = "wayland" ] || [ -n "${WAYLAND_DISPLAY:-}" ]
}

# --- Window Calls (GNOME Wayland) -------------------------------------------

# Print the extension's window list as JSON, or fail (missing extension, etc.).
_wc_json() {
  local raw
  raw=$(gdbus call --session --dest "$WC_DEST" --object-path "$WC_PATH" \
        --method "$WC_IFACE.List" 2>/dev/null) || return 1
  [ -n "$raw" ] || return 1
  # gdbus prints the JSON wrapped in a GVariant tuple: ('<json>',)
  # ast.literal_eval unwraps it and un-escapes any quoting safely.
  printf '%s' "$raw" | python3 -c 'import sys, ast; print(ast.literal_eval(sys.stdin.read())[0])' 2>/dev/null
}

_wc_call() { # method winid
  gdbus call --session --dest "$WC_DEST" --object-path "$WC_PATH" \
    --method "$WC_IFACE.$1" "$2" >/dev/null 2>&1
}

# Return 0 if an existing window was focused, 1 otherwise.
_wc_toggle() {
  local re="$1" json id
  json=$(_wc_json) || return 1
  [ -n "$json" ] || return 1

  # Raise the first match, preferring the current workspace.
  id=$(printf '%s' "$json" | jq -r --arg re "$re" '
        [ .[]
          | select( ((.wm_class // "") | test($re; "i"))
                 or ((.wm_class_instance // "") | test($re; "i")) ) ]
        | sort_by(.in_current_workspace == true | not)
        | .[0].id // empty')
  if [ -n "$id" ]; then
    _wc_call Activate "$id"
    return 0
  fi

  return 1
}

# --- X11 / Xwayland ---------------------------------------------------------

# Return 0 if an existing window was activated, 1 otherwise.
_x11_focus() {
  local re="$1" win wid
  if command -v wmctrl >/dev/null 2>&1; then
    win=$(wmctrl -lx 2>/dev/null | awk -v re="$re" 'BEGIN{IGNORECASE=1} $0 ~ re {print $1; exit}')
    if [ -n "$win" ]; then
      wmctrl -i -a "$win" 2>/dev/null && return 0
    fi
  fi
  if command -v xdotool >/dev/null 2>&1; then
    wid=$(xdotool search --onlyvisible --class "$re" 2>/dev/null | head -n1 || true)
    [ -z "$wid" ] && wid=$(xdotool search --onlyvisible --name "$re" 2>/dev/null | head -n1 || true)
    if [ -n "$wid" ]; then
      xdotool windowactivate --sync "$wid" 2>/dev/null && return 0
    fi
  fi
  return 1
}

# --- launch -----------------------------------------------------------------

_launch() {
  # Detached so a keyboard-shortcut daemon never blocks on the app.
  setsid "$@" >/dev/null 2>&1 &
}

# --- public entry point -----------------------------------------------------

toggle_app() {
  local re="$1"; shift

  if _is_wayland; then
    _wc_toggle "$re" && return 0   # native Wayland windows (needs Window Calls)
  fi
  _x11_focus "$re" && return 0     # X11 session, or Xwayland windows on Wayland
  _launch "$@"
  return 0
}
