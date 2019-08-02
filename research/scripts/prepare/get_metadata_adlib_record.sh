#!/bin/bash

# '.Object_name | ."object_name.type" | .term' $file
# '.Associated_period | ."association.period" | .term' $file
# '.Production_date | ."production.date.start"' $file
# '.Title | .title' $file
# '.Description | .description' $file
#  eerst nog checken of dit een array is via if jq '.Associated_subject | length ' < 10
# '.Associated_subject[] | ."association.subject" | .term' $file 
#  eerst nog checken of dit een array is via if jq '.Content_subject | length ' < 13
# '.Content_subject[] | ."content.subject" | .term' $file

input=$1
header=id\ttitel\tbeschrijving\tobject\tdatum\tperiode\tcs1\tcs2\tcs3\tcs4\tas1\tas2\tas3\tas4

function getLenght {
    type=$1
    case $type in
        AS)
            length=$(jq '.Associated_subject | length')
        ;;
        CS)
            length=$(jq '.Content_subject | length')
        ;;
    esac
    echo $length
}

for file in input/*.json
do
    # weet niet meteen hoe dit effeciënter te doen door die '.' in de veldnamen
    objectnumber=$(jq '.object_number' ${file})
    title=$(jq '.Title | .title' ${file})
    description=$(jq '.Description | .description' ${file})
    objectname=$(jq '.Object_name | ."object_name.type" | .term' ${file})
    datum=$(jq '.Production_date | ."production.date.start"' ${file})
    periode=$(jq '.Production_date | ."production.date.start"' ${file})

    if [ $(($(getLength "CS"))) < 10]
    then
    
done

