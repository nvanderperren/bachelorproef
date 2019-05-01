#!/bin/bash

curl -X POST \
    -H "Authorization: Key $1" \
    -H "Content-Type: application/json" \
    -d '
  {
    "inputs": [
      {
        "data": {
          "image": {
            "url": "https://samples.clarifai.com/metro-north.jpg"
          }
        }
      },
      {
        "data": {
          "image": {
            "url": "https://samples.clarifai.com/wedding.jpg"
          }
        }
      }
    ]
  }'\
    https://api.clarifai.com/v2/inputs >> search.json