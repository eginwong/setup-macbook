#!/bin/bash

aliases=(
  "alias ll='ls -Al'"
  "alias bejs='bundle exec jekyll serve'"
)

function setup_alias {
  for ALIAS in "${aliases[@]}"
  do
    :
    verify_alias "$ALIAS"
  done
}

function verify_alias {
  echo "INSTALLING ALIASES"
  if [[ -e ~/.bash_profile ]] && grep -qF "$1" ~/.bash_profile; then
    echo "${1}:: INSTALLED"
  else
    echo "${1}:: NOT INSTALLED"
    echo "($1)" >> ~/.bash_profile
    setup_alias
  fi
  
  # shellcheck disable=SC1091
  # shellcheck source=~
  . ~/.bash_profile
}