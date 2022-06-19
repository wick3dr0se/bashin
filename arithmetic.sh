#!/bin/bash

INCREMENT() {
	local init end increment
	
	IFS='=+' read init end icrement <<<$1

	until [[ $init -ge $end ]] ; do
		((init+=$icrement))
		printf '%s ' "$init"
	done
	echo
}

DECREMENT() {
	local init end decrement
	
	IFS='=-' read init end decrement <<<$1

	until [[ $init -le -$end ]] ; do
		init=$((init-$decrement))
		printf '%s ' "$init"
	done
	echo
}

DIVIDE() {
	local numerator denominator

	IFS='/' read numerator denominator <<<$1
	numerator=${numerator//.[0-9]*}
	denominator=${denominator//.[0-9]*}

	echo $((numerator/denominator))
}

MODULUS() {
	local numerator denominator

	IFS='%' read numerator denominator <<<$1
	numerator=${numerator//.[0-9]*}
	denominator=${denominator//.[0-9]*}

	echo $((numerator%denominator))
}

MULTIPLY() {
	local x y

	IFS='*' read x y <<<$1

	echo $((x*y))
}

ADD() {
	local x y
	
	IFS='+' read x y <<<$1

	echo $((x+y))
}

SUBTRACT() {
	local x y

	IFS='-' read x y <<<$1
	
	echo $((x-y))
}
