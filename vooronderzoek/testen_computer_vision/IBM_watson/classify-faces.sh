#!/bin/bash

# variables
apikey=$1
imageURL=$2
version=2018-03-19
prefix_url="https://gateway.watsonplatform.net/visual-recognition/api/v3"

curl -u "apikey:$apikey" \
    "$prefix_url/detect_faces?url=$imageURL&version=$version" > classify-face.json