function setup_alias {
  ALIASLL=("alias ll='ls -Al'")
  ALIASBEJS=("alias bejs='bundle exec jekyll serve'")
  
  if [[ -e ~/.bash_profile ]] && grep -qF "${ALIASLL[*]}" ~/.bash_profile; then
    echo "ALIAS:: INSTALLED"
  else
    echo "ALIAS:: NOT INSTALLED"
    echo "${ALIASLL[*]}" >> ~/.bash_profile
    setup_alias
  fi
  
  # shellcheck disable=SC1091
  # shellcheck source=~
  . ~/.bash_profile
}