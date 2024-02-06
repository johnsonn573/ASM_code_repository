!/bin/bash

cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL01/merged_by_cell

module load samtools/1.3

for g in *.bam
do
filename=${g:0:9}
samtools sort -n "$filename".bam > /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL01/sortname/"$filename"namesorted.bam
done

module unload samtools/1.3
