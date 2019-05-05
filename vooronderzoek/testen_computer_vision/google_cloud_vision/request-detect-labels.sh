curl -X POST \
     -H "Authorization: Bearer $(gcloud auth print-access-token)" \
     -H "Content-Type: application/json; charset=utf-8" \
     --data "{
      'requests': [
        {
          'image': {
            'source': {
              'imageUri': 'http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/FO-70-00030/full/full/0/default.jpg'
            }
          },
          'features': [
            {
              'type': 'LABEL_DETECTION'
            }
          ]
        }
      ]
    }" "https://vision.googleapis.com/v1/images:annotate" > detect-labels-FO-70-00030.json