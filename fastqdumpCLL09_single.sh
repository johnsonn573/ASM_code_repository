#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL09_alone

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015


"$DIR2"/fastq-dump --split-files SRR8579780 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579781 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579782 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR8579783 -O "$DIR"

