##FROM ubuntu:20.04
##MAINTAINER hitesh
##ENV TOMCAT_VERSION 9.0.83
##ENV TOMCAT_HOME /tomcat/apache-tomcat-$TOMCAT_VERSION
##RUN apt-get update && apt-get install -y openjdk-11-jdk wget
##RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
##RUN tar -xf apache-tomcat-$TOMCAT_VERSION.tar.gz
##RUN mkdir -p $TOMCAT_HOME
##WORKDIR $TOMCAT_HOME
##COPY target/spring-boot-rest-example-0.5.0.war $TOMCAT_HOME/webapps/
##EXPOSE 8082
##CMD ["bin/catalina.sh", "run"]
###========================================

FROM ubuntu:20.04
MAINTAINER hitesh
ARG WAR_FILE
ENV TOMCAT_VERSION 9.0.83
ENV TOMCAT_HOME /tomcat/apache-tomcat-$TOMCAT_VERSION
RUN apt-get update && apt-get install -y openjdk-11-jdk wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN tar -xf apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN mkdir -p $TOMCAT_HOME
WORKDIR $TOMCAT_HOME
COPY target/$WAR_FILE $TOMCAT_HOME/webapps/
EXPOSE 8082
CMD ["bin/catalina.sh", "run"]
