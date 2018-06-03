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
if [ ! -d "dev" ]; then
  echo "LOG: create dev folder"
  mkdir dev
fi
}

setup_alias() {
ALIASLL="alias ll='ls -Al'"

if [[ -e ~/.bash_profile ]] && grep -qF "$ALIASLL" ~/.bash_profile;then
  echo "alias already present"
else
  echo $ALIASLL >> ~/.bash_profile
fi

. ~/.bash_profile
}

homebrew() {
if which brew | grep -q 'no brew' || [[ $(which brew | head -c1 | wc -c) -eq 0 ]]; then
  echo "HOMEBREW:: not installed"
  # From the website: https://brew.sh/ -20180602
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  homebrew
else
  echo "HOMEBREW:: installed"
fi
}

vscode() {
if which code | grep -q 'no code' || [[ $(which code | head -c1 | wc -c) -eq 0 ]]; then
  echo "VSCODE:: not installed"
  brew install homebrew/cask/visual-studio-code
  vscode
else
  echo "VSCODE:: installed"
fi
}

ruby_update() {
  echo "RUBY:: currently at $(ruby -v)"
  echo "RUBY:: updating"
  brew install ruby
  echo "RUBY:: updated"
}


main() {

# create main working folder
cd ~ || exit

create_dev_folder

# enter main working folder
cd dev || exit

setup_alias

homebrew
ruby_update
vscode

# return to home
cd ~

}

main

# LOG PROGRAMS TO INSTALL
# TRY TO GET BREW INSTALL TO WORK visual-studio-code
# GIT
# VSCODE: https://code.visualstudio.com/download
