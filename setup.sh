#!/bin/bash

#################
# OLD: Do Not Run
##################

sudo -v

# setup bashrc
cp -i ./bashrc ~/.bashrc_mine

# Local bin directory
mkdir ~/.bin_local

grep -q 'source ~/.bashrc_mine' ~/.bashrc
if [ $? -ne 0 ]; then
    echo '# Source my configuration' >> ~/.bashrc
    echo 'source ~/.bashrc_mine' >> ~/.bashrc
fi

function install_rvm {
    if [ \! $(which rvm) ]; then
        sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
        sudo curl -sSL https://get.rvm.io | bash -s stable --ruby
    fi
}

# Setup our basic directory structure
test -d ~/envs || mkdir ~/envs
test -d ~/projects || mkdir ~/projects
cp ./virtualenv/* ~/envs/

# Setup python dev environment (environment configured in .bashrc_mine)
sudo pip install virtualenvwrapper

# Ruby
install_rvm

