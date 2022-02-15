export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True
export TRANSLATIONAPI_LB_IP=`kubectl get svc translation-api-minikube-service -o yaml | grep  ip | cut -d ":" -f2 | tr -d " \t\n\r"`
envsubst "`printf '${%s} ' $(sh -c "env|cut -d'=' -f1")`" < predict-sentiment-api/k8s-deployment.yaml > predict-sentiment-api/k8s-deployment-deploy.yaml

oci ce cluster create-kubeconfig --cluster-id ocid1.cluster.oc1.iad.aaaaaaaasuoq6frltbstmes7j7ukkkmbff33l2oxi6574lac2c4yrmpmas6q --file $HOME/.kube/config --region us-ashburn-1 --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT

kubectl create secret docker-registry ocirsecret --docker-server=<region>.ocir.io --docker-username='<Object Storage Namespace>/<user>' --docker-password='<Auth Token>' --docker-email='<user>'
kubectl create -f predict-sentiment-api/k8s-deployment-deploy.yaml || (kubectl delete -f predict-sentiment-api/k8s-deployment-deploy.yaml && kubectl create -f predict-sentiment-api/k8s-deployment-deploy.yaml)
rm predict-sentiment-api/k8s-deployment-deploy.yaml
