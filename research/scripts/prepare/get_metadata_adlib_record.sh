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
header='id\ttitel\tbeschrijving\tobject\tdatum\tperiode\tcs1\tcs2\tcs3\tcs4\tas1\tas2\tas3\tas4'

function getLength() {
    type=$1
    file=$2
    case $type in
        AS)
            length=$(jq '.Associated_subject | length' $file)
        ;;
        CS)
            length=$(jq '.Content_subject | length' $file)
        ;;
    esac
    echo $length
}

for file in $input/*.json
do
    # weet niet meteen hoe dit effeciënter te doen door die '.' in de veldnamen
    objectnumber=$(jq '.object_number' ${file})
    title=$(jq '.Title | .title' ${file})
    description=$(jq '.Description | .description' ${file})
    objectname=$(jq '.Object_name | ."object_name.type" | .term' ${file})
    datum=$(jq '.Production_date | ."production.date.start"' ${file})
    periode=$(jq '.Production_date | ."production.date.start"' ${file})

    length=$(getLength CS $file)

    if [ $(($length)) -lt 10 ]
    then
        csline=$(jq -r '[.Content_subject[0]."content.subject".term,
        .Content_subject[1]."content.subject".term,
        .Content_subject[2]."content.subject".term,
        .Content_subject[3]."content.subject".term] | @tsv' $file)
        printf "$csline\n"
    else
        csline="$(jq -r '.Content_subject."content.subject".term' $file)\t\t\t"
        printf "$csline\t\t\t\n"
    fi

    length=$(getLength AS $file)

    if [ $(($length)) -lt 10 ]
    then
        csline=$(jq -r '[.Content_subject[0]."content.subject".term,
        .Content_subject[1]."content.subject".term,
        .Content_subject[2]."content.subject".term,
        .Content_subject[3]."content.subject".term] | @tsv' $file)
        printf "$csline\n"
    else
        csline="$(jq -r '.Content_subject."content.subject".term' $file)\t\t\t"
        printf "$csline\t\t\t\n"
    fi
done

