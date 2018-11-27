FROM gcc:latest

MAINTAINER AtsushiSakai

COPY /cpp-httplib /cpp-httplib
COPY /json /json
COPY /json_client /json_client

RUN /json_client/build.sh

# server run
ENTRYPOINT ["./a.out"]

