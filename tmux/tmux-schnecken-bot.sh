#!/bin/bash

SESSION_NAME="main"
WINDOW_NAME="schnecken_bot"

# Attach to the session if it exists, or create it if it doesn't
# Check if the session exists, if not create it
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
  tmux new -s $SESSION_NAME\; detach
fi

# Check if the window already exists
tmux list-windows -t $SESSION_NAME | grep -q $WINDOW_NAME

# If the window doesn't exist, create it and set up the panes
if [ $? != 0 ]; then
  # Create a new window
  tmux new-window -t $SESSION_NAME -n $WINDOW_NAME

  # Split the window into panes
  tmux split-window -v -t $SESSION_NAME:$WINDOW_NAME   # Split horizontally
  tmux split-window -h -t $SESSION_NAME:$WINDOW_NAME.1 # Split vertically

  # Run commands in specific panes
  # Schnecken bot
  tmux select-pane -t $SESSION_NAME:$WINDOW_NAME.1
  tmux send-keys -t $SESSION_NAME:$WINDOW_NAME.1 'cd /home/nicolas/workspace/schnecken_bot && cargo run --release' C-m # Run cargo in the top left pane

  # htop
  tmux select-pane -t $SESSION_NAME:$WINDOW_NAME.3
  tmux resize-pane -t $SESSION_NAME:$WINDOW_NAME.3 -y 30%   # Resize bottom pane to a smaller part
  tmux send-keys -t $SESSION_NAME:$WINDOW_NAME.3 'htop' C-m # Run htop in the bottom pane
fi

# Switch to the window
tmux attach -t $SESSION_NAME
tmux select-window -t $SESSION_NAME:$WINDOW_NAME
tmux select-pane -t $SESSION_NAME:$WINDOW_NAME.2
