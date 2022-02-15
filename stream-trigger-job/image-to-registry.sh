until [[ `kubectl get svc predict-sentiment-api-minikube-service -o yaml | grep  ip | cut -d ":" -f2 | tr -d " \t\n\r"` != "" ]]
do
  sleep 5s
done

docker build -t translation-api-image ./stream-trigger-job

docker login iad.ocir.io -u='oracleidentitycloudservice/vinicius.hakamine@outlook.com' -p='Ws-:#T>yA0[33:kyQ_W{'
docker tag translation-api-image:latest iad.ocir.io/idoulk58kp4z/stream-trigger-job:latest
docker push iad.ocir.io/idoulk58kp4z/stream-trigger-job:latest
