# Pipeline description

## Downloading Raw Data
Some raw data description:    \
The raw data can be downloaded from SRR using fastq-dump from SRA tools. We performed this download on your human genetics Emory server (HGCC).
More specifically, we ran the following scripts to download the data from SRR.    \
\
fastqdumpB01B02B03.sh    \
fastqdumpB04_single.sh    \
fastqdumpB04_dual.sh    \
fastqdumpB05_single.sh    \
fastqdumpB06_single.sh    \
fastqdumpCLL01.sh    \
fastqdumpCLL02.sh    \
fastqdumpCLL03_dual.sh    \
fastqdumpCLL03_single.sh    \
fastqdumpCLL04.sh    \
fastqdumpCLL04_dual.sh    \
fastqdumpCLL05_dual.sh    \
fastqdumpCLL05_single.sh    \
fastqdumpCLL06_single.sh    \
fastqdumpCLL07_single.sh    \
fastqdumpCLL08_single.sh    \
fastqdumpCLL09_single.sh    \
fastqdumpCLL10_single.sh    \
fastqdumpCLL11_single.sh    \
fastqdumpCLL12_dual.sh

Note on the RAW data. The raw data is paired-end and is prefixed by SRR IDs (i.e. SRR6464041_1.fastq and SRR6464041_2.fastq). Importantly, reads from the same cell sometimes spans multiple fastq files. We address this issues later on in the pipeline. Some of the shell scripts listed above are suffixed with "single" or "dual," which indicates whether the sample has accompanying scRNAseq data (dual) or not (single).

## Creating genome file for alignment

Because the raw data was generated from scRRBS in such a way that reads in the final library originated from genomic loci flanked by CCGG regions on both sides within 1000 bps of one another. It is therefore necessary to work with a genome file for which all other regions are masked. To accomplish this, we first created a bed file of all these regions using the script ccgg.r. We then used the script mask_script.sh, which creates a masked genome and subsequently an in silico bisulfite converted genome using Bismark. This was all done using an hg38 version of the human genome.

## Demultiplexing, alignment, and filtering

Once all the fastq data was deposited onto our server and the genome was created, we ran fastq_to_sc_bam.sh, which is a script that demultiplexes the fastq files, trims the reads, performs genomic alignment using Bismark, and filters out reads with MAPQ scores < 20.
A qsub command was run on each pair of fastq files. These qsub commands can be found in the txt file qsub_commands_for_fastq_to_sc_bam_script.txt.
