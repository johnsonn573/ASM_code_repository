if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

samples=c("CLL01","CLL02","CLL03","CLL04","CLL05","CLL06","CLL07","CLL08","CLL09","CLL10","CLL11","CLL12")
files=list.files(paste0(path,"data/cov_to_small_CLL_qc"))
data.path="bothstrands_paired_CLL"
j=1
files.sample<-files[substr(files,1,5)==samples[j]]
  
basename=substr(files.sample,1,9)
  
  
matrix.m1=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
matrix.u1=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
matrix.m2=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
matrix.u2=matrix(data=0,nrow=length(cg),ncol=length(files.sample))

for (j in 1:12){
  print(j)
  load(paste0(path,"data/sample_matrices/matrix.",samples[j],".rda"))
  load(paste0(path,"data/cts_per_sample/",data.path,"/cts.",samples[j],".rda"))
  cts=get(paste0("cts.",samples[j]))
  inc=which(cts[,1]>0)
  head(inc)
  
  assign(paste0("matrix.m1",samples[j],".asm"),value=get(paste0("matrix.m1",samples[j]))[inc,])
  assign(paste0("matrix.u1",samples[j],".asm"),value=get(paste0("matrix.u1",samples[j]))[inc,])
  assign(paste0("matrix.m2",samples[j],".asm"),value=get(paste0("matrix.m2",samples[j]))[inc,])
  assign(paste0("matrix.u2",samples[j],".asm"),value=get(paste0("matrix.u2",samples[j]))[inc,])
  
  files.to.save=c(paste0("matrix.m1",samples[j],".asm"),
                  paste0("matrix.u1",samples[j],".asm"),
                  paste0("matrix.m2",samples[j],".asm"),
                  paste0("matrix.u2",samples[j],".asm"))
  
  save(list=files.to.save,file=paste0(path,"data/sample_matrices/ASM_only/matrix_asm",samples[j],".rda"))
  rm(list=files.to.save)
  rm(list=c(paste0("matrix.m1",samples[j]),paste0("matrix.u1",samples[j]),paste0("matrix.m2",samples[j]),paste0("matrix.u2",samples[j])))
}

  
  