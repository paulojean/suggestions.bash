#!/usr/bin/env bash

__suggestions_preview__ () {
  local cols input input_size
  cols=$(tput cols)
  input=$1
  input_size=$(echo "$input" | wc -c)

  if [ $input_size -gt 605 ]; then
    echo $(echo $input | (head -c 300 && echo -e " \033[37;7m <...> \033[0m" && tail -c 300))
  else
    echo $input
  fi
}

export -f __suggestions_preview__

__suggestions_list_commands__ () {
  local command=$(
    history | \
    sort -n -r | \
    cut -c 8-  | \
    fzf -q "$READLINE_LINE" \
      --print-query --height ${FZF_TMUX_HEIGHT:-40%} \
      --preview-window down:4:wrap \
      --preview '__suggestions_preview__ {}' | \
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
