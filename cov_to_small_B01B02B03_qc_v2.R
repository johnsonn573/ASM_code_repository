rm(list=ls())
# This script is modified from cov_to_small_B01B02B03_qc.R

if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

# 02/10/2021
# Modified for B01, B02, B03

# 12/04/2020

# Script purpose
# To perform QC on the cov_to_small files
# Removed cells with average read count <5
# If reads are less than 6, set the count to zero (effectively ignoring the cell downstream)

files.all=list.files(paste0(path,"data/cov_to_small_B01B02B03"))
load(paste0(path,"data/cov_to_small_B01B02B03/",files.all[1]))
num.characters=rep(7,length(files.all))
grs=paste0(substr(files.all,1,num.characters),".gr")
dfs=paste0(substr(files.all,1,num.characters),".df")
i=1
for (i in 1:length(files.all)){
  print(i)
  load(paste0(path,"data/cov_to_small_B01B02B03/",files.all[i]))
  df=get(dfs[i])
  reads=df$M+df$U
  #  df$M[reads<6]<-0
  #  df$U[reads<6]<-0
  name=paste0(substr(files.all[i],1,num.characters[i]),".df")
  assign(x=name,value=df)
  if(mean(reads)>=5){
    save(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),
                paste0(substr(files.all[i],1,num.characters[i]),".df")),
         file=paste0(path,"data/cov_to_small_B01B02B03_qc/",files.all[i]))
  }else{}
  rm(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),paste0(substr(files.all[i],1,num.characters[i]),".df")))}

