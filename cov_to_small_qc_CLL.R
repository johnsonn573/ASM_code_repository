rm(list=ls())
# This script is modified from cov_to_small_B01B02B03_qc_v2.R

path=paste0(getwd(),"/")

# Script purpose
# To perform QC on the cov_to_small files
# Removed cells with average read count <5
# If reads are less than 6, set the count to zero (effectively ignoring the cell downstream)

files.all=list.files(paste0(path,"data/cov_to_small_paired_CLL"))
load(paste0(path,"data/cov_to_small_paired_CLL/",files.all[1]))
num.characters=rep(9,length(files.all))
grs=paste0(substr(files.all,1,num.characters),".gr")
dfs=paste0(substr(files.all,1,num.characters),".df")

read.matrix<-matrix(data=NA,nrow=length(files.all),ncol=2)
colnames(read.matrix)<-c("Mean.Reads","Number.CpGs")

for (i in 1:length(files.all)){
  print(i)
  load(paste0(path,"data/cov_to_small_paired_CLL/",files.all[i]))
  df=get(dfs[i])
  reads=df$M+df$U
  #  df$M[reads<6]<-0
  #  df$U[reads<6]<-0
  name=paste0(substr(files.all[i],1,num.characters[i]),".df")
  assign(x=name,value=df)
  read.matrix[i,1]<-mean(reads)
  read.matrix[i,2]<-nrow(df)
  if(mean(reads)>=5){
    save(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),
                paste0(substr(files.all[i],1,num.characters[i]),".df")),
         file=paste0(path,"data/cov_to_small_CLL_qc/",files.all[i]))
  }else{}
  rm(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),paste0(substr(files.all[i],1,num.characters[i]),".df")))}


