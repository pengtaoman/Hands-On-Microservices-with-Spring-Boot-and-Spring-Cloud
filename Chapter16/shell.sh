brew install siege

./gradlew build && docker-compose build

kubectl config current-context

kubectl create ns hands-on

kubectl config set-context $(kubectl config current-context) --namespace=hands-on

kubectl create configmap config-repo --from-file config-repo/ --save-config

kubectl create secret generic config-server-secrets \
--from-literal=ENCRYPT_KEY=my-very-secure-encrypt-key \
--from-literal=SPRING_SECURITY_USER_NAME=dev-usr \
--from-literal=SPRING_SECURITY_USER_PASSWORD=dev-pwd \
--save-config

kubectl create secret generic config-client-secrets \
--from-literal=ENCRYPT_KEY=my-very-secure-encrypt-key \
--from-literal=SPRING_SECURITY_USER_NAME=dev-usr \
--from-literal=SPRING_SECURITY_USER_PASSWORD=dev-pwd \
--save-config

kubectl create secret generic config-client-credentials \
--from-literal=CONFIG_SERVER_USR=dev-usr \
--from-literal=CONFIG_SERVER_USR_PASSWORD=dev_pwd \
--save-config

docker pull openzipkin/zipkin:2.12.9

kubectl apply -f kubernetes/services/overlays/dev/rabbitmq-dev.yml
kubectl apply -f kubernetes/services/overlays/dev/mongodb-dev.yml
kubectl apply -f kubernetes/services/overlays/dev/mysql-dev.yml

kubectl wait --timeout=600s --for=condition=ready pod --all


kubectl apply -k kubernetes/services/base


=======================================================================


kubectl delete configmap config-repo

kubectl delete secret config-server-secrets
kubectl delete secret config-client-secrets
kubectl delete secret config-client-credentials

kubectl delete -f kubernetes/services/overlays/dev