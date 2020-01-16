#!/usr/bin/env sh
# boostrap.sh should be run first
# This will install software onto the host.

cd "$(dirname $0)/.."
source $DOTFILES/script/lib/functions.sh

if [[ "$(uname -s)" == "Darwin" ]]; then
    info "installing mac dependencies"
    find . ! -path "./script/*" -maxdepth 3 -name install.sh | while read installer; do 
        sh -c "${installer}" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            warn "$installer could not be installed"
        else
            info "$installer installed"
        fi
    done
fi

