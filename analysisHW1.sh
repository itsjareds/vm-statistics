#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Invalid parameters."
  echo "Syntax: $0 [baseDataFilename] [resultsDirectory] [resultsFile]"
  exit 1
fi

base=$1
dir=$2
out=$3

if [ ! -d $dir ]; then
  echo "Directory $dir not found"
  exit 1
fi

rm -f ${dir}/${out}
echo "Enter experiment name:"
read name
echo "Experiment $name" >> ${dir}/${out}

set -x
for f in ${dir}/${base}.*; do
  sort -n $f | awk -f analyzeResults.awk scale=${f##*.} >> ${dir}/${out}
done 
set +x
