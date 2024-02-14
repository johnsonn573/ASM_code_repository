$!/bin/bash

## Example for command line usage of fastqdump_all.sh on HPC control system SGE: 
# for i in `cat SRRs.txt`; do qsub -v i=$i fastqdump_all.sh; done

## Ideally, add whatever other job management parameters you need into the command.

## Software version: sratoolkit.2.9.6-1-centos_linux64

samplename=`echo $i | cut -d; -f1`
dirname=`echo $i | cut -d; -f2`

mkdir -p ${dirname}

fastq-dump --split-files ${samplename} -O ${dirname}