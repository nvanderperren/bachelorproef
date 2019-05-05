#!/bin/bash

api_key=$1
request=$2

curl -v -s -H "Content-Type: application/json" \
    https://vision.googleapis.com/v1/images:annotate?key=$api_key \
    --data-binary @$request > response.json