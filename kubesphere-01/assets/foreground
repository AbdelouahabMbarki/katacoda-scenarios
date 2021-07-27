helm repo add openebs https://openebs.github.io/charts

helm repo update

kubectl create namespace openebs

helm install openebs --namespace openebs openebs/openebs --wait

kubectl patch storageclasses.storage.k8s.io openebs-hostpath -p 'geclass.kubernetes.io/is-default-class":"true"}}}'

kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/v3.1.1/kubesphere-installer.yaml
   
kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/v3.1.1/cluster-configuration.yaml
