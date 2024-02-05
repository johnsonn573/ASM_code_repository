#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL11_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR6463935 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463936 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463937 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463938 -O "$DIR"

