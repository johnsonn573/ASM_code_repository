#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL02

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 

"$DIR2"/fastq-dump --split-files SRR6463927 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463928 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463929 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463930 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463931 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463932 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463933 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463934 -O "$DIR"


