#!/usr/bin/env bash

count=0
countMax=10

# [More colors](https://www.shellhacks.com/bash-colors/)
GRAY_NORMAL="\e[37m"
RED_BOLD="\e[31;1m"
NO_COLOR="\e[0m"

while ((count++ < countMax)) && ! curl -fsL http://localhost:3030 > /dev/null; do
  printf "${GRAY_NORMAL}%s${NO_COLOR}\n" "Wait for the Fuseki server to start completely..."
  sleep 1
done

if ((count >= countMax)); then
  printf "${RED_BOLD}%s${NO_COLOR}\n" "ERROR: Can't connect to Fuseki endpoint."
  exit 1
fi
