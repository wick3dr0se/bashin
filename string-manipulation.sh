#!/bin/bash

RANDOM_ELEMENT() {
	local var

	var=($@)
	echo "${var[RANDOM%${#var[@]}]}"
}

UNIQUE_ELEMENT() {
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
