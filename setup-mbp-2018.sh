#!/bin/bash

###### INSTRUCTIONS ######
# copy this script to your computer
# in terminal, run the following command to grant executable rights
# `chmod 711 <name_of_script>`
# then execute the script like zis:
# `source <name_of_script>
#
# be proud of yourself.
#########################

# METHODS
create_dev_folder() {
  if [[ ! -d dev ]]; then
    echo "LOG: create dev folder"
    mkdir dev
  fi
}

install_base_brew() {
  # From the website: https://brew.sh/ -20180602
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_vscode() {
  brew install homebrew/cask/visual-studio-code
}

## 
# Verify program method checks if program is installed on the system. If not, it will run the second parameter
# which should be a method to install the desired program. Afterwards, the method will call itself to verify
# that the program has actually been installed correctly.
#
# Note: make sure that the first if condition will be met after installation. Otherwise, infinite loop
#
# $1 program name which is known to /usr/bin or /usr/local/bin to verify if program exists
# $2 method for installation of desired program
##
verify_program() {
  if "$1" -v | grep -q "no ${1}" || [[ $("$1" -v | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    $2
    verify_program "$1" "$2"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

install_code_extensions() {
  if [[ $(code --list-extensions | grep 'shakram02.bash-beautify' | head -c1 | wc -c) -eq 0 ]]; then
    code --install-extension shakram02.bash-beautify
    install_code_extensions
  else
    echo "VSCODE:: extensions installed"
  fi
}

main() {
  # import other scripts
  . lib/alias.sh
  . lib/brews.sh
  . lib/casks.sh
  . lib/gems.sh

  # create main working folder
  cd ~ || exit
  
  create_dev_folder
  
  # enter main working folder
  cd dev || exit
  
  setup_alias
  
  # verify_program brew install_base_brew
  batch_install_brews

  # verify_program code install_vscode

  batch_install_casks
  batch_install_gems

  # install_code_extensions

  # # cleanup
  brew cleanup --force
  rm -f -r /Library/Caches/Homebrew/*
  
  # return to home
  cd ~ || exit
}

main

# TODO: NODE AT LTS VERSION
# gem install bundler
# # TODO: git configs
#   "merge.ff false"
#   "pull.rebase true"
#     "user.name pathikrit"
#   "user.email pathikritbhowmick@msn.com"

  # inspiration https://github.com/pathikrit/mac-setup-script/blob/master/setup.sh
  # https://www.shellcheck.net/#