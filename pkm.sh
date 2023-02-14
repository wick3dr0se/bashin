#!/bin/bash

#set -eEuo pipefail

. bashin
import std/{ansi,tui}

hud(){ printf '\e[%dHPKM' "$LINES"; }

prompt(){ hud; read -rep " $1 "; }

scroll(){
  case $cursor in
    $LINES) ((cursor=LINES-${#args[@]})) ;;
    $((rows-${#args[@]}))) cursor="$rows" ;;
  esac
}

hover(){
  hover="${args[$cursor-$LINES]}"
  printf '\e[%dH\e[4%s\e[m' "$cursor" "$hover"

  hist+=("${cursor}H${hover#[1-7]m}")
  skip&&{
    printf '\e[m\e[%s' "${hist[0]}"
    hist=("${hist[@]:1}")
  }
}

term_size; ((rows=LINES-1))

vt buffer:alt pos:"$rows" cursor:hide

cursor="$rows"
args=(
  '2mquery/install'
  '1mlist installed/uninstall'
)

printf '%s\n' "${args[@]#[1-7]m}"
hud

for((;;)){
  read_keys
  case ${KEY^^} in
    Q) vt buffer:main && exit;;
    J|\[B) ((cursor++));;
    K|\[A) ((cursor--));;
    L|\[C)
      . pacman.sh
    ;;
  esac

  scroll
  hover
}
