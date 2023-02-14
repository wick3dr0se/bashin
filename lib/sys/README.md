<details open><summary><h1>:card_index_dividers: File Management</h1></summary>

A library of file management procedures

### Top Lines
Get N amount of lines from the top of file

Sets to the baked in HEAD (array)
```bash
head_lines <N> <filePath>
```

Example:
```bash
echo "${HEAD[@]}"
```

---

### Bottom Lines
Get N amount of lines from the bottom of file

Sets to the baked in $TAIL (array)
```bash
tail_lines <N> <filePath>
```

Example:
```bash
echo "${TAIL[@]}"
```

---

### Line Count
Get a line count from file

Sets to the baked in $LINE_COUNT (variable)
```bash
line_count <filePath>
```

Example:
```bash
echo "$LINE_COUNT"
```
> 4

---

</details>

<details open><summary><h1>:bomb: Bashist</h1></summary>

A library of BASH alternatives to common Linux system commands

Many bashin procedures are re-mapped to their counterpart system commands

*Requires corresponding libs to be imported*

### Return
Allow builtin return to accept an alphabetic argument outside of functions, on top of handling exit codes

```bash
# return an exit code
return <{0..255}>
# return a string
return '<string>'
```

### Clear Terminal
Clear the terminal screen; An alternative to the clear command written in ANSI escape sequences

Wraps wipe_term from std/ansi
```bash
clear
```

---

### Sleep
Pause script execution for approximately N seconds. Alternative to sleep command using BASH microsleeps

Wraps pause from std/time
```bash
sleep <N>
```

---

### Create file
Create an empty file. An alternative to the touch command in pure BASH

Wraps mkfile from sys/files
```bash
touch <filePath>
```

---

### Head
Output first N lines of a file. An alternative to the head command written in pure BASH

Wraps head_lines from sys/files
```bash
head <N> <filePath>
```

### Tail
Output last N lines of a file. An alternative to the tail command in pure BASH

Wraps tail_lines from sys/files
```bash
tail <N> <filePath>
```

---