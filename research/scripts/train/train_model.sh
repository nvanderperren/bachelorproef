#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: train a custom model of Clarifai. Training images with concepts should already be provided
# (see add_train_inputs.sh) and the model should already be created.
#
# Usage:
# sh train_model.sh ${api_key} ${model_id} ${iteration}
#
# Dependencies: cURL, jq
# model ids:
# - thema: HvA_theme
#

key=$1
model_id=$2
# iteration=$3
# file=../../output/train/model/thema/train_model_$iteration.json  # change this if you want to store the file anywhere else
file=../../output/train/model/thema/train_model.json

curl -X POST \
  -H "Authorization: Key $key" \
  -H "Content-Type: application/json" \
  https://api.clarifai.com/v2/models/$model_id/versions | jq . > $file
