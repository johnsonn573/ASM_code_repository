#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL10_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579784 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579785 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579786 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579787 -O "$DIR"

