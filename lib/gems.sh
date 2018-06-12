gems=(
  bundler
)

# verify if cask is present. If not, install. If yes, do nothing.
function verify_gem {
  if [[ $(gem list | grep "$1" | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_gem "$1"
    verify_gem "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

# command for single install cask
function install_gem {
  gem install "$1"
}

# install all gems available in declared constant
# @param gems
function batch_install_gems {
  for GEM in "${gems[@]}" 
  do 
    :
    verify_gem "$GEM"
  done
}