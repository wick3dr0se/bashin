<div align="center">
<h1>bashin</h1>
<p>A minimal BASH framework</p>

<img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white"></img>
<img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></img>
<img src=https://img.shields.io/badge/Maintained%3F-yes-green.svg></img>
<img src="https://badge-size.herokuapp.com/wick3dr0se/bashin/master/bashin.sh"></img>  
<a href="https://discord.gg/W4mQqNnfSq">
<img src="https://discordapp.com/api/guilds/913584348937207839/widget.png?style=shield"/></a>
</div>

Bashin is an extension of BASH intended to be as minimal and clean as possible; Wrote in pure BASH with (floating point) arithmetic evaluation borrowed from C, bashin is super fast

Many scripters resort to slow external commands glued together with pipes and subshells. Of course they have their use cases but generally (for performance sake) they should be avoided

Bashin can be used to handle advanced arithmetic in precedence, e.g:

```bash
  math '5*(2+3)-8'
```

> 17

— Among many other things; Ran interactively or from within another script

Bashin handles ANSI escape sequences that make coloring, positioning and other modifications way more simple (like a TUI)

<div align="center"><h1>Contents</h1></div>

* [Setup](#setup)
* [How to Use](#how-to-use)
    * [ANSI Escape Sequencss](#ansi-escape-sequences)
        * [[style]](#ansi-style)
        * [[cursor]](#ansi-cursor)
        * [[rainbow]](#ansi-rainbow)
    * [Arithmetic](#arithmetic)
        * [[math]](#math)
    * [String Manipulation](#string-manipulation)
        * [[regex]](#regex)
        * [[truncate]](#truncate)
        * [[trim]](#trim)
        * [[trim_all]](#trim_all)
        * [[split]](#split)
        * [[head]](#head)
        * [[tail]](#tail)
        * [[lines]](#lines)
        * [[random]](#random)
        * [[unique]](#unique)
* [Communication](#communication)

# Setup

clone the repository
```bash
git clone https://github.com/wick3dr0se/bashin&& cd "${_##*/}"
```

source bashin within another script
```bash
<path>/bashin
# or
. <path>/bashin
```

*source within your ~/.bashrc to use interactively & globally*

# How to Use

see `usage.sh` for examples

<div align="center"><h2>ANSI escape sequences</h2></div>

### ANSI [style]
text colors and styles (accepts countless arguments)
```bash
style fg-<color> bg-<color> <mode>
```

### [style]-color params:

`black` - set fg/bg color to black  
`red` - set fg/bg color to red  
`green` - set fg/bg color to green  
`yellow` - set fg/bg color to yellow  
`blue` - set fg/bg color to blue  
`purple` - set fg/bg color to purple  
`cyan` - set fg/bg color to cyan    
`white` - set fg/bg color to white

---

### [style]-mode params:

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

### ANSI [cursor]
terminal control (accepts countless arguments)
```bash
cursor '<position>' '<erase>'
```

### [cursor]-position params:

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

### [cursor]-erase params:

`?screen:end` - erase from cursor to end of screen  
`?screen:beg` - erase from beg of screen to cursor  
`?screen` - erase entire screen  
`?row:saved` - erase saved row  
`?row:end` - erase from cursor to end of row  
`?row:beg` - erase start of row to cursor  
`?row` - erase the entire row

---

### ANSI [rainbow]
colorize a specified string, variable or array per character
```bash
rainbow '<string>'
```

<div align="center"><h2>Arithmetic</h2></div>

### [math]
evaluate an equation by precedence
```bash
math '<c*(a+b)-d>'
```

<div align="center"><h2>String Manipulation</h2></div>

### [regex]
match a string by regular expression
```bash
regex '<string>' <pattern>
```

---

### [truncate]
trim all excess whitespace
```bash
truncate '  <string>  '
```

### [trim]
remove a given value from string
```bash
trim '<string>' '<value>'
```

### [trim_all]
remove all cases of given value from string
```bash
trim_all '<string> <value>'
```

### [split]
split by delimeter
```bash
split '<string>' '<delimeter>'
```

---

### [head]
output the first N rows of a specified file
```bash
head <N> <file>
```

### [tail]
output the last N rows of a specified file
```bash
tail <N> <file>
```

---

### [lines]
get a line count from a specified file
```bash
rows <file>
```

---

### [random]
fetch a random element from string; variable or array
```bash
random  <hi> <bye> <cya>
```

---

### [unique]
unique gets unique elements not found in both strings; variable or array
```bash
unique "<array1[@]>" "<array2[@]>"
```
