#!/bin/bash

return(){
  local value="${1:-${?:-0}}"

  if [[ $value =~ [0-9][+*-/%][0-9] ]]; then
    ((int=value))
  elif [[ $value =~ ^[0-9]+$ ]]; then
    int="$value"
  fi

  printf '\e[33m%s\e[m\n' "${int:-$value}"
  builtin return "${int:-0}"
}

return "$1"
