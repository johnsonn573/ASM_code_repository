#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/B04_dual

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579049 -O "$DIR"/SRR8579049
"$DIR2"/fastq-dump --split-files SRR8579050 -O "$DIR"/SRR8579050
"$DIR2"/fastq-dump --split-files SRR8579051 -O "$DIR"/SRR8579051
"$DIR2"/fastq-dump --split-files SRR8579052 -O "$DIR"/SRR8579052

