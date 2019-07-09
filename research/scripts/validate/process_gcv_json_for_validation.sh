#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: generate a csv files with all wanted information (tags and score) of the json responses
# from the Google Cloud Vision API
# threshold: 50%
#
# Example usage:
# sh process_json.sh ${path_to_output_folder} ${name_of_csv} ${path_to_folder_with_json_files}/*.json
#
# Dependencies: jq

# variables

folder=$1
name=$2
location=$folder/$name.csv
header="tag 1,pct 1,tag 2,pct 2,tag 3,pct 3,tag 4,pct 4,tag 5,pct 5,tag 6,pct 6,tag 7,pct 7,tag 8,pct 8,tag 9,pct 9,tag 10,pct 10"

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
        echo "done"
        exit 1
    fi
    
    echo "$json"
    
    tag_value=""
    
    for i in {0..9}
    do
        text=$(jq -r ".responses[].labelAnnotations[$i] | if .score > 0.5 then "'"\(.description),\(.score)"'" else "'","'" end" $json)
        if [ $i -ne 9 ]
        then
            tag_value+="$text,"
        else
            tag_value+="$text"
        fi
    done
    
    printf "%s\n" "$tag_value" >> $location
    shift
    
done
echo "script done"