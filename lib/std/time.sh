#!/bin/bash

shopt -s extglob

clock(){
  start="$EPOCHSECONDS"
  "$@"
  end="$EPOCHSECONDS"

  ((CLOCK=end-start))

  printf '%s\n' "$CLOCK"
}
