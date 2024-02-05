#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL07_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015

"$DIR2"/fastq-dump --split-files SRR8579772 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579773 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579774 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579775 -O "$DIR"

