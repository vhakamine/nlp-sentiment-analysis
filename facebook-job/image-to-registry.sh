docker build -t facebook-job-image:test ./facebook-job

docker login iad.ocir.io -u='oracleidentitycloudservice/vinicius.hakamine@outlook.com' -p='Ws-:#T>yA0[33:kyQ_W{'
docker tag facebook-job-image:test iad.ocir.io/idoulk58kp4z/facebook-job:test
docker push iad.ocir.io/idoulk58kp4z/facebook-job:test
