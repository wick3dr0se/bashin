#!/bin/bash

skip(){
  if (( ${N:=1} > ${1:-1} )); then
    :
  else
    ((N++)); false
  fi
}

for i in {1..5}; do
  echo $i
  skip 2&& echo hi
done
