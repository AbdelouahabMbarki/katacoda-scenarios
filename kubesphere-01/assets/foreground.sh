#!/bin/bash
echo Waiting for Kubernetes to start...
  while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done
echo Kubernetes started
if [ -f /root/.kube/start ]; then
  /root/.kube/start
fi

helm repo add openebs https://openebs.github.io/charts

helm repo update

kubectl create namespace openebs

helm install openebs --namespace openebs openebs/openebs --wait

kubectl patch storageclasses.storage.k8s.io openebs-hostpath -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/v3.1.1/kubesphere-installer.yaml
   
kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/v3.1.1/cluster-configuration.yaml
