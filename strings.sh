#!/bin/bash

regex() {
  local i

  for i in $1 ; do
    [[ $i =~ $2 ]] && echo $BASH_REMATCH
  done
}

truncate() {
  local i string

  for i in $1 ; do
    string+=" $i"
  done
  echo ${string# }
}

split() {
  local i string

  IFS="$2" 
  for i in $1 ; do
    string+=$i
  done
  truncate $string
}

random_element() {
	local var

	var=($@)
	echo "${var[RANDOM%${#var[@]}]}"
}

unique_element() {
	local col var1 var2

	for col in ${arr1[@]} ; do
		var1+="^${col}$"
	done

	for col in ${arr2[@]} ; do
		var2+="^${col}$"
	done

	for col in ${arr1[@]} ${arr2[@]} ; do
		[[ $var1 =~ "^${col}$" ]] || printf '%s ' "$col"
		[[ $var2 =~ "^${col}$" ]] || printf '%s ' "$col"
	done
	echo
}
