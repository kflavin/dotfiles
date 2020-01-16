#!/bin/sh

set -e
#cd $(dirname $0)../../
source $DOTFILES/script/lib/functions.sh

# Need for YCM
brew install cmake
brew install vim

if test $(which python); then
    $DOTFILES/vim/vim.symlink/bundle/YouCompleteMe/install.py
else
    warn "Python not found, skipping YCM for vim installation."
fi
