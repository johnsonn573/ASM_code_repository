#rm(list=ls());gc()

# Creating the input data for the likelihoods
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B03.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B06.rda")

# We only car to test CpGs with >1 cells with both U & M reads since this is one of our filtering criteria.
# Each row is a CpG. Each column is a different count. Column 1 is a count of the number of U&M cells
include<-(cts.B01[,1]+cts.B02[,1]+cts.B03[,1]+cts.B04[,1]+cts.B05[,1]+cts.B06[,1])>1

# The degrees of freedom for the LRT of variable ASM
df.LRT<- -1+(as.numeric(rowSums(cts.B01)>0)+as.numeric(rowSums(cts.B02)>0)+as.numeric(rowSums(cts.B03)>0)+as.numeric(rowSums(cts.B04)>0)+as.numeric(rowSums(cts.B05)>0)+as.numeric(rowSums(cts.B06)>0))[include]
df.LRT[df.LRT==0]<-1


# The loop loads in the sample data and does the following pre-processing steps
# Combines unmethylated reads from both strands into an unmethylated matrix
# Combines methylated reads from both strands into a methylated matrix
# Removes rows with fewer than 2 cells with both methylated and unmethylated reads.
# Output naming converting example: U.matrixB01, M.matrixB01, etc.

sample.names<-c("B01","B02","B03","B04","B05","B06")
for(i in 1:length(sample.names)){
  load(paste0("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/matrix.",sample.names[i],".rda"),verbose=T)
  assign(x=paste0("U.matrix",sample.names[i]),value=get(paste0("matrix.u1",sample.names[i]))[include,]+get(paste0("matrix.u2",sample.names[i]))[include,])
  assign(x=paste0("M.matrix",sample.names[i]),value=get(paste0("matrix.m1",sample.names[i]))[include,]+get(paste0("matrix.m2",sample.names[i]))[include,])
  rm(list=paste0(c("matrix.m1","matrix.u1","matrix.m2","matrix.u2"),sample.names[i]))
  gc()
}

sample.names<-c("B01","B02","B03","B04","B05","B06")
source("C:/Users/User/Dropbox/projects/scrrbs/code/LRT/likelihood_functions.R")
# load("C:/Users/User/Dropbox/projects/scrrbs/likelihoodstuff_forKaren/input_data_v3_forKaren.rda")

# Likelihood for each Individual (This will also be used for Variable ASM)
# Both Alternative and Null Likelihoods saved
for(i in 1:length(sample.names)){
  print(i)

  M.tmp<-get(paste0("M.matrix",sample.names[i])); M.tmp2<-M.tmp # Matrix of methylated reads
  U.tmp<-get(paste0("U.matrix",sample.names[i])); U.tmp2<-U.tmp # Matrix of unmethylated reads
  M.tmp[U.tmp2>0]<-0 # Methylated matrix excluding cells with unmethylated reads.
  U.tmp[M.tmp2>0]<-0 # Unmethylated matrix excluding cells with methylated reads

  M.cells<-rowSums(M.tmp>0) # A vector with the number of methylated cells. Each element is a CpG.
  U.cells<-rowSums(U.tmp>0) # A vector with the number of unmethylated cells. Each element is a CpG.
  prop.m<-M.cells/(U.cells+M.cells) # The proportion of methylated cells. Each element is a CpG
  prop.u<-1-prop.m # The proportion of unmethylated cells. Each element is a CpG.
  prop.m[is.nan(prop.m+prop.u)]<-1 # Sometimes there are 0 methylated and 0 unmethylated cells. By setting the proportion equal to 1 for these cells, it has no effect on the likelihood.
  prop.u[is.nan(prop.m+prop.u)]<-1 # Sometimes there are 0 methylated and 0 unmethylated cells. By setting the proportion equal to 1 for these cells, it has no effect on the likelihood.

  # we need to make new matrices, one with methylated reads and the other with unmethylated reads. BUT...
  # we want to only include reads from cells with both methylated and unmethylated reads.
  matrix.UM.U.tmp<-get(paste0("U.matrix",sample.names[i]))
  matrix.UM.U.tmp[!(M.tmp2>0&U.tmp2>0)]<-0 # cell everything to zero except cells with both U and M reads
  matrix.UM.M.tmp<-get(paste0("M.matrix",sample.names[i]))
  matrix.UM.M.tmp[!(M.tmp2>0&U.tmp2>0)]<-0 # cell everything to zero except cells with both U and M reads

  # Assigning names to the input data. This is used for the next loop.
  assign(x=paste0("matrix.UM.U.",sample.names[i]),value=matrix.UM.U.tmp)
  assign(x=paste0("matrix.UM.M.",sample.names[i]),value=matrix.UM.M.tmp)
  assign(x=paste0("matrix.U.U.",sample.names[i]),value=M.tmp)
  assign(x=paste0("matrix.M.M.",sample.names[i]),value=U.tmp)
  assign(x=paste0("M.cells.",sample.names[i]),value=M.cells)
  assign(x=paste0("U.cells.",sample.names[i]),value=U.cells)
  assign(x=paste0("prop.m.",sample.names[i]),value=prop.m)
  assign(x=paste0("prop.u.",sample.names[i]),value=prop.u)
  
  p.asm.matrix=matrix(data=NA,nrow=nrow(matrix.UM.U.tmp),ncol=1)
  l.asm.matrix=matrix(data=NA,nrow=nrow(matrix.UM.U.tmp),ncol=1)
  l.null.asm.matrix=matrix(data=NA,nrow=nrow(matrix.UM.U.tmp),ncol=1)
  
  for (j in 1:nrow(p.asm.matrix)){
    
    # Here we are iteratively loading in all the input data for each CpG.
    U.j=matrix.UM.U.tmp[j,]
    M.j=matrix.UM.M.tmp[j,]
    prop.u.j<-prop.u[j]
    prop.m.j<-prop.m[j]
    U.cells.j<-U.cells[j]
    M.cells.j<-M.cells[j]

    inc=which(U.j>0|M.j>0) # Only including the cells with data
    if(identical(inc,integer(0))){inc<-1} # If there is no data, the output looks like 'integer(0)' which messes up the likelihood. Setting it to one will force it to include the first cell, which is 0, thus being uninformative to the likelihood.
    U.j=U.j[inc]
    M.j=M.j[inc]

    optimization_output=optimize(f=like_alldata,lower=0,upper=1) # Optimize pasm.
    
    p.asm.matrix[j,1]<-optimization_output$minimum
    l.asm.matrix[j,1]<-optimization_output$objective
    l.null.asm.matrix[j,1]<-like_alldata(pasm=0)
  }
  assign(x=paste0("pASM.",sample.names[i]),value=p.asm.matrix)
  assign(x=paste0("l.",sample.names[i]),value=l.asm.matrix)
  assign(x=paste0("l.null.",sample.names[i]),value=l.null.asm.matrix)
  
  rm(list=c("M.tmp","U.tmp","M.tmp2","U.tmp2","matrix.UM.U.tmp","matrix.UM.M.tmp"))
  rm(list=paste0(c("M.matrix","U.matrix"),sample.names[i]));gc()
}

save(list=c("pASM.B01","pASM.B02","pASM.B03","pASM.B04","pASM.B05","pASM.B06",
            "l.B01","l.B02","l.B03","l.B04","l.B05","l.B06","include"),
     file="C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodsIndividual_v3.rda")

save(list=c("l.null.B01","l.null.B02","l.null.B03","l.null.B04","l.null.B05","l.null.B06","include","df.LRT"),
     file="C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodsNullIndividual_v3.rda")

################################################################################
################################################################################
################################################################################

# Global Likelihood
# Initializing the output
p.asm.matrix=matrix(data=NA,nrow=length(df.LRT),ncol=1)
l.asm.matrix=matrix(data=NA,nrow=length(df.LRT),ncol=1)
l.asm.null.matrix=matrix(data=NA,nrow=length(df.LRT),ncol=1)

for (j in 1:nrow(p.asm.matrix)){
  print(j)
  for(i in 1:length(sample.names)){
    # Here we are iteratively loading in all the input data for each CpG.
    inc=which(get(paste0("matrix.UM.U.",sample.names[i]))[j,]>0|get(paste0("matrix.UM.M.",sample.names[i]))[j,]>0) # Only including the cells with data
    if(identical(inc,integer(0))){inc<-1}
    assign(x=paste0("U.",sample.names[i],".j"),value=get(paste0("matrix.UM.U.",sample.names[i]))[j,inc])
    assign(x=paste0("M.",sample.names[i],".j"),value=get(paste0("matrix.UM.M.",sample.names[i]))[j,inc])
    assign(x=paste0("prop.u.",sample.names[i],".j"),value=get(paste0("prop.u.",sample.names[i]))[j])
    assign(x=paste0("prop.m.",sample.names[i],".j"),value=get(paste0("prop.m.",sample.names[i]))[j])
    assign(x=paste0("U.cells.",sample.names[i],".j"),value=get(paste0("U.cells.",sample.names[i]))[j])
    assign(x=paste0("M.cells.",sample.names[i],".j"),value=get(paste0("M.cells.",sample.names[i]))[j])
  }
  optimization_output=optimize(f=like_alldata.global,lower=0,upper=1) # This part does the optimization.
  
  p.asm.matrix[j,1]<-optimization_output$minimum
  l.asm.matrix[j,1]<-optimization_output$objective
  l.asm.null.matrix[j,1]<-like_alldata.global(pasm=0)
}

pASM.global<-p.asm.matrix
l.global<-l.asm.matrix
l.null.global<-l.asm.null.matrix

save(list=c("pASM.global","l.global","include"),
     file="C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodGlobal_v3.rda")
save(list=c("l.null.global","include"),
     file="C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodNullGlobal_v3.rda")

################################################################################
################################################################################
################################################################################

# Likelihood ratio Tests
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodGlobal_v3.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodNullGlobal_v3.rda")

# LR for Global ASM vs. Null
LR.global.vs.null=-2*(l.global[,1]-l.null.global[,1])
LR.global.vs.null[!is.finite(LR.global.vs.null)|LR.global.vs.null<0]<-0
log10.pval.global.vs.null<-pchisq(LR.global.vs.null,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.global.vs.null)

# LR for Variable ASM vs. Null
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodsNullIndividual_v3.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/likelihoodsIndividual_v3.rda")

l.variable.ASM=l.B01+l.B02+l.B03+l.B04+l.B05+l.B06
l.null.variable.ASM=l.null.B01+l.null.B02+l.null.B03+l.null.B04+l.null.B05+l.null.B06
LR.variable.vs.null=-2*(l.variable.ASM[,1]-l.null.variable.ASM[,1])
LR.variable.vs.null[!is.finite(LR.variable.vs.null)|LR.variable.vs.null<0]<-0
log10.pval.variable.vs.null<-pchisq(LR.variable.vs.null,df=df.LRT,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.variable.vs.null)

# Sample-level LR Tests for ASM vs. Null

# B01
LR.B01=-2*(l.B01[,1]-l.null.B01[,1])
LR.B01[!is.finite(LR.B01)|LR.B01<0]<-0
log10.pval.B01<-pchisq(LR.B01,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B01)

# B02
LR.B02=-2*(l.B02[,1]-l.null.B02[,1])
LR.B02[!is.finite(LR.B02)|LR.B02<0]<-0
log10.pval.B02<-pchisq(LR.B02,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B02)

# B03
LR.B03=-2*(l.B03[,1]-l.null.B03[,1])
LR.B03[!is.finite(LR.B03)|LR.B03<0]<-0
log10.pval.B03<-pchisq(LR.B03,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B03)

# B04
LR.B04=-2*(l.B04[,1]-l.null.B04[,1])
LR.B04[!is.finite(LR.B04)|LR.B04<0]<-0
log10.pval.B04<-pchisq(LR.B04,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B04)

# B05
LR.B05=-2*(l.B05[,1]-l.null.B05[,1])
LR.B05[!is.finite(LR.B05)|LR.B05<0]<-0
log10.pval.B05<-pchisq(LR.B05,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B05)

# B06
LR.B06=-2*(l.B06[,1]-l.null.B06[,1])
LR.B06[!is.finite(LR.B06)|LR.B06<0]<-0
log10.pval.B06<-pchisq(LR.B06,df=1,log.p=T,lower.tail = F)/log(10)
summary(log10.pval.B06)


################################################################################
################################################################################
################################################################################

save(
  list=c("LR.global.vs.null","LR.variable.vs.null","log10.pval.global.vs.null","log10.pval.variable.vs.null","log10.pval.B01","log10.pval.B02","log10.pval.B03","log10.pval.B04","log10.pval.B05","log10.pval.B06","include"),
  file="C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/LRTpvalues_v3_20230418.rda")



