#!/bin/bash

sudo -v

# setup bashrc
if [ ! -f ~/.bashrc_mine ]; then
    cp ./bashrc ~/.bashrc_mine
fi

grep -q 'source ~/.bashrc_mine' ~/.bashrc
if [ $? -ne 0 ]; then
    echo '# Source my configuration' >> ~/.bashrc
    echo 'source ~/.bashrc_mine' >> ~/.bashrc
fi

function install_rvm {
  sudo curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
  sudo curl -sSL https://get.rvm.io | bash -s stable --ruby
}


# Setup python dev environment
sudo pip install virtualenvwrapper

mkdir ~/envs
cp ./virtualenv/* ~/envs/

# Ruby
install_rvm

