FROM gcc:latest

MAINTAINER AtsushiSakai

COPY /cpp-httplib /cpp-httplib
COPY /json /json
COPY /json_server /json_server

RUN /json_server/build.sh

# open port
EXPOSE 8000

# server run
ENTRYPOINT ["./a.out"]

