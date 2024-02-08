if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

k=1
j=1
for (k in 1:2){
  samples1=c("B01","B02","B03")
  samples2=c("B04","B05","B06")
  samples=get(paste0("samples",k))
  data.path1="bothstrands_paired_B01B02B03"
  data.path2="bothstrands_paired"
  data.path=get(paste0("data.path",k))
  for (j in 1:3){
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
  }}


