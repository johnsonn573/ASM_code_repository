#!/bin/bash

## Run on HPC control system SGE. SRRs.txt used as input for SRR (aka - samplename) and sample (aka - sample).
# bash qsub_submit.sh

for i in `cat SRRs.txt`;
do
    samplename=`echo $i | cut -d; -f1`
    dirname=`echo $i | cut -d; -f2`
    qsub -q b.q -pe smp 10 -cwd -j y -v SRR=${samplename},sample=${dirname} ../fastq_to_sc_bam.sh
done

