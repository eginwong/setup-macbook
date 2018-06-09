casks=(
  dropbox
  insomnia
  java
  skype
  slack
  steam
  transmission
)

# verify if cask is present. If not, install. If yes, do nothing.
function verify_cask {
  if [[ $(brew cask list | grep "$1" | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_cask "$1"
    verify_cask "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

# command for single install cask
function install_cask {
  brew cask install "$1"
}

# install all casks available in declared constant
# @param casks
function batch_install_casks {
  for CASK in "${casks[@]}" 
  do 
    :
    verify_cask "$CASK"
  done
}