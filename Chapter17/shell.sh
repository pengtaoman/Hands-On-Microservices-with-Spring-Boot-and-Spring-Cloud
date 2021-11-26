

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

curl -ks https://minikube.me:32443/product-composite/2 -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtYWdudXMiLCJleHAiOjIyMzc5MjUzNTcsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJuZ2xnRExxWTRWbjNTYmxpcHVVbmJqWlVrNlE9IiwiY2xpZW50X2lkIjoid3JpdGVyIiwic2NvcGUiOlsicHJvZHVjdDpyZWFkIiwicHJvZHVjdDp3cml0ZSJdfQ.DdHocf6UwYkKAYCEdZ6hx5dU338NHz1Oc50IR2BmqQQA7pf67bfU0W7F3NdstzyitYjnZoPUtLe0VcoOf-SUfpYA-J6JbqVisVbU4XChFsxCbnY-fX-VmOZmCSRyRJ4eAXcit4ftdv5NSyKggwyHL9CuP1oaCjzFhaDdlrlSImNAOY2-5WwyLLqQNOBpjoYQAgdyGuuuujJVfA3LlWIicYWsfCwKnoIC-z9ZHS_FbMJtLhHl92rjoyscGXG0G8arrNS7_7VzpoGJcQoyU1Vs0LLog458ge40qZTdq_KdQVuifS9P2QeDujvwVTwG1jIc64SJkbdzzeX4pc0KAJtl4A"

curl -i https://minikube.me:32443/product-composite/2 -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtYWdudXMiLCJleHAiOjIyMzc5MjUzNTcsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJuZ2xnRExxWTRWbjNTYmxpcHVVbmJqWlVrNlE9IiwiY2xpZW50X2lkIjoid3JpdGVyIiwic2NvcGUiOlsicHJvZHVjdDpyZWFkIiwicHJvZHVjdDp3cml0ZSJdfQ.DdHocf6UwYkKAYCEdZ6hx5dU338NHz1Oc50IR2BmqQQA7pf67bfU0W7F3NdstzyitYjnZoPUtLe0VcoOf-SUfpYA-J6JbqVisVbU4XChFsxCbnY-fX-VmOZmCSRyRJ4eAXcit4ftdv5NSyKggwyHL9CuP1oaCjzFhaDdlrlSImNAOY2-5WwyLLqQNOBpjoYQAgdyGuuuujJVfA3LlWIicYWsfCwKnoIC-z9ZHS_FbMJtLhHl92rjoyscGXG0G8arrNS7_7VzpoGJcQoyU1Vs0LLog458ge40qZTdq_KdQVuifS9P2QeDujvwVTwG1jIc64SJkbdzzeX4pc0KAJtl4A"



 1037  kb apply -f letsencrypt-issuer-staging.yaml
 1038  kb apply -f letsencrypt-issuer-prod.yaml

 ngrok http https://minikube.me:32443

 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 ngrok by @inconshreveable                                (Ctrl+C to quit)

Session Status                online
Account                       pengtao1000@gmail.com (Plan: Free)
Version                       2.3.40
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://0717-42-84-42-182.ngrok.io -> https:
Forwarding                    https://0717-42-84-42-182.ngrok.io -> https

Connections                   ttl     opn     rt1     rt5     p50     p90
                              0       0       0.00    0.00    0.00    0.0

 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

 vi Chapter17/kubernetes/services/base/ingress-edge-server-ngrok.yml  ######修改host为0717-42-84-42-182.ngrok.io


curl -i https://0717-42-84-42-182.ngrok.io/product-composite/2 -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtYWdudXMiLCJleHAiOjIyMzc5MjUzNTcsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiJuZ2xnRExxWTRWbjNTYmxpcHVVbmJqWlVrNlE9IiwiY2xpZW50X2lkIjoid3JpdGVyIiwic2NvcGUiOlsicHJvZHVjdDpyZWFkIiwicHJvZHVjdDp3cml0ZSJdfQ.DdHocf6UwYkKAYCEdZ6hx5dU338NHz1Oc50IR2BmqQQA7pf67bfU0W7F3NdstzyitYjnZoPUtLe0VcoOf-SUfpYA-J6JbqVisVbU4XChFsxCbnY-fX-VmOZmCSRyRJ4eAXcit4ftdv5NSyKggwyHL9CuP1oaCjzFhaDdlrlSImNAOY2-5WwyLLqQNOBpjoYQAgdyGuuuujJVfA3LlWIicYWsfCwKnoIC-z9ZHS_FbMJtLhHl92rjoyscGXG0G8arrNS7_7VzpoGJcQoyU1Vs0LLog458ge40qZTdq_KdQVuifS9P2QeDujvwVTwG1jIc64SJkbdzzeX4pc0KAJtl4A"