#!/bin/bash

## Relevant software: 
# samtools v1.3

## Usage: ./namesort.sh ~/your/path/to/input_directory ~/your/path/to/output_directory
# User defines input and output paths as first and second args.
# Do not include final "/" in argument paths.

inputpath=`echo $1`
outputpath=`echo $2`

mkdir -p ${outputpath}

for g in *.bam
do
    filename=`echo $g | sed -e 's/\.bam$//'`
    samtools sort -n ${inputpath}/${filename}.bam > ${outputpath}/${filename}namesorted.bam
done
