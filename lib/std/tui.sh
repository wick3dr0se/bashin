#!/bin/bash
# Terminal User Interface

# get terminal window size $LINES/$COLUMNS
term_size(){
  shopt -s checkwinsize; (:;:)
}

# get current terminal position $LINE/$COLUMN
cur_pos(){ IFS='[;' read -p $'\e[6n' -d R -rs _ LINE COLUMN _; }

read_keys(){ # read keyboard input, including control sequences
  [[ $1 == 'mouse=on' ]]&&{
    printf '\e[?1000h'
  }

  read -rsn1 KEY
  [[ $KEY == $'\e' ]]&&{
    read -rsn2 KEY
    [[ $KEY == "[M" ]]&& { read -rsn3; KEY="$KEY$REPLY"; printf '\e[?1000l'; }
  }
  
  [[ $KEY ]]&& :
}

# update $LINES & $COLUMNS from window resizes
trap term_size 28

term_size
