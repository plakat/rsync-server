#!/bin/sh
cd `dirname $0`

if [ "$KUBERNETES_NAMESPACE" = "" ]; then
  export KUBERNETES_NAMESPACE="default"
fi
echo Using namespace "$KUBERNETES_NAMESPACE"

if [ ! -f rsyncuser_id ]; then
  echo Generating SSH key...
  ssh-keygen -b 2048 -t rsa -f rsyncuser_id -C "rsyncuser"
fi

kubectl create secret generic rsync-ssh-secret --from-file=id_rsa=rsyncuser_id --from-file=id_rsa.pub=rsyncuser_id.pub --from-file=authorized_keys=rsyncuser_id.pub -n $KUBERNETES_NAMESPACE

