#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: generate a csv files with all wanted information (tags and score) of the json responses
# from the Google Cloud Vision API
#
# Example usage:
# sh process_json.sh ${path_to_output_folder} ${name_of_csv} ${path_to_folder_with_json_files}/*.json
#
# Dependencies: jq

# variables

folder=$1
name=$2
location=$folder/$name.csv
header="tag 1,tag 2,tag 3,tag 4,tag 5,tag 6,tag 7,tag 8,tag 9,tag 10,tag 11, tag 12,\
    tag 13,tag 14,tag 15,tag 16,tag 17,tag 18,tag 19,tag 20"

# main script

if [ ! -f $folder ]
then
    mkdir $folder
fi


while (( $# ))
do
    if [ ! -f $location ]
    then
        echo "file does not exist"
        printf "$header\n" > $location
    else
        echo "file exists"
    fi

    json=$3

    if [[ $json == "" ]]; then
        echo "do nothing"
        echo "done"
        exit 1
    fi

    echo "$json"

    tag_value=""

    for i in {0..19}
    do
        command=.responses[].labelAnnotations[$i]
        tag=$(jq -r $command.description $json)
        value=$(jq -r  $command.score $json)
        if [ $i -ne 19 ]
        then
            tag_value+="$tag ($value),"
        else
            tag_value+="$tag ($value)"
        fi
    done

    printf "%s\n" "$tag_value" >> $location
    shift

done
echo "script done"