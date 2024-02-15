path=paste0(getwd(), "/")

# Script purpose
# To do the same thing as cts_per_sample.R, except with both strands.
# We are trying to replicate the results in these slides: 
# https://docs.google.com/presentation/d/1AEMTC8UMKpP3aTMQkeFgVuNE3Z2S4fSCtskhV8LILEk/edit#slide=id.ga74670be46_0_200

# Here, I am making count data frames for each sample.
# There are 6,284,070 rows corresponding to CpGs with data in at least 1 B01-B06
# There are 6 data frames total, each with 7 columns
# Column 1 (possible.asm): The # of cells with both U and M reads. 
# Column 2 (u.asm.reads): The total # of U reads across all cells with ASM.
# Column 3 (m.asm.reads): The total # of M reads across all cells with ASM.
# Column 4 (u.non.asm.cells): Number of unmethylated cells.  
# Column 5 (m.non.asm.cells): Number of methylated cells.
# Column 6 (m.reads): Number of methylated reads (non-ASM).
# Column 7 (u.reads): Number of unmethylated reads (non-ASM).


load(paste0(path,"annot/cg_genome38.rda"))
load(paste0(path,"annot/na1_B_v3.rda")) # New NA files since changes in August 2022 (seems bismark methylation extractor was run on poorly sorted bams).
load(paste0(path,"annot/na2_B_v3.rda")) # New NA files since changes in August 2022 (seems bismark methylation extractor was run on poorly sorted bams).
#load(paste0(path,"annot/na1_B_v2.rda")) # updated to include B01, B02, and B03
#load(paste0(path,"annot/na2_B_v2.rda")) # updated to include B01, B02, and B03
#load(paste0(path,"data/na1.rda"))
#load(paste0(path,"data/na2.rda"))

library(GenomicRanges)

# Strand 1
cg1=cg_genome38;head(cg1)
end(cg1)=start(cg_genome38);head(cg1)
seqlevels(cg1)=substr(seqlevels(cg_genome38),4,6)
cg1.notna=cg1[!na1|!na2]

# Strand 2
cg2=cg_genome38;head(cg2)
start(cg2)=end(cg_genome38);head(cg2)
seqlevels(cg2)=substr(seqlevels(cg_genome38),4,6)
cg2.notna=cg2[!na1|!na2]



# These are for making substrings of sample names. B04, B05, and B06 have 2 fewer characters than CLL samples
num.characters1=c(3,3,3);num.characters1
num.characters2=c(7,7,7);num.characters2
load(paste0(path,"annot/cov_sample_cell.rda"))




files.all=list.files(paste0(path,"data/cov_to_small_B01B02B03_qc"))

samples=c("B01","B02","B03")
k=3
# This nested loop, loops through each sample and each cell of each sample.
for (k in 1:length(samples)){
  print(paste0("Counting for ",samples[k]))
  files=files.all[substr(files.all,1,num.characters1[k])==samples[k]]
  grs=paste0(substr(files,1,num.characters2[k]),".gr")
  dfs=paste0(substr(files,1,num.characters2[k]),".df")
  cts=matrix(data=0,nrow=length(cg1.notna),ncol=7)
  colnames(cts)=c("possible.asm","m.asm.reads","u.asm.reads","u.non.asm.cells","m.non.asm.cells","m.reads","u.reads")
  # start loop
  for (i in 1:length(files)){
    cts.tmp=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    cts.tmp1=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    cts.tmp2=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    print(i)
    load(paste0(path,"data/cov_to_small_B01B02B03_qc/",files[i]))
    gr=get(grs[i])
    df=get(dfs[i])
    find1=findOverlaps(cg1.notna,gr)
    cts.tmp1[queryHits(find1),1]<-cts.tmp1[queryHits(find1),1]+as.numeric(df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]>0)
    inc.only.asm.subject4=subjectHits(find1)[df$M[subjectHits(find1)]==0&df$U[subjectHits(find1)]>0]
    inc.only.asm.query4=queryHits(find1)[df$M[subjectHits(find1)]==0&df$U[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query4,4]<-cts.tmp1[inc.only.asm.query4,4]+as.numeric(df$U[inc.only.asm.subject4]>0)
    inc.only.asm.subject5=subjectHits(find1)[df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]==0]
    inc.only.asm.query5=queryHits(find1)[df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]==0]
    cts.tmp1[inc.only.asm.query5,5]<-cts.tmp1[inc.only.asm.query5,5]+as.numeric(df$M[inc.only.asm.subject5]>0)
    colnames(cts)
    inc.only.asm.subject6=subjectHits(find1)[df$M[subjectHits(find1)]>0]
    inc.only.asm.query6=queryHits(find1)[df$M[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query6,6]<-cts.tmp1[inc.only.asm.query6,6]+as.numeric(df$M[inc.only.asm.subject6])
    
    inc.only.asm.subject7=subjectHits(find1)[df$U[subjectHits(find1)]>0]
    inc.only.asm.query7=queryHits(find1)[df$U[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query7,7]<-cts.tmp1[inc.only.asm.query7,7]+as.numeric(df$U[inc.only.asm.subject7])
    
    find2=findOverlaps(cg2.notna,gr)
    cts.tmp2[queryHits(find2),1]<-cts.tmp2[queryHits(find2),1]+as.numeric(df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]>0)
    inc.only.asm.subject4=subjectHits(find2)[df$M[subjectHits(find2)]==0&df$U[subjectHits(find2)]>0]
    inc.only.asm.query4=queryHits(find2)[df$M[subjectHits(find2)]==0&df$U[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query4,4]<-cts.tmp2[inc.only.asm.query4,4]+as.numeric(df$U[inc.only.asm.subject4]>0)
    inc.only.asm.subject5=subjectHits(find2)[df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]==0]
    inc.only.asm.query5=queryHits(find2)[df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]==0]
    cts.tmp2[inc.only.asm.query5,5]<-cts.tmp2[inc.only.asm.query5,5]+as.numeric(df$M[inc.only.asm.subject5]>0)
    
    inc.only.asm.subject6=subjectHits(find2)[df$M[subjectHits(find2)]>0]
    inc.only.asm.query6=queryHits(find2)[df$M[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query6,6]<-cts.tmp2[inc.only.asm.query6,6]+as.numeric(df$M[inc.only.asm.subject6])
    
    inc.only.asm.subject7=subjectHits(find2)[df$U[subjectHits(find2)]>0]
    inc.only.asm.query7=queryHits(find2)[df$U[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query7,7]<-cts.tmp2[inc.only.asm.query7,7]+as.numeric(df$U[inc.only.asm.subject7])
    
    cts.tmp=cts.tmp1+cts.tmp2
    
    inc=cts.tmp[,6]>0&cts.tmp[,7]>0
    cts.tmp[inc,1]<-1
    cts.tmp[inc,2]<-cts.tmp[inc,6]
    cts.tmp[inc,3]<-cts.tmp[inc,7]
    
    colnames(cts)
    cts.tmp[inc,4]<-0
    cts.tmp[inc,5]<-0
    cts.tmp[inc,6]<-0
    cts.tmp[inc,7]<-0
    
    cts=cts+cts.tmp
    rm(list=c(grs[i],dfs[i]))
  }
  assign(x=paste0("cts.",samples[k]),value=cts)
  save(list=paste0("cts.",samples[k]),file=paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.",samples[k],".rda"))
}


#### Now B04, B05, B06

files.all=list.files(paste0(path,"data/cov_to_small_paired_qc"))

samples=c("B04","B05","B06")

# This nested loop, loops through each sample and each cell of each sample.
for (k in 1:length(samples)){
  print(paste0("Counting for ",samples[k]))
  files=files.all[substr(files.all,1,num.characters1[k])==samples[k]]
  grs=paste0(substr(files,1,num.characters2[k]),".gr")
  dfs=paste0(substr(files,1,num.characters2[k]),".df")
  cts=matrix(data=0,nrow=length(cg1.notna),ncol=7)
  colnames(cts)=c("possible.asm","m.asm.reads","u.asm.reads","u.non.asm.cells","m.non.asm.cells","m.reads","u.reads")
  # start loop
  for (i in 1:length(files)){
    cts.tmp=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    cts.tmp1=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    cts.tmp2=matrix(data=0,nrow=length(cg1.notna),ncol=7)
    print(i)
    load(paste0(path,"data/cov_to_small_paired_qc/",files[i]))
    gr=get(grs[i])
    df=get(dfs[i])
    find1=findOverlaps(cg1.notna,gr)
    cts.tmp1[queryHits(find1),1]<-cts.tmp1[queryHits(find1),1]+as.numeric(df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]>0)
    inc.only.asm.subject4=subjectHits(find1)[df$M[subjectHits(find1)]==0&df$U[subjectHits(find1)]>0]
    inc.only.asm.query4=queryHits(find1)[df$M[subjectHits(find1)]==0&df$U[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query4,4]<-cts.tmp1[inc.only.asm.query4,4]+as.numeric(df$U[inc.only.asm.subject4]>0)
    inc.only.asm.subject5=subjectHits(find1)[df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]==0]
    inc.only.asm.query5=queryHits(find1)[df$M[subjectHits(find1)]>0&df$U[subjectHits(find1)]==0]
    cts.tmp1[inc.only.asm.query5,5]<-cts.tmp1[inc.only.asm.query5,5]+as.numeric(df$M[inc.only.asm.subject5]>0)
    colnames(cts)
    inc.only.asm.subject6=subjectHits(find1)[df$M[subjectHits(find1)]>0]
    inc.only.asm.query6=queryHits(find1)[df$M[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query6,6]<-cts.tmp1[inc.only.asm.query6,6]+as.numeric(df$M[inc.only.asm.subject6])
    
    inc.only.asm.subject7=subjectHits(find1)[df$U[subjectHits(find1)]>0]
    inc.only.asm.query7=queryHits(find1)[df$U[subjectHits(find1)]>0]
    cts.tmp1[inc.only.asm.query7,7]<-cts.tmp1[inc.only.asm.query7,7]+as.numeric(df$U[inc.only.asm.subject7])
    
    find2=findOverlaps(cg2.notna,gr)
    cts.tmp2[queryHits(find2),1]<-cts.tmp2[queryHits(find2),1]+as.numeric(df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]>0)
    inc.only.asm.subject4=subjectHits(find2)[df$M[subjectHits(find2)]==0&df$U[subjectHits(find2)]>0]
    inc.only.asm.query4=queryHits(find2)[df$M[subjectHits(find2)]==0&df$U[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query4,4]<-cts.tmp2[inc.only.asm.query4,4]+as.numeric(df$U[inc.only.asm.subject4]>0)
    inc.only.asm.subject5=subjectHits(find2)[df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]==0]
    inc.only.asm.query5=queryHits(find2)[df$M[subjectHits(find2)]>0&df$U[subjectHits(find2)]==0]
    cts.tmp2[inc.only.asm.query5,5]<-cts.tmp2[inc.only.asm.query5,5]+as.numeric(df$M[inc.only.asm.subject5]>0)
    
    inc.only.asm.subject6=subjectHits(find2)[df$M[subjectHits(find2)]>0]
    inc.only.asm.query6=queryHits(find2)[df$M[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query6,6]<-cts.tmp2[inc.only.asm.query6,6]+as.numeric(df$M[inc.only.asm.subject6])
    
    inc.only.asm.subject7=subjectHits(find2)[df$U[subjectHits(find2)]>0]
    inc.only.asm.query7=queryHits(find2)[df$U[subjectHits(find2)]>0]
    cts.tmp2[inc.only.asm.query7,7]<-cts.tmp2[inc.only.asm.query7,7]+as.numeric(df$U[inc.only.asm.subject7])
    
    cts.tmp=cts.tmp1+cts.tmp2
    
    inc=cts.tmp[,6]>0&cts.tmp[,7]>0
    cts.tmp[inc,1]<-1
    cts.tmp[inc,2]<-cts.tmp[inc,6]
    cts.tmp[inc,3]<-cts.tmp[inc,7]
    
    colnames(cts)
    cts.tmp[inc,4]<-0
    cts.tmp[inc,5]<-0
    cts.tmp[inc,6]<-0
    cts.tmp[inc,7]<-0
    
    cts=cts+cts.tmp
    rm(list=c(grs[i],dfs[i]))
  }
  assign(x=paste0("cts.",samples[k]),value=cts)
  save(list=paste0("cts.",samples[k]),file=paste0(path,"data/cts_per_sample/bothstrands_paired/cts.",samples[k],".rda"))
}

