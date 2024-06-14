
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
    # Starts a pod in a namespace, and can optionally mount a volume.
    namespace=""
    volume=""

    while getopts ":nv:" opt; do
      case ${opt} in
        n )
          namespace="$OPTARG"
          ;;
        v )
          volume="$OPTARG"
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
    pod_name="one-off-$(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z')"
    #c=$(echo kubectl ${namespace}run -it --rm --restart=Never --image "$image" $(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z') -- "$cmd")
    #kubectl -n "${namespace}" run -it --rm --restart=Never --image "$image" $(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z') -- "$cmd"
    #bash -c "$c"

    if [[ -n "$volume" ]]; then
        override_spec='
{
    "spec": {
        "volumes": [
            {
                "name": "'"$volume"'",
                "persistentVolumeClaim": {
                    "claimName": "'"$volume"'"
                }
            }
        ],
        "containers": [
            {
                "name": "'"$pod_name"'",
                "image": "'"$image"'",
                "stdin": true,
                "tty": true,
                "args": ["'"$cmd"'"],
                "volumeMounts": [
                    {
                        "mountPath": "/data",
                        "name": "'"$volume"'"
                    }
                ]
            }
        ]
    }
}'; fi


    # To re-attach to a pod (pass -c for container): k -n default attach -it f685eeca

    command=("kubectl" "run" "-it" "--rm" "--restart=Never" "--image" "$image")
    if [[ -n "$namespace" ]]; then
        command+=("-n" "$namespace")
    fi
    if [[ -n "$volume" ]]; then
        command+=("--overrides" "$override_spec")
    fi
    command+=("$pod_name" "--" "$cmd")
    echo "$command"
    "${command[@]}"
}

function krun2() {
    namespace=""
    image_type=${1}

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

    pod=$(kubectl get pods --namespace=$namespace | grep $1 | head -1 | cut -d" " -f1)
    image=$(kubectl describe pod $pod --namespace=$namespace | grep Image: | head -1 | awk '{ print $2}')
    echo "Starting from $image..."
    krun -n $namespace "$image" $cmd
}


function krun3() {
    # This one is good for replicating a pod with environment variables

    if [[ -z $1 ]]; then
        echo "Usage: $0 [-n namespace] <type> <command>"
        return 1
    fi
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

    type=$1
    cmd=${2:-sh}

    pod_name="one-off-$(uuidgen | cut -d- -f1 | tr 'A-Z' 'a-z')"
    from_pod=$(kubectl --namespace=$namespace get pods | grep "$type" | head -1 | awk '{print $1}')

    if [[ -z $from_pod ]]; then
        echo "No pod exists for $type"
        return 1
    fi

    container_spec=$(kubectl --namespace=$namespace get pod "$from_pod" -o json | jq -c '.spec.containers[0]')
    env_vars=$(echo $container_spec | jq -c '.env')
    image=$(echo $container_spec | jq -c -r '.image')
    overrides=$(cat <<EOF
{
  "spec": {
    "containers": [{
      "name": "$pod_name",
      "env": $env_vars
    }]
  }
}
EOF
)

    echo kubectl --namespace="$namespace" run "$pod_name" -it --rm --restart=Never --image "$image" --overrides="<..overrides..>" --override-type strategic -- $cmd
    kubectl --namespace="$namespace" run "$pod_name" -it --rm --restart=Never --image "$image" --overrides="$overrides" --override-type strategic -- $cmd
}
