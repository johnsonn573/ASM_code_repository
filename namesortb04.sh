#!/bin/bash

cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B04/notmerged

module load samtools/1.3

for g in *sorted20.bam
do
filename=${g:0:17}
samtools sort -n "$filename"sorted20.bam > /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B04/sortname/"$filename"namesorted.bam
done

module unload samtools/1.3

