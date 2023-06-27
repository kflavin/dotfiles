#!/usr/bin/env sh

if [[ ! -x $(which rvm) ]]; then
    gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    #\curl -sSL https://get.rvm.io | bash -s stable --ruby
    # M1 works with development version, but not stable
    \curl -sSL https://get.rvm.io | bash
fi
