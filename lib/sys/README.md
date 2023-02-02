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

### Create file
```touch
touch <filePath>
```

---

Many bashin procedures are re-mapped to their counterpart system commands