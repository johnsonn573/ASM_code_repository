
load("cts.B01.rda")
load("cts.B02.rda")
load("cts.B03.rda")
load("cts.B04.rda")
load("cts.B05.rda")
load("cts.B06.rda")

# load("C:/Users/User/Dropbox/projects/scrrbs/likelihoodstuff_forKaren/cts.rda")
# include<-(cts.B01[,1]+cts.B02[,1]+cts.B03[,1]+cts.B04[,1]+cts.B05[,1]+cts.B06[,1])>1
sampleIDs<-c("B01","B02","B03","B04","B05","B06")
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
log.p.value2.B01[log.p.value2.B01>0]<-0
log.p.value2.B02[log.p.value2.B02>0]<-0
log.p.value2.B03[log.p.value2.B03>0]<-0
log.p.value2.B04[log.p.value2.B04>0]<-0
log.p.value2.B05[log.p.value2.B05>0]<-0
log.p.value2.B06[log.p.value2.B06>0]<-0

N1<-cts.B01[,4]+cts.B01[,5]
N2<-cts.B02[,4]+cts.B02[,5]
N3<-cts.B03[,4]+cts.B03[,5]
N4<-cts.B04[,4]+cts.B04[,5]
N5<-cts.B05[,4]+cts.B05[,5]
N6<-cts.B06[,4]+cts.B06[,5]
N.all<-N1+N2+N3+N4+N5+N6

w1<-sqrt(N1/N.all)
w2<-sqrt(N2/N.all)
w3<-sqrt(N3/N.all)
w4<-sqrt(N4/N.all)
w5<-sqrt(N5/N.all)
w6<-sqrt(N6/N.all)
w<-cbind(w1,w2,w3,w4,w5,w6)

# We need to divide the p-value by two. To due this on the log-scale, we substract log(2).
Z1<-qnorm((log.p.value2.B01-log(2)),log.p = T)
Z1[Z1>0]<-0
Z2<-qnorm((log.p.value2.B02-log(2)),log.p = T)
Z2[Z2>0]<-0
Z3<-qnorm((log.p.value2.B03-log(2)),log.p = T)
Z3[Z3>0]<-0
Z4<-qnorm((log.p.value2.B04-log(2)),log.p = T)
Z4[Z4>0]<-0
Z5<-qnorm((log.p.value2.B05-log(2)),log.p = T)
Z5[Z5>0]<-0
Z6<-qnorm((log.p.value2.B06-log(2)),log.p = T)
Z6[Z6>0]<-0

Z<-cbind(Z1,Z2,Z3,Z4,Z5,Z6)

Tstat<-rowSums(w*Z)/sqrt(rowSums(w^2))

pval2.metaZ<-pnorm(Tstat)*2

# CpGs with 0 M cells and 0 U cells get a value of NA. These should have a p-value of 1.
pval2.metaZ[is.na(pval2.metaZ)]<-1

load("LRTpvalues_v3_20230418.rda",verbose=TRUE)

coverageB01<-rowSums(cts.B01)>0
coverageB02<-rowSums(cts.B02)>0
coverageB03<-rowSums(cts.B03)>0
coverageB04<-rowSums(cts.B04)>0
coverageB05<-rowSums(cts.B05)>0
coverageB06<-rowSums(cts.B06)>0

coverage=coverageB01|coverageB02|coverageB03|coverageB04|coverageB05|coverageB06
alpha<-0.05/sum(coverage)

sum(10^log10.pval.global.vs.null<alpha)
sum(10^log10.pval.global.vs.null<alpha&pval2.metaZ[include]>0.05)

save(pval2.metaZ,file="pval2metaZ.rda")

################################################################################

load("asm.strict_B01.rda")
load("asm.strict_B02.rda")
load("asm.strict_B03.rda")
load("asm.strict_B04.rda")
load("asm.strict_B05.rda")
load("asm.strict_B06.rda")

alpha<-0.05/sum(coverageB01)

# 3 criteria for determining ASM.
sum(10^log10.pval.B01<alpha & cts.B01[,1]>1 & exp(log.p.value2.B01)>0.05)

sum(asm.strict.B01)
sum(asm.strict.B01&exp(log.p.value2.B01)>0.05)

sum(asm.strict.B02)
sum(asm.strict.B02&exp(log.p.value2.B02)>0.05)

sum(asm.strict.B03)
sum(asm.strict.B03&exp(log.p.value2.B03)>0.05)

sum(asm.strict.B04)
sum(asm.strict.B04&exp(log.p.value2.B04)>0.05)

sum(asm.strict.B05)
sum(asm.strict.B05&exp(log.p.value2.B05)>0.05)

sum(asm.strict.B06)
sum(asm.strict.B06&exp(log.p.value2.B06)>0.05)

save(list=c("log.p.value2.B01","log.p.value2.B02","log.p.value2.B03","log.p.value2.B04","log.p.value2.B05","log.p.value2.B06"),
     file="pvals2.rda")



