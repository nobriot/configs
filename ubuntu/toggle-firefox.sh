#!/usr/bin/env bash
# Toggle/focus-or-launch Firefox (X11 + GNOME Wayland).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_toggle-lib.sh
source "$DIR/_toggle-lib.sh"

# Keyboard-shortcut environments often have a minimal PATH.
export PATH="$PATH:/snap/bin:/usr/local/bin:/usr/bin"

toggle_app "firefox" firefox
