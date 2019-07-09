#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: send training images with their concept to Clarifai for training the model
#
# Usage:
# sh add_train_inputs.sh ${api_key} ${path_to_csv_file} ${iteration}
#
# In the CSV, the ID's of the images should be stored in the first column/field, concept in the second
#
# Dependencies: cURL, jq
#

# variables
key=$1
file=$2
iteration=$3
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/pct:50/0/default.jpg
folder=../output/train/model/$iteration #folder where to store the json response


# main script
mkdir $folder

cat $file | sed 1d | cut -d , -f1,2 | \
while read line
do
    image="${line%,*}"
    concept="${line##*,}"
    url="${domain}${image}${suffix}"

    echo "${url} busy"
    echo "${concept}"

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
          },
          "concepts":[
            {
              "id": "'"${concept}"'",
              "value": true
            }
          ]
        }
      }
    ]
  }'\
  https://api.clarifai.com/v2/inputs | jq . > ${folder}/${image}.json
done
echo "done"