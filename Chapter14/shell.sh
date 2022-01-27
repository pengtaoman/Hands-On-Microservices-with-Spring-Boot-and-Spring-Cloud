docker run -d --name mongo-spring --memory 350m -p 27017:27017 mongo:3.6.9
docker run -d --name mysql-spring --memory 350m -p 3306:3306 -e MYSQL_ROOT_PASSWORD=rootpwd -e MYSQL_DATABASE=review-db -e MYSQL_USER=user -e MYSQL_PASSWORD=pwd mysql:5.7
docker run -d --name rabbitmq-spring --memory 350m -p 5672:5672 -p 15672:15672 rabbitmq:3.7.8-management
docker run -d --name zipkin --memory 512m -p 9411:9411 -e STORAGE_TYPE=mem -e RABBIT_ADDRESSES=localhost:5672 openzipkin/zipkin:2.12.9

export CONFIG_SERVER_ENCRYPT_KEY=my-very-secure-encrypt-key
export CONFIG_SERVER_USR=dev-usr
export CONFIG_SERVER_PWD=dev-pwd
export SPRING_PROFILES_ACTIVE=native
export ENCRYPT_KEY=${CONFIG_SERVER_ENCRYPT_KEY}
export SPRING_SECURITY_USER_NAME=${CONFIG_SERVER_USR}
export SPRING_SECURITY_USER_PASSWORD=${CONFIG_SERVER_PWD}

./gradlew :spring-cloud:config-server:bootRun
./gradlew :spring-cloud:eureka-server:bootRun
./gradlew :spring-cloud:gateway:bootRun
./gradlew :spring-cloud:authorization-server:bootRun

./gradlew :microservices:product-service:bootRun
./gradlew :microservices:recommendation-service:bootRun
./gradlew :microservices:review-service:bootRun
./gradlew :microservices:product-composite-service:bootRun

ACCESS_TOKEN=$(curl -X POST -k https://writer:secret@localhost:8443/oauth/token  -d grant_type=password -d username=magnus -d password=password -s| jq .access_token -r)

curl -ks https://localhost:8443/product-composite/2 -H "Authorization: Bearer $ACCESS_TOKEN" | jq


###放开gateway review的uri
#gateway.yml 加入
#- id: review
#  uri: lb://review
#  predicates:
#    - Path=/review/**

curl -ks https://localhost:8443/review?productId=2 -H "Authorization: Bearer $ACCESS_TOKEN" | jq

###ProductCompositeIntegration 中调用http://review 是基于review 服务的bootstrap.yml中application.name
#这个规则是测试出来的，不是找到文档

