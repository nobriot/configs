#!/bin/bash

SESSION_NAME="main"
WINDOW_NAME="schnecken_bot"

# Attach to the session if it exists, or create it if it doesn't
# Check if the session exists, if not create it
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
    tmux new -A -s "$SESSION_NAME"
else
    tmux switch-client -t "$SESSION_NAME"
fi

# Check if the window already exists
tmux list-windows -t "$SESSION_NAME" | grep -q "$WINDOW_NAME"

# If the window doesn't exist, create it and set up the panes
if [ $? -ne 0 ]; then
    # Create a new window
    tmux new-window -t "$SESSION_NAME" -n "$WINDOW_NAME"

    # Split the window into panes
    tmux split-window -h -t "$SESSION_NAME:$WINDOW_NAME"        # Split vertically
    tmux split-window -v -t "$SESSION_NAME:$WINDOW_NAME.0"       # Split the left pane horizontally

    # Resize the bottom pane to 30% of the screen
    tmux resize-pane -t "$SESSION_NAME:$WINDOW_NAME.1" -y 30     # Resize bottom pane to 30% of the screen

    # Run commands in specific panes
    tmux send-keys -t "$SESSION_NAME:$WINDOW_NAME.1" 'htop' C-m  # Run htop in the bottom pane
    tmux send-keys -t "$SESSION_NAME:$WINDOW_NAME.0" 'cd /home/nicolas/workspace/schnecken_bot && cargo run --release' C-m  # Run cargo in the top left pane
fi

# Switch to the window
tmux select-window -t "$SESSION_NAME:$WINDOW_NAME"
