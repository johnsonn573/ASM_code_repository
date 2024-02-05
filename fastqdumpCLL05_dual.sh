#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL05_dual

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579568 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579569 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579570 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579571 -O "$DIR"

