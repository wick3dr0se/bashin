<div align="center">
<h1>bashin</h1>
<p>A minimal BASH framework</p>

<img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white"></img>
<img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></img>
<img src=https://img.shields.io/badge/Maintained%3F-yes-green.svg></img>
<img src="https://badge-size.herokuapp.com/wick3dr0se/bashin/master/bashin"></img>
</div>

Bashin is a framework intended to be as minimal and clean as possible. Wrote in C and BASH, bashin aims for speed and ingenuity

Many scripters resort to slow external commands glued together with pipes and subshells. Not only is bashin much faster but by extending BASH with C, BASH is capable of so much more

Bashin can be used to handle advanced arithmetic in precedence, e.g. `math '5*(2+3)-8'` output: `17`, among many other things; Ran interactively or from within another script

Bashin handles things like ANSI escape sequences that make coloring, positioning and other modifications way more simple (like a TUI)

<div align="center"><h1>Contents</h1></div>

* [Setup](#setup)
* [How to Use](#how-to-use)
    * [ANSI](#ansi)
        * [[sgr]](#ansi-sgr)
        * [[vt100]](#ansi-vt100)
        * [[rainbow]](#ansi-rainbow)
    * [Arithmetic](#arithmetic)
        * [[math]](#math)
    * [String Manipulation](#string-manipulation)
        * [[random_element]](#random_element)
        * [[unique_element]](#unique_element)
* [Communication](#communication)

# Setup

clone the repository

`git clone https://github.com/wick3dr0se/bashin`

source bashin within another script

`. ~/.bashin`

or source in your .bashrc to use interactively & globally

# How to Use

<div align="center"><h2>ANSI</h2></div>

### ANSI [sgr]
text colors and styles
> `sgr '<string>' <fg-color> <bg-color> <style>`

or

> `sgr '<string>' <fg-color> <style>`

### [sgr]-foreground color & background color params:

`black` - set fg/bg color to black  
`red` - set fg/bg color to red  
`green` - set fg/bg color to green  
`yellow` - set fg/bg.color to yellow  
`blue` - set fg/bg color to blue  
`purple` - set fg/bg color to purple  
`light-blue` - set fg/bg color to light blue   
`white` - set fg/bg color to white

---

### [sgr]-style params:

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

### ANSI [vt100]
terminal control
> `vt100 '<cursor>' '<erase>'`

### [vt100]-cursor params:

`home` - move cursor to 0,0  
`position-n-n` - move cursor to row N, col N  
`up-n` - move up # rows  
`down-n` - move down # rows  
`right-n` - move right # columns  
`left-n` - move left # columns  
`^down-n` - move down to beginning of row #  
`^up-n` - move up to beginning of row #  
`col-n` - move cursor to column #  
`cursor` - get cursor position  
`up-scroll` - move up 1 row & scroll  
`save` - save cursor position  
`restore` - restore cursor to the last save position

---

### [vt100]-erase params:

`cursor` - erase from cursor to end of screen  
`^cursor` - erase from beg of screen to cursor  
`screen` - erase entire screen  
`saved` - erase saved rows  
`row` - erase from cursor to end of row  
`^row` - erase start of row to cursor  
`^row$` - erase the entire row

---

### ANSI [rainbow]
colorize a specified string, variable or array per character
> `rainbow '<string>'`

---

<div align="center"><h2>Arithmetic</h2></div>

### [math]
evaluate an equation by precedence
> `math '<c*(a+b)-d>'`

---

<div align="center"><h2>String Manipulation</h2></div>

### [random_element]
fetch a random element from an array
> `random_element  "<array[@]>"`

---

### [unique_element]
when two arrays are specified, unique_element gets unique elements not found in both arrays
> `unique_element "<array1[@]>" "<array2[@]>"`

---

# Communication

[discord](https://discord.gg/TstuWvDzXr)
