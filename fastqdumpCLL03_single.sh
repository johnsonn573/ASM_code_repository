#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL03_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 

"$DIR2"/fastq-dump --split-files SRR8579156 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579157 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579158 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579159 -O "$DIR"

