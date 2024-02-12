load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B03.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_B06.rda")

load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL03.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL06.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL07.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL08.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL09.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL10.rda")
#load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL11.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/asm_per_sample/bothstrands_paired/asm.strict_CLL12.rda")

load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B03.rda")

load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B06.rda")

load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL03.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL06.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL07.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL08.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL09.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL10.rda")
#load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL11.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL12.rda")

load("C:/Users/User/Dropbox/projects/scrrbs/annot/na1_CLL.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/annot/na2_CLL.rda")
na1CLL<-na1
na2CLL<-na2

load("C:/Users/User/Dropbox/projects/scrrbs/annot/na1_B_v3.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/annot/na2_B_v3.rda")
na1B<-na1
na2B<-na2


load("C:/Users/User/Dropbox/projects/scrrbs/annot/cg_genome38.rda")

asm.matrix<-matrix(data=NA,nrow=length(cg_genome38),ncol=17)

asm.matrix[!na1B|!na2B,1]<-asm.strict.B01
asm.matrix[!na1B|!na2B,2]<-asm.strict.B02
asm.matrix[!na1B|!na2B,3]<-asm.strict.B03
asm.matrix[!na1B|!na2B,4]<-asm.strict.B04
asm.matrix[!na1B|!na2B,5]<-asm.strict.B05
asm.matrix[!na1B|!na2B,6]<-asm.strict.B06

asm.matrix[!na1CLL|!na2CLL,7]<-asm.strict.CLL01
asm.matrix[!na1CLL|!na2CLL,8]<-asm.strict.CLL02
asm.matrix[!na1CLL|!na2CLL,9]<-asm.strict.CLL03
asm.matrix[!na1CLL|!na2CLL,10]<-asm.strict.CLL04
asm.matrix[!na1CLL|!na2CLL,11]<-asm.strict.CLL05
asm.matrix[!na1CLL|!na2CLL,12]<-asm.strict.CLL06
asm.matrix[!na1CLL|!na2CLL,13]<-asm.strict.CLL07
asm.matrix[!na1CLL|!na2CLL,14]<-asm.strict.CLL08
asm.matrix[!na1CLL|!na2CLL,15]<-asm.strict.CLL09
asm.matrix[!na1CLL|!na2CLL,16]<-asm.strict.CLL10
asm.matrix[!na1CLL|!na2CLL,17]<-asm.strict.CLL12

CpGs.with.data<-vector(mode = "numeric", length(cg_genome38))

incb01<-rowSums(cts.B01)==0
incb02<-rowSums(cts.B02)==0
incb03<-rowSums(cts.B03)==0
incb04<-rowSums(cts.B04)==0
incb05<-rowSums(cts.B05)==0
incb06<-rowSums(cts.B06)==0

CpGs.with.data[!(!na1B|!na2B)]<-NA
CpGs.with.data[!na1B|!na2B][incb01|incb02|incb03|incb04|incb05|incb06]<-NA

incCCL01<-rowSums(cts.CLL01)==0
incCCL02<-rowSums(cts.CLL02)==0
incCCL03<-rowSums(cts.CLL03)==0
incCCL04<-rowSums(cts.CLL04)==0
incCCL05<-rowSums(cts.CLL05)==0
incCCL06<-rowSums(cts.CLL06)==0
incCCL07<-rowSums(cts.CLL07)==0
incCCL08<-rowSums(cts.CLL08)==0
incCCL09<-rowSums(cts.CLL09)==0
incCCL10<-rowSums(cts.CLL10)==0
#incCCL11<-rowSums(cts.CLL11)==0
incCCL12<-rowSums(cts.CLL12)==0

CpGs.with.data[!na1B|!na2B][incCCL01|incCCL02|incCCL03|incCCL04|incCCL05|incCCL06|incCCL07|incCCL08|incCCL09|incCCL10|incCCL12]<-NA

reads.matrix<-matrix(data=NA,nrow=length(cg_genome38),ncol=17)

reads.matrix[!na1B|!na2B,1]<-rowSums(cts.B01[,c(2,3,6,7)])
reads.matrix[!na1B|!na2B,2]<-rowSums(cts.B02[,c(2,3,6,7)])
reads.matrix[!na1B|!na2B,3]<-rowSums(cts.B03[,c(2,3,6,7)])
reads.matrix[!na1B|!na2B,4]<-rowSums(cts.B04[,c(2,3,6,7)])
reads.matrix[!na1B|!na2B,5]<-rowSums(cts.B05[,c(2,3,6,7)])
reads.matrix[!na1B|!na2B,6]<-rowSums(cts.B06[,c(2,3,6,7)])

reads.matrix[!na1CLL|!na2CLL,7]<-rowSums(cts.CLL01[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,8]<-rowSums(cts.CLL02[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,9]<-rowSums(cts.CLL03[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,10]<-rowSums(cts.CLL04[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,11]<-rowSums(cts.CLL05[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,12]<-rowSums(cts.CLL06[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,13]<-rowSums(cts.CLL07[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,14]<-rowSums(cts.CLL08[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,15]<-rowSums(cts.CLL09[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,16]<-rowSums(cts.CLL10[,c(2,3,6,7)])
reads.matrix[!na1CLL|!na2CLL,17]<-rowSums(cts.CLL12[,c(2,3,6,7)])

reads<-reads.matrix[which(CpGs.with.data==0),]

asm.mat<-asm.matrix[which(CpGs.with.data==0),]

include.asm<-asm.mat[,1]>0|asm.mat[,2]>0|asm.mat[,3]>0|asm.mat[,4]>0|asm.mat[,5]>0|asm.mat[,6]>0|asm.mat[,7]>0|asm.mat[,8]>0|asm.mat[,9]>0|asm.mat[,10]>0|asm.mat[,11]>0|asm.mat[,12]>0|asm.mat[,13]>0|asm.mat[,14]>0|asm.mat[,15]>0|asm.mat[,16]>0|asm.mat[,17]>0

df.B01<-data.frame(CpG=1:nrow(asm.mat),sample="B01",asm=asm.mat[,1],reads=reads[,1])[include.asm,]
df.B02<-data.frame(CpG=1:nrow(asm.mat),sample="B02",asm=asm.mat[,2],reads=reads[,2])[include.asm,]
df.B03<-data.frame(CpG=1:nrow(asm.mat),sample="B03",asm=asm.mat[,3],reads=reads[,3])[include.asm,]
df.B04<-data.frame(CpG=1:nrow(asm.mat),sample="B04",asm=asm.mat[,4],reads=reads[,4])[include.asm,]
df.B05<-data.frame(CpG=1:nrow(asm.mat),sample="B05",asm=asm.mat[,5],reads=reads[,5])[include.asm,]
df.B06<-data.frame(CpG=1:nrow(asm.mat),sample="B06",asm=asm.mat[,6],reads=reads[,6])[include.asm,]

df.CLL01<-data.frame(CpG=1:nrow(asm.mat),sample="CLL01",asm=asm.mat[,7],reads=reads[,7])[include.asm,]
df.CLL02<-data.frame(CpG=1:nrow(asm.mat),sample="CLL02",asm=asm.mat[,8],reads=reads[,8])[include.asm,]
df.CLL03<-data.frame(CpG=1:nrow(asm.mat),sample="CLL03",asm=asm.mat[,9],reads=reads[,9])[include.asm,]
df.CLL04<-data.frame(CpG=1:nrow(asm.mat),sample="CLL04",asm=asm.mat[,10],reads=reads[,10])[include.asm,]
df.CLL05<-data.frame(CpG=1:nrow(asm.mat),sample="CLL05",asm=asm.mat[,11],reads=reads[,11])[include.asm,]
df.CLL06<-data.frame(CpG=1:nrow(asm.mat),sample="CLL06",asm=asm.mat[,12],reads=reads[,12])[include.asm,]
df.CLL07<-data.frame(CpG=1:nrow(asm.mat),sample="CLL07",asm=asm.mat[,13],reads=reads[,13])[include.asm,]
df.CLL08<-data.frame(CpG=1:nrow(asm.mat),sample="CLL08",asm=asm.mat[,14],reads=reads[,14])[include.asm,]
df.CLL09<-data.frame(CpG=1:nrow(asm.mat),sample="CLL09",asm=asm.mat[,15],reads=reads[,15])[include.asm,]
df.CLL10<-data.frame(CpG=1:nrow(asm.mat),sample="CLL10",asm=asm.mat[,16],reads=reads[,16])[include.asm,]
df.CLL12<-data.frame(CpG=1:nrow(asm.mat),sample="CLL12",asm=asm.mat[,17],reads=reads[,17])[include.asm,]

df.model<-rbind(df.B01,df.B02,df.B03,df.B04,df.B05,df.B06,
                df.CLL01,df.CLL02,df.CLL03,df.CLL04,df.CLL05,df.CLL06,
                df.CLL07,df.CLL08,df.CLL09,df.CLL10,df.CLL12)

type=factor(substr(df.model$sample,1,1))

rm(list=ls(pattern = "df.CLL"))
gc()
rm(list=ls(pattern = "df.B0"))
gc()
rm(list=ls(pattern = "asm.strict"))
gc()
rm(list=ls(pattern = "cts."))
gc()

library(lme4)
df.model$asm<-as.numeric(df.model$asm)
#df.model$asm[is.na(df.model$asm)]<-0
#df.model$reads[is.na(df.model$reads)]<-0
rm(na1B,na2B,na1CLL,na2CLL,na1,na2,cg_genome38,asm.matrix,asm.mat)
gc()
df.model$type<-type
rm(type);gc()


df.model<-df.model[!is.na(df.model$asm),]
library(lme4)

#save(df.model,file="C:/Users/User/Dropbox/projects/scrrbs/data/dfmodel_forKaren.rda")
df.model<-df.model[df.model$reads!=0,]
df.model$log.reads <- log(df.model$reads)
mean.log.reads<-mean(df.model$log.reads)
sd.log.reads<-sd(df.model$log.reads)
df.model$log.reads.scaled<-(df.model$log.reads-mean.log.reads)/sd.log.reads

start<-Sys.time()
#mod4<-glmer(df.model$asm~df.model$type + df.model$log.reads.scaled + (1|factor(df.model$sample)) + (1|factor(df.model$CpG)),family= binomial(link="logit"))
mod5<-glmer(df.model$asm~df.model$type + df.model$log.reads.scaled + (1|factor(df.model$sample)),family= binomial(link="logit"))

end<-Sys.time()
end-start

#summary(mod4)$coefficients
summary(mod5)$coefficients


SE<-summary(mod5)$coefficients[2,2]


X.seq<-seq(range(df.model$log.reads.scaled)[1],range(df.model$log.reads.scaled)[2],length.out=1000)

B0<-summary(mod5)$coefficients[1,1]
B_CLL<-summary(mod5)$coefficients[2,1]
B_log.reads<-summary(mod5)$coefficients[3,1]

logit.y.b<-B0+B_log.reads*X.seq
logit.y.cll<-B0+B_CLL+B_log.reads*X.seq

logit.y.b.UB<-B0+B_log.reads*X.seq+SE
logit.y.b.LB<-B0+B_log.reads*X.seq-SE
logit.y.cll.UB<-B0+B_CLL+B_log.reads*X.seq+SE
logit.y.cll.LB<-B0+B_CLL+B_log.reads*X.seq-SE

Y.B.lower.bound <- exp(logit.y.b.LB) / (1+exp(logit.y.b.LB))
Y.B.upper.bound <- exp(logit.y.b.UB) / (1+exp(logit.y.b.UB))

Y.CLL.lower.bound <- exp(logit.y.cll.LB) / (1+exp(logit.y.cll.LB))
Y.CLL.upper.bound <- exp(logit.y.cll.UB) / (1+exp(logit.y.cll.UB))

Y.B.hat <- exp(logit.y.b)/(1+exp(logit.y.b))
Y.cll.hat <- exp(logit.y.cll)/(1+exp(logit.y.cll))

par(mfrow=c(1,1))
#subset.size=2000

X.seq.rescaled<-exp(X.seq*sd.log.reads+mean.log.reads)
#pdf(file="C:/Users/User/Dropbox/projects/scrrbs/figs/comparisons_B_CLL3.pdf")
plot(X.seq.rescaled,Y.B.hat,col="forestgreen",type="l",xlab="Number of Reads",ylab="Probability(ASM)",ylim=c(0,1))
#points(X.seq.rescaled,Y.B.lower.bound,col="chartreuse2",type="l")
polygon(c(X.seq.rescaled,rev(X.seq.rescaled)),c(Y.B.hat,rev(Y.B.upper.bound)),col="darkseagreen1",border="darkseagreen1")
polygon(c(X.seq.rescaled,rev(X.seq.rescaled)),c(Y.B.hat,rev(Y.B.lower.bound)),col="darkseagreen1",border="darkseagreen1")
points(X.seq.rescaled,Y.B.hat,col="forestgreen",type="l",xlab="Number of Reads",ylab="Pr(ASM)",ylim=c(-.1,1.1))

col <- rgb(205, 200, 177, max = 255, alpha = 125)
col2rgb("darkgoldenrod3")
col2rgb("forestgreen")
col2rgb("darkseagreen1")
col2rgb("darkgoldenrod1")


points(X.seq.rescaled,Y.cll.hat,col="darkgoldenrod3",type="l",lty=1)
polygon(c(X.seq.rescaled,rev(X.seq.rescaled)),c(Y.cll.hat,rev(Y.CLL.upper.bound)),col=col,border=col)
polygon(c(X.seq.rescaled,rev(X.seq.rescaled)),c(Y.cll.hat,rev(Y.CLL.lower.bound)),col=col,border=col)
#points(X.seq.rescaled,Y.CLL.lower.bound,col="darkgoldenrod1",type="l")
#points(X.seq.rescaled,Y.CLL.upper.bound,col="darkgoldenrod1",type="l")
points(X.seq.rescaled,Y.cll.hat,col="darkgoldenrod3",type="l",lty=1)


legend("topleft",legend = c("CLL","B"),col=c("darkgoldenrod3","forestgreen"),bty="n",lty=1)
x.across<-seq(1,2,length.out=100)
x.low<-rep(2610/5,100)
x.high<-rep(2830/5,100)
y.up<-seq(.12/4,.15/4,length.out=100)
y.high<-rep(.15/4,100)
y.low<-rep(.12/4,100)
x.high<-rep(2830/5,100)
polygon(c(x.low,x.across,x.high,rev(x.across)),c(y.up,y.high,rev(y.up),y.low),col=col,border=col)

x.across<-seq(2610/5,2830/5,length.out=100)
x.low<-rep(2610/5,100)
x.high<-rep(2830/5,100)
y.up<-seq(.05/3.4,.08/3.4,length.out=100)
y.high<-rep(.08/3.4,100)
y.low<-rep(.05/3.4,100)
x.high<-rep(2830/5,100)
col <- rgb(193, 255, 193, max = 255, alpha = 125)
polygon(c(x.low,x.across,x.high,rev(x.across)),c(y.up,y.high,rev(y.up),y.low),col=col,border=col)
legend(x=2500/5,y=.2/4,legend = c("CLL","B"),col=c("darkgoldenrod3","forestgreen"),bty="n",lty=1)
#dev.off()


x.across<-seq(2600,2900,length.out=100)
x.low<-rep(2600,100)
x.high<-rep(2900,100)
y.up<-seq(.1,.2,length.out=100)
y.high<-rep(.2,100)
y.low<-rep(.1,100)
x.high<-rep(2900,100)

sample.B.1<-sample(size=subset.size,which(df.model$type=="B"&df.model$asm==1))
y.sample.b.asm<-df.model$asm[sample.B.1]
inc1<-y.sample.b.asm==1
inc0<-y.sample.b.asm==0
y.sample.b.asm[inc1]<-jitter(y.sample.b.asm[inc1]+.1,amount=.025)
x.sample.b.asm<-df.model$reads[sample.B.1]
points(x.sample.b.asm,y.sample.b.asm,col="forestgreen",pch=".",cex=.001)

sample.B.0<-sample(size=subset.size,which(df.model$type=="B"&df.model$asm==0))
y.sample.b.asm<-df.model$asm[sample.B.0]
inc1<-y.sample.b.asm==1
inc0<-y.sample.b.asm==0
y.sample.b.asm[inc0]<-jitter(y.sample.b.asm[inc0]-.025,amount=.025)
x.sample.b.asm<-df.model$reads[sample.B.0]
points(x.sample.b.asm,y.sample.b.asm,col="forestgreen",pch=".",cex=.001)

sample.C.1<-sample(size=subset.size,which(df.model$type=="C"&df.model$asm==1))
y.sample.c.asm<-df.model$asm[sample.C.1]
inc1<-y.sample.c.asm==1
y.sample.c.asm[inc1]<-jitter(y.sample.c.asm[inc1]+.025,amount=.025)
x.sample.c.asm<-df.model$reads[sample.C.1]
points(x.sample.c.asm,y.sample.c.asm,col="darkgoldenrod3",pch=".",cex=.001)

sample.C.0<-sample(size=subset.size,which(df.model$type=="C"&df.model$asm==0))
y.sample.c.asm<-df.model$asm[sample.C.0]
inc0<-y.sample.c.asm==0
y.sample.c.asm[inc0]<-jitter(y.sample.c.asm[inc0]-.1,amount=.025)
x.sample.c.asm<-df.model$reads[sample.C.0]
points(x.sample.c.asm,y.sample.c.asm,col="darkgoldenrod3",pch=".",cex=.001)




sample.B.0<-sample(size=2000,which(df.model$type=="B"&df.model$asm==0))
y.sample.b.asm<-df.model$asm[sample.B.0]
inc1<-y.sample.b.asm==1
inc0<-y.sample.b.asm==0
y.sample.b.asm[inc1]<-jitter(y.sample.b.asm[inc1]+.05,amount=.05)
y.sample.b.asm[inc0]<-jitter(y.sample.b.asm[inc0]-.05,amount=.05)
x.sample.b.asm<-df.model$reads[sample.B.0]
points(x.sample.b.asm,y.sample.b.asm,col="forestgreen",pch=".",cex=.001)







df.model$asm[df.model$type=="B"]
df.model$reads[df.model$type=="B"]

performance::icc(mod)

indices.subset<-sample(size=3000,1:nrow(df.model))

df.subset<-df.model[indices.subset,]
df.subset$reads<-scale(df.subset$reads)
mod<-glmer(df.subset$asm~df.subset$reads+df.subset$type+df.subset$reads*df.subset$type+(1|factor(df.subset$CpG))+(1|factor(df.subset$sample)),family= binomial(link="logit"))

