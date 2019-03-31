#!/bin/bash

key=$1
image_id=$2 # id of image
pct=$3 # percetage size of image
folder=$3 # path to folder
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/pct:$pct/0/default.jpg
url="${domain}${image_id}${suffix}"

if [ ! -d "$folder" ]; then
    mkdir $folder
fi

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
    }' https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs | jq . > "$folder/$image_id".json

echo "done"