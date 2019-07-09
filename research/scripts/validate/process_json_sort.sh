#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: generate a csv with all wanted information (image URL, model name, tags) of the json-responses
# from the Clarifai Prediction API. Order the JSON-files by creation date before processing, 
# since the csv of the dataset isn't sorted alphabetically
#
# Example usage
# sh process_json_sort.sh ${path_to_folder_with_json_files} ${path_to_output_folder} ${name_csv_file}
#
# Dependencies: jq is used to process json in bash
#
##################################################################

# variables

json_folder=$1 # path to folder where json files are stored
folder=$2 # path to folder where you want to store the csv
name=$3 # name of the csv (no extension!)
location=../$folder/$name.csv
header="beeld URL,modelnaam,tag 1,tag 2,tag 3,tag 4,tag 5,tag 6,tag 7,tag 8,tag 9,tag 10,tag 11, tag 12,\
tag 13,tag 14,tag 15,tag 16,tag 17,tag 18,tag 19,tag 20"

# main script

if [ ! -f $folder ]
then
    mkdir $folder
fi

cd $json_folder

for json in $(ls -trU $(baseline $json_folder))
do
    if [ ! -f $location ]
    then
        echo "file does not exist"
        printf "$header\n" > $location
    else
        echo "file exists"
    fi

    if [[ $json == "" ]]; then
        echo "do nothing"
        echo "done"
        exit 1
    fi

    echo "$json"

    tag_value="" # every tag is stored in this variable
    url_model=`jq -r '.outputs[] | .input.data.image.url + "," + .model.display_name' $json`

    for i in {0..19}
    do
        command=.outputs[].data.concepts[$i]
        tag=$(jq -r $command.name $json)
        value=$(jq -r  $command.value $json)
        if [ $i -ne 19 ]
        then
            tag_value+="$tag ($value)," # append the tag
        else
            tag_value+="$tag ($value)" # append the tag
        fi
    done

    printf "%s\n" "$url_model,$tag_value" >> $location
    shift

done
echo "done"