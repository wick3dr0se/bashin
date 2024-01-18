#!/bin/bash
# Terminal User Interface

echo_off(){
  stty -echo
}

echo_on(){
  stty echo
}

get_term_size(){ # outputs to $LINES & $COLUMNS
  shopt -s checkwinsize; (:;:)
  ROWS="$LINES" COLS="$COLUMNS"
}

get_cursor_pos(){ # outputs to $LINE & $COLUMN
  IFS='[;' read -p $'\e[6n' -d R -rs _ ROW COL _
}

read_keys(){ # read keyboard/mouse input
  read -rsn1 KEY
  [[ $KEY == $'\e' ]]&& read -rsn2 KEY
  [[ $KEY == '[M' ]]&& read -rsn3; KEY="$KEY$REPLY"
}
