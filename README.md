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

## Name-sorting bam files.

We name-sorted all the bam files using samtools with the following scripts.    \
\
namesortb01.sh    \
namesortb02.sh    \
namesortb03.sh    \
namesortb04.sh    \
namesortb05.sh    \
namesortb06.sh    \
namesortcll01.sh    \
namesortcll02.sh    \
namesortcll03_alone.sh    \
namesortcll03_dual.sh    \
namesortcll04.sh    \
namesortcll04.sh    \
namesortcll04_dual.sh    \
namesortcll05_alone.sh    \
namesortcll05_dual.sh    \
namesortcll06_alone.sh    \
namesortcll07_alone.sh    \
namesortcll08_alone.sh    \
namesortcll08_alone_SRR8579779.sh    \
namesortcll09_alone.sh    \
namesortcll09_alone_SRR8579782.sh    \
namesortcll09_alone_SRR8579783.sh    \
namesortcll10_alone.sh    \
namesortcll10_alone_SRR8579785.sh    \
namesortcll10_alone_SRR8579787.sh    \
namesortcll10_alone_SRR8579789.sh    \
namesortcll11_alone.sh    \
namesortcll12_dual.sh    \
namesortcll12_dual_SRR8579789.sh    \
namesortcll12_dual_SRR8579791.sh

## Bismark methylation extractor.

We ran the bismark methylating extractor on each bam file using the following scripts.    \
b01methylationextract.sh    \
b02methylationextract.sh    \
b03methylationextract.sh    \
b04methylationextract.sh    \
b05methylationextract.sh    \
b06methylationextract.sh    \
cll01methylationextract.sh    \
cll02methylationextract.sh    \
cll03_dual_methylationextract.sh    \
cll04methylationextract.sh    \
cll05_alone_methylationextract.sh    \
cll05_dual_methylationextract.sh    \
cll06_alone_methylationextract.sh    \
cll07_alone_methylationextract.sh    \
cll08_alone_methylationextract.sh    \
cll09_alone_methylationextract.sh    \
cll09_alone_methylationextract_SRR8579782.sh    \
cll09_alone_methylationextract_SRR8579783.sh    \
cll10methylationextract.sh    \
cll10methylationextract_SRR8579785.sh    \
cll10methylationextract_SRR8579786.sh    \
cll10methylationextract_SRR8579787.sh    \
cll11methylationextract.sh    \
cll12methylationextract.sh    \
cll12methylationextract_SRR8579789.sh    \
cll12methylationextract_SRR8579791.sh
