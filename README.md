# Pipeline description

## Downloading Raw Data
Some raw data description:    \
The following script and txt file were used to download the data from SRR.    \
\
SRRs.txt    \
fastqdump_all.sh    

The raw data is paired-end and is prefixed by SRR IDs (i.e. SRR6464041_1.fastq and SRR6464041_2.fastq). Importantly, reads from the same cell sometimes spans multiple fastq files. We address this issue later on in the pipeline. Some of the directory names listed in SRRs.txt are suffixed with "alone" or "dual," which indicates whether the sample has accompanying scRNAseq data (dual) or not (single/alone).

## Alignment preprocessing

The raw data was generated from scRRBS in such a way that reads in the final library originated from genomic loci flanked by CCGG regions on both sides within 1000 bps of one another. It is therefore necessary to work with a genome file for which all other regions are masked. To accomplish this, we first created a bed file of all these regions using the script ccgg.r. We then used the script mask_script.sh, which creates a masked genome and subsequently an *in silico* bisulfite converted genome using Bismark. This was all performed using the hg38 version of the human genome.

## Demultiplexing, alignment, and filtering

Once all the fastq data was deposited onto our server and the genome was created, we ran fastq_to_sc_bam.sh. This script demultiplexes the fastq files, trims the reads, performs genomic alignment using Bismark, and filters out reads with MAPQ scores < 20.

The HPC control system SGE was used for job submission. Submission using qsub can be applied with qsub_submit.sh, which requires input from SRRs.txt. 

## Merging files by cell (CLL samples)

Recall that cells were split across multiple fastq files on SRR when they were originally deposited. At this step, we remedy this issue for CLL01 and CLL02 by creating a shell script (merge_by_cell_CLL.sh) using the R script merge_by_cell_CLL.R. The shell script outputs bam files that have been merged by cell using samtools.

## Merging files by cell (B-cell samples)

B-cell samples B01-B03 were merged by running the R script merge_by_cell_v3.R to generate merge_by_cell_v3.sh. The file merge was then performed by running this generated script.

## Name-sorting bam files.

We name-sorted all the bam files using samtools with the following script.    

namesort.sh    

The script relies on samtools v1.3 and is run with the inputfile path and outputfile path as the first and second arguments:    

./namesort.sh ~/my/input/path ~/my/output/path    

## Bismark methylation extractor.

We ran the bismark methylating extractor on each bam file using the following script.    


methylationextract.sh    

The script uses Bismark v0.19.0. Inputfile path and outputfile path are the first and second arguments. For example:

./methylationextract.sh ~/my/input/path ~/my/output/path


## Converting the remaining cov.gz files to Rdata files.

We used the following scripts to convert the cov.gz files to Rdata files. \
cov_to_small_paired_CLL.R (CLL samples) \
cov_to_small_paired_v2.R (B-cell samples)

## QC Filtering

We filtered out cells with a average number of reads per CpGs < 5 using the following scripts.

cov_to_small_qc_CLL.R \
cov_to_small_B01B02B03_qc_v2.R \
cov_to_small_B04B05B06_paired_qc_v2.R

## Marking CpGs w/ no data

To reduce file sizes in downstream analyses, we created a Genomic Ranges file (cg_genome.gr), which marked all the CpG sites in the human genome using a script called cg_genome.R. We then ran the scripts na_B_v3.R and na_CLL.R. These scripts mark all the CpGs that do not have data in B-cell samples and CLL samples, respectively.

## Counting methylation at each CpG. 

For each CpG, we counted up the (1) number of fully methylated cells, (2) number of fully unmethylated cells, (3) number of cells with both methylated and unmethylated read overlaps as well as the number of methylated and unmethylated reads originating from each of these 3 types of cells. We used the following scripts to perform these tasks.

cts_per_sample_bothstrands_paired_B.R    \
cts_per_sample_bothstrands_paired_CLL.R    \
    \
We also generated matrices for each sample with rows corresponding to CpGs and columns corresponding to cells. For the B01 sample, these are the following matrices:    \
matrix.m1B01: counts of all methylated reads on the sense strand by cell & CpG    \
matrix.m2B01: counts of all methylated reads on the anti-sense strand by cell & CpG    \
matrix.u1B01: counts of all unmethylated reads on the sense strand by cell & CpG    \
matrix.u2B01: counts of all unmethylated reads on the anti-sense strand by cell & CpG    \
    \
For the 4 following matrices, only cells with both methylated and unmethylated reads were included for a given CpG.    \
matrix.m1B01.asm: counts of all methylated reads on the sense strand by cell & CpG    \
matrix.m2B01.asm: counts of all methylated reads on the anti-sense strand by cell & CpG    \
matrix.u1B01.asm: counts of all unmethylated reads on the sense strand by cell & CpG    \
matrix.u2B01.asm: counts of all unmethylated reads on the anti-sense strand by cell & CpG    \
    \
These matrices were created for all B-cell samples and all CLL samples.

## Computing likelihoods

To compute likelihoods at both the sample-level and global levels (i.e. all B-cell samples or all CLL samples), we used the following scripts:    \
    \
likelihood_global_CLL.R    \
likelihood_B.R

## Generating composite p-values 

To account for asymmetry among methylated/unmethylated cells, we performed a one-sided weight Z-test, using the following scripts:    \
    \
pvalue2_metaZ_B.R    \
pvalue2_metaZ_CLL.R

## Global ASM and Manhattan plots (Figure 2)

Global ASM and manhattan plots required the following input files:    \
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

## Calling sample-level ASM

We used the following scripts to call ASM at the sample level (Figure 3A).    \
    \
asm_bothstrands_paired_B.R    \
asm_bothstrand_paired_CLL_v2.R

## Generating pairwise comparisons of sample-level ASM (Figure 3B).

We used the following script to compute pairwise overlap of ASM across samples and generate Figure 3B.
    \
comparisons_B_CLL.R

## Probability of ASM against the number of reads (Figure 3C).

We built a multi-level logistic regression model to determine the probability of ASM conditional on the logarithm of the number of reads.
   \
comparison_B_CLL_logreads.R

## Identification of imprinting binding motifs.

We ran the following script to find all imprinting binding motifs in the human genome and save it as an R Genomic Ranges object.
   \
motif.R

## Overlap of global ASM with imprinting-related features (Figure 4 and Table 3).

We quantified the overlap of ASM with imprinting-related features (imprinting binding motifs and imprinted genes) across B-cell samples and CLL samples. See Figure 4.    \
table_ASM_imprinted_global_B_and_CLL.R   \
table_ASM_motif_global_B_and_CLL.R   \
   \
To create Figure 4, the output of the two scripts above is used as input in the following script.   \
   \
Figure_Overlap_Motif_Imprinted.R

## ASM in 10 kb bins (Figure 5).

To run the following scripts, an Rdata file (cov_sample_cell.rda) must be loaded into R. cov_sample_cell contains annotation information. Specifically, it matches cov file names with sample IDs and cell IDs for B04-B06.    \
   \
We ran the following script to quantify ASM in 10 kb bins and produce a corresponding manhattan plot.   \
manhattan_10kb_bin.R
