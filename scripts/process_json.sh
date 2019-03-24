#!/bin/bash

# variables
folder=$1
name=$2
json=$3
location=../$folder/$name.csv
header="beeld URL,modelnaam,tag 1,tag 2,tag 3,tag 4,tag 5,tag 6,tag 7,tag 8,tag 9,tag 10,tag 11, tag 12,\
    tag 13,tag 14,tag 15,tag 16,tag 17,tag 18,tag 19,tag 20"

if [ ! -f $location ]
then
    echo "file does not exist"
    printf "$header\n" > $location
else
    echo "file exists"
fi

url_model=`jq -r '.outputs[] | .input.data.image.url + "," + .model.display_name' $json`


for i in {0..19}
do
    command=.outputs[].data.concepts[$i]
    tag=$(jq -r $command.name $json)
    value=$(jq -r $command.value*100 $json)
    tag_value+="$tag ($value%),"
done


printf "%s\n" "$url_model,$tag_value" >> $location