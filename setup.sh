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

# Setup our basic directory structure
test -d ~/envs || mkdir ~/envs
test -d ~/projects || mkdir ~/projects
cp ./virtualenv/* ~/envs/

# Setup python dev environment (environment configured in .bashrc_mine)
sudo pip install virtualenvwrapper

