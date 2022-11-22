#!/bin/bash

set -a
shopt -s extglob

opt(){
  local opt
  declare -gA opts
  for opt in $1 ; do 
    opts[$opt]="$2"
  done
}

## ANSI
cur_pos(){ IFS='[;' read -p $'\e[6n' -d R -rs _ row col ;}

term_size(){
  IFS='[;' read -sp $'\e[9999;9999H\e[6n' -d R -rs _ rows cols
}

trap_resize(){ trap 'cur_pos' WINCH ;}

wipe_term() { printf '\e[H\e[2J' ;}

cursor(){
  opt 'on show' 25h # show cursor
  opt 'off hide' 25l # hide cursor
  
  opt 'up' A # up (N) rows
  opt 'down' B # down (N) rows
  opt 'right' C # right (N) cols
  opt 'left' D # left (N) cols
  opt 'down-start' E # down (N) rows at start
  opt 'up-start' F # up (N) rows at start
  opt 'col' G # move to col (N)
  
  opt 'home pos position' H # move to row (N), col (N)

  opt 'up-scroll' M # move up row & scroll
  opt 'save' 7 # save position
  opt 'restore' 8 # restore position

  # erase
  opt '?screen:end' J # from cursor to screen end
  opt '?screen:start' 1J # from cursor to screen start
  opt '?screen' 2J # entire screen
  opt '?row:saved' 3J # saved row

  opt '?row:end' K # from cursor to row end
  opt '?row:start' 1K # from cursor to row start
  opt '?row' 2K # entire row

  local n opt vt100
  for _ ; do
    if [[ $_ =~ [a-z]+:[0-9]+ ]]; then
      opt="${_%%:*}" n="${_/$opt:}"
      [[ ${opts[$opt]} ]]&& vt100+=("\e[${n/:/;}${opts[$opt]}")
    else
      [[ ${opts[$_]} ]]&& vt100+=("\e[${opts[$_]}")
    fi
  done
  shift ${#vt100[@]}
  printf '%b' "${vt100[*]}" "$*"
}

style(){
  opt 'black' 0 # black
  opt 'red' 1 # red
  opt 'green' 2 # green
  opt 'yellow' 3 # yellow
  opt 'blue' 4 # blue
  opt 'purple' 5 # purple
  opt 'cyan' 6 # cyan
  opt 'white' 7 # white

  opt 'bold' 1 # bold
  opt 'dim' 2 # dim
  opt 'italic' 3 # italic
  opt 'underline' 4 # underline
  opt 'blink' 5 # blink
  opt 'rapid-blink blink-fast' 6 # rapid blink
  opt 'reverse' 7 # reverse
  opt 'hidden' 8 # hidden
  opt 'strike strikeout' 9 # strikeout

  opts[fg]=3
  opts[bg]=4

  local g opt sgr
  for _ ; do
    if [[ $_ =~ fg|bg ]]; then
      opt="${_#*-}" g="${opts[$BASH_REMATCH]}"
      [[ ${opts[$opt]} ]] && sgr+=("${g}${opts[$opt]}")
    else
      [[ ${opts[$_]} ]]&& sgr+=("${opts[$_]}")
    fi
  done

  shift "${#sgr[@]}"
  sgr="${sgr[*]}" sgr="\e[${sgr// /;}m${*}\e[m\n"
  
  printf '%b' "$sgr"
}

rainbow(){
  local char color colors
  while read -rN1 char; do
    ((++color))
    (( color == 7 ))&& color=1
    [[ $char == ' ' ]]&& ((color--))
   
    colors+="\e[1;3${color}m${char}"
  done <<<"$@"
  
  colors="$colors\e[m\n"
  printf '%b' "${colors/$'\n'}"
}

## String Manipulation
regex() {
  for _ in $1; do
    [[ $_ =~ $2 ]] && echo $BASH_REMATCH
  done
}

truncate() {
  local string
  for _ in $1; do
    string+=" $_"
  done
  printf '%s\n' "${string## }"
}

trim(){
  printf '%s\n' "${1/$2}"
}

trim_all(){
  printf '%s\n' "${1//$2}"
}

split(){
  local string
  IFS="$2" 
  for _ in $1 ; do
    printf '%s\n' "$_"
  done
}

head(){
  local y
  mapfile -tn "$1" y < "$2"
  printf '%s\n' "${y[@]}"
}

tail(){
  local y
  mapfile -tn 0 y < "$2"
  printf '%s\n' "${y[@]: -$1}"
}

lines() {
  local y
  mapfile -tn 0 y < "$1"
  printf '%s\n' "${#y[@]}"
}

random() {
  local rand
  for _ in $@ ; do
    rand+=("$_")
  done

  printf '%s\n' "${rand[RANDOM%${#rand[@]}]}"
}

unique() {
  local uniq
  for _ in $1; do
    [[ $2 =~ $_ ]]|| uniq+=("$_")
  done

  for _ in $2; do
    [[ $1 =~ $_ ]]|| uniq+=("$_")
  done

  printf '%s\n' "${uniq[*]}"
}

## Arithmetic
math() {
  "$PWD/arithmetic" < <(echo "$@")
}
math
