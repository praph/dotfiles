#!/usr/bin/env bash

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

if test ! $(which npsdm)
then
  fail "npm not found, exiting."
  exit 0
fi


# Make a directory for global installations:
info 'Make a directory for global installations:'
mkdir ~/.npm-global

# Configure npm to use the new directory path:
info 'Configure npm to use the new directory path:'
npm config set prefix '~/.npm-global'

# Open or create a ~/.profile file and add this line:
info 'Open or create a ~/.profile file and add this line:'
export PATH=~/.npm-global/bin:$PATH

# Back on the command line, update your system variables:
info 'Back on the command line, update your system variables:'
source ~/.bashrc

success 'Everything set up 👍'