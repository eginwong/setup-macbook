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

main() {

# create main working folder
cd ~ || exit

create_dev_folder

# enter main working folder
cd dev || exit

setup_alias

# return to home
cd ~

}

main

# LOG PROGRAMS TO INSTALL
# TRY TO GET BREW INSTALL TO WORK visual-studio-code
# GIT
# VSCODE: https://code.visualstudio.com/download
