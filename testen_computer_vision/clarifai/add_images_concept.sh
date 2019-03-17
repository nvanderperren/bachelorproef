#!/bin/bash

curl -X POST \
    -H "Authorization: Key e3a8443b500e484f8537f9ace059338b" \
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