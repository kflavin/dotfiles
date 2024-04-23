
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

function privip() {
    aws ec2 describe-instances --filter Name=ip-address,Values=$1 --query 'Reservations[*].Instances[*].PrivateDnsName' --no-cli-pager
}

function helmuninstall() {
    ( helm -n $1 uninstall --wait backend || true ) && \
      ( helm -n $1 uninstall --wait rxv-services || true ) && \
      ( helm -n $1 uninstall deps || true ) && \
      kubectl delete ns $1
}


function watchpods() {
    watch -n.1 -d "kubectl -n $1 get pods"
}

function krun() {
    namespace=""

    while getopts ":n:" opt; do
      case ${opt} in
        n )
          namespace="$OPTARG"
          ;;
        \? )
          echo "Invalid option: $OPTARG" 1>&2
          ;;
        : )
          echo "Invalid option: $OPTARG requires an argument" 1>&2
          ;;
      esac
    done
    shift $((OPTIND -1))


    image=${1:-alpine:latest}
    cmd=${2:-sh}
    #c=$(echo kubectl ${namespace}run -it --rm --restart=Never --image "$image" $(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z') -- "$cmd")
    #kubectl -n "${namespace}" run -it --rm --restart=Never --image "$image" $(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z') -- "$cmd"
    #bash -c "$c"

    command=("kubectl" "run" "-it" "--rm" "--restart=Never" "--image" "$image")
    if [[ -n "$namespace" ]]; then
        command+=("-n" "$namespace")
    fi
    command+=("$(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z')" "--" "$cmd")
    "${command[@]}"
}

