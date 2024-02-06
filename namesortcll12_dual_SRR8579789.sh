#!/bin/bash

cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL12_dual/notmerged

module load samtools/1.3

for g in SRR8579789*
do
filename=${g:0:25}
samtools sort -n "$filename".bam > /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL12_dual/sortname/"$filename"namesorted.bam
done

module unload samtools/1.3
