brews=(
  ruby
  node
)

function verify_brew {
  if "$1" --version | grep -q "no ${1}" || [[ $("$1" --version | head -c1 | wc -c) -eq 0 ]]; then
    echo "${1}:: not installed" | awk '{print toupper($0)}'
    install_brew "$1"
    verify_brew "$1"
  else
    echo "${1}:: installed" | awk '{print toupper($0)}'
  fi
}

function install_brew {
  brew install "$1"
}