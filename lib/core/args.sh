#!/bin/bash

# get arguments and short/long options
get_args(){
    for _; do
        if [[ $_ =~ ^-(-)? ]]; then
            OPTS+=("$_")
        else
            ARGS+=("$_")
        fi
    done
}

# check to see if parameters ocntain option or option with argument
has_opt(){
    local optFound

    for _; do
        for (( i = 0; i < ${#OPTS[@]}; i++ )); do
            [[ "${OPTS[$i]} ${ARGS[$i]}" == "$_"* ]]&& optFound=1
        done
    done

    (( optFound ))&& :
}