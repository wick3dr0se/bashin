#!/bin/bash
# This is just a script to fetch bashin and source it globally
# Check for the $BASHIN env before program execution, execute this setup script accordingly

(( BASHIN ))&&{
  printf 'Bashin found!'
  exit
}

API='https://api.github.com/repos'
AUTHOR='wick3dr0se'
REPO='bashin'

# create a hidden directory for bashin
mkdir ~/.bashin

# download bashin and extract
curl -L "$API/$AUTHOR/$REPO/tarball" | tar -xzC ~/.bashin --strip=1

# append to .bashrc
printf '\n. ~/.bashin/bashin\n' >>~/.bashrc

# source bashrc, in turn sourcing bashin
. ~/.bashrc
