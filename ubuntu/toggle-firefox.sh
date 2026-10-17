#!/usr/bin/env bash
# Toggle/focus-or-launch Firefox (X11 + GNOME Wayland).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_toggle-lib.sh
source "$DIR/_toggle-lib.sh"

# Keyboard-shortcut environments often have a minimal PATH.
export PATH="$PATH:/snap/bin:/usr/local/bin:/usr/bin"

# Match common Firefox WM_CLASS values (case-insensitive)
# Navigator is used by some Firefox builds/bundles.
# See: wmctrl -lx or the Window Calls extension JSON for exact values.
toggle_app "firefox|Firefox|Navigator" firefox
