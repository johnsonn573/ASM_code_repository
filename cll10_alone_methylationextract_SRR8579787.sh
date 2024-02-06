#!/bin/bash

module load Bismark
cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL10_alone/sortname
for i in SRR8579787*
do
sortname=${i:0:25}
bismark_methylation_extractor -p --bedGraph --counts "$sortname"namesorted.bam -o /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL10_alone/cov
done
module unload Bismark

