cat $1 | sed 1d | cut -d , -f2,3 | \
while read line
do
    url="${line%,*}"
    else="${line##*,}"
    echo $url
    echo $else

done
echo "done"