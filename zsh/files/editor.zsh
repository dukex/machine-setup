project() {
  PROJECT=$(find ~/code -mindepth 1 -maxdepth 2 -type d ! -path "*/.*" | fzf --select-1 | tr '\n' ':')
  PROJECT_PATH=${PROJECT%:*}
  PROJECT_NAME=$(basename $PROJECT_PATH)

  tmux has-session -t $PROJECT_NAME 2>/dev/null

  if [ $? != 0 ]; then
    tmux new-session -d -s $PROJECT_NAME -n "editor"

    tmux send-keys -t editor "cd $PROJECT_PATH" C-m
    tmux send-keys -t editor "nvim ." C-m

    tmux new-window -t $PROJECT_NAME -n "terminal"
    tmux send-keys -t terminal "cd $PROJECT_PATH" C-m

    tmux select-pane -t editor
  fi;

  tmux attach-session -d -t $PROJECT_NAME
}
