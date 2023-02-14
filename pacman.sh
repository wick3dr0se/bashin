#!/bin/bash

case ${hover#[1-7]m} in
  query/install)
    hud
    prompt 'Enter a search pattern:'
    mapfile -t MAPFILE < <(pacman -Ss "$REPLY")
    printf '%s\n' "${MAPFILE[@]}"

    for((;;)){
      scroll
      hover "${MAPFILE[$cursor-$LINES]}"

      read_keys
      case ${KEY^^} in
        J|\[B) ((cursor++));;
        K|\[A) ((cursor--));;
      esac
    }
  ;;
  list\ installed/uninstall)
    :
  ;;
esac
