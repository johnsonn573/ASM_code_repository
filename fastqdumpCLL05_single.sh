#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL05_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 


"$DIR2"/fastq-dump --split-files SRR8579564 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579565 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579566 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579567 -O "$DIR"

