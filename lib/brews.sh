brews=(
  ruby
  node
)

# verify if brew is present. If not, install. If yes, do nothing.
function verify_brew {
  if "$1" --version | grep -q "no ${1}" || [[ $("$1" --version | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_brew "$1"
    verify_brew "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

# command for single install brew
function install_brew {
  brew install "$1"
}

# install all brews available in declared constant
# @param brews
function batch_install_brews {
  for BREW in "${brews[@]}" 
  do 
    :
    verify_brew "$BREW"
  done
}