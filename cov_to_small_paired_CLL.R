path=getwd()
library(GenomicRanges)

# 9/7/2023
# This script was modified from C:/Users/User/Dropbox/projects/scrrbs/code/cov_to_small_paired_v2.R

# This script is trying to store the cov files so they are smaller and faster to load.
# These are going to be stored in the following directory: /home/nick/Dropbox/projects/scrrbs/data/cov_to_small

load(paste0(path,"/annot/cov_sample_cell_CLL.rda"))

files<-list.files(paste0(path, "/data/cov_files_paired_CLL"))

cov_sample_cell_CLL2<-cov_sample_cell_CLL[cov_sample_cell_CLL$cov.names%in%files,]


for (i in 1:nrow(cov_sample_cell_CLL2)){
  print(i)
  cov=read.delim(paste0(path,"/data/cov_files_paired_CLL/",cov_sample_cell_CLL2$cov.names[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=cov_sample_cell_CLL2$cell[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"/data/cov_to_small_paired_CLL/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}


