
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


function pubip() {
    aws ec2 describe-instances --instance-ids $(kubectl get nodes "$1" -o json | jq -r '.metadata.labels["alpha.eksctl.io/instance-id"]') --query 'Reservations[*].Instances[*].PublicIpAddress' --no-cli-pager
}
