#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: create a custom model in Clarifai with five concepts. The concepts are the themes of the
# images of Huis van Alijn.
#
# Usage:
# sh create_model_theme.sh ${api_key}
#
# Dependencies: cURL, jq
#

key=$1
file=../output/train/model/create_model_theme.json
concept1=geboorte
concept2=huwelijk
concept3=sint
concept4=speelgoed
concept5=vakantie

curl -X POST \
  -H "Authorization: Key $key" \
  -H "Content-Type: application/json" \
  -d '
  {
    "model": {
      "id": "HvA_theme",
      "output_info": {
        "data": {
          "concepts": [
            {
              "id": "'"${concept1}"'"
            },
            {
               "id": "'"${concept2}"'"
            },
            {
                "id": "'"${concept3}"'"
            },
            {
                "id": "'"${concept4}"'"
            },
            {
                "id": "'"${concept5}"'"
            }
          ]
        },
        "output_config": {
          "concepts_mutually_exclusive": true,
          "closed_environment": true
        }
      }
    }
  }'\
  https://api.clarifai.com/v2/models | jq . > $file