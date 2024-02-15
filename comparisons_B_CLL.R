
load("asm.strict_B01.rda")
load("asm.strict_B02.rda")
load("asm.strict_B03.rda")
load("asm.strict_B04.rda")
load("asm.strict_B05.rda")
load("asm.strict_B06.rda")

load("asm.strict_CLL01.rda")
load("asm.strict_CLL02.rda")
load("asm.strict_CLL03.rda")
load("asm.strict_CLL04.rda")
load("asm.strict_CLL05.rda")
load("asm.strict_CLL06.rda")
load("asm.strict_CLL07.rda")
load("asm.strict_CLL08.rda")
load("asm.strict_CLL09.rda")
load("asm.strict_CLL10.rda")
load("asm.strict_CLL11.rda")
load("asm.strict_CLL12.rda")

load("cts.B01.rda")
load("cts.B02.rda")
load("cts.B03.rda")

load("cts.B04.rda")
load("cts.B05.rda")
load("cts.B06.rda")

load("cts.CLL01.rda")
load("cts.CLL02.rda")
load("cts.CLL03.rda")
load("cts.CLL04.rda")
load("cts.CLL05.rda")
load("cts.CLL06.rda")
load("cts.CLL07.rda")
load("cts.CLL08.rda")
load("cts.CLL09.rda")
load("cts.CLL10.rda")
load("cts.CLL11.rda")
load("cts.CLL12.rda")

load("na1_CLL.rda")
load("na2_CLL.rda")
na1CLL<-na1
na2CLL<-na2

load("na1_B_v3.rda")
load("na2_B_v3.rda")
na1B<-na1
na2B<-na2


load("cg_genome38.rda")

asm.matrix<-matrix(data=NA,nrow=length(cg_genome38),ncol=17)
sum(!na1B|!na2B)

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
#asm.matrix[!na1CLL|!na2CLL,16]<-asm.strict.CLL10
asm.matrix[!na1CLL|!na2CLL,16]<-asm.strict.CLL11
asm.matrix[!na1CLL|!na2CLL,17]<-asm.strict.CLL12


sample.names<-c("B01","B02","B03","B04","B05","B06","CLL01","CLL02","CLL03","CLL04","CLL05","CLL06","CLL07","CLL08","CLL09","CLL10","CLL12")

matrix.OR<-matrix(data=NA,nrow=17,ncol=17)
colnames(matrix.OR)<-sample.names
rownames(matrix.OR)<-sample.names

matrix.OR.pval<-matrix(data=NA,nrow=17,ncol=17)
colnames(matrix.OR.pval)<-sample.names
rownames(matrix.OR.pval)<-sample.names


for(i in 1:17){
  print(i)
  for(j in 1:17){
    print(j)
    inc1<-rowSums(get(paste0("cts.",sample.names[i])))>0
    indices<-1:length(cg_genome38)
    if(i<=6){indices1<-indices[which(!na1B|!na2B)[inc1]]}
    if(i>6){indices1<-indices[which(!na1CLL|!na2CLL)[inc1]]}
    inc2<-rowSums(get(paste0("cts.",sample.names[j])))>0
    if(j<=6){indices2<-indices[which(!na1B|!na2B)[inc2]]}
    if(j>6){indices2<-indices[which(!na1CLL|!na2CLL)[inc2]]}
    indices.both<-which(indices%in%indices1&indices%in%indices2)
    tab<-table(asm.matrix[indices.both,i],asm.matrix[indices.both,j])
    try(fish<-fisher.test(tab))
    sderr_est<-
    try(matrix.OR[i,j]<-fish$estimate)
    try(matrix.OR.pval[i,j]<-fish$p.value)
    rm(fish)
  }
}

inc<-which(colnames(matrix.OR)!="CLL10")
matrix.OR2<-matrix.OR[inc,inc]

#install.packages('plot.matrix')
library('plot.matrix')
library('viridis')


pdf(file="comparison_B_CLL_v3.pdf",width=30*.4,height=14*.4)
par(mar=c(5.1, 4.1, 4.1, 4.1),mfrow=c(1,2))
plot(matrix.OR2,col=rev(viridis(n=10)),axis.col=list(side=1, las=2), axis.row = list(side=2, las=1),xlab="",ylab="")
plot(log10(matrix.OR2),col=rev(viridis(n=10)),axis.col=list(side=1, las=2), axis.row = list(side=2, las=1),xlab="",ylab="")
dev.off()
range(matrix.OR2)

save(list=c("matrix.OR","matrix.OR.pval"),file="comparisons_B_CLL_v3.rda")

load("comparisons_B_CLL.rda",verbose=T)
range(matrix.OR)
load("comparisons_B_CLL_v3.rda",verbose=T)

load("comparisons_B_CLL_v3.rda")

p.values<-matrix.OR.pval[lower.tri(matrix.OR.pval)]
range(matrix.OR[lower.tri(matrix.OR.pval)][p.values<0.05/length(p.values)])


cutoff<-0.05/length(p.values)
matrix.OR2<-matrix.OR
matrix.OR2[matrix.OR.pval>cutoff]<-Inf
#matrix.OR2[matrix.OR2<1]<-Inf
par(mar=c(5.1, 4.1, 4.1, 4.1),mfrow=c(1,1))
plot(log10(matrix.OR2),col=rev(viridis(n=10)),axis.col=list(side=1, las=2), axis.row = list(side=2, las=1),xlab="",ylab="")
new.matrix<-matrix.OR.pval

new.matrix[lower.tri(matrix.OR.pval)][!p.values<0.05/length(p.values)]<-"NS"
min(matrix.OR.pval[lower.tri(matrix.OR.pval)][!p.values<0.05/length(p.values)])
range(matrix.OR[lower.tri(matrix.OR.pval)][p.values<0.05/length(p.values)])
max(matrix.OR.pval[lower.tri(matrix.OR.pval)][p.values<0.05/length(p.values)])

sum(lower.tri(matrix.OR.pval))
sum(!p.values<0.05/length(p.values))
sum(p.values<0.05/length(p.values))

# 10 of 136 do not pass Bonferroni significance
View(new.matrix)

# https://cran.r-project.org/web/packages/plot.matrix/vignettes/plot.matrix.html
# https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization/

