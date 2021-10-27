alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"
alias ka="kubectl get pods -A"

alias bynode="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,NS:.metadata.namespace -A | sort"
alias bypod="kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName,NS:.metadata.namespace -A | sort"
alias byns="kubectl get pod -o=custom-columns=NS:.metadata.namespace,NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName -A | sort"
