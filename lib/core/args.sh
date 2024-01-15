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