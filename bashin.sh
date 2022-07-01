#!/bin/bash

set -a

_source() {
	local var i
	[[ $0 == bashin.sh ]] || var="${BASH_SOURCE%/*}"

	for i in "$@" ; do
		i="/${i/.sh}.sh"
		[[ $1 ]] || i='./*'
		. ${var}${i}
	done
}

_run() {
  path="$HOME/.bashin"

  "$path/$1" < <(echo $input)
}

math() {
  input=$@

  _run 'arithmetic'
}

_source 'ansi' 'strings'
