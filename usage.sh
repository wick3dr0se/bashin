#!/bin/bash

# source bashin
. bashin

# import specific libraries (scripts)
import sys/{bashist,files}
import std/{ansi,time,tui,strings}
# or import_all to import every library
# -------------------------------------------------------

wipe_term # just to clear the screen

# < core/loops > #
for i in {1..3}; do
  skip 2&& i+=' Skipped 2 iterations'
  echo "$i"
done
# -------------------------------------------------------

# < core/math > #
#do arithmetic in pemdas precedence (floating point)
math '5+2-(3%2)/8.2'
# -------------------------------------------------------

# < std/ansi > #
# switch to main buffer, move cursor to position 1y,9x & print
vt right:9 'VT100 ANSI esacpes'

# rainbow-like colorize text
colorize 'SGR 4-bit cycle'

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

# < std/time > #
# time a commands execution
printf 'Took ~'; clock sleep 1

# pause for ~3 seconds
printf 'Pausing for a couple seconds...'
pause 2
vt ?row col:1 # just to clear the line and move back up
# -------------------------------------------------------

# < std/tui > #
# read terminal cells to $LINES/$COLUMNS env respectively (implicit)
echo "$LINES $COLUMNS - Terminal row & column cells"

# get current terminal cursor position
cur_pos
echo "$LINE $COLUMN - Cursor position"

# read keyboard input; accepts control sequences
printf 'Echoing control keys.. Press Q to quit: '
for((;;)){
  read_keys

  case ${KEY^^} in
    Q) printf 'Q\n'&& break;;
    [A-Z]) continue;;
    \[*) printf "$KEY ";;
  esac
}

# make boundries infinite by sending cursor to opposite end of screen
#infinite_boundries Y X # works by nameref settings Y & X var respectively
# -------------------------------------------------------

# < sys/bashist > #
# -------------------------------------------------------

# < sys/files > #
# print 1 line from the beginning of file
head_lines 1 usage.sh
echo "First line - usage.sh: $HEAD"

# print 1 line from the end of file
tail_lines 1 usage.sh
echo "Last line - usage.sh: $TAIL"

# get a file line count
lc usage.sh
echo "Line Count - usage.sh: $LINE_COUNT"
