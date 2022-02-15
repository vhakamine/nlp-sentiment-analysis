until [[ `kubectl get svc translation-api-minikube-service -o yaml | grep  ip | cut -d ":" -f2 | tr -d " \t\n\r"` != "" ]]
do
  sleep 5s
done

docker build -t predict-sentiment-api-image ./predict-sentiment-api

docker login iad.ocir.io -u='oracleidentitycloudservice/vinicius.hakamine@outlook.com' -p='Ws-:#T>yA0[33:kyQ_W{'
docker tag predict-sentiment-api-image:latest iad.ocir.io/idoulk58kp4z/predict-sentiment:latest
docker push iad.ocir.io/idoulk58kp4z/predict-sentiment:latest
