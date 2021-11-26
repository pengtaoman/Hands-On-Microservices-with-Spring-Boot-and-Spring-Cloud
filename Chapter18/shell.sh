
INGRESS_HOST=$(kubectl -n istio-system get svc istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')


echo "$INGRESS_HOST minikube.me" | tee -a /etc/hosts

