#!/bin/bash

module load Bismark
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/sortname
for i in *sorted.bam
do
sortname=${i:0:12}
bismark_methylation_extractor -p --bedGraph --counts "$sortname"namesorted.bam -o /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/cov
done
module unload Bismark


