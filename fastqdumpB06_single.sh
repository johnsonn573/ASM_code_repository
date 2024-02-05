#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/B06_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579152 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579153 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579154 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579155 -O "$DIR"

