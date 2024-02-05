#!/bin/bash

file1=SRR8579045
file2=SRR8579046
file3=SRR8579047
file4=SRR8579048

DIRA=/home/Shared/ConneelyLab/nick_method/scRRBS/B04_alone/"$file1"
DIRB=/home/Shared/ConneelyLab/nick_method/scRRBS/B04_alone/"$file2"
DIRC=/home/Shared/ConneelyLab/nick_method/scRRBS/B04_alone/"$file3"
DIRD=/home/Shared/ConneelyLab/nick_method/scRRBS/B04_alone/"$file4"

DIR2=/home/Shared/ConneelyLab/nick_method/sratoolkit.2.9.6-1-centos_linux64/bin

cd /home/njohnson/ncbi/dbGaP-20015 

"$DIR2"/fastq-dump --split-files "$file1" -O "$DIRA"
"$DIR2"/fastq-dump --split-files "$file2" -O "$DIRB"
"$DIR2"/fastq-dump --split-files "$file3" -O "$DIRC"
"$DIR2"/fastq-dump --split-files "$file4" -O "$DIRD"

