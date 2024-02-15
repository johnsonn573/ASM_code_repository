if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)
library(GenomicRanges)

# 8/24/2021
# Changed the name of the cov files suffix from namesorted.bismark.cov.gz sorted20.bismark.cov.gz.

# 12/03/2020

# Script purpose
# This is a copy of cov_to_small.R.
# We changed it to process the cov files based on paired methylation calling
# Only B04 sample here.

# This script is trying to store the cov files so they are smaller and faster to load.
# These are going to be stored in the following directory: /home/nick/Dropbox/projects/scrrbs/data/cov_to_small

load(paste0(path,"annot/cov_sample_cell.rda"))
cov_sample_cell2=cov_sample_cell[cov_sample_cell$sample=="B04",]
cov_sample_cell2$cov.names=paste0(substr(cov_sample_cell2$cov.names,1,17),"namesorted.bismark.cov.gz")

for (i in 1:nrow(cov_sample_cell2)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",cov_sample_cell2$cov.names[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=cov_sample_cell2$cell[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_paired/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}

load(paste0(path,"annot/cov_sample_cell.rda"))
cov_sample_cell2=cov_sample_cell[cov_sample_cell$sample=="B05",]
cov_sample_cell2$cov.names=paste0(substr(cov_sample_cell2$cov.names,1,17),"namesorted.bismark.cov.gz")

for (i in 1:nrow(cov_sample_cell2)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",cov_sample_cell2$cov.names[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=cov_sample_cell2$cell[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_paired/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}


load(paste0(path,"annot/cov_sample_cell.rda"))
cov_sample_cell2=cov_sample_cell[cov_sample_cell$sample=="B06",]
cov_sample_cell2$cov.names=paste0(substr(cov_sample_cell2$cov.names,1,17),"namesorted.bismark.cov.gz")

for (i in 1:nrow(cov_sample_cell2)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",cov_sample_cell2$cov.names[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=cov_sample_cell2$cell[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_paired/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}

i=1
incB01<-substr(list.files(paste0(path,"data/cov_files_paired")),1,3)=="B01"
covfilesB01<-list.files(paste0(path,"data/cov_files_paired"))[incB01]
for (i in 1:length(covfilesB01)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",covfilesB01[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=paste0("B01.",substr(covfilesB01,10,12))[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_B01B02B03/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}

incB02<-substr(list.files(paste0(path,"data/cov_files_paired")),1,3)=="B02"
covfilesB02<-list.files(paste0(path,"data/cov_files_paired"))[incB02]
for (i in 1:length(covfilesB02)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",covfilesB02[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=paste0("B02.",substr(covfilesB02,10,12))[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_B01B02B03/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}


incB03<-substr(list.files(paste0(path,"data/cov_files_paired")),1,3)=="B03"
covfilesB03<-list.files(paste0(path,"data/cov_files_paired"))[incB03]
for (i in 1:length(covfilesB03)){
  print(i)
  cov=read.delim(paste0(path,"data/cov_files_paired/",covfilesB03[i]),header=F);dim(cov)
  colnames(cov)=c("chr","start","end","proportion","M","U")
  cov$chr=substr(cov$chr,4,100)
  cov.gr=makeGRangesFromDataFrame(cov)
  cellID=paste0("B03.",substr(covfilesB03,10,12))[i]
  assign(x=paste0(cellID,".gr"),value=cov.gr)
  assign(x=paste0(cellID,".df"),value=cov[,c(5,6)])
  save(list=c(paste0(cellID,".gr"),paste0(cellID,".df")),file=paste0(path,"data/cov_to_small_B01B02B03/",cellID,".rda"))
  rm(list=c(paste0(cellID,".gr"),paste0(cellID,".df")))
  rm(cellID)
}
