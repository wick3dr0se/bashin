#!/bin/bash

# get arguments and short/long options
get_opts(){
  for _; do
    if [[ $_ =~ ^-(-)? ]]; then
      OPTS[$i]="$_"
      ((i++))
      isOpt=1
    else
      if (( isOpt )); then
        ARGS[$i-1]="$_"
        unset isOpt
      else
        ARGS[$i]="$_"
        ((i++))
      fi
    fi
  done
}

# check to see if parameters contain option or option with argument
has_opt(){
  for (( i = 0; i <= ${#OPTS[@]}; i++ )); do
    case $1 in
      "${OPTS[$i]}"|"${OPTS[$i]} ${ARGS[$i]}") return;;
    esac
  done

  return 1
}