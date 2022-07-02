#!/bin/bash

4bit() {
	local clr fx a b c d
	declare -A clr fx
clr=(
[black]=0
[red]=1
[green]=2
[yellow]=3
[blue]=4
[purple]=5
[light-blue]=6
[white]=7
)

fx=(
[bold]=1
[dim]=2
[italic]=3
[underline]=4
[blink]=5
[blink-fast]=6
[reverse]=7
[hidden]=8
[strike]=9
)

	[[ $2 ]] && d="3${clr[$2]}"
	[[ $3 ]] && {
	      	[[ ${!clr[@]} =~ $3 ]] && c="4${clr[$3]};" || c="${fx[$3]};"
	}
	[[ $4 ]] && b="${fx[$4]};"
	[[ $5 ]] && a="${fx[$5]};"
	
	printf '\e[%s%s%s%sm%s\e[0m\n' "$a" "$b" "$c" "$d" "$1"

}

vt100() {
	local cursor erase var

	declare -A cursor erase
cursor=(
[home]='\e[H'
[position]="\e[H"
[up]="\e[A"
[down]="\e[B"
[right]="\e[C"
[left]="\e[D"
[^down]="\e[E"
[^up]="\e[F"
[col]="\e[G"
[cursor]='\e[6n'
[up-scroll]='\M'
[save]='\7'
[restore]='\8'
)
erase=(
[cursor]='\e[J'
[^cursor]='\e[1J'
[screen]='\e[2J'
[saved]='\e[3J'
[row]='\e[K'
[^row]='\e[1K'
[^row$]='\e[2K'
)

  [[ $1 =~ - ]] && var=${1/*[a-z]-} && var=${var/-/;}
  cursor="${cursor[${1%%-*}]::-1}${var}${cursor[${1%%-*}]##*[}"

  if [[ ${!erase[@]} =~ ${2%%-*} ]] ; then
    [[ $2 ]] && erase=${erase[${2%%-*}]}
  elif [[ ${!cursor[@]} =~ ${2%%-*} ]] ; then
    [[ $2 =~ - ]] && var=${2/*[a-z]-}
    cursor+="${cursor[${2%%-*}]::-1}${var}${cursor[${2%%-*}]##*[}"
  fi

  [[ $3 ]] && erase+=${erase[${3%%-*}]}

  printf "${cursor}${erase}"
}

rainbow() {
	local clr char

	clr=1
	while read -N1 char ; do
		[[ $clr -le 6 ]] && ((clr++))
		[[ $clr == 7 ]] && clr=1
		[[ $char == ' ' ]] && ((clr--))
		printf '\e[1;3%sm%s\e[0m' "$clr" "$char"
	done <<<"$@"
}
