alias kubectl="kubecolor"

ensure_aws_logged() {
  aws s3 ls --profile caju-admin &> /dev/null

  if [ $? -ne 0 ]; then
    echo "You need to login to AWS"
    aws sso login --profile caju-admin
  fi
}

ek() {
    ensure_aws_logged

    if [ -n "$1" ]; then
        CONFIG=$(rg --max-depth 3 -l '^kind: Config$' $HOME/.kube/ 2>/dev/null \
            | grep $1)
    else
        CONFIG=$(rg --max-depth 3 -l '^kind: Config$' $HOME/.kube/ $PWD 2>/dev/null | fzf --multi | tr '\n' ':')
    fi
    # echo file and remove trailing :
    echo ${CONFIG%:*}
    export KUBECONFIG=${CONFIG%:*}
    PROFILE=$(yq '.users[0].user.exec.env[0].value' $KUBECONFIG)
    REGION=$(yq '.users[0].user.exec.args' $KUBECONFIG | grep -A1 region | tail -1 | awk '{print $2}')
}

ek9s() {
  ek
  k9s
}

fn k() {
  if [ -n "$KUBE_NAMESPACE" ]; then
      kubectl --namespace "$KUBE_NAMESPACE" $@
  else
      kubectl $@
  fi
}

function ekns() {
  namespaces=$(kubectl get ns -o=custom-columns=:.metadata.name)
  export KUBE_NAMESPACE=$(echo $namespaces | fzf --select-1 --preview "kubectl --namespace {} get pods")
  echo "Set namespace to $KUBE_NAMESPACE"
}