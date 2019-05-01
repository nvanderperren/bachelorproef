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
                        "url": "https://upload.wikimedia.org/wikipedia/commons/2/28/Simone_Martini_068.jpg"
                    },
                    "concepts": [
                        {
                            "id": "woman",
                            "value": "true"
                        }
                    ]
                }
            }
        ]
    }' \
    https://api.clarifai.com/v2/inputs > add_image.json