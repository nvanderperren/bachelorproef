key=$1

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
              "id": "geboorte"
            },
            {
               "id": "huwelijk"
            },
            {
                "id": "sint"
            },
            {
                "id": "speelgoed"
            },
            {
                "id": "vakantie"
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
  https://api.clarifai.com/v2/models | jq . > ../output/train/model/create_model_theme.json