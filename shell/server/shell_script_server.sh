#!/usr/bin/env bash
#
# Shell script based json server
# 
# Author: Atsushi Sakai 
#
# using: 
# - [stedolan/jq: Command\-line JSON processor](https://github.com/stedolan/jq)
# - [jpmens/jo: JSON output from a shell](https://github.com/jpmens/jo)
#
# inspired
# - [benrady/shinatra: A simple web server in 5 lines of bash](https://github.com/benrady/shinatra) 
#
echo "Shell script server start!!"
PORT=8000
echo "PORT:$PORT"

while { 
    HEADER="HTTP/1.1 200 OK\r\nConnection: keep-alive\r\n\r\n";

    json=$(jo time="$(date)" port=$PORT)
    BODY="$json\r\n"
    RESPONSE=$HEADER$BODY
    echo -en "$RESPONSE";
    } | nc -l "${PORT:-8080}"; do
  echo ""
  echo "================================================"
  echo ""
done
