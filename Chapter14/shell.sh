docker run -d --memory 350m -p 27017:27017 mongo:3.6.9
docker run -d --memory 350m -p 3306:3306 -e MYSQL_ROOT_PASSWORD=rootpwd -e MYSQL_DATABASE=review-db -e MYSQL_USER=user -e MYSQL_PASSWORD=pwd mysql:5.7
docker run -d --memory 350m -p 5672:5672 -p 15672:15672 rabbitmq:3.7.8-management
docker run -d --memory 512m -p 9411:9411 -e STORAGE_TYPE=mem -e RABBIT_ADDRESSES=rabbitmq openzipkin/zipkin:2.12.9

export CONFIG_SERVER_ENCRYPT_KEY=my-very-secure-encrypt-key
export CONFIG_SERVER_USR=dev-usr
export CONFIG_SERVER_PWD=dev-pwd
export SPRING_PROFILES_ACTIVE=native
export ENCRYPT_KEY=${CONFIG_SERVER_ENCRYPT_KEY}
export SPRING_SECURITY_USER_NAME=${CONFIG_SERVER_USR}
export SPRING_SECURITY_USER_PASSWORD=${CONFIG_SERVER_PWD}

./gradlew :spring-cloud:eureka-server:bootRun
./gradlew :spring-cloud:gateway:bootRun
./gradlew :spring-cloud:config-server:bootRun
./gradlew :spring-cloud:authorization-server:bootRun

./gradlew :microservices:product-service:bootRun
./gradlew :microservices:recommendation-service:bootRun
./gradlew :microservices:review-service:bootRun
./gradlew :microservices:product-composite-service:bootRun