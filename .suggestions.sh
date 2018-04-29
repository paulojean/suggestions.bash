__suggestions_list_commands__() {
  local command=$(
    history | \
    sort -r | \
    cut -c 8-  | \
    fzf -q "$READLINE_LINE" --print-query --height ${FZF_TMUX_HEIGHT:-40%} | \
    tail -n 1)

  if [[ -z "$command" ]]
  then
    command="$READLINE_LINE"
  fi

  READLINE_LINE="$command"
  READLINE_POINT=${#READLINE_LINE}
}

bind -x '"\e[A":__suggestions_list_commands__'
bind -x '"\C-r":__suggestions_list_commands__'
