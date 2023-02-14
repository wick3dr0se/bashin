#!/bin/bash

clock(){
  start="$EPOCHSECONDS"
  "$@"
  end="$EPOCHSECONDS"

  ((CLOCK=end-start))

  echo "$CLOCK"
}
