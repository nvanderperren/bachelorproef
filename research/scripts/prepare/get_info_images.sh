# variables
file=$1
iteration=$2
domain=http://ec2-18-191-252-182.us-east-2.compute.amazonaws.com:8182/iiif/2/
suffix=/info.json
folder=../../models_info/images_custom_model/testset_$iteration #folder where to store the json response


# main script
mkdir $folder

cat $file | sed 1d | cut -d , -f1 | \
while read line
do
    image="${line}"
    url="${domain}${image}${suffix}"

    echo "${url} busy"
    wget -O ${folder}/${image}.json $url
    jq . ${folder}/${image}.json > ${folder}/${image}_beautify.json
done
echo "done"