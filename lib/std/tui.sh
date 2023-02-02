#!/bin/bash
# Terminal User Interface

# update $LINE/$COLUMN from window resizes
trap term_size 28

# get current terminal position
cur_pos(){ IFS='[;' read -p $'\e[6n' -d R -rs _ LINE COLUMN _; }

# get terminal window size $LINES/$COLUMNS
term_size(){ shopt -s checkwinsize; (:;:); }

read_keys(){ # read keyboard input, including control sequences
  read -rsn1
  [[ $REPLY == $'\e' ]]&& read -rsn2
  KEY="${REPLY-}"
}
