<details open><summary><h1>:infinity: Loops</h1></summary>

A library of very useful loop helper procedures

### Skip
Skip N or 1 loop iterations. Iterations are stored to the $SKIP builtin
```bash
skip <N>
```
---
</details>


<details open><summary><h1>:bookmark_tabs: Stacks</h1></summary>

### Push
Push element(s) on top of the stack
```bash
push <element>
```

### Pop
Pop element(s) from stack, storing them to the $POPPED builtin
```bash
pop <element_index>
```

*Executing `pop` without arguments will pop the first element from the stack`

### Peek
Show element(s) in stack
```bash
peek <element_index>
```

*Executing `peek` without arguments will show the first element in the stack*

### Stack
View stack information
```bash
stack <option>
```

#### Options
```
empty,-e,--empty  ...  Empty the stack
reverse,-r,--reverse  ...  Reverse the stack
```

*Executing `stack` without arguments will output the entire stack with index and stack count*

### Cycle
Cycle the stack (shifting N elements)
```bash
cycle <N>
```

*Cycle backwards by specifying a negative integer*
</details>
