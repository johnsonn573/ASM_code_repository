path=paste0(getwd(),"/")
#rm(list=ls());gc()
# Script purpose:
# Count ASM sites for each sample on both strands.

load(paste0(path,"annot/cov_sample_cell.rda"))
samples=unique(cov_sample_cell$sample);rm(cov_sample_cell)
samples=samples[order(samples)];samples

load(paste0(path,"/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda"))

files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_CLL"),full.names=TRUE)
for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

# Computing p-values for criteria 1
# LRT for whether the ASM reads is more consistent with 50/50 binomial expectation or 1% sequencing error.
sampleIDs=paste0("CLL0",c(1:9))
sampleIDs=c(sampleIDs,paste0("CLL",c(10,12)))

load(paste0(path,"data/sample_matrices/LRTpvalues_CLL_V2.rda",verbose=T))

for(i in 1:length(sampleIDs)){
  print(i)
  p.tmp<-10^get(paste0("log10.pval.",sampleIDs[i]))
  pvalue=vector("numeric",length(include))
  pvalue[pvalue==0]<-1
  pvalue[include]<-10^get(paste0("log10.pval.",sampleIDs[i]))
  assign(x=paste0("p.value1.",sampleIDs[i]),value=pvalue)
}

covCLL01<-rowSums(cts.CLL01)>0
covCLL02<-rowSums(cts.CLL02)>0
covCLL03<-rowSums(cts.CLL03)>0
covCLL04<-rowSums(cts.CLL04)>0
covCLL05<-rowSums(cts.CLL05)>0
covCLL06<-rowSums(cts.CLL06)>0
covCLL07<-rowSums(cts.CLL07)>0
covCLL08<-rowSums(cts.CLL08)>0
covCLL09<-rowSums(cts.CLL09)>0
covCLL10<-rowSums(cts.CLL10)>0
covCLL12<-rowSums(cts.CLL12)>0

coverage<-covCLL01|covCLL02|covCLL03|covCLL04|covCLL05|covCLL06|covCLL07|covCLL08|covCLL09|covCLL10|covCLL12

covB01<-rowSums(cts.B01)>0


#load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/pvals2.rda",verbose=T)
#load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/pval2metaZ_CLL.rda",verbose=T)

for (i in 1:length(sampleIDs)){
  print(i)
  assign(x="possible.asm",value=get(paste0("cts.",sampleIDs[i]))[,1])
  assign(x="u.asm",value=get(paste0("cts.",sampleIDs[i]))[,2])
  assign(x="m.asm",value=get(paste0("cts.",sampleIDs[i]))[,3])
  numerator=matrix(data=NA,nrow=length(m.asm),ncol=1)
  num1=dbinom(x=m.asm,size=(m.asm+u.asm),p=.01,log=T)
  num2=dbinom(x=m.asm,size=(m.asm+u.asm),p=.99,log=T)
  numerator[num1>num2,1]<-num1[num1>num2]
  numerator[num2>=num1,1]<-num2[num2>=num1]
  logLR=numerator-dbinom(x=m.asm,size=(m.asm+u.asm),p=.5,log=T) # Changed in V6.
  p.value=pchisq(q=-2*logLR,df=1,lower.tail = F);length(p.value) # P-value
  log10.p.value=pchisq(q=-2*logLR,df=1,lower.tail = F,log.p=T)/log(10) # P-value
  log.p.value=pchisq(q=-2*logLR,df=1,lower.tail = F,log.p=T)
  #  assign(x=paste0("log10.p.value1.",sampleIDs[i]),value=log10.p.value)
  #  assign(x=paste0("log.p.value1.",sampleIDs[i]),value=log.p.value)
  #  assign(x=paste0("p.value1.",sampleIDs[i]),value=p.value)
  #  save(list=paste0("p.value1.",sampleIDs[i]),file=paste0(path,"data/pvalues/p.value1.",sampleIDs[i],".rda"))
}

for (i in 1:length(sampleIDs)){ # Looping through CLL samples
  print(i)
  assign(x="possible.asm",value=get(paste0("cts.",sampleIDs[i]))[,1])
  assign(x=paste0("asm.number",sampleIDs[i]),value=possible.asm)
  assign(x="u.non.asm",value=get(paste0("cts.",sampleIDs[i]))[,4])
  assign(x="m.non.asm",value=get(paste0("cts.",sampleIDs[i]))[,5])
  proportion=m.non.asm/(m.non.asm+u.non.asm);cov=m.non.asm+u.non.asm # Computing the proportion and coverage for each CpG at non-ASM sites.
  probabilities=matrix(data=NA,nrow=length(m.non.asm),ncol=1) # Setting up an empty matrix to store p-values
  # not=!(proportion==1|proportion==0)&!possible.asm==0&!possible.asm==1 # Excluding sites with <2 ASM cells AND sites with a proportion of 0 or 1.
  not=!possible.asm==0 # This is a new change in this version.
  # Here I'm using the pbinom() function to do a two-tailed binomial test
  # Why not use the binom.test() function? It's because it's slow. It doesn't let you compute from vectors.
  # But I compare pbinom() to binom.test() below this loop so you can see it gives the same result.
  # But I have to use pbinom() 3 separate times to make sure that it computes the correct two-tailed p-value.
  inc1=m.non.asm<(cov*.5)#&not # Only include sites when methylated cells are less than half total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(x,n,.5)*2 (3 lines below)
  x=m.non.asm[inc1]
  n=cov[inc1]
  probabilities[inc1]=pbinom(x,n,.5)*2 # Store p-values
  inc2=(m.non.asm>(cov*.5))#&not  # Only include sites when methylated cells are more than than half total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(n-x,n,0.5)*2 (3 lines below)
  x=m.non.asm[inc2]
  n=cov[inc2]
  probabilities[inc2]=pbinom(n-x,n,0.5)*2 # Store p-values
  inc3=(m.non.asm==(cov*.5)) #&not # Only include sites when methylated cells are equal to exactly half the total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(x,n,.5)+pbinom(x,n,.5,lower.tail=F)
  #  inc3[is.na(inc3)]<-FALSE
  x=m.non.asm[inc3]
  n=cov[inc3]
  probabilities[inc3]=pbinom(x,n,.5)+pbinom(x,n,.5,lower.tail=F) # Store p-values
  assign(x=paste0("p.value2.",sampleIDs[i]),value=probabilities)
  #  save(list=paste0("p.value2.",sampleIDs[i]),file=paste0(path,"data/pvalues/p.value2.",sampleIDs[i],".rda"))
}

for (i in 1:length(sampleIDs)){
  print(i)
  cts=get(paste0("cts.",sampleIDs[i]))
  cts=data.frame(cts)
  alpha=0.05/sum(covB01)
  p.value1<-vector(mode="numeric",length=length(include))
  p.value1[p.value1==0]<-1
  p.value1[include]=10^get(paste0("log10.pval.",sampleIDs[i]))
  #  p.value2=exp(get(paste0("log.p.value2.",sampleIDs[i])))
  p.value2=get(paste0("p.value2.",sampleIDs[i]))
  asm=cts$possible.asm>1&p.value1<alpha&p.value2>0.05;print(sum(asm))
  assign(x=paste0("asm.strict.",sampleIDs[i]),value=asm);sum(asm)
  save(list=paste0("asm.strict.",sampleIDs[i]),file=paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_",sampleIDs[i],".rda"))
}

