if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

library(GenomicRanges)

load("C:/Users/User/Dropbox/projects/scrrbs/annot/na1_CLL.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/annot/na2_CLL.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/annot/cg_genome38.rda")

cg=cg_genome38[!na1|!na2]
seqlevels(cg)=substr(seqlevels(cg),4,100)
cg1=cg
end(cg1)=start(cg)
cg2=cg
start(cg2)=end(cg)

samples=c("CLL01","CLL02","CLL03","CLL04","CLL05","CLL06","CLL07","CLL08","CLL09","CLL10","CLL11","CLL12")
files=list.files(paste0(path,"data/cov_to_small_CLL_qc"))
data.path="cov_to_small_CLL_qc"

for (j in 1:12){
    
    files.sample<-files[substr(files,1,5)==samples[j]]
    
    basename=substr(files.sample,1,9)
    
    
    matrix.m1=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
    matrix.u1=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
    matrix.m2=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
    matrix.u2=matrix(data=0,nrow=length(cg),ncol=length(files.sample))
    
    for (i in 1:length(files.sample)){
      load(paste0(path,"data/",data.path,"/",files.sample[i]))
      print(i)
      gr=get(paste0(basename[i],".gr"))
      df=get(paste0(basename[i],".df"))
      
      find1=findOverlaps(cg1,gr)
      find2=findOverlaps(cg2,gr)
      
      matrix.m1[queryHits(find1),i]<-df$M[subjectHits(find1)]
      matrix.u1[queryHits(find1),i]<-df$U[subjectHits(find1)]
      matrix.m2[queryHits(find2),i]<-df$M[subjectHits(find2)]
      matrix.u2[queryHits(find2),i]<-df$U[subjectHits(find2)]
      
      rm(list=c(paste0(basename[i],".gr"),paste0(basename[i],".df")))
    }
    
    assign(paste0("matrix.m1",samples[j]),value=matrix.m1)
    assign(paste0("matrix.u1",samples[j]),value=matrix.u1)
    assign(paste0("matrix.m2",samples[j]),value=matrix.m2)
    assign(paste0("matrix.u2",samples[j]),value=matrix.u2)
    
    list.to.save=c(paste0("matrix.m1",samples[j]),paste0("matrix.u1",samples[j]),paste0("matrix.m2",samples[j]),paste0("matrix.u2",samples[j]))
    save(list=list.to.save,file=paste0(path,"data/sample_matrices/matrix.",samples[j],".rda"))
    rm(list=list.to.save)
    
  }
