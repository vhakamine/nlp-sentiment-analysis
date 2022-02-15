export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True
export PREDICTSENTIMENT_LB_IP=`kubectl get svc predict-sentiment-api-minikube-service -o yaml | grep  ip | cut -d ":" -f2 | tr -d " \t\n\r"`
envsubst "`printf '${%s} ' $(sh -c "env|cut -d'=' -f1")`" < stream-trigger-job/k8s-deployment.yaml > stream-trigger-job/k8s-deployment-deploy.yaml

oci ce cluster create-kubeconfig --cluster-id ocid1.cluster.oc1.iad.aaaaaaaasuoq6frltbstmes7j7ukkkmbff33l2oxi6574lac2c4yrmpmas6q --file $HOME/.kube/config --region us-ashburn-1 --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT

kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io --docker-username='idoulk58kp4z/oracleidentitycloudservice/vinicius.hakamine@outlook.com' --docker-password='Ws-:#T>yA0[33:kyQ_W{' --docker-email='vinicius.hakamine@outlook.com'

kubectl create -f stream-trigger-job/k8s-deployment-deploy.yaml || (kubectl delete -f stream-trigger-job/k8s-deployment-deploy.yaml && kubectl create -f stream-trigger-job/k8s-deployment-deploy.yaml)
rm stream-trigger-job/k8s-deployment-deploy.yaml
