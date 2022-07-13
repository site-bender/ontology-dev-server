#!/usr/bin/env bash

count=0
countMax=10

while ((count++ < countMax)) && ! curl -fsL http://localhost:3030/ds; do
  echo "Wait for the Fuseki server to start completely..."
  sleep 1
done

if ((count >= countMax)); then
  echo "ERROR: Can't connect to Fuseki endpoint."
  exit 1
fi
