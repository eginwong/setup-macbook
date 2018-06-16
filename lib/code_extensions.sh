#!/bin/bash

code_extensions=(
  shakram02.bash-beautify
  mikael.angular-beastcode
  formulahendry.auto-close-tag
  formulahendry.auto-complete-tag
  formulahendry.auto-rename-tag
  steoates.autoimport
  eamodio.gitlens
  abusaidm.html-snippets
  jsynowiec.vscode-insertdatestring
  yzhang.markdown-all-in-one
  esbenp.prettier-vscode
  ms-python.python
  glen-84.sass-lint
  foxundermoon.shell-format
  eg2.tslint
)

# verify if cask is present. If not, install. If yes, do nothing.
# lowercase everything for sensitivity
function verify_code_extension {
  if [[ $(code --list-extensions | tr "[:upper:]" "[:lower:]" | grep "$1" | head -c1 | wc -c) -eq 0 ]]; then
    echo "$1:: not installed" | awk '{print toupper($0)}'
    install_code_extension "$1"
    verify_code_extension "$1"
  else
    echo "$1:: installed" | awk '{print toupper($0)}'
  fi
}

# command for single install cask
function install_code_extension {
  code --install-extension "$1"
}

# install all code_extensions available in declared constant
# @param code_extensions
function batch_install_code_extensions {
  echo "INSTALLING CODE EXTENSIONS"
  for EXTENSION in "${code_extensions[@]}"
  do
    :
    verify_code_extension "$EXTENSION"
  done
}