#!/bin/bash

shopt -s extglob

clock(){
  CLOCK_START="$EPOCHSECONDS"
  "$@"

  ((CLOCK=EPOCHSECONDS-CLOCK_START))
}
