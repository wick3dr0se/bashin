#!/bin/bash

## ANSI
declare -gA buffer cursor erase move color mode

# vt100 escape sequences
buffer=(
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

# select graphic rendition color codes
color=(
  ['black']=0
  ['red']=1
  ['green']=2
  ['yellow']=3
  ['blue']=4
  ['purple']=5
  ['cyan']=6
)

mode=(
  ['bold']=1
  ['dim']=2
  ['italic']=3
  ['underlline']=4
  ['blink']=5
  ['rapid-blink']=6
  ['inverse']=7
  ['hidden']=8
)

vt(){  # virtual terminal // control the terminal
  local vt100 x y

  for _; do
    case $_ in
      buffer:*) vt100+=("${buffer[${_#buffer:}]?}");;
      cursor:*) vt100+=("${cursor[${_#cursor:}]?}");;
      erase:*) vt100+=("${erase[${_#erase:}]?}");;
      move:*)
        [[ $_ =~ [0-9]$ ]]|| : "$_:1"
        foo="${_#move:}"; : "${foo#*:}"

        [[ $_ =~ [0-9]+:[0-9]+ ]]&&{
          x="${_%:*}" y="${_#*:}"; : "$y;${x}"
        }
        
        vt100+=("[$_${move[${foo%%:*}]?}")
      ;;
      *)
        printf 'Invalid argument!'
        return 1
      ;;
    esac
  done

  printf '\e%s' "${vt100[@]}"
}

sgr(){ # select graphic rendition // style/color strings
  local sgr

  for _; do
    case $_ in
      bg:*) sgr+=("\e[4${color[${_#bg:}]?}m");;
      fg:*) sgr+=("\e[3${color[${_#fg:}]?}m");;
      mode:*) sgr+=("\e[${mode[${_#mode:}]?}m");;
      *) sgr+=("$_\e[m");;
    esac
  done

  printf '%b' "${sgr[@]}"
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
