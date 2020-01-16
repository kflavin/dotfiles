#!/bin/sh

set -e
#cd $(dirname $0)../../
source ./script/lib/functions.sh

# Packages for YCM
if test ! $(which cmake); then
    # cmake exits with non-zero code if it already exists
    #brew install cmake
    echo "asdf"
fi
#brew install vim
#
#if test $(which python); then
#    $DOTFILES/vim/vim.symlink/bundle/YouCompleteMe/install.py
#else
#    warn "Python not found, skipping YCM for vim installation."
#fi
