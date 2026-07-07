#!/usr/bin/env bash
# Toggle/focus-or-launch Alacritty (X11 + GNOME Wayland).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_toggle-lib.sh
source "$DIR/_toggle-lib.sh"

# Keyboard-shortcut environments often have a minimal PATH.
export PATH="$PATH:/snap/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/bin"

# Resolve the alacritty binary from PATH or common locations.
ALACRITTY_BIN="$(command -v alacritty 2>/dev/null || true)"
if [ -z "$ALACRITTY_BIN" ]; then
  for candidate in /snap/bin/alacritty /usr/bin/alacritty /usr/local/bin/alacritty "$HOME/.cargo/bin/alacritty"; do
    if [ -x "$candidate" ]; then ALACRITTY_BIN="$candidate"; break; fi
  done
fi
if [ -z "$ALACRITTY_BIN" ]; then
  echo "toggle-alacritty: alacritty binary not found in PATH or common locations" >&2
  exit 1
fi

toggle_app "alacritty" "$ALACRITTY_BIN"
