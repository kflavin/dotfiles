#!/usr/bin/env sh
# boostrap.sh should be run first
# This will install software onto the host.

cd "$(dirname $0)/.."
source ./script/lib/functions.sh

# We need brew in our path
export PATH="$PATH:/usr/local/bin:/opt/homebrew/bin"

if [[ "$(uname -s)" == "Darwin" ]]; then
    info "installing mac dependencies"
    # These need to be installed first.
    sh -c "./macos/defaults/install.sh" #> /dev/null 2>&1

    # Run all other install scripts.  These scripts should not use sudo, because output is captured.
    find . ! -path "./script/*" -maxdepth 3 -name install.sh -a -not -path './macos/*' | while read installer; do 
        sh -c "${installer}" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            warn "$installer could not be installed"
        else
            info "$installer installed"
        fi
    done
fi

