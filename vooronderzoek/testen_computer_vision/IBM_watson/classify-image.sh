#!/bin/bash

# variables
apikey=$1
imageURL=$2
version=2018-03-19
url="https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?url=$imageURL&version=$version"

curl -u "apikey:$apikey" "$url" > classify-image.json