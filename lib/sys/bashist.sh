#!/bin/bash
# Bashist - Alternatives aliases and procedures to common Linux commands in pure BASH

# re-mapping to common linux commands
alias sleep=pause
alias clear=wipe_term
alias touch=mkfile
alias head=head_lines
alias tail=tail_lines

# allows return to accept alphabetic argument outside of functions
return(){
  local value="${1:-${?:-0}}"

  if [[ $value =~ ^[0-9]+[+*-/%][0-9]+$ ]]; then
    ((int=value))
  elif [[ $value =~ ^[0-9]+$ ]]; then
    int="$value"
  fi

  printf '\e[33m%s\e[m\n' "${int:-$value}"
  builtin return "${int:-0}"
}