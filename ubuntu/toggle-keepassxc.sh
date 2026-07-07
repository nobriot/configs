#!/usr/bin/env bash
# Toggle/focus-or-launch KeePassXC (X11 + GNOME Wayland).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_toggle-lib.sh
source "$DIR/_toggle-lib.sh"

# Keyboard-shortcut environments often have a minimal PATH.
export PATH="$PATH:/snap/bin:/usr/local/bin:/usr/bin"

# Matches wm_class "keepassxc" and Wayland app_id "org.keepassxc.KeePassXC".
toggle_app "keepass" keepassxc
