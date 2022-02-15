export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING=True

oci ce cluster create-kubeconfig --cluster-id ocid1.cluster.oc1.iad.aaaaaaaasuoq6frltbstmes7j7ukkkmbff33l2oxi6574lac2c4yrmpmas6q --file $HOME/.kube/config --region us-ashburn-1 --token-version 2.0.0  --kube-endpoint PUBLIC_ENDPOINT

kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io --docker-username='idoulk58kp4z/oracleidentitycloudservice/vinicius.hakamine@outlook.com' --docker-password='Ws-:#T>yA0[33:kyQ_W{' --docker-email='vinicius.hakamine@outlook.com'

kubectl create -f facebook-job/k8s-deployment.yaml || ( kubectl delete -f facebook-job/k8s-deployment.yaml && kubectl create -f facebook-job/k8s-deployment.yaml )
