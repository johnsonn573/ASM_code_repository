library("GenomeInfoDb",lib.loc="/home/njohnson/R_libs")
library("GenomicRanges",lib.loc="/home/njohnson/R_libs")
library("GenomeInfoDb",lib.loc="/home/njohnson/R_libs")
library("Biostrings",lib.loc="/home/njohnson/R_libs")
library("Rsamtools",lib.loc="/home/njohnson/R_libs")

# script purpose
# Create a vector showing which CpGs have all NAs
# This script was adapted from /home/nick/Documents/projects/scrrbs/code 

load("/home/Shared/ConneelyLab/nick_method/scRRBS/cg_genome38.rda")

cov.names=list.files("/home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/cov_files_paired_CLL/")

cg1=cg_genome38
end(cg1)=start(cg1)
cg2=cg_genome38
start(cg2)=end(cg2)

x=read.table(paste0("/home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/cov_files_paired_CLL/",cov.names)[1])
colnames(x)=c("chr","start","end","prop","M","U")
x.gr=makeGRangesFromDataFrame(x)
na1=!cg1%in%x.gr
na2=!cg2%in%x.gr

for (i in 2:length(cov.names)){
  print(i)
  x=read.table(paste0("/home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/cov_files_paired_CLL/",cov.names)[i])
  colnames(x)=c("chr","start","end","prop","M","U")
  x.gr=makeGRangesFromDataFrame(x)
  na1=na1&!cg1%in%x.gr
  na2=na2&!cg2%in%x.gr
}

save(na1,file="/home/Shared/ConneelyLab/nick_method/scRRBS/na1_CLL.rda")
save(na2,file="/home/Shared/ConneelyLab/nick_method/scRRBS/na2_CLL.rda")

