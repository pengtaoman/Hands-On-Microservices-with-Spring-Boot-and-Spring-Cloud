

open https://dashboard.ngrok.com/signup

ngrok authtoken 21LYYZ8g4DDBlxktYosNRPZQMFc_3mSHrgmeWDCJYa8BN5qKN

sudo bash -c "echo '10.211.55.111' minikube.me | tee -a /etc/hosts"

./gradlew build && docker-compose build

./kubernetes/scripts/deploy-dev-env.bash


[root@centos111 base]# kubectl -n ingress-nginx get svc
NAME            TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)                      AGE
ingress-nginx   NodePort   10.106.22.54   <none>        80:32600/TCP,443:32443/TCP   355d

HOST=minikube.me PORT=32443 ./test-em-all.bash


ACCESS_TOKEN=$(curl -X POST -k https://writer:secret@minikube.me:32443/oauth/token  -d grant_type=password -d username=magnus -d password=password -s| jq .access_token -r)


