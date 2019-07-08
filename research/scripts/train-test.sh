key=$1
file=$2
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/full/pct:50/0/default.jpg

cat $file | sed 1d | cut -d , -f2,5 | \
while read line
do
    image="${line%,*}"
    concept="${line##*,}"
    url="${domain}${image}${suffix}"

    echo "${url} busy"
    echo "${concept}"

    curl -X POST \
    -H "Authorization: Key $key" \
    -H "Content-Type: application/json" \
    -d '
    {
    "inputs": [
      {
        "data": {
          "image": {
            "url": "'"${url}"'"
          },
          "concepts":[
            {
              "id": "'"${concept}"'",
              "value": true
            }
          ]
        }
      }
    ]
  }'\
  https://api.clarifai.com/v2/inputs | jq . > ../output/test/${image}.json


done
echo "done"