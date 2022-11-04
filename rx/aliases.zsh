alias api="kubectl exec -it $(kubectl get pods | grep '^api' | awk '{print $1}') -- bash"
alias pg="kubectl exec -it $(kubectl get pods | grep '^post' | awk '{print $1}') -- bash"
