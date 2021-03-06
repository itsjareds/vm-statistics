#!/bin/bash

if [[ $# -ne 5 ]]; then
  echo "Invalid parameters."
  echo "Syntax: $0 [iterationCountP] [firstScalingP] [numberRuns]
  [resultsDirectory] [baseDataFileName]"
  exit 1
fi

mkdir -p $4
rm -rf "$4/*"

for i in `seq $2 \`expr $2 + $3\` | awk '{print 2 ^ $1}'`; do
  echo "Running $1 iterations on blocksize $i..."
  ./hw1 $1 $i > "$4/$5.$i"
done
