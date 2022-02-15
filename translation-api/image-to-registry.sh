docker build -t translation-api-image:latest ./translation-api

docker login iad.ocir.io -u='oracleidentitycloudservice/vinicius.hakamine@outlook.com' -p='Ws-:#T>yA0[33:kyQ_W{'
docker tag translation-api-image:latest iad.ocir.io/idoulk58kp4z/nlp-translation:latest
docker push iad.ocir.io/idoulk58kp4z/nlp-translation:latest
