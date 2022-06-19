#!/bin/bash

INCREMENT() {
	local init end increment
	
	IFS='=+' read init increment end <<<$@

	until [[ $init -ge $end ]] ; do
		((init+=$increment))
		printf '%s ' "$init"
	done
	echo
}

DECREMENT() {
	local init end decrement
	
	IFS='=-' read init decrement end <<<$@

	until [[ $init -le -$end ]] ; do
		init=$((init-$decrement))
		printf '%s ' "$init"
	done
	echo
}

DIVIDE() {
	local numerator denominator

	IFS='/' read numerator denominator <<<$@
	numerator=${numerator//.[0-9]*}
	denominator=${denominator//.[0-9]*}

	echo $((numerator/denominator))
}

MODULO() {
	local numerator denominator

	IFS='%' read numerator denominator <<<$@
	numerator=${numerator//.[0-9]*}
	denominator=${denominator//.[0-9]*}

	echo $((numerator%denominator))
}

MULTIPLY() {
	local x y

	IFS='*x' read x y <<<$@

	echo $((x*y))
}

ADD() {
	local x y
	
	IFS='+' read x y <<<$@

	echo $((x+y))
}

SUBTRACT() {
	local x y

	IFS='-' read x y <<<$@
	
	echo $((x-y))
}
