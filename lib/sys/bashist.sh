#!/bin/bash
# Bashist - Alternatives aliases and procedured to common Linux commands in pure BASH

alias clear=clear_term
alias head=head_file
alias tail=tail_file

# create files; better touch command
touch(){
  for _; do
    >"$_"
  done
}
