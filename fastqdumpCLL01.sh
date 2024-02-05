#!/bin/bash

DIR=/home/Shared/ConneelyLab/nick_method/scRRBS/CLL01

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 

"$DIR2"/fastq-dump --split-files SRR6463911 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463912 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463913 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463914 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463915 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463916 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463917 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463918 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463919 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463920 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463921 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463922 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463923 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463924 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463925 -O "$DIR"
"$DIR2"/fastq-dump --split-files SRR6463926 -O "$DIR"


