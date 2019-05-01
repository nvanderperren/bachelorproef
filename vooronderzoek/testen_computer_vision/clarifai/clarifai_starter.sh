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
                        "url": "http://ec2-18-188-193-33.us-east-2.compute.amazonaws.com:8182/iiif/2/IMG_20190126_122803.jpg/full/full/0/default.jpg"
                    }
                }
            }
        ]
    }' \
    https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs >> response.json