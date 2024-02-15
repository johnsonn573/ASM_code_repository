library("GenomeInfoDb")
library("GenomicRanges")
library("GenomeInfoDb")
library("Biostrings")
library("Rsamtools")

# script purpose
# Create a vector showing which CpGs have all NAs
# This script was adapted from /home/nick/Documents/projects/scrrbs/code 

load("cg_genome38.rda")

path=paste0(getwd(), "/")
cov.names=list.files(paste0(path, "cov_files_paired/"))

cg1=cg_genome38
end(cg1)=start(cg1)
cg2=cg_genome38
start(cg2)=end(cg2)

x=read.table(paste0(path,"cov_files_paired/",cov.names)[1])
colnames(x)=c("chr","start","end","prop","M","U")
x.gr=makeGRangesFromDataFrame(x)
na1=!cg1%in%x.gr
na2=!cg2%in%x.gr

for (i in 2:length(cov.names)){
  print(i)
  x=read.table(paste0(path,"cov_files_paired/",cov.names)[i])
  colnames(x)=c("chr","start","end","prop","M","U")
  x.gr=makeGRangesFromDataFrame(x)
  na1=na1&!cg1%in%x.gr
  na2=na2&!cg2%in%x.gr
}

save(na1,file="na1_B_v3.rda")
save(na2,file="na2_B_v3.rda")

