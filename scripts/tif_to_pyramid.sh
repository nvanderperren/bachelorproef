#!/bin/sh
#
# Author: Nastasia Vanderperren
# Goal: convert tif to pyramid tif and place them in the pictures folder
# jpg-files will only be copied into the pictures folder
#
# Dependencies: ImageMagick

i=1
while (( $# ))
do
    folder=$1
    goal="/Volumes/Naamloos/testbeelden"
    cd $folder

    for photo in *
    do
        echo "BUSY WITH $i $photo"
        echo "------------------------------------------"
        file=`basename ${photo%.*}` # create file name without extension
        if [[ $photo == *.tif ]]
        then
            echo "- converting $photo"
            convert $photo -define tiff:tile-geometry=256x256 \
            -compress jpeg "ptif:$goal/$file" # convert the tif to pyramid tif
        else
            echo "- copying $photo"
            cp $photo $goal/$file # if it's no tif file, convertion is not needed. copy it in stead.
        fi
        echo "- $photo done"
        echo ""
        let "i++"
    done
    shift
done
