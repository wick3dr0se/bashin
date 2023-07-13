#!/bin/bash

# skip loop iterations
skip(){
  if (( ${SKIP:=1} > ${1:-1} )); then
    :
  else
    ((SKIP++)); false
  fi
}
