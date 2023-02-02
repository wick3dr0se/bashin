#!/bin/bash
## String Manipulation

regex() { # match a regex
  for _ in $1; do
    [[ $_ =~ $2 ]]&& REGEX="${BASH_REMATCH[0]}"
  done
}

trim(){ # cut a substring from string
  TRIM="${1/$2}"
}

trim_all(){ # cut all occurences of substring from string
  TRIM="${1//$2}"
}

delim(){ # string delimiter
  IFS="$2"
  for _ in $1; do
    DELIM+=("$_")
  done
  unset IFS
}

rand() { # get random element from string
  local foo
  for _ in $1; do
    foo+=("$_")
  done

  RAND="${foo[SRANDOM%${#foo[@]}]}"
}

unique() { # get unique elements from two strings
  local foo
  for _ in $1; do
    [[ $2 =~ $_ ]]|| foo+=("$_")
  done

  for _ in $2; do
    [[ $1 =~ $_ ]]|| foo+=("$_")
  done

  UNIQUE="${foo[@]}"
}

reverse_string(){ # reverse a strings characters
  local foo="$1" bar

  for ((i=${#foo}-1; i>=0; i--)); do
    bar+="${foo:$i:1}"
  done
  
  REVERSE="$bar"
}

reverse_array(){ # reverse an arrays elements
  local bar foo=("$@")

  for ((i=${#foo[@]}-1; i>=0; i--)); do
    bar+=("${foo[@]:$i:1}")
  done
  
  REVERSE=("${bar[@]}")
}
