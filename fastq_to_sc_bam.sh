#!/bin/bash

## This script demultiplexes scRRBS data deposited on GEO under accession number GSE109085.

## The script assumes that you have already used the fastq-dump command to download
## multiplexed paired-end fastq files into a directory. The next couple lines are
## used to specify the directory where these fastq files have been placed. Apart
## from that, the script should run without additional modifications. Once finished
## running, there will be 24 output files ending in .cov, one for each cell. 
## These files contain the methylation calls for each CpG site.

## Relevant software include:
# conda environment (see conda_list_available_tools.txt)
# samtools v1.3
# fastx v0.014
# Bismark v0.19.0
# bbmap at https://github.com/BioInfoTools/BBMap?tab=readme-ov-file for filterbyname.sh
# TrimGalore v0.6.5

# barcodes=( "TATCTC" "TCTCTG" )
# revcomp_barcodes=( "GAGATA" "CAGAGA" )

barcodes=( "ACAACC" "ACTCAC" "AGGATG" "ATCGAC" "CAAGAG" "CATGAC" "CCTTCG" "CGGTAG" "CTATTG" "CTCAGC" "GCATTC" "GTGAGG" "GTTGAG" "TATCTC" "TCTCTG" "TGACAG" "TGCTGC" "ACAGAC" "AGAAGG" "ATCAAG" "CCATAG" "GAAGTC" "GGTAAC" "TGTAGG" )
revcomp_barcodes=( "GGTTGT" "GTGAGT" "CATCCT" "GTCGAT" "CTCTTG" "GTCATG" "CGAAGG" "CTACCG" "CAATAG" "GCTGAG" "GAATGC" "CCTCAC" "CTCAAC" "GAGATA" "CAGAGA" "CTGTCA" "GCAGCA" "GTCTGT" "CCTTCT" "CTTGAT" "CTATGG" "GACTTC" "GTTACC" "CCTACA" )


ip=`echo $PWD/${sample}/${SRR}/${SRR}`
file_fastq1=`echo ${ip}_1.fastq`
file_fastq2=`echo ${ip}_2.fastq`
output_dir=`echo $PWD/${sample}/${SRR}/` 


cd $output_dir

rm *txt
rm *png
rm *bam
rm *rda
rm *_tr1.fastq
rm *_tr2.fastq
rm *gz

#########################################################################################
#### Start of demultiplexing

awk '(NR%4==1)' $file_fastq1 > var1_1
awk '(NR%4==2)' $file_fastq1 | cut -c 1-6 > var2_1
awk '(NR%4==1)' $file_fastq2 > var1_2
awk '(NR%4==2)' $file_fastq2 | cut -c 1-6 > var2_2

paste var1_1 var2_1 > seqinfo1
paste var1_2 var2_2 > seqinfo2

awk -F "\t" '$2 == "ACAACC"' seqinfo1 | cut -f1 > ACAACC1.txt
awk -F "\t" '$2 == "ACTCAC"' seqinfo1 | cut -f1 > ACTCAC1.txt
awk -F "\t" '$2 == "AGGATG"' seqinfo1 | cut -f1 > AGGATG1.txt
awk -F "\t" '$2 == "ATCGAC"' seqinfo1 | cut -f1 > ATCGAC1.txt
awk -F "\t" '$2 == "CAAGAG"' seqinfo1 | cut -f1 > CAAGAG1.txt
awk -F "\t" '$2 == "CATGAC"' seqinfo1 | cut -f1 > CATGAC1.txt
awk -F "\t" '$2 == "CCTTCG"' seqinfo1 | cut -f1 > CCTTCG1.txt
awk -F "\t" '$2 == "CGGTAG"' seqinfo1 | cut -f1 > CGGTAG1.txt
awk -F "\t" '$2 == "CTATTG"' seqinfo1 | cut -f1 > CTATTG1.txt
awk -F "\t" '$2 == "CTCAGC"' seqinfo1 | cut -f1 > CTCAGC1.txt
awk -F "\t" '$2 == "GCATTC"' seqinfo1 | cut -f1 > GCATTC1.txt
awk -F "\t" '$2 == "GTGAGG"' seqinfo1 | cut -f1 > GTGAGG1.txt
awk -F "\t" '$2 == "GTTGAG"' seqinfo1 | cut -f1 > GTTGAG1.txt
awk -F "\t" '$2 == "TATCTC"' seqinfo1 | cut -f1 > TATCTC1.txt
awk -F "\t" '$2 == "TCTCTG"' seqinfo1 | cut -f1 > TCTCTG1.txt
awk -F "\t" '$2 == "TGACAG"' seqinfo1 | cut -f1 > TGACAG1.txt
awk -F "\t" '$2 == "TGCTGC"' seqinfo1 | cut -f1 > TGCTGC1.txt
awk -F "\t" '$2 == "ACAGAC"' seqinfo1 | cut -f1 > ACAGAC1.txt
awk -F "\t" '$2 == "AGAAGG"' seqinfo1 | cut -f1 > AGAAGG1.txt
awk -F "\t" '$2 == "ATCAAG"' seqinfo1 | cut -f1 > ATCAAG1.txt
awk -F "\t" '$2 == "CCATAG"' seqinfo1 | cut -f1 > CCATAG1.txt
awk -F "\t" '$2 == "GAAGTC"' seqinfo1 | cut -f1 > GAAGTC1.txt
awk -F "\t" '$2 == "GGTAAC"' seqinfo1 | cut -f1 > GGTAAC1.txt
awk -F "\t" '$2 == "TGTAGG"' seqinfo1 | cut -f1 > TGTAGG1.txt
awk -F "\t" '$2 == "ACAACC"' seqinfo2 | cut -f1 > ACAACC2.txt
awk -F "\t" '$2 == "ACTCAC"' seqinfo2 | cut -f1 > ACTCAC2.txt
awk -F "\t" '$2 == "AGGATG"' seqinfo2 | cut -f1 > AGGATG2.txt
awk -F "\t" '$2 == "ATCGAC"' seqinfo2 | cut -f1 > ATCGAC2.txt
awk -F "\t" '$2 == "CAAGAG"' seqinfo2 | cut -f1 > CAAGAG2.txt
awk -F "\t" '$2 == "CATGAC"' seqinfo2 | cut -f1 > CATGAC2.txt
awk -F "\t" '$2 == "CCTTCG"' seqinfo2 | cut -f1 > CCTTCG2.txt
awk -F "\t" '$2 == "CGGTAG"' seqinfo2 | cut -f1 > CGGTAG2.txt
awk -F "\t" '$2 == "CTATTG"' seqinfo2 | cut -f1 > CTATTG2.txt
awk -F "\t" '$2 == "CTCAGC"' seqinfo2 | cut -f1 > CTCAGC2.txt
awk -F "\t" '$2 == "GCATTC"' seqinfo2 | cut -f1 > GCATTC2.txt
awk -F "\t" '$2 == "GTGAGG"' seqinfo2 | cut -f1 > GTGAGG2.txt
awk -F "\t" '$2 == "GTTGAG"' seqinfo2 | cut -f1 > GTTGAG2.txt
awk -F "\t" '$2 == "TATCTC"' seqinfo2 | cut -f1 > TATCTC2.txt
awk -F "\t" '$2 == "TCTCTG"' seqinfo2 | cut -f1 > TCTCTG2.txt
awk -F "\t" '$2 == "TGACAG"' seqinfo2 | cut -f1 > TGACAG2.txt
awk -F "\t" '$2 == "TGCTGC"' seqinfo2 | cut -f1 > TGCTGC2.txt
awk -F "\t" '$2 == "ACAGAC"' seqinfo2 | cut -f1 > ACAGAC2.txt
awk -F "\t" '$2 == "AGAAGG"' seqinfo2 | cut -f1 > AGAAGG2.txt
awk -F "\t" '$2 == "ATCAAG"' seqinfo2 | cut -f1 > ATCAAG2.txt
awk -F "\t" '$2 == "CCATAG"' seqinfo2 | cut -f1 > CCATAG2.txt
awk -F "\t" '$2 == "GAAGTC"' seqinfo2 | cut -f1 > GAAGTC2.txt
awk -F "\t" '$2 == "GGTAAC"' seqinfo2 | cut -f1 > GGTAAC2.txt
awk -F "\t" '$2 == "TGTAGG"' seqinfo2 | cut -f1 > TGTAGG2.txt

cat ACAACC1.txt ACAACC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > ACAACC
cat ACTCAC1.txt ACTCAC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > ACTCAC
cat AGGATG1.txt AGGATG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > AGGATG
cat ATCGAC1.txt ATCGAC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > ATCGAC
cat CAAGAG1.txt CAAGAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CAAGAG
cat CATGAC1.txt CATGAC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CATGAC
cat CCTTCG1.txt CCTTCG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CCTTCG
cat CGGTAG1.txt CGGTAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CGGTAG
cat CTATTG1.txt CTATTG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CTATTG
cat CTCAGC1.txt CTCAGC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CTCAGC
cat GCATTC1.txt GCATTC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > GCATTC
cat GTGAGG1.txt GTGAGG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > GTGAGG
cat GTTGAG1.txt GTTGAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > GTTGAG
cat TATCTC1.txt TATCTC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > TATCTC
cat TCTCTG1.txt TCTCTG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > TCTCTG
cat TGACAG1.txt TGACAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > TGACAG
cat TGCTGC1.txt TGCTGC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > TGCTGC
cat ACAGAC1.txt ACAGAC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > ACAGAC
cat AGAAGG1.txt AGAAGG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > AGAAGG
cat ATCAAG1.txt ATCAAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > ATCAAG
cat CCATAG1.txt CCATAG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > CCATAG
cat GAAGTC1.txt GAAGTC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > GAAGTC
cat GGTAAC1.txt GGTAAC2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > GGTAAC
cat TGTAGG1.txt TGTAGG2.txt | sort -u | cut -c 2- | cut -d ' ' -f1 > TGTAGG

rm *_tr1a_val_1.fq
rm *val_1_bismark_bt2_pe.bam
rm *sorted20.bam

# for i in {0..1} ; do
for i in {0..23} ; do
    filterbyname.sh in=$file_fastq1 out="$SRR"_"${barcodes[$i]}"_tr1.fastq names="${barcodes[$i]}" include=true overwrite=true
    filterbyname.sh in=$file_fastq2 out="$SRR"_"${barcodes[$i]}"_tr2.fastq names="${barcodes[$i]}" include=true overwrite=true
    fastx_trimmer -f 8 -i "$SRR"_"${barcodes[$i]}"_tr1.fastq -o "$SRR"_"${barcodes[$i]}"_tr1a.fastq
    fastx_trimmer -f 8 -i "$SRR"_"${barcodes[$i]}"_tr2.fastq -o "$SRR"_"${barcodes[$i]}"_tr2a.fastq
    trim_galore --rrbs --paired --adapter "${revcomp_barcodes[$i]}" --three_prime_clip_R1 3 --three_prime_clip_R2 3 "$SRR"_"${barcodes[$i]}"_tr1a.fastq "$SRR"_"${barcodes[$i]}"_tr2a.fastq -o $output_dir
done

#### End of demultiplexing
#########################################################################################

rm sub*

### Align to hg38 using Bismark

for f in *_tr1a_val_1.fq
do
    name=${f:0:17}
    echo $name
    bismark --bowtie2 -N 1 -L 32 /home/Shared/ConneelyLab/nick_method/scRRBS/hg38mask_CCGG -1 "$name"_tr1a_val_1.fq -2 "$name"_tr2a_val_2.fq
done



mv *_tr1a_val_1.fq /home/Shared/ConneelyLab/nick_method/scRRBS/sc_fastq
mv *_tr2a_val_2.fq /home/Shared/ConneelyLab/nick_method/scRRBS/sc_fastq

### Use samtools to sort and filter out MAPQ scores less than 20


for g in *val_1_bismark_bt2_pe.bam
do
    filename=${g:0:17}
    samtools sort -n "$filename"_tr1a_val_1_bismark_bt2_pe.bam > "$filename"sorted.bam
    samtools view -bq 20 "$filename"sorted.bam > "$filename"sorted20.bam
done


mv *sorted20.bam /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/"$sample"/notmerged
