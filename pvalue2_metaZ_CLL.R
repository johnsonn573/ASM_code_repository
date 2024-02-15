path=paste0(getwd(),"/")
files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_CLL"),full.names=TRUE)
inc<-files.samples!=paste0(path,"data/cts_per_sample/bothstrands_paired_CLL/cts.CLL11.rda")
for (i in 1:length(files.samples[inc])){print(i);load(files.samples[inc][i])}

for(i in 1:length(samples[inc])){
  cts<-get(paste0("cts.",samples[inc][i]))
  assign(x=paste0("coverage",samples[inc][i]),value=rowSums(cts)>0)
}

sampleIDs<-c("CLL01","CLL02","CLL03","CLL04","CLL05","CLL06","CLL07","CLL08","CLL09","CLL10","CLL12")
i=1
# Creates a p-value to test deviation from 50/50 binomial distribution
for (i in 1:length(sampleIDs)){ # Looping through b01 - b06
  print(i)
  possible.asm<-get(paste0("cts.",sampleIDs[i]))[,1]
  u.non.asm<-get(paste0("cts.",sampleIDs[i]))[,4]
  m.non.asm<-get(paste0("cts.",sampleIDs[i]))[,5]
  proportion=m.non.asm/(m.non.asm+u.non.asm);cov=m.non.asm+u.non.asm # Computing the proportion and coverage for each CpG at non-ASM sites.
  probabilities=matrix(data=NA,nrow=length(m.non.asm),ncol=1) # Setting up an empty matrix to store p-values
  not=!possible.asm==0 # This is a new change in this version.
  inc1=m.non.asm<(cov*.5)#&not # Only include sites when methylated cells are less than half total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(x,n,.5)*2 (3 lines below)
  x=m.non.asm[inc1]
  n=cov[inc1]
  probabilities[inc1]=pbinom(x,n,.5,log.p = T)+log(2) # Store p-values. As p-values, these should be multiplied by 2, but on log-scale we add log(2).
  inc2=(m.non.asm>(cov*.5))#&not  # Only include sites when methylated cells are more than than half total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(n-x,n,0.5)*2 (3 lines below)
  x=m.non.asm[inc2]
  n=cov[inc2]
  probabilities[inc2]=pbinom(n-x,n,0.5,log.p = T)+log(2) # Store p-values. As p-values, these should be multiplied by 2, but on log-scale we add log(2).
  inc3=(m.non.asm==(cov*.5)) #&not # Only include sites when methylated cells are equal to exactly half the total number of non-ASM cells with coverage. For these, the p-values will be computed like this: pbinom(x,n,.5)+pbinom(x,n,.5,lower.tail=F)
  #  inc3[is.na(inc3)]<-FALSE
  x=m.non.asm[inc3]
  n=cov[inc3]
  probabilities[inc3]=log(pbinom(x,n,.5)+pbinom(x,n,.5,lower.tail=F)) # Store p-values
  assign(x=paste0("log.p.value2.",sampleIDs[i]),value=probabilities)
}

# Occasionally values are above zero due to some rounding error.
# More specifically, sometimes the pbinom function might return -0.6931472, which is log(2). And then when log(2) is added, it should equal 0, but due to rounding error, it's some tiny positive number
log.p.value2.CLL01[log.p.value2.CLL01>0]<-0
log.p.value2.CLL02[log.p.value2.CLL02>0]<-0
log.p.value2.CLL03[log.p.value2.CLL03>0]<-0
log.p.value2.CLL04[log.p.value2.CLL04>0]<-0
log.p.value2.CLL05[log.p.value2.CLL05>0]<-0
log.p.value2.CLL06[log.p.value2.CLL06>0]<-0
log.p.value2.CLL07[log.p.value2.CLL07>0]<-0
log.p.value2.CLL08[log.p.value2.CLL08>0]<-0
log.p.value2.CLL09[log.p.value2.CLL09>0]<-0
log.p.value2.CLL10[log.p.value2.CLL10>0]<-0
# log.p.value2.CLL11[log.p.value2.CLL11>0]<-0
log.p.value2.CLL12[log.p.value2.CLL12>0]<-0

N1<-cts.CLL01[,4]+cts.CLL01[,5]
N2<-cts.CLL02[,4]+cts.CLL02[,5]
N3<-cts.CLL03[,4]+cts.CLL03[,5]
N4<-cts.CLL04[,4]+cts.CLL04[,5]
N5<-cts.CLL05[,4]+cts.CLL05[,5]
N6<-cts.CLL06[,4]+cts.CLL06[,5]
N7<-cts.CLL07[,4]+cts.CLL07[,5]
N8<-cts.CLL08[,4]+cts.CLL08[,5]
N9<-cts.CLL09[,4]+cts.CLL09[,5]
N10<-cts.CLL10[,4]+cts.CLL10[,5]
#N11<-cts.CLL11[,4]+cts.CLL11[,5]
N12<-cts.CLL12[,4]+cts.CLL12[,5]
N.all<-N1+N2+N3+N4+N5+N6+N7+N8+N9+N10+N12

w1<-sqrt(N1/N.all)
w2<-sqrt(N2/N.all)
w3<-sqrt(N3/N.all)
w4<-sqrt(N4/N.all)
w5<-sqrt(N5/N.all)
w6<-sqrt(N6/N.all)
w7<-sqrt(N7/N.all)
w8<-sqrt(N8/N.all)
w9<-sqrt(N9/N.all)
w10<-sqrt(N10/N.all)
#w11<-sqrt(N11/N.all)
w12<-sqrt(N12/N.all)
w<-cbind(w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w12)

# We need to divide the p-value by two. To due this on the log-scale, we substract log(2).
Z1<-qnorm((log.p.value2.CLL01-log(2)),log.p = T)
Z1[Z1>0]<-0
Z2<-qnorm((log.p.value2.CLL02-log(2)),log.p = T)
Z2[Z2>0]<-0
Z3<-qnorm((log.p.value2.CLL03-log(2)),log.p = T)
Z3[Z3>0]<-0
Z4<-qnorm((log.p.value2.CLL04-log(2)),log.p = T)
Z4[Z4>0]<-0
Z5<-qnorm((log.p.value2.CLL05-log(2)),log.p = T)
Z5[Z5>0]<-0
Z6<-qnorm((log.p.value2.CLL06-log(2)),log.p = T)
Z6[Z6>0]<-0
Z7<-qnorm((log.p.value2.CLL07-log(2)),log.p = T)
Z7[Z7>0]<-0
Z8<-qnorm((log.p.value2.CLL08-log(2)),log.p = T)
Z8[Z8>0]<-0
Z9<-qnorm((log.p.value2.CLL09-log(2)),log.p = T)
Z9[Z9>0]<-0
Z10<-qnorm((log.p.value2.CLL10-log(2)),log.p = T)
Z10[Z10>0]<-0
#Z11<-qnorm((log.p.value2.CLL11-log(2)),log.p = T)
#Z11[Z11>0]<-0
Z12<-qnorm((log.p.value2.CLL12-log(2)),log.p = T)
Z12[Z12>0]<-0




Z<-cbind(Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z12)

Tstat<-rowSums(w*Z)/sqrt(rowSums(w^2))

pval2.metaZ<-pnorm(Tstat)*2

# CpGs with 0 M cells and 0 U cells get a value of NA. These should have a p-value of 1.
pval2.metaZ[is.na(pval2.metaZ)]<-1

load("LRTpvalues_CLL.rda",verbose=TRUE)


coverage=coverageCLL01|coverageCLL02|coverageCLL03|coverageCLL04|coverageCLL05|coverageCLL06|coverageCLL07|coverageCLL08|coverageCLL09|coverageCLL10|coverageCLL12
alpha<-0.05/sum(coverage)

sum(10^log10.pval.global.vs.null<alpha)
sum(10^log10.pval.global.vs.null<alpha&pval2.metaZ[include]>0.05)

save(pval2.metaZ,file="pval2metaZ_CLL.rda")
