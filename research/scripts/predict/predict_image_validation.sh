#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: send images to Clarifai via a CSV and get predictions by a chosen model. Store the responses of the
# Clarifai Prediction API in a folder
#
# Usage:
# sh predict_images.sh ${api_key} ${path_to_csv_file} ${path_to_output_folder}
#
# In the CSV, the ID's of the images should be stored in the second column/field
#
# Model IDs:
# - general: aaa03c23b3724a16a56b629203edc62c
# - wedding: c386b7a870114f4a87477c0824499348
# - travel: eee28c313d69466f836ab83287a54ed9
# - custom thema: HvA_theme | b6fd2a1befd947bdb200b5e635721657
#
# Dependencies: cURL
#

# variables

key=$1
file=$2 # path to file
folder=$3 # path to folder
model=$4
version=$5
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/922,/0/default.jpg

# main script

if [ ! -d "$folder" ]; then
    mkdir $folder
fi


cat $file | sed 1d | cut -d , -f1 | \
while read line
do
    url="${domain}${line}${suffix}"
    echo "${url} busy"
    
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
    }' https://api.clarifai.com/v2/models/${model}/versions/${version}/outputs | jq . > "$folder/$line".json
done
echo "done"