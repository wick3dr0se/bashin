#!/bin/bash

4BIT() {
	local bg_clr fg_clr fx col
	declare -A bg_clr fg_clr fx
bg_clr=(
[black]=40
[red]=41
[green]=42
[yellow]=43
[blue]=44
[purple]=45
[light-blue]=46
[white]=47
)
fg_clr=(
[black]=30
[red]=31
[green]=32
[yellow]=33
[blue]=34
[purple]=35
[light-blue]=36
[white]=37
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

	for col in ${!fg_clr[@]} ${!bg_clr[@]} ${!fx[@]} ; do
		case $col in
			$2) fg_clr="${fg_clr[$col]}" ;;
			$3) [[ $4 ]] && bg_clr="${bg_clr[$col]};" || fx="${fx[$col]};" ;;
			$4) fx="${fx[$col]};" ;;
		esac
	done
	printf '\e[%s%s%sm%s\e[0m\n' "$fx" "$bg_clr" "$fg_clr" "$1"
}

VT100() {
	local cursor var1 var2 erase col

	IFS=- read x var1 var2 <<<$1

	declare -A cursor erase
cursor=(
[home]='\e[H'
[position]="\e[${var1};${var2}H"
[up]="\e[${var1}A"
[down]="\e[${var1}B"
[right]="\e[${var1}C"
[left]="\e[${var1}1D"
[^down]="\e[${var1}E"
[^up]="\e[${var1}F"
[col]="\e[${var1}G"
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

	for col in ${!cursor[@]} ${!erase[@]} ; do
		case $col in
			${1/-*}) cursor="${cursor[$col]}" ;;
			$2) erase="${erase[$col]}" ;;
		esac
	done

	printf "${cursor}${erase}"
}

RAINBOW() {
	local clr char

	clr=1
	while read -N1 char ; do
		[[ $clr -le 6 ]] && ((clr++))
		[[ $clr == 7 ]] && clr=1
		[[ $char == ' ' ]] && ((clr--))
		printf '\e[1;3%sm%s\e[0m' "$clr" "$char"
	done <<<"$@"
}
