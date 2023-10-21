<details open><summary><h1>:paintbrush: ANSI Escape Sequences</h1></summary>

A library of ANSI escape sequences

### Wipe Terminal
wipe terminal clean, clearing screen, buffer & set cursor to row 0, column 0
```bash
wipe_term
```
---

### Alternative Buffer
switch the terminal to the alternative buffer
```bash
buffer_alt
```
---

### Main Buffer
switch the terminal to the main buffer
```bash
buffer_main
```
---

### Line Break
break lines at terminal width
```bash
line_break
```
---

### Main Buffer
wrap lines
```bash
line_wrap
```
---

### Mouse Off
turn off mouse input detection
```bash
mouse_off
```
---

### Mouse On
turn on mouse input detection
```bash
mouse_on
```

### Cursor Hide
hide the terminal cursor
```bash
cursor_hide
```
---

### Cursor Show
show the terminal cursor
```bash
cursor_show
```
---

### Cursor Save
save cursor position
```bash
cursor_save
```
---

### Cursor Restore
restore saved cursor poistion
```bash
cursor_restore
```
---

### Cursor Up
move cursor up N cells, optionally at the start
```bash
cursor_up [start] [N]
```
---

### Cursor Down
move cursor down N cells, optionally at the start
```bash
cursor_down [start] [N]
```
---

### Cursor Right
move cursor right N cells
```bash
cursor_right [N]
```
---

### Cursor Left
move cursor left N cells
```bash
cursor_left [N]
```
---

### Cursor Column
move cursor to column N
```bash
cursor_col <N>
```
---

### Cursor Row
move cursor to row N
```bash
cursor_row <N>
```
---

### Erase Row
erase terminal row, optionally from start to cursor or to end from cursor 
```bash
erase_row [start/end]
```
---

### Erase Screen
erase terminal screen, optionally from start to cursor, end to cursor or the entire buffer
```bash
erase_screen [start/end/buffer]
```
---

### Scroll Up
scroll the terminal up N rows
```bash
scroll_up [N]
```
---

### Scroll Down
scroll the terminal down N rows
```bash
scroll_down [N]
```
---

### Select Graphic Rendition
text colors and styles (accepts countless arguments)
```bash
sgr_write [bg:<red>] 'test' [mode:<bold>] [fg:<blue>] 'i am blue text'

# append a newline
sgr_writeline [bg:<red>] 'test' [mode:<bold>] [fg:<blue>] 'i am blue text'
```
---

### SGR — Color Parameters

`black` - set fg/bg color to black  
`red` - set fg/bg color to red  
`green` - set fg/bg color to green  
`yellow` - set fg/bg color to yellow  
`blue` - set fg/bg color to blue  
`purple` - set fg/bg color to purple  
`cyan` - set fg/bg color to cyan    
`white` - set fg/bg color to white

---

### SGR — Mode Parameters

`bold` - set bold style  
`dim` - set faint style  
`italic` - set italic style  
`underline` - set underline style  
`blink` - set blinking style  
`rapid-blink` - set rapid blinking style  
`inverse` - set inverse style  
`hidden` - set hidden style  
`strikeout` - set strikeout style

---

### Colorize
rainbow colorize some text
```bash
colorize 'text'
```
---
</details>

<details open><summary><h1>:watch: Time</h1></summary>

A collection of time-related procedures

### Clock
Times a commands execution
```bash
clock <command>
```
---
</details>

<details open><summary><h1>:magic_wand: Terminal User Interface</h1></summary>

A library of TUI procedures

### Echo Off
turn off terminal echoing
```bash
echo_off
```
---

### Echo On
turn on terminal echoing
```bash
echo_on
```

### Terminal Dimensions
fetches the terminal dimensions
```bash
get_term_size
```

Example:
```bash
echo "$ROWS $COLS"
```
> 123 188
---

### Terminal Cursor Position
Fetches the current cursor position within the terminal
```bash
get_cursor_pos
```

Example:
```bash
echo "$ROW $COL"
```
> 53 1
---

### Terminal Dimensions
Fetches terminal window cells

Example:
```bash
echo "$LINES $COLUMNS"
```
> 53 84
---

### Read Keyboard Input
Read control sequences as well as standard keyboard input
```bash
read_keys
```

Example:
```bash
echo "$KEY"
```
> [A
---
</details>

<details open><summary><h1>:sewing_needle: String Manipulation</h1></summary>

A large library of string manipulation procedures

### Regex
Match a string, variable or array by regular expression

Stores to the baked in $REGEX (variable)
```bash
regex '<string>' '<pattern>'
```
---

### Trim
Remove a given value from string

Stores to the baked in $TRIM (variable)
```bash
trim '<string>' '<value>'
```
---

### Trim all
Remove all cases of given value from string

Stored to the baked in $TRIM (variable)
```bash
trim_all '<string>' '<value>'
```
---

### Delimiter
Split a string, variable or array on a delimiter

Sets to the baked in $DELIM (array)
```bash
delim '<string>' '<delimiter>'
```
---

### Random element
Fetch a random element from a string, variable or array

Sets to the baked in $RAND (variable)
```bash
rand  '<a b c d e f g>'
```

Example:
```bash
echo "$RAND"
```
> f
---

### Unique Elements
Get unique elements not found in both strings, variables or arrays

Sets to the baked in $UNIQUE (variable)
```bash
unique '<a b c d>' '<c x d b>'
```

Example:
```bash
echo "$UNIQUE"
```
> a x
---

### Reverse String
Reverse a strings characters

Sets to the baked in $REVERSE (variable)
```bash
reverse_string '<string>'
# or
reverse_string "<$string>"
```

Example:
```bash
echo "$REVERSE"
```
> gnirts
---

### Reverse Array
Reverse strings or an arrays elements

Sets to the baked in $REVERSE (array)
```bash
reverse_array <'string1>' '<string2>'
# or
reverse_array "${array[@]}"
```

Example:
```bash
echo "${REVERSE[@]}"
```
> string2 string1
---
</details>
