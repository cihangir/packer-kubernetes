#!/bin/bash

echo "initial sleep for 60 secs.."
sleep 60

COUNTER=0
TRY_COUNT=50
INTERVAL=10
RES=""
until [ -n "$RES" ]; do
    COUNTER=$((COUNTER + 1))
    RES=$(/usr/bin/curl -s -H "Content-Type: application/json" -XPOST -d'{"apiVersion":"v1","kind":"Namespace","metadata":{"name":"kube-system"}}' "http://127.0.0.1:8080/api/v1/namespaces" | grep "already exists" 2>&1)
    echo $RES
    if [ $COUNTER -eq $TRY_COUNT ]; then
        exit 1
    fi
    echo "will sleep..."
    sleep $INTERVAL
done
