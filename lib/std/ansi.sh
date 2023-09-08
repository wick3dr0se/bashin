#!/bin/bash

# select graphic rendition color codes
declare -gA color mode

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

buffer_alt(){ printf '\e[?1049h'; }

buffer_main(){ printf '\e[?1049l'; }

line_break(){ printf '\e[?7l]'; }

line_wrap(){ printf '\e[?7h'; }

mouse_off(){ printf '\e[?1000l'; }

mouse_on(){ printf '\e[?1000h'; }

cursor_hide(){ printf '\e[?25l'; }

cursor_show(){ printf '\e[?25h'; }

cursor_save(){ printf '\e7'; }

cursor_restore(){ printf '\e8'; }

cursor_up(){  # accepts <N> or <arg> <N>
  case $1 in
    'start') printf '\e[%dF' "$2";;
    *) printf '\e[%dA' "$1";;
  esac
}

cursor_down(){ # accepts <N> or <arg> <N>
  case $1 in
    'start') printf '\e[%dE' "$2";;
    *) printf '\e[%dB' "$1";;
  esac
}

cursor_right(){ # accepts <N>
  printf '\e[%dC' "$1"
}

cursor_left(){ # accepts <N>
  printf '\e[%dD' "$1"
}

cursor_column(){ # accepts <N>
  printf '\e[%dG' "$1"
}

cursor_row(){ # accepts <N>
  local x
  IFS='[;' read -p $'\e[6n' -d R -rs _ _ x _

  printf '\e[%d;%dH' "$1" "$x"
}

cursor_position(){ # accepts <N> <N>
  printf '\e[%d;%dH' "$2" "$1"
}

erase_row(){ # accepts <arg>
  case $1 in
    'start') printf '\e[1K';;
    'end') printf '\e[K';;
    *) printf '\e[2K';;
  esac
}

erase_screen(){ # accepts <arg>
  case $1 in
    'buffer') printf '\e[3J]';;
    'start') printf '\e[1J';;
    'end') printf '\e[J';;
    *) printf '\e[2J';;
  esac
}

scroll_up(){ # accepts <N>
  printf '\e[%dS'
}

scroll_down(){ # accepts <N>
  printf '\e[%dT'
}

sgr_write(){ # select graphic rendition // style/color strings
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

sgr_writeline(){
  sgr_write "$@"
  printf '\n'
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
