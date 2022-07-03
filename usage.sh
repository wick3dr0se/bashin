#!/bin/bash

# source bashin
. ./bashin.sh

# evaluate given expression by BODMAS
math '2*(2+8)-3^2'

# color arg with ANSI 4bit & style
sgr 'text' green black bold underline

# control the cursor positioning and erasing
echo 'this line gets erased by vt100'
vt100 ^up cursor

# colorize a string
rainbow 'I use Arch BTW'

# use regex to get a specific pattern
regex 'match this' 't[a-z].s$'

# trim all excess whitespace
truncate '   trim    me    '

# delimeter
split 'split, on, commas' ','

# get a random element from an array
arr=(a b c "d" e f 'g' h i j k)
random_element "${arr[@]}"

# grab any unique elements by comparing two arrays
arr1=('unique' 'match')
arr2=('match')
unique_element "${arr1[@]}" "${arr[@]}"
