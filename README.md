<div align="center">
<h1>bashin</h1>
<p>A minimal pure BASH framework</p>

<img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white"></img>
<img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></img>
<img src=https://img.shields.io/badge/Maintained%3F-yes-green.svg></img>
<img src="https://badge-size.herokuapp.com/wick3dr0se/bashin/master/bashin"></img>
</div>

Bashin is a framework intended to be as minimal and clean as possible. Wrote in pure BASH, bashin aims for speed and ingenuity

Many scripters resort to external commands that could be instead handled elegantly with builtins. Bashin can be used as a calculator e.g. `ADD 5+7` output: `12`, among many other things; Ran interactively or from within another script

Bashin handles things like ANSI escape sequences that make coloring, positioning and other modifications much more simple (like a TUI)

Bashin loves bashisms

<div align="center"><h1>Contents</h1></div>

* [Setup](#setup)
* [How to Use](#how-to-use)
    * [ANSI](#ansi)
        * [4BIT](#ansi-4bit)
        * [VT100](#ansi-vt100)
        * [RAINBOW](#ansi-rainbow)
    * [Arithmetic](#arithmetic)
        * [INCREMENT](#increment)
        * [DECREMENT](#decrement)
        * [POWER](#power)
        * [MULTIPLY](#multiply)
        * [DIVIDE](#divide)
        * [REMAINDER](#remainder)
        * [ADD](#add)
        * [SUBTRACT](#subtract)
    * [String Manipulation](#string-manipulation)
        * [RANDOM_ELEMENT](#random_element)
        * [UNIQUE_ELEMENT](#unique_element)
    * [Miscellaneous](#miscellaneous)
        * [SOURCE](#source)
* [Communication](#communication)

# Setup

clone the repository

`git clone https://github.com/wick3dr0se/bashin && cd bashin/`

copy bashin to your home directory

`cp .bashin $HOME/`

source bashin

`. ~/.bashin`

*append to your .bashrc to use interactively & globally*

# How to Use

<div align="center"><h2>ANSI</h2></div>

### ANSI [4BIT]
text colors and styles
> `4BIT '<string>' <fg-color> <bg-color> <style>`

or

> `4BIT '<string>' <fg-color> <style>`

### [4BIT]-foreground color & background color params:

`black` - set fg/bg color to black  
`red` - set fg/bg color to red  
`green` - set fg/bg color to green  
`yellow` - set fg/bg.color to yellow  
`blue` - set fg/bg color to blue  
`purple` - set fg/bg color to purple  
`light-blue` - set fg/bg color to light blue  
`white` - set fg/bg color to white

---

### [4BIT]-style params:

`bold` - set bold style  
`dim` - set faint style  
`italic` - set italic style  
`underline` - set underline style  
`blink` - set blinking style  
`blink-fast` - set rapid blinking style  
`inverse` - set inverse style  
`hidden` - set hidden style  
`strike` - set strikeout style  

---

### ANSI [VT100]
terminal control
> `VT100 '<cursor>' '<erase>'`

### [VT100]-cursor params:

`home` - move cursor to 0,0  
`position-n-n` - move cursor to row #n, col $n  
`up-n` - move up #n rows  
`down-n` - move down #n rows  
`right-n` - move right #n columns  
`left-n` - move left #n columns  
`^down-n` - move down to beginning of row #n  
`^up-n` - move up to beginning of row #n  
`col-n` - move cursor to column #n  
`cursor` - get cursor position  
`up-scroll` - move up 1 row & scroll  
`save` - save cursor position  
`restore` - restore cursor to the last save position

---

### [VT100]-erase params:

`cursor` - erase from cursor to end of screen  
`^cursor` - erase from beg of screen to cursor  
`screen` - erase entire screen  
`saved` - erase saved rows  
`row` - erase from cursor to end of row  
`^row` - erase start of row to cursor  
`^row$` - erase the entire row

---

### ANSI [RAINBOW]
colorize a specified string, variable or array per character
> `RAINBOW '<string>'`

---

<div align="center"><h2>Arithmetic</h2></div>

### [INCREMENT]
when specified, from start increment to a maximum
> `INCREMENT <start> + <increment> = <max>`

---

### [DECREMENT]
when specified, from start decrement to a minimum
> `DECREMENT <start> - <decrement> = <min>`

---

### [POWER]
x to the power of y
> `POWER <x> ^ <y>.

---

### [MULTIPLY]
multiply x and y
> `MULTIPLY <x> * or x <y>`

---

### [DIVIDE]
divide x by y
> `DIVIDE <x> / <y>`

---

### [REMAINDER]
remainder of x by y
> `REMAINDER <x> % <y>`

---

### [ADD]
add x to y
> `ADD <x> + <y>`

---

### [SUBTRACT]
subtract x from y
> `SUBTRACT <x> - <y>`

---

<div align="center"><h2>String Manipulation</h2></div>

### [RANDOM_ELEMENT]
fetch a random element from an array
> `RANDOM_ELEMENT  "<array[@]>"`

---

### [UNIQUE_ELEMENT]
when two arrays are specified, UNIQUE_ELEMENT gets unique elements not found in both arrays
> `UNIQUE_ELEMENT "<array1[@]>" "<array2[@]>"`

---

<div align="center"><h2>Miscellaneous</h2></div>

### [SOURCE]
gets absolute path while sourcing multiple specified files. if no argument is supplied, SOURCE sources everything in path

> `SOURCE '<script_name>'`

---

# Communication

[discord](https://discord.gg/TstuWvDzXr)
