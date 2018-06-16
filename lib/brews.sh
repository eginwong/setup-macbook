#!/bin/bash

brews=(
  node
  ruby
  rbenv
  ruby-build
  shellcheck
  shfmt # for shell formatter
)

# verify if brew is present. If not, install. If yes, do nothing.
function verify_brew {
  if command -v "$1" >/dev/null 2>&1; then
    echo "${1}:: installed" | awk '{print toupper($0)}'
  else
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_brew "$1"
    verify_brew "$1"
  fi
}

# command for single install brew
function install_brew {
  brew install "$1"
}

# install all brews available in declared constant
# @param brews
function batch_install_brews {
  echo "INSTALLING BREWS"
  for BREW in "${brews[@]}"
  do
    :
    verify_brew "$BREW"
  done
}