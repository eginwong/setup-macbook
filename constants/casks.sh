casks=(
  dropbox
  insomnia
  java
  skype
  slack
  steam
  transmission
)

function verify_cask {
  if [[ $(brew cask list | grep "$1" | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_cask "$1"
    verify_cask "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

function install_cask {
  brew cask install "$1"
}