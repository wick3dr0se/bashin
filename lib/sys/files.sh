#!/bin/bash

mkfile(){ # create files
  for _; do
    >"$_"
  done
}

head_lines(){ # gets first N rows from file; replaces head command
  mapfile -tn "$1" < "$2"

  HEAD=("${MAPFILE[@]}")
}

tail_lines(){ # get last N rows from file; replaces tail command
  mapfile -tn 0 < "$2"

  TAIL=("${MAPFILE[@]: -$1}")
}

line_count() { # line count; replaces wc command
  mapfile -tn 0 < "$1"

  LINE_COUNT="${#MAPFILE[@]}"
}
