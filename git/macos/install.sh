#!/bin/sh

set -e
#cd $(dirname $0)../../
source ./script/lib/functions.sh

brew install hub gh

git config --global core.excludesfile ~/.gitignore_global
