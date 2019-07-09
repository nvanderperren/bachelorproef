#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: send an image to Clarifai via the IIIF Image API and get predictions
# The user can define the size of the image by percentage and decide which model to use
#
# Because some of the images are bigger than the max. filesize accepted by Clarifai, the IIIF Image API is used
# The IIIF Image API makes it possible to get a smaller image of the original image without
# needing to manually resize the image
#
# Example usage:
# sh predict_image_by_size_id.sh ${apikey} ${model_id} ${model_version} ${image_id} ${size_in_percentage} ${output_folder}
#
# model ids:
# - general: aaa03c23b3724a16a56b629203edc62c
# - wedding: c386b7a870114f4a87477c0824499348
# - travel: eee28c313d69466f836ab83287a54ed9
#
# Dependencies: cURL
#

# variables

key=$1 # your api key
model=$2 # id of your model
version=$3 # version of your model (see documentation clarifai)
image_id=$4 # id of image
pct=$5 # percetage size of image
folder=$6 # path to folder
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/ # the base URL of the images
suffix=/full/pct:$pct/0/default.jpg
url="${domain}${image_id}${suffix}"

# main script

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