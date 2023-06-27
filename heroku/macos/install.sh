#!/usr/bin/env sh -e

if [[ ! -x $(which heroku) ]]; then
    brew tap heroku/brew && brew install heroku
fi
