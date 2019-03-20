#!/bin/bash

curl -X POST \
    -H "Authorization: Key $1" \
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