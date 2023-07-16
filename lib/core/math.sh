#!/bin/bash
## Arithmetic

math() { # do advanced arithmetic in precedence from C
  local output="$(${BASH_SOURCE[0]%math.sh}/arithmetic <<<"$@")"

  while [[ $output =~ 0$ ]]; do
    output="${output%0}"
  done

  printf '%s\n' "${output%.}"
}
