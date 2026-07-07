#!/usr/bin/env bash
# Install the "Window Calls" GNOME Shell extension, which the toggle-*.sh
# scripts use to focus native Wayland windows on GNOME.
#
# GNOME Wayland blocks every external window-focus D-Bus call, so a small
# in-shell extension is the only reliable way to raise arbitrary windows.
# After running this you must log out and back in once (Wayland cannot reload
# the shell live) for the extension to load.
set -euo pipefail

UUID="window-calls@domandoman.xyz"

# `gnome-extensions enable` fails on an extension the running shell hasn't
# loaded yet (i.e. right after install, before relog), so write the UUID into
# the gsettings enabled-extensions list directly — the shell reads that list
# on login and enables the extension then.
_enable() {
  gsettings get org.gnome.shell enabled-extensions \
    | python3 -c "
import ast, sys
l = ast.literal_eval(sys.stdin.read() or '[]')
l = l if isinstance(l, list) else []
if '$UUID' not in l: l.append('$UUID')
sys.stdout.write(str(l))
" | xargs -0 gsettings set org.gnome.shell enabled-extensions
}

if gnome-extensions info "$UUID" >/dev/null 2>&1; then
  echo "$UUID already installed. Enabling..."
  _enable
  echo "If the toggle scripts still can't focus Wayland windows, log out and back in."
  exit 0
fi

SHELL_VER="$(gnome-shell --version | grep -oE '[0-9]+' | head -1)"
echo "GNOME Shell $SHELL_VER — fetching $UUID ..."

info=$(curl -fsSL "https://extensions.gnome.org/extension-info/?uuid=${UUID}&shell_version=${SHELL_VER}")
dl=$(printf '%s' "$info" | python3 -c 'import sys, json; print(json.load(sys.stdin)["download_url"])')

tmp=$(mktemp --suffix=.shell-extension.zip)
trap 'rm -f "$tmp"' EXIT
curl -fsSL "https://extensions.gnome.org${dl}" -o "$tmp"

gnome-extensions install --force "$tmp"
_enable

echo
echo "Installed $UUID."
echo ">>> Log out and back in, then it will be active. <<<"
echo "Verify with:  gnome-extensions info $UUID"
echo "Then test:    ./toggle-firefox.sh"
