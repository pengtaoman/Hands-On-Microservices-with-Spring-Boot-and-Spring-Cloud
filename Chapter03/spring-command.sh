spring init \
--build=gradle \
--boot-version=2.3.0.RELEASE \
--java-version=1.8 \
--packaging=jar \
--name=product-service \
--groupId=se.magnus.microservice.core.product \
--package-name=se.magnus.microservice.core.product \
--dependencies=actuator,webflux \
--version=1.0.0-SNAPSHOT \
product-service

##############################################
cd Chaper03/1-spring-init
./gradlew build


cd Chaper03/2-basic-rest-services
java -jar microservices/product-service/build/libs/*.jar & \
java -jar microservices/product-composite-service/build/libs/*.jar & \
java -jar microservices/recommendation-service/build/libs/*.jar & \
java -jar microservices/review-service/build/libs/*.jar
