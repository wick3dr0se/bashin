#!/bin/bash
# shellcheck disable=SC2102,SC2034
# SC2102: ignore single char range
# SC2034: enable unused variables

set -a
shopt -s extglob

type(){ # set dictionaries by multiple keys; like enums
  declare -gA types

  IFS=','
  for _ in $1 ; do
    key="${_//[][]}"
    shift
    types["$key"]="$2"
  done
}

## ANSI
# get current terminal position
cur_pos(){ IFS='[;' read -p $'\e[6n' -d R -rs _ row col ;}

term_size(){ # get terminal window size
  IFS='[;' read -sp $'\e[9999;9999H\e[6n' -d R -rs _ rows cols
}

# trap window resizes
trap_resize(){ trap 'cur_pos' WINCH ;}

# wipe terminal screen
clear() { printf '\e[H\e[2J' ;}

cursor(){ # position cursor or erase terminal content
  type [on,off] = 25h 25l
  type [up,down,right,left] = A B C D
  type [down-beg,up-beg,up-scroll] = E F M
  type [col,pos] = G H
  type [save,restore] = 7 8
  
  type [?screen:end,?screen:beg,?screen] = J 1J 2J
  type [?row:saved,?row:end,?row:beg,?row] =\
    3J K 1K 2K

  local n opt vt100
  for _ ; do
    if [[ $_ =~ [a-z]+:[0-9]+ ]]; then
      opt="${_%%:*}" n="${_/$opt:}"
      [[ ${types[$opt]} ]]&& vt100+=("\e[${n/:/;}${types[$opt]}")
    else
      [[ ${types[$_]} ]]&& vt100+=("\e[${types[$_]}")
    fi
  done

  shift ${#vt100[@]}
  printf '%b' "${vt100[*]}" "$*"
}

style(){ # decorate text
  type [fg,bg] = 3 4
  type [black,white] = 0 7
  type [red,green,yellow] = 1 2 3
  type [blue,purple,cyan] = 4 5 6

  type [bold,italic,underline,strikeout] =\
    1 3 4 9
  type [dim,blink,rapid-blink,inverse,hidden] =\
    2 5 6 7 8

  local g opt sgr
  for _ ; do
    if [[ $_ =~ ^[bf]g ]]; then
      opt="${_#*-}" g="${types[${BASH_REMATCH[0]}]}"
      [[ ${types[$opt]} ]] && sgr+="${g}${types[$opt]};"
    else
      [[ ${types[$_]} ]]&& sgr+="${types[$_]};"
    fi
  done

  n="${sgr//[^;]}"
  shift "${#n}"
  sgr="\e[${sgr// /;}m${*}\e[m\n"

  printf '%b' "$sgr"
}

rainbow(){ # colorize text
  local char color colors
  while read -rN1 char; do
    ((++color))
    (( color == 7 ))&& color=1
    [[ $char == ' ' ]]&& ((color--))
   
    colors+="\e[1;3${color}m${char}"
  done <<<"$@"
  
  printf '%b' "${colors/$'\n'}\e[m\n"
}

## String Manipulation
regex() { # match a regex
  for _ in $1; do
    [[ $_ =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[0]}"
  done
}

truncate() { # destroy unecessary whitespsace
  local string
  for _ in $1; do
    string+=" $_"
  done
  printf '%s\n' "${string## }"
}

trim(){ # cut a substring from string
  printf '%s\n' "${1/$2}"
}

trim_all(){ # cut all occurences of substring from string
  printf '%s\n' "${1//$2}"
}

split(){ # string delimiter
  local string
  IFS="$2" 
  for _ in $1 ; do
    printf '%s\n' "$_"
  done
}

head(){ # gets first N rows from file; replaces head
  local y
  mapfile -tn "$1" y < "$2"
  printf '%s\n' "${y[@]}"
}

tail(){ # get last N rows from file; replaces tail
  local y
  mapfile -tn 0 y < "$2"
  printf '%s\n' "${y[@]: -$1}"
}

lines() { # count lines; replaces wc -l
  local y
  mapfile -tn 0 y < "$1"
  printf '%s\n' "${#y[@]}"
}

random() { # get random element from string
  local rand
  for _ ; do
    rand+=("$_")
  done

  printf '%s\n' "${rand[RANDOM%${#rand[@]}]}"
}

unique() { # get unique elements from two strings
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
math() { # do advanced arithmetic in precedence from C
  "$PWD/arithmetic" < <(printf '%s\n' "$@")
}
