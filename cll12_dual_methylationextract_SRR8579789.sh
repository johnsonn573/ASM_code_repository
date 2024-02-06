#!/bin/bash

module load Bismark
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL12_dual/sortname
for i in SRR8579789*
do
sortname=${i:0:25}
bismark_methylation_extractor -p --bedGraph --counts "$sortname"namesorted.bam -o /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL12_dual/cov
done
module unload Bismark

