path=paste0(getwd(),"/")
#rm(list=ls());gc()
# Script purpose:
# Count ASM sites for each sample on both strands.

load(paste0(path,"annot/cov_sample_cell.rda"))
samples=unique(cov_sample_cell$sample);rm(cov_sample_cell)
samples=samples[order(samples)];samples

files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired"),full.names=TRUE)
for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03"),full.names=TRUE)
for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

# Computing p-values for criteria 1
# LRT for whether the ASM reads is more consistent with 50/50 binomial expectation or 1% sequencing error.
sampleIDs=paste0("B0",1:6)

load(paste0(path,"data/sample_matrices/LRTpvalues_v3_20230418.rda"))

for(i in 1:6){
  print(i)
  p.tmp<-10^get(paste0("log10.pval.",sampleIDs[i]))
  pvalue=vector("numeric",length(include))
  pvalue[pvalue==0]<-1
  pvalue[include]<-10^get(paste0("log10.pval.",sampleIDs[i]))
  assign(x=paste0("p.value1.",sampleIDs[i]),value=pvalue)
}

covB01<-rowSums(cts.B01)>0
covB02<-rowSums(cts.B02)>0
covB03<-rowSums(cts.B03)>0
covB04<-rowSums(cts.B04)>0
covB05<-rowSums(cts.B05)>0
covB06<-rowSums(cts.B06)>0

coverage<-covB01|covB02|covB03|covB04|covB05|covB06

load(paste0(path,"data/sample_matrices/pvals2.rda"))

for (i in 1:length(sampleIDs)){
  print(i)
  cts=get(paste0("cts.",sampleIDs[i]))
  cts=data.frame(cts)
  alpha=0.05/sum(covB01)
  p.value1=get(paste0("p.value1.",sampleIDs[i]))
  p.value2=exp(get(paste0("log.p.value2.",sampleIDs[i])))
  asm=cts$possible.asm>1&p.value1<alpha&p.value2>0.05;print(sum(asm))
  assign(x=paste0("asm.strict.",sampleIDs[i]),value=asm);sum(asm)
  save(list=paste0("asm.strict.",sampleIDs[i]),file=paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_",sampleIDs[i],".rda"))
}




