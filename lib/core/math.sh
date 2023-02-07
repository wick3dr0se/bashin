#!/bin/bash

## Arithmetic
math() { # do advanced arithmetic in precedence from C
  "${PWD}"/lib/core/arithmetic < <(echo "$@")
}
