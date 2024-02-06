#!/bin/bash

cd /mnt/icebreaker/data2/home/Shared/ConneelyLab/nick_method/scRRBS/hg38mask_CCGG

Rscript ccgg.r

module load bedtools/2.27.0
bedtools maskfasta -fi /mnt/icebreaker/data2/home/Shared/ConneelyLab/nick_method/scRRBS/unmasked_genome/hg38.fa -fo hg38.masked.fa -bed ccgg.regions1000.bed
module unload bedtools/2.27.0

module load Bismark/0.19.0
bismark_genome_preparation --bowtie2 /mnt/icebreaker/data2/home/Shared/ConneelyLab/nick_method/scRRBS/hg38mask_CCGG
module unload Bismark/0.19.0



