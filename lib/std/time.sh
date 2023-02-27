#!/bin/bash

shopt -s extglob

clock(){
  start="$EPOCHSECONDS"
  "$@"
  end="$EPOCHSECONDS"

  ((CLOCK=end-start))

  echo "$CLOCK"
}

pause(){
  local n
  case $1 in
    [1-9]?([0-9]).0) n="${1/.0}999";;
    ?([0-9]).[1-9][0-9]) n=${1/.} n="${n%[0-9]}9999";;
    ?([0-9]).[1-9]) n="${1/0.}" n="${n/.}999";;
    [1-9]?([0-9])) n="${1}9999";;
    *) echo 'Unsupported value'&& exit 1;;
  esac
  shift

  case $n in
    1999) ((n/=26));;
    2999) ((n/=19));;
    [3-5]999) ((n/=15));;
    [6-9]999) ((n/=13));;
    29999) ((n/=19));;
    [1-5]9999) ((n/=21));;
    [6-7]9999) ((n/=22));;
    [8-9]9999) ((n/=24));;
    1[0-4]9999) ((n/=23));;
    1[5-9]9999) ((n/=24));;
  esac

  for((i=0;i<n;i++)); do
    (:;:)
  done
}