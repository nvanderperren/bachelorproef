#!/bin/bash

# general: aaa03c23b3724a16a56b629203edc62c
# wedding: c386b7a870114f4a87477c0824499348
# travel: eee28c313d69466f836ab83287a54ed9

key=$1
model=$2
version=$3
image_id=$4 # id of image
pct=$5 # percetage size of image
folder=$6 # path to folder
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
}' https://api.clarifai.com/v2/models/$model/versions/$version/outputs | jq . > "$folder/$image_id".json

echo "done"