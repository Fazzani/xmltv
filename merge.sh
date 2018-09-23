#!/bin/bash

source $(dirname $0)/.conf

set -ex

command -v tv_merge >/dev/null 2>&1 || { echo >&2 "I require tv_merge but it's not installed. Please install xmltv-util package. Aborting."; exit 1; }
command -v tar >/dev/null 2>&1 || { echo >&2 "I require tar but it's not installed.  Aborting."; exit 1; }

output="output.xmltv"
i=0

for filename in $1
do
  if [[ $i -eq 0 ]]; then
     second=$filename
     i=$((i+1))
     continue
   fi

   if [[ $i -gt 1 ]]; then
     second=$output
   fi

   echo -e "merge $second ${filename}"
   /usr/bin/tv_merge -i $second -m $filename -o $output
   i=$((i+1))

done;

#tar zcvf output.tar.gz $output
mv $output merge.xmltv
git remote add origin2 https://${GITHUB_API_TOKEN}@github.com/fazzani/xmltv.git > /dev/null 2>&1
git add merge.xmltv && git commit -m "daily pushing merged xmltv file to GITHUB" && git push origin2 HEAD:master

exit 0
