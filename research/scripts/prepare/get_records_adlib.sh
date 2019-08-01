#!/bin/bash

csv=$1
file=$2
output=output

if [ ! -d $output ]
then
    mkdir $output
fi

cat $csv | sed 1d | cut -d , -f2 | \
while read line; do
    filename=$line
    echo "checking $filename"
    json=$(jq --arg filename "$filename" '.[] | .recordList | .record[] | select(.object_number==$filename)' "$file")    
    
    echo "${json:0:10}"

    if [ "${json:0:1}" = "{" ]; then
        echo "$json" > "${output}/${filename}.json"
    fi
done
