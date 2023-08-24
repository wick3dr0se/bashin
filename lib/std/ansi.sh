#!/bin/bash

## ANSI
declare -gA buffer cursor erase move

buffer=( # virtual terminal // control the terminal
  ['alt']='[?1049h'
  ['main']='[?1049l'
)

cursor=(
  ['hide']='[?25l'
  ['show']='[?25h'
  ['save']=7
  ['restore']=8
)

erase=(
  ['row']='[2K'
  ['row-start']='[1K'
  ['row-end']='[K'
  ['screen']='[2J'
  ['screen-start']='[1J'
  ['screen-end']='[J'
)

move=(
  ['up']=A
  ['down']=B
  ['right']=C
  ['left']=D
  ['down-start']=E
  ['up-start']=F
  ['col']=G
  ['pos']=H
  ['up-scroll']=S
  ['down-scroll']=T
)

vt(){
  unset seq

  for _; do
    if [[ $_ == 'buffer:'*&& ${buffer[${_#buffer:}]?} ]]; then
      seq+=("${buffer[${_#buffer:}]}")
    elif [[ $_ == 'cursor:'*&& ${cursor[${_#cursor:}]?} ]]; then
      seq+=("${cursor[${_#cursor:}]}")
    elif [[ $_ == 'erase:'*&& ${erase[${_#erase:}]?} ]]; then
      seq+=("${erase[${_#erase:}]}")
    elif [[ $_ == 'move:'* ]]; then
      [[ $_ =~ [0-9]$ ]]|| : "$_:1"; foo="${_#move:}"; : "${foo#*:}"

      [[ ${move[${foo%%:*}]?} ]]&&{
        [[ $_ =~ [0-9]+:[0-9]+ ]]&&{ x="${_%:*}" y="${_#*:}"; : "$y;${x}"; }
        seq+=("[$_${move[${foo%%:*}]}")
      }
    else
      printf 'Invalid argument!'
      return 1
    fi
  done

  echo "${seq[@]}"
  printf '\e%s' "${seq[@]}"
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
  local color=1
  while read -rn1; do
    [[ $REPLY == ' ' ]]&& ((color--))
    printf '\e[3%dm%s\e[m' "$color" "$REPLY"
    ((color++))
    (( color == 7 ))&& color=1
  done <<< "$*"

  [[ $* == '' ]]|| printf '\n'
}
