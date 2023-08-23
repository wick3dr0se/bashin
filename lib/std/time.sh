#!/bin/bash

shopt -s extglob

clock(){
  local start="$EPOCHSECONDS"
  "$@"
  local end="$EPOCHSECONDS"

  ((CLOCK=end-start))

  printf '%s\n' "$CLOCK"
}
