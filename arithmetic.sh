#!/bin/bash

INCREMENT() {
	local init end increment
	
	IFS='=+' read init increment end <<<${@%.*}
	
	until [[ $init -ge $end ]] ; do
		((init+=$increment))
		printf '%s ' "$init"
	done
	echo
}

DECREMENT() {
	local init end decrement
	
	IFS='=-' read init decrement end <<<${@%.*}

	until [[ $init -le -$end ]] ; do
		init=$((init-$decrement))
		printf '%s ' "$init"
	done
	echo
}

POWER() {
	local x y
	
	IFS='^' read x y <<<${@%.*}

	echo $((x**y))
}

DIVIDE() {
	local x y

	IFS='/' read x y <<<${@%.*}

	echo $((x/y))
}

REMAINDER() {
	local x y

	IFS='%' read x y <<<${@%.*}

	echo $((x%y))
}

MULTIPLY() {
	local x y

	IFS='*x' read x y <<<${@%.*}

	echo $((x*y))
}

ADD() {
	local x y
	
	IFS='+' read x y <<<${@%.*}

	echo $((x+y))
}

SUBTRACT() {
	local x y

	IFS='-' read x y <<<${@%.*}
	
	echo $((x-y))
}
