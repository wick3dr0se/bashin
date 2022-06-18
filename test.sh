#!/bin/bash

SOURCE_SCRIPT() { # source script - accepts script name
	[[ $1 ]] && var="${1}"
	[[ ${0%/*} == ${0##*/} ]] && . "$var" || . "${0%/*}${var}"
}

SOURCE_SCRIPT '.bashin'



## bashin ##
ABSOLUTE_PATH 'script_path'

alphabet=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
RANDOM_ELEMENT ${alphabet[@]}

4BIT 'test' red strikeout

arr1=('im unique' '9313' 'im not unique')
arr2=('im not unique' 'x')
UNIQUE_ELEMENT "${arr1[@]}" "${arr2[@]}"

INCREMENT 10-100+5

RAINBOW "I use Arch btw"

echo 'this line gets deleted from ANSI'
ANSI up del_cursor

