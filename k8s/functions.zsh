
m () {
    if [[ $# > 0 ]]
    then
        microk8s $@
    else
        microk8s --help
    fi
}

mk () {
    microk8s kubectl $@
}

mp () {
    if [[ $# > 0 ]]
    then
        multipass $@
    else
        multipass list
    fi
}
