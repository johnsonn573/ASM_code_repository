# Pipeline description

Some raw data description:
The raw data can be downloaded from SRR using fastq-dump from SRA tools. We performed this download on your human genetics Emory server (HGCC).
More specifically, we ran the following scripts to download the data from SRR.
fastqdumpB01B02B03.sh
fastqdumpB04_single.sh
fastqdumpB04_dual.sh
fastqdumpB05_single.sh
fastqdumpB06_single.sh

Note on the RAW data. The raw data is paired-end and is prefixed by SRR IDs (i.e. SRR6464041_1.fastq and SRR6464041_2.fastq). Importantly, reads from the same cell sometimes spans multiple fastq files. We address this issues later on in the pipeline.

fastq_to_sc_bam.sh
