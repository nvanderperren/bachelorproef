#!/bin/bash

curl -X POST \
    -H 'Authorization: Key e3a8443b500e484f8537f9ace059338b' \
    -H "Content-Type: application/json" \
    -d '
  {
    "query": {
      "ands": [
        {
          "output": {
            "data": {
              "concepts": [
                {
                  "name": "people"
                }
              ]
            }
          }
        }
      ]
    }
  }'\
    https://api.clarifai.com/v2/searches > search_people.json