#!/bin/bash

## ANSI
vt(){ # virtual terminal // control the terminal
  local vt
  local -A vt100=(
    [buffer:main]='?1049l'  [buffer:alt]='?1049h'
    [cursor:show]='?25h'  [cursor:hide]='?25l'
    [line:wrap]='?7l'  [line:break]='?7h'
    [up]=A  [down]=B  [right]=C  [left]=D
    [down:beg]=E  [up:beg]=F  [up:scroll]=M
    [col]=G  [pos]=H  [save]=7  [restore]=8

    [?screen:end]=J  [?screen:beg]='1J'  [?screen]='2J'  [?screen:buffer]='3J'
    [?row:end]=K  [?row:beg]='1K'  [?row]='2K'
  )

  for _; do
    if [[ $_ =~ [a-z]:[0-9]:[0-9] ]]; then
      local opt="${_%%:*}" n="${_#*:}"

      printf '\e[%s%s' "${n/:/;}" "${vt100[$opt]}"
    elif [[ $_ =~ [a-z]:[0-9] ]]; then
      printf '\e[%d%s' "${_##*:}" "${vt100[${_%:*}]}"
    elif [[ ${vt100[$_]-} ]]; then
      printf '\e[%s' "${vt100[$_]}" 
    else
      vt+=("$_")
    fi
  done

  printf '%s' "${vt[*]}"
  [[ ${vt-} == '' ]]|| printf '\n'
}

sgr(){ # select graphic rendition // decorate text
  local sgr
  local -A colors=(
    # foreground or background
    [fg]=3 [bg]=4
    # colors
    [black]=0 [white]=7
    [red]=1 [green]=2 [yellow]=3
    [blue]=4 [purple]=5 [cyan]=6

  )

  local -A modes=(
    # modes
    [bold]=1 [dim]=2 [italic]=3[underline]=4
    [blink]=5 [rapid-blink]=6 [inverse]=7 [hidden]=8
  )

  for _; do
    if [[ ${colors[${_#*:}]-}&& $_ =~ ^[fb]g: ]]; then
      printf '\e[%d%dm' "${colors[${_%%:*}]}" "${colors[${_#*:}]}"
    elif [[ ${colors[$_]-} ]]; then
      printf '\e[3%dm' "${colors[$_]}"
    elif [[ ${modes[$_]-} ]]; then
      printf '\e[%dm' "${modes[$_]}"
    else
      sgr+=("$_")
    fi
  done
  
  printf '%s\e[m\n' "${sgr[*]}"
}

# wipe terminal screen
wipe_term(){ printf '\e[2J\e[3J\e[H'; }

colorize(){ # colorize text
  color=1
  while read -rn1; do
    [[ $REPLY == ' ' ]]&& ((color--))
    printf '\e[3%dm%s\e[m' "$color" "$REPLY"
    ((color++))
    (( color == 7 ))&& color=1
  done <<< "$*"

  [[ $* == '' ]]|| printf '\n'
}
