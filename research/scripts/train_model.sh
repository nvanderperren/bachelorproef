key=$1
model_id=$2
iteration=$3

curl -X POST \
  -H "Authorization: Key $key" \
  -H "Content-Type: application/json" \
  https://api.clarifai.com/v2/models/$model_id/versions | jq . > ../output/train/model/train_model_$iteration.json
