FROM openjdk:8u191-jdk-alpine3.8

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apk update
RUN apk add --no-cache curl
RUN apk add --no-cache tar
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.50/* /opt/tomcat/.


WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
