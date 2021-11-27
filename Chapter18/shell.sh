
INGRESS_HOST=$(kubectl -n istio-system get svc istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')


echo "$INGRESS_HOST minikube.me" | tee -a /etc/hosts




kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/grafana.yaml
wget https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/jaeger.yaml

curl -o 2>/dev/null -s -L -w "%{http_code}" http://kiali.istio-system.svc.cluster.local:20001/kiali/
curl -o 2>/dev/null -s -L -w "%{http_code}" http://grafana.istio-system.svc.cluster.local:3000
curl -o 2>/dev/null -s -L -w "%{http_code}" http://tracing.istio-system.svc.cluster.local:80

################################################################
./gradlew build && docker-compose build

kubectl create ns hands-on

kubectl config set-context $(kubectl config current-context) --namespace=hands-on

 ./kubernetes/scripts/deploy-dev-env.bash


[root@centos111 ~]# kb get Gateway
NAME          AGE
hands-on-gw   17h

############################################################################
Chapter18/kubernetes/services/base/istio/jwt-authentication-policy.yml 
这个规范已经过时，新的还在研究怎么做
############################################################################

ACCESS_TOKEN=$(curl -X POST -k https://writer:secret@minikube.me/oauth/token  -d grant_type=password -d username=magnus -d password=password -s| jq .access_token -r)



curl -ks https://minikube.me/product-composite/2 -H "Authorization: Bearer $ACCESS_TOKEN"


kubectl -n istio-system apply -f kubernetes/istio/setup/kiali-configmap.yml
kubectl -n istio-system delete po kiali-dc84967d9-ms7fp


https://github.com/kiali/kiali-operator/blob/master/deploy/kiali/kiali_cr.yaml



















 