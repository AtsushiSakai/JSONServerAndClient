FROM ubuntu:latest

MAINTAINER AtsushiSakai

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java8-installer

COPY /JSONHttpLib /JSONHttpLib
COPY /JSONClient.java /JSONClient.java

RUN javac JSONClient.java

EXPOSE 8000

# server run
ENTRYPOINT ["java","JSONClient"]

