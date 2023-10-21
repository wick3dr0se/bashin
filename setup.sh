#!/bin/bash
# This is just a script to fetch bashin and source (append) it globally from .bash_profile
# This script can be called to make your scripts portable with bashin; Check for $BASHIN env. If doesn't exist execute this script remotely. See below
# https://github.com/wick3dr0se/bashin/tree/main#auto-setup

(( BASHIN ))&&{
  printf 'Bashin already exist on system!\n'
  exit
}

API='https://api.github.com/repos'
AUTHOR='wick3dr0se'
REPO='bashin'

# create a hidden directory for bashin in ~/
mkdir "$HOME/.bashin"

# download bashin and extract to ~/.bashin
curl -L "$API/$AUTHOR/$REPO/tarball" | tar -xzC "$HOME/.bashin" --strip=1

# append sourcing ~/.bashin/bashin to ~/.bash_profile
printf '\n. ~/.bashin/bashin\n' >>"/$HOME/.bash_profile"

# source bash_profile, in turn sourcing bashin
. "$HOME/.bash_profile"
