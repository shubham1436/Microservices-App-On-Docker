#!/usr/bin/env bash

set -e

cd util;                                              ./gradlew clean build publishToMavenLocal; cd -

cd microservices/core/product-service;                ./gradlew clean build buildDockerImage; cd -
cd microservices/core/recommendation-service;         ./gradlew clean build buildDockerImage; cd -
cd microservices/core/review-service;                 ./gradlew clean build buildDockerImage; cd -
cd microservices/composite/product-composite-service; ./gradlew clean build buildDockerImage; cd -

cd microservices/support/auth-server;                 ./gradlew clean build buildDockerImage; cd -
cd microservices/support/config-server;               ./gradlew clean build buildDockerImage; cd -
cd microservices/support/discovery-server;            ./gradlew clean build buildDockerImage; cd -
cd microservices/support/edge-server;                 ./gradlew clean build buildDockerImage; cd -
cd microservices/support/monitor-dashboard;           ./gradlew clean build buildDockerImage; cd -
cd microservices/support/turbine;                     ./gradlew clean build buildDockerImage; cd -

find . -name *SNAPSHOT.jar -exec du -h {} \;

docker push $1/ms-blog-discovery-server;
docker push $1/ms-blog-monitor-dashboard;
docker push $1/ms-blog-edge-server;
docker push $1/ms-blog-config-server;
docker push $1/ms-blog-auth-server;
docker push $1/ms-blog-product-composite-service;
docker push $1/ms-blog-review-service;
docker push $1/ms-blog-recommendation-service;
docker push $1/ms-blog-product-service;
docker push $1/ms-blog-turbine;
