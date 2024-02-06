!/bin/bash

cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL03_alone/notmerged

module load samtools/1.3

for g in *.bam
do
filename=${g:0:25}
samtools sort -n "$filename".bam > /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL03_alone/sortname/"$filename"namesorted.bam
done

module unload samtools/1.3
