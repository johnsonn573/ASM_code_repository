# Pipeline description

Some raw data description:  <br />
The raw data can be downloaded from SRR using fastq-dump from SRA tools. We performed this download on your human genetics Emory server (HGCC).
More specifically, we ran the following scripts to download the data from SRR. <br />
fastqdumpB01B02B03.sh <br />
fastqdumpB04_single.sh <br />
fastqdumpB04_dual.sh <br />
fastqdumpB05_single.sh <br />
fastqdumpB06_single.sh <br />
fastqdumpCLL01.sh <br />
fastqdumpCLL02.sh <br />
fastqdumpCLL03_dual.sh <br />
fastqdumpCLL03_single.sh <br />
fastqdumpCLL04.sh <br />
fastqdumpCLL04_dual.sh <br />
fastqdumpCLL05_dual.sh <br />
fastqdumpCLL05_single.sh <br />
fastqdumpCLL06_single.sh <br />
fastqdumpCLL07_single.sh <br />
fastqdumpCLL08_single.sh <br />
fastqdumpCLL09_single.sh <br />
fastqdumpCLL10_single.sh <br />
fastqdumpCLL11_single.sh <br />
fastqdumpCLL12_dual.sh <br />

Note on the RAW data. The raw data is paired-end and is prefixed by SRR IDs (i.e. SRR6464041_1.fastq and SRR6464041_2.fastq). Importantly, reads from the same cell sometimes spans multiple fastq files. We address this issues later on in the pipeline. Some of the shell scripts listed above are suffixed with "single" or "dual," which indicates whether the sample has accompanying scRNAseq data (dual) or not (single).  <br />

Once all the fastq data was deposited onto our server, we ran fastq_to_sc_bam.sh, which is a script that demultiplexes the fastq files, trims the reads, performs genomic alignment using Bismark, filters out reads with MAPQ scores < 20, and name sorts the reads.
A qsub command was run on each pair of fastq files. These qsub commands can be found in the txt file qsub_commands_for_fastq_to_sc_bam_script.txt.  <br />
