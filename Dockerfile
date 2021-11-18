FROM openjdk:8u191-jdk-alpine3.8

RUN apk update
RUN apk add --no-cache curl

EXPOSE 8080

ENTRYPOINT  [ "java" ]
