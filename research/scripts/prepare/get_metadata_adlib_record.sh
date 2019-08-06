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
header="id,titel,beschrijving,object,datum,periode,cs1,cs2,cs3,cs4,as1,as2,as3,as4"

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

printf "$header\n" > test.csv

for file in $input/*.json
do
    # weet niet meteen hoe dit effeciënter te doen door die '.' in de veldnamen
    echo $file
    objectnumber=$(jq -r '.object_number' ${file})
    title=$(jq '.Title | .title' ${file})
    description=$(jq '.Description | .description' ${file})
    objectname=$(jq -r '.Object_name | ."object_name.type" | .term' ${file})
    datum=$(jq -r '.Production_date | ."production.date.start"' ${file})
    periode=$(jq -r '.Associated_period | ."association.period" | .term' ${file})

    length=$(getLength CS $file)

    if [ $(($length)) -lt 10 ]
    then
        cs1=$(jq '.Content_subject[0]."content.subject".term' $file)
        cs2=$(jq '.Content_subject[1]."content.subject".term' $file)
        cs3=$(jq '.Content_subject[2]."content.subject".term' $file)
        cs4=$(jq '.Content_subject[3]."content.subject".term' $file)
        csline="${cs1},${cs2},${cs3},${cs4}"
    else
        csline="$(jq '.Content_subject."content.subject".term' $file),,,"
    fi

    length_2=$(getLength AS $file)

    if [ $(($length_2)) -lt 10 ]
    then
        as1=$(jq '.Associated_subject[0]."association.subject".term' $file)
        as2=$(jq '.Associated_subject[1]."association.subject".term' $file)
        as3=$(jq '.Associated_subject[2]."association.subject".term' $file)
        as4=$(jq '.Associated_subject[3]."association.subject".term' $file)
        asline="${as1},${as2},${as3},${as4}"
    else
        asline="$(jq '.Associated_subject."association.subject".term' $file),,,"
    fi

    
    printf "${objectnumber},${title},${description},${objectname},${datum},${periode},${csline},${asline}\n" >> test.csv
done

