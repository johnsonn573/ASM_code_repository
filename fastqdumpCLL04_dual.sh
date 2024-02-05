#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL04_dual

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579364 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579365 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579366 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579367 -O "$DIR"


