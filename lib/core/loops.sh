#!/bin/bash

# skip loop iterations
skip(){
  if (( ${N:=1} > ${1:-1} )); then
    :
  else
    ((N++)); false
  fi
}
