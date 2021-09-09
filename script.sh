#!/bin/bash
i=1
while read file_name
do
NUMBER=`echo $file_name | rev | cut -d"/" -f1 | rev | tr -d '[A-Z][a-z]'`
DIRNAME=`dirname $file_name`
mv "$file_name" "$DIRNAME/$(sed -n "$i"p /tmp/candidatename | awk '{print $1}')$NUMBER"
let i=i+1
done <<< "$(find . -name "filenumber*"  |  sort -n -k1.4)"