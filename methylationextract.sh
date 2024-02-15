#!/bin/bash

## Relevant software:
# Bismark v0.19.0

inputpath=`echo $1`
outputpath=`echo $2`

for i in *sorted.bam
do
    sortname=`echo $i | sed -e 's/namesorted\.bam$//'`
    bismark_methylation_extractor -p --bedGraph --counts ${inputpath}/${sortname}namesorted.bam -o ${outputpath}
done