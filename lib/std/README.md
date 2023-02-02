<details open><summary><h1>:paintbrush: ANSI Escape Sequences</h1></summary>

A library of ANSI escape sequences

### SGR
text colors and styles (accepts countless arguments)
```bash
sgr <mode> fg:<color> bg:<color>
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

### VT100
terminal control (accepts countless arguments)
```bash
vt '<erase>' '<position>'
```
---

### VT100 — Positional Parameters

`pos` - move cursor to row N, col N or 0,0  
`up` - move up # rows  
`down` - move down # rows  
`right` - move right # columns  
`left` - move left # columns  
`down:beg` - move down to beginning of row #  
`up:beg` - move up to beginning of row #  
`col` - move cursor to column #   
`up:scroll` - move up 1 row & scroll  
`save` - save cursor position  
`restore` - restore cursor to the last save position

---

### VT100 — Erase Parameters

`?screen:end` - erase from cursor to end of screen  
`?screen:beg` - erase from beg of screen to cursor  
`?screen` - erase entire screen  
`?row:saved` - erase saved row  
`?row:end` - erase from cursor to end of row  
`?row:beg` - erase start of row to cursor  
`?row` - erase the entire row

---
</details>

<details open><summary><h1>:magic_wand: Terminal User Interface</h1></summary>

A library of TUI procedures

### Terminal Cursor Position
Fetches the current cursor position within the terminal
```bash
cur_pos
```

Example:
```bash
echo "$LINE $COLUMN"
```
> 53 1

---

### Terminal Dimensions
Fetches terminal window cells
```bash
term_size
```

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