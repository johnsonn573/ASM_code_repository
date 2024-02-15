# Run on 8/25/2021

# Script modified from cov_to_small_B04B05B06_paired_qc.R



if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

# 01/04/2021

# Script purpose
# This is a copy of cov_to_small.R.
# We changed it to process the cov files based on paired methylation calling
# Only B04, B05, B06 sample here.

# Script purpose
# To perform QC on the cov_to_small_qc.R files
# Removed cells with average read count <5
# If reads are less than 6, set the count to zero (effectively ignoring the cell downstream)

files.all=list.files(paste0(path,"data/cov_to_small_paired/"))
#files.all=files.all[substr(files.all,1,3)%in%c("B05","B06")]

load(paste0(path,"data/cov_to_small_paired/",files.all[1]))
num.characters=c(rep(7,384),rep(9,1794-384))
grs=paste0(substr(files.all,1,num.characters),".gr")
dfs=paste0(substr(files.all,1,num.characters),".df")

for (i in 1:length(files.all)){
  print(i)
  load(paste0(path,"data/cov_to_small_paired/",files.all[i]))
  df=get(dfs[i])
  reads=df$M+df$U
  #  df$M[reads<6]<-0
  #  df$U[reads<6]<-0
  name=paste0(substr(files.all[i],1,num.characters[i]),".df")
  assign(x=name,value=df)
  if(mean(reads)>=5){
    save(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),
                paste0(substr(files.all[i],1,num.characters[i]),".df")),
         file=paste0(path,"data/cov_to_small_paired_qc/",files.all[i]))
  }else{}
  rm(list=c(paste0(substr(files.all[i],1,num.characters[i]),".gr"),paste0(substr(files.all[i],1,num.characters[i]),".df")))}

