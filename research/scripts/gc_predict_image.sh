#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: send images to Google Cloud Vision via a CSV and get predictions (detected labels). Store the responses of the
# Cloud Vision API in a folder
#
# Usage:
# sh predict_images.sh ${api_key} ${path_to_csv_file} ${path_to_output_folder}
#
# In the CSV, the ID's of the images should be stored in the second column/field
#
# Dependencies: cURL, gcloud command line tool
#

# variables

file=$1 # path to file
folder=$2 # path to folder
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/pct:80/0/default.jpg

# main script

if [ ! -d "$folder" ]; then
    mkdir $folder
fi


cat $file | sed 1d | cut -d , -f1 | \
while read line
do
    url="${domain}${line}${suffix}"
    echo "${url} busy"
    echo $folder

    curl -X POST \
     -H "Authorization: Bearer $(gcloud auth print-access-token)" \
     -H "Content-Type: application/json; charset=utf-8" \
     --data "{
      'requests': [
        {
          'image': {
            'source': {
              'imageUri': '"${url}"'
            }
          },
          'features': [
            {
              'type': 'LABEL_DETECTION'
            }
          ]
        }
      ]
    }" "https://vision.googleapis.com/v1/images:annotate" > "$folder/$line".json

done
echo "done"