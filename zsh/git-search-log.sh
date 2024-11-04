#!/bin/bash

set -euo pipefail

# Ensure compatibility with fish etc by ensuring fzf uses bash for the preview command
export SHELL=/bin/bash

git log -G$@ --oneline | fzf \
    --preview-window=bottom,80% \
    --preview "echo {} | sed 's/ .*//g' | xargs git show --color" \
    --bind 'enter:execute(commit=$(echo {} | sed "s/ .*//g") && git diff-tree --no-commit-id --name-only $commit -r | fzf --preview-window=bottom,80% --preview "git show --color $commit -- $(git rev-parse --show-toplevel)/\{}")'

