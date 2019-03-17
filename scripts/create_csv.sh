#!/bin/bash
#
# Author: Nastasia Vanderperren
# Goal: script to add contextual information of pictures in csv format, like filename, theme, period, etc.
#
#

### variables
# give name of basefolder as parameter
parent=$1

### functions

function getYear {
    string=$1
    year="onbekend"
    if [ "${string:2:1}" = "-" ]
    then
        year="${string:0:2}s"
    fi
    echo $year
}

# give filename as parameter
function getPeriod {
    string=$1
    case ${string:0:2} in
    FO)
        year=`getYear "${string:3:3}"`
        ;;
    DI)
        year=`getYear "${string:4:3}"`
        ;;
    *)
        year="onbekend"
        ;;
    esac
    echo $year
}

function getType {
    string=$1
    case ${string:0:2} in
    FO)
        type="foto"
        ;;
    DI)
        type="diapositief"
        ;;
    *)
        type="onbekend"
        ;;
    esac
    echo $type
}

function createCSV {
    csv_header="base,filename,extension,type,theme,period"
    csv="/Users/nastasiavanderperren/iCloud Drive (archief) - 1/Documents/Informatica_Hogent/BA3/bachelorproef/dataset/testset_pictures_HvA.csv"
    baseURL=""
    echo $csv_header > "$csv"
    for folder in *; do
        cd "$folder"
        theme=`basename "$folder" | tr [:upper:] [:lower:]`
        for file in *; do
            filename=`basename $file`
            extension="${filename##*.}"
            filename="${filename%.*}"
            period=`getPeriod $filename`
            type=`getType $filename`
            echo $base,$filename,$extension,$type,$theme,$period >> "$csv"
        done
        cd ..
    done
}

### main script
cd "$parent"
createCSV






