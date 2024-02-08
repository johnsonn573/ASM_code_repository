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

## Merging files by cell (CLL samples)

Recall that cells were split across multiple fastq files on SRR when they were originally deposited. At this step, we remedy this issue for CLL01 and CLL02 by creating a shell script (merge_by_cell_CLL.sh) using the R script merge_by_cell_CLL.R. The shell script outputs bam files that have been merged by cell using samtools.

## Merging files by cell (B-cell samples)

Similarly to CLL01 and CLL02, we also merged by cell for B01-B03 by first generating a shell script (merge_by_cell_v3.sh) using an R script (merge_by_cell_v3.R) and then running that shell script.

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
\
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

## Converting the remaining cov.gz files to Rdata files.

We used the following scripts to perform the conversion. \
cov_to_small_paired_CLL.R (CLL samples) \
cov_to_small_paired_v2.R (B-cell samples)

## QC Filtering

We filtered out cells with a mean number of reads per CpGs < 5 using the following scripts.

cov_to_small_qc_CLL.R \
cov_to_small_B01B02B03_qc_v2.R \
cov_to_small_B04B05B06_paired_qc_v2.R

## Marking CpGs w/ no data

To reduce file sizes in downstream analyses, we created a Genomic Ranges file (cg_genome.gr), which marked all the CpG sites in the human genome using a script called cg_genome.R. We then ran the scripts na_B_v3.R and na_CLL.R, which markes all the CpGs that have no data in B-cell samples and CLL samples, respectively.

## Counting methylation at each CpG. 

For each CpG, we counted up the (1) number of fully methylated cells, (2) number of fully unmethylated cells, (3) number of cells with both methylated and unmethylated read overlaps as well as the number of methylated and unmethylated reads originating from each of these 3 types of cells. We used the following scripts to perform this task.

cts_per_sample_bothstrands_paired_B.R    \
cts_per_sample_bothstrands_paired_CLL.R    \
    \
We also generated matrices for each sample with rows corresponding to CpGs and columns corresponding to cells. For the B01 sample, these are the following matrices:    \
matrix.m1B01: counts of all methylated reads on the sense strand by cell & CpG    \
matrix.m2B01: counts of all methylated reads on the anti-sense strand by cell & CpG    \
matrix.u1B01: counts of all unmethylated reads on the sense strand by cell & CpG    \
matrix.u2B01: counts of all unmethylated reads on the anti-sense strand by cell & CpG    \
    \
For the 4 following matrices, only cells w/ both methylated and unmethylated reads included for a given CpG.    \
matrix.m1B01.asm: counts of all methylated reads on the sense strand by cell & CpG    \
matrix.m2B01.asm: counts of all methylated reads on the anti-sense strand by cell & CpG    \
matrix.u1B01.asm: counts of all unmethylated reads on the sense strand by cell & CpG    \
matrix.u2B01.asm: counts of all unmethylated reads on the anti-sense strand by cell & CpG    \
    \
These matrices were created for all B-cell samples and all CLL samples.

## Computing likelihoods

To compute likelihoods at both the sample-level and global (i.e. all B-cell samples or all CLL samples), we used the following scripts:    \
    \
likelihood_global_CLL.R    \
likelihood_B.R

## Generating composite p-values 

To account for asymmetry among methylated/unmethylated cells, we performed a one-sided weight Z-test, using the following scripts:    \
    \
pvalue2_metaZ_B.R    \
pvalue2_metaZ_CLL.R

## Global ASM and Manhattan plots (Fig. 2)

This step required the following input files:    \
    \
An Ensembl GTF file with a prefix (i.e. "chr") added to each chromosome for the purpose of consistent formatting.    \
prefixed_Homo_sapiens.GRCh38.87.chr.gtf    \
    \
An Excel file with human imprinted genes and their coordinates. The genes for this file were taken from https://www.geneimprint.com/ and manually edited.    \
Imprinted_Genes2023_coordinates.xlsx    \
    \
The scripts to generate the manhattan plots are as follows:    \
manhattan_code_v4_metaZ.R (for B-cell samples)    \
manhattan_code_metaZ_CLL.R (for CLL samples)
