#!/bin/bash
# Terminal User Interface

term_size(){ # outputs to $ROWS & $COLS
  IFS='[;' read -sp $'\e7\e[999;999H\e[6n\e8' -d R -rs _ ROWS COLS
}

get_cursor_pos(){ # outputs to $ROW & $COL
  IFS='[;' read -p $'\e[6n' -d R -rs _ ROW COL _
}

read_keys(){ # read keyboard/mouse input; outputs to $KEY
  read -rsn1 KEY
  [[ $KEY == $'\e' ]]&&{
    read -rsn2 KEY
    [[ $KEY == "[M" ]]&& { read -rsn3; KEY="$KEY$REPLY"; }
  }
  
  [[ $KEY ]]&& :
}