
INGRESS_HOST=$(kubectl -n istio-system get svc istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')


echo "$INGRESS_HOST minikube.me" | tee -a /etc/hosts




kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/grafana.yaml
wget https://raw.githubusercontent.com/istio/istio/release-1.9/samples/addons/jaeger.yaml

curl -o 2>/dev/null -s -L -w "%{http_code}" http://kiali.istio-system.svc.cluster.local:20001/kiali/
curl -o 2>/dev/null -s -L -w "%{http_code}" http://grafana.istio-system.svc.cluster.local:3000
curl -o 2>/dev/null -s -L -w "%{http_code}" http://tracing.istio-system.svc.cluster.local:80



