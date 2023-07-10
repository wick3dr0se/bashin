#!/bin/bash

stack(){
  local newStack reverseStack i n=0

  if (( ${#STACK[@]} == 0 )); then
    printf 'Stack is empty!\n'

    return 1
  elif [[ $2 ]]; then
    printf 'Too many arguments!\n'

    return 1
  else
    case $1 in
      '-e'|'--empty'|'empty')
        unset STACK
        
        printf 'Stack emptied!\n'

        return
      ;;
      '-r'|'--reverse'|'reverse')
        for ((i=${#STACK[@]}-1; i>=0; i--)); do
          reverseStack+=("${STACK[@]:$i:1}")
        done
        STACK=("${reverseStack[@]}")

        printf 'Stack reversed!\n'
      ;;
    esac
  fi

  for _ in "${STACK[@]}"; do
    newStack+=("$n($_)")
    ((n++))
  done

  printf '\e[33m%d\e[m[%s]\n' "${#STACK[@]}" "${newStack[*]}"
}

peek(){
  local newStack

  if (( $# )); then
    for _; do
      if [[ $_ =~ ^([0-9])+$ ]]; then
        newStack+=("$_(${STACK[$_]})")
      else
        printf 'Numeric arguments only!\n'

        return 1
      fi
    done

    printf '\e[33m%d\e[m[%s]\n' "${#STACK[@]}" "${newStack[*]}"
  else
    printf '\e[33m%d\e[m[0(%s)]\n' "${#STACK[@]}" "${STACK[0]}"
  fi
}

push(){
  local oldStack+=("${STACK[@]}")
  unset STACK
  STACK=("$@" "${oldStack[@]}")
}

pop(){
  if (( ${#STACK[@]} == 0 )); then
    printf 'Stack is empty!\n'
    return 1
  elif (( $# )); then
    for _; do
      if (( $_ <= ${#STACK[@]}-1 )); then
        unset "STACK[$_]"
      else
        printf 'Element %d not accessible!\n' "$_"

        return 1
      fi
    done
    
    STACK=("${STACK[@]}")
  else
    STACK=("${STACK[@]:1}")
  fi
}
