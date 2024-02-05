#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL04

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 


"$DIR2"/fastq-dump --split-files SRR8579360 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579361 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579362 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579363 -O "$DIR"


