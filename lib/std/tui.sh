#!/bin/bash
# Terminal User Interface

# update $LINES & $COLUMNS from window resizes
trap 'shopt -s checkwinsize; (:;:)' 28

# get terminal window size $LINES/$COLUMNS
shopt -s checkwinsize; (:;:)

# get current terminal position
cur_pos(){ IFS='[;' read -p $'\e[6n' -d R -rs _ LINE COLUMN _; }

read_keys(){ # read keyboard input, including control sequences
  read -rsn1
  [[ $REPLY == $'\e' ]]&& read -rsn2
  KEY="${REPLY-}"
}

infinite_boundries(){
  local -n _y="$1" _x="$2"
  if (( _y == 0 )) ; then
    _y="$LINES"
  elif (( x == 0 )); then
    _x="$COLUMNS"
  elif (( _y > LINES )); then
    _y=1
  elif (( _x > COLUMNS )); then
    _x=1
  fi
}
