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
file=../../output/train/model/periode/create_model.json
concept1=00s
concept2=10s
concept3=20s
concept4=30s
concept5=40s
concept6=50s
concept7=60s
concept8=70s
concept9=80s
concept10=90s


curl -X POST \
  -H "Authorization: Key $key" \
  -H "Content-Type: application/json" \
  -d '
  {
    "model": {
      "id": "HvA_period",
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
            },
            {
                "id": "'"${concept6}"'"
            },
            {
                "id": "'"${concept7}"'"
            },
            {
                "id": "'"${concept8}"'"
            },
            {
                "id": "'"${concept9}"'"
            },
            {
                "id": "'"${concept10}"'"
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