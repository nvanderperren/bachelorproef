#!/bin/bash

key=$1

file=../dataset/test.csv
domain=http://ec2-18-188-193-33.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/full/0/default.jpg

cat $file | \
sed 1d | \
cut -d , -f2 | \
while read line
do
    url="${domain}${line}${suffix}"
    echo "${url}"
    curl -X POST \
    -H "Authorization: Key $key" \
    -H "Content-Type: application/json" \
    -d '
    {
        "inputs": [
            {
                "data": {
                    "image": {
                        "url": "'"${url}"'"
                    }
                }
            }
        ]
    }' https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs > "$line".json
done