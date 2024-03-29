# Add my key
function keys() {
    eval $(ssh-agent) && ssh-add
}

# ports pass quick proto tcp to 63.90.9.10 port {2414:2417,2422
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias hex2raw="tr -d '\\\x' | xxd -r -p"
alias int2hex='python -c "import sys; print hex(int(sys.argv[1]))"'
alias int2oct='python -c "import sys; print oct(int(sys.argv[1]))"'
alias hex2int='echo -n f | python -c "import sys; print int(sys.argv[1], 16)"'
alias oct2int='echo -n o | python -c "import sys; print int(sys.argv[1], 8)"'

# Get the twos complement
function twos {
 if [[ -z $1 ]]; then
     echo "Need negative number."
     return 1
 fi
 echo $((~$1+1))
}

# virtualenvwrapper
export WORKON_HOME=~/envs
export PROJECT_HOME=~/projects
export VIRTUALENV_USE_DISTRIBUTE=1
export PIP_RESPECT_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh

# Quickly move between environment and project files
function cde {
    VENV=/home/yay/envs/$PROJECT_NAME
    cd $VENV/lib/python*/site-packages
}

function cdp {
    cd $PROJECT_DIR
}

# Django
source ~/bin/make_django_project

# Go
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/repos/gobook
