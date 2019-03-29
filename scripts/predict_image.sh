#!/bin/bash

key=$1
file=$2 # path to file
folder=$3 # path to folder
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/full/0/default.jpg

if [ ! -d "$folder" ]; then
    mkdir $folder
fi


cat $file | sed 1d | cut -d , -f2 | \
while read line
do
    url="${domain}${line}${suffix}"
    echo "${url} busy"
    echo $folder
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
    }' https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs > "$folder/$line".json
done
echo "done"