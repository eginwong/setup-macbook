#!/bin/bash

# only global npms
npms=(
  @angular/cli
)

# verify if npm is present. If not, install. If yes, do nothing.
function verify_npm {
  if [[ $(npm list -g --depth 0 | grep "$1" | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_npm "$1"
    verify_npm "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

# command for single install npm
function install_npm {
  npm install -g "$1"
}

# install all npms available in declared constant
# @param npms
function batch_install_npms {
  echo "INSTALLING NPMS"
  for npm in "${npms[@]}"
  do
    :
    verify_npm "$npm"
  done
}