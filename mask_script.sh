#!/bin/bash

## Software: 
## bedtools v2.27.0
## Bismark v0.19.0

Rscript ccgg.r

bedtools maskfasta -fi hg38.fa -fo hg38.masked.fa -bed ccgg.regions1000.bed

bismark_genome_preparation --bowtie2 hg38mask_CCGG