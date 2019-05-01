#!/bin/bash

curl -X PATCH \
    -H "Authorization: Key $1" \
    -H "Content-Type: application/json" \
    -d '
    {
    "models": [
      {
        "id": "schilderijen",
        "output_info": {
          "data": {
            "concepts": [
              {
                "id": "woman"
              }
            ]
          }
        }
      }
    ],
    "action": "merge"
  }'\
    https://api.clarifai.com/v2/models/ > concept_to_model.json
