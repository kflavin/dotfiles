
if command -v pyenv 1>/dev/null 2>&1; then
  export PATH=$(pyenv root)/shims:$PATH
  eval "$(pyenv init -)"
  #eval "$(pyenv init - | sed 's:^pyenv() :function pyenv():')"
fi

## enable pyenv virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
