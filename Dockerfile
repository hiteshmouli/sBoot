FROM ubuntu:20.04
MAINTAINER hitesh
RUN apt-get update && apt-get install -y openjdk-11-jdk && apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
RUN tar -xf apache-tomcat-9.0.83.tar.gz
RUN mkdir tomcat && mv apache-tomcat-9.0.83 /tomcat/
WORKDIR tomcat
COPY target/spring-boot-rest-example-0.5.0.war /apache-tomcat-9.0.83/webapps/
EXPOSE 8082
CMD ["/tomcat/apache-tomcat-9.0.83/bin/catalina.sh", "run"]
