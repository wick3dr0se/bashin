#!/bin/bash

# source bashin
. bashin

# import specific libraries (scripts)
import sys/files
import std/{ansi,tui,strings}
# or import_all to import every library
# -------------------------------------------------------

# < core/math > #
#do arithmetic in pemdas precedence (floating point)
math '5+2-(3%2)/8.2'
# -------------------------------------------------------

# < std/ansi > #
# clear screen, move up 10 cells & print hello
vt ?screen right:10 'VT100 ANSI esacpes'

# rainbow colorize text
rainbow 'ANSI'

# decorate text with a dim green black background/foreground
sgr dim bg:green fg:black 'Select Graphic Rendition'
# -------------------------------------------------------

# < std/strings > #
# return a regular expression
regex 'racecar' 'c[a-d].'
echo "$REGEX - Returned by regex"

# remove once
trim '"quote"' '"'
echo "$TRIM - Quotes half trimmed"

# remove all
trim_all '"quote"' '"'
echo "$TRIM - Quotes trimmed"

# delimiter
delim 'a, b c' ', '
echo "${DELIM[@]} - Delimited array"

# get a random element
rand 'a b c d'
echo "$RAND - Random element"

# get unique elements
unique 'a b c x' 'x n b a'
echo "$UNIQUE - Unique elements"

# reverse a strings characters
reverse_string "reverse"
echo "$REVERSE - Reversed string"

arr=(r e v e r s e)
reverse_array "${arr[@]}"
echo "${REVERSE[@]} - Reversed array"
# -------------------------------------------------------

# < std/tui > #
# read terminal cells to $LINES/$COLUMNS env respectively
term_size
echo "$LINES $COLUMNS - Terminal row & column cells"

# get current terminal cursor position
cur_pos
echo "$LINE $COLUMN - Cursor position"

# read keyboard input; accepts control sequences
printf 'Echoing control keys.. Press Q to quit: '
for((;;)){
  read_keys

  case ${KEY^^} in
    Q) break;;
    [A-Z]) continue;;
    \[*) printf "$KEY ";;
  esac
}
# -------------------------------------------------------

# < sys/files > #
# print 1 line from the beginning of file
top_lines 1 usage.sh
echo "First line - usage.sh: $HEAD"

# print 1 line from the end of file
bot_lines 1 usage.sh
echo "Last line - usage.sh: $TAIL"

# get a file line count
lc usage.sh
echo "Line Count - usage.sh: $LINE_COUNT"
