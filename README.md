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

Bashin is an extension of BASH intended to be as minimal and clean as possible; Wrote in pure BASH, bashin is super fast

Many scripters resort to slow external commands glued together with pipes and subshells. Of course they have their use cases but generally (for performance sake) they should be avoided

Bashin makes BASH shine in string manipulation, e.g:

```bash
arr=('a' 'b' 'c')

reverse_array "${arr[@]}"

echo "${REVERSE[@]}"
```

> c b a

```bash
arr1=('a' 'b' 'c') arr2=('a' 'c')

unique "${arr1[*]}" "${arr2[*]}"

echo "${UNIQUE[@]}"
```

> b

— Among many other things; Bashin can be sourced interactively or per script

Bashin handles ANSI escape sequences that make coloring, positioning and other terminal modifications much more simple (like building a TUI)

# Auto Setup
execute the setup.sh script (recommended)

```bash
bash <(curl -s https://raw.githubusercontent.com/wick3dr0se/bashin/main/setup.sh)
```

*the one-liner above will remotely execute the `bashin` setup script - including `bashin`*

## Manual Setup
clone the repository
```bash
git clone https://github.com/wick3dr0se/bashin&& cd "${_##*/}"
```

execute the setup.sh script `bash setup.sh`

otherwise source bashin within another script:
```bash
<path>/bashin
# or
. <path>/bashin
```

source within your ~/.bashrc to use interactively & globally

then use `import_all` or `import` to manually source necessary procs (functions), e.g. `import ansi`

*core libs (scripts) are implicitly imported*

# How to Use

See `usage.sh` for examples and view documentation in the respective library directory
