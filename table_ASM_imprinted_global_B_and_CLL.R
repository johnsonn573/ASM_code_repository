rm(list=ls());gc()
# Modified on 02/11/2021 to include B01, B02, B03
library(GenomicRanges)
if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)


gtf=rtracklayer::readGFF("C:/Users/User/Dropbox/projects/scrrbs/annot/prefixed_Homo_sapiens.GRCh38.87.chr.gtf")
genes.all=gtf[gtf$type=="gene",]

genes.all.gr=makeGRangesFromDataFrame(data.frame(chr=genes.all$seqid,start=genes.all$start,end=genes.all$end,strand=genes.all$strand))
names(genes.all.gr)=genes.all$gene_name
genes.all.gr.tmp<-genes.all.gr

library(xlsx)
imprintedgenes<-read.xlsx("C:/Users/User/Dropbox/projects/scrrbs/annot/Imprinted_Genes2023_coordinates.xlsx",sheetName = "Imprinted_Genes2023_coordinates")
imprintedgenes<-imprintedgenes[is.na(imprintedgenes$Remove),]
imprinted.genes.gr<-makeGRangesFromDataFrame(imprintedgenes)
names(imprinted.genes.gr)<-imprintedgenes$gene_name
add.these.imprinted.genes.gr<-imprinted.genes.gr[!names(imprinted.genes.gr)%in%names(genes.all.gr)]

genes.all.gr<-c(genes.all.gr.tmp,add.these.imprinted.genes.gr)
genes.all.gr<-genes.all.gr[!duplicated(names(genes.all.gr))]

genes.all.gr.tmp<-genes.all.gr
start(genes.all.gr)[as.logical(strand(genes.all.gr)=="+")]=start(genes.all.gr.tmp)[as.logical(strand(genes.all.gr.tmp)=="+")]-2000
end(genes.all.gr)[as.logical(strand(genes.all.gr)=="-")]=end(genes.all.gr.tmp)[as.logical(strand(genes.all.gr.tmp)=="-")]+2000

length(genes.all.gr)

load(paste0(path,"annot/cg_genome38.rda"))
load(paste0(path,"annot/na1_B_v3.rda")) # updated to include B01, B02, and B03
load(paste0(path,"annot/na2_B_v3.rda")) # updated to include B01, B02, and B03

na1B<-na1
na2B<-na2

load(paste0(path,"annot/na1_CLL.rda"))
load(paste0(path,"annot/na2_CLL.rda"))

na1CLL<-na1
na2CLL<-na2

load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B02.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B03.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B04.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B05.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired/cts.B06.rda")

coverageB01<-rowSums(cts.B01)>0
coverageB02<-rowSums(cts.B02)>0
coverageB03<-rowSums(cts.B03)>0
coverageB04<-rowSums(cts.B04)>0
coverageB05<-rowSums(cts.B05)>0
coverageB06<-rowSums(cts.B06)>0
coverage=coverageB01|coverageB02|coverageB03|coverageB04|coverageB05|coverageB06
cg.coverage_B=cg_genome38[!na1B|!na2B][coverage] # CpGs with coverage

##############################################################################################################

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
load("C:/Users/User/Dropbox/projects/scrrbs/data/cts_per_sample/bothstrands_paired_CLL/cts.CLL12.rda")

coverageCLL01<-rowSums(cts.CLL01)>0
coverageCLL02<-rowSums(cts.CLL02)>0
coverageCLL03<-rowSums(cts.CLL03)>0
coverageCLL04<-rowSums(cts.CLL04)>0
coverageCLL05<-rowSums(cts.CLL05)>0
coverageCLL06<-rowSums(cts.CLL06)>0
coverageCLL07<-rowSums(cts.CLL07)>0
coverageCLL08<-rowSums(cts.CLL08)>0
coverageCLL09<-rowSums(cts.CLL09)>0
coverageCLL10<-rowSums(cts.CLL10)>0
coverageCLL12<-rowSums(cts.CLL12)>0

coverage=coverageCLL01|coverageCLL02|coverageCLL03|coverageCLL04|coverageCLL05|coverageCLL06|coverageCLL07|coverageCLL08|coverageCLL09|coverageCLL10|coverageCLL12

cg.coverage_CLL=cg_genome38[!na1CLL|!na2CLL][coverage] # CpGs with coverage

cg.coverage<-c(cg.coverage_B,cg.coverage_CLL)

cg.coverage<-cg.coverage[!duplicated(cg.coverage)]

alpha<-0.05/sum(length(cg.coverage_B))
UM.cell.cts<-(cts.B01[,1]+cts.B02[,1]+cts.B03[,1]+cts.B04[,1]+cts.B05[,1]+cts.B06[,1])>1
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/LRTpvalues_v3_20230418.rda")
log10pval<-vector("numeric",length(include))
log10pval[include]<-log10.pval.global.vs.null
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/pval2metaZ.rda")
global.ASM<-10^log10pval<alpha&UM.cell.cts&pval2.metaZ>0.05

length(global.ASM)
sum(global.ASM)

genes.coverage=genes.all.gr[countOverlaps(genes.all.gr,cg.coverage)>0]
print(paste0("genes with coverage: ",length(genes.coverage)))

cg.asm.B=cg_genome38[!na1B|!na2B][global.ASM]


# CLL ASM

alpha<-0.05/length(cg.coverage_CLL)
UM.cell.cts<-(cts.CLL01[,1]+cts.CLL02[,1]+cts.CLL03[,1]+cts.CLL04[,1]+cts.CLL05[,1]+cts.CLL06[,1]+cts.CLL07[,1]+cts.CLL08[,1]+cts.CLL09[,1]+cts.CLL10[,1]+cts.CLL12[,1])>1
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/LRTpvalues_CLL.rda",verbose=T)
log10pval<-vector("numeric",length(include))
log10pval[include]<-log10.pval.global.vs.null
load("C:/Users/User/Dropbox/projects/scrrbs/data/sample_matrices/pval2metaZ_CLL.rda",verbose=T)
global.ASM<-10^log10pval<alpha&UM.cell.cts&pval2.metaZ>0.05
sum(global.ASM)
cg.asm.CLL=cg_genome38[!na1CLL|!na2CLL][global.ASM]

genes.coverage=genes.coverage[!duplicated(names(genes.coverage))]




genes.asm.B=genes.coverage[countOverlaps(genes.coverage,cg.asm.B)>0]
genes.asm.CLL=genes.coverage[countOverlaps(genes.coverage,cg.asm.CLL)>0]
print(paste0("genes with asm: ",length(genes.asm.B)))
print(paste0("genes with asm: ",length(genes.asm.CLL)))

genes.coverage.noasm.B=genes.coverage[countOverlaps(genes.coverage,cg.asm.B)==0]
genes.coverage.noasm.CLL=genes.coverage[countOverlaps(genes.coverage,cg.asm.CLL)==0]

# Do you want to include genes that overlap imprinted genes?
not.imprinted.genes.gr=genes.coverage[!names(genes.coverage)%in%names(imprinted.genes.gr)]

# Do you want to exclude genes that overlap imprinted genes?
#not.imprinted.genes.gr=genes.coverage[countOverlaps(genes.coverage,imprinted.genes.gr)==0]


contingency_table.B=matrix(data=NA,nrow=2,ncol=2)

colnames(contingency_table.B)=c("Not Imprinted","Imprinted")
rownames(contingency_table.B)=c("No ASM","ASM")

length(imprinted.genes.gr)+length(not.imprinted.genes.gr)
length(genes.asm.B)+length(genes.coverage.noasm.B)
length(genes.asm.CLL)+length(genes.coverage.noasm.CLL)

length(imprinted.genes.gr)+length(not.imprinted.genes.gr)
length(unique(names(imprinted.genes.gr)))

contingency_table.B[2,2]=sum(unique(names(imprinted.genes.gr))%in%unique(names(genes.asm.B)))
contingency_table.B[1,2]=sum(unique(names(imprinted.genes.gr))%in%unique(names(genes.coverage.noasm.B)))
contingency_table.B[1,1]=sum(unique(names(not.imprinted.genes.gr))%in%unique(names(genes.coverage.noasm.B)))
contingency_table.B[2,1]=sum(unique(names(not.imprinted.genes.gr))%in%unique(names(genes.asm.B)))

proportion.B <- contingency_table.B[2,]/colSums(contingency_table.B)
CI.B <- 1.96*sqrt( proportion.B * (1-proportion.B) / sum(contingency_table.B) )
df.ggplot.B<-data.frame(proportion=proportion.B,CI=CI.B,"Gene Type"=c("Imprinted","Not Imprinted"),Tissue="B-cell")

contingency_table.B
chisq.test(contingency_table.B)
fisher.test(contingency_table.B)


#################################################################################

contingency_table.CLL=matrix(data=NA,nrow=2,ncol=2)

colnames(contingency_table.CLL)=c("Not Imprinted","Imprinted")
rownames(contingency_table.CLL)=c("No ASM","ASM")

length(imprinted.genes.gr)+length(not.imprinted.genes.gr)
length(genes.asm.CLL)+length(genes.coverage.noasm.CLL)
length(genes.asm.CLL)+length(genes.coverage.noasm.CLL)

length(imprinted.genes.gr)+length(not.imprinted.genes.gr)
length(unique(names(imprinted.genes.gr)))

contingency_table.CLL[2,2]=sum(unique(names(imprinted.genes.gr))%in%unique(names(genes.asm.CLL)))
contingency_table.CLL[1,2]=sum(unique(names(imprinted.genes.gr))%in%unique(names(genes.coverage.noasm.CLL)))
contingency_table.CLL[1,1]=sum(unique(names(not.imprinted.genes.gr))%in%unique(names(genes.coverage.noasm.CLL)))
contingency_table.CLL[2,1]=sum(unique(names(not.imprinted.genes.gr))%in%unique(names(genes.asm.CLL)))

colSums(contingency_table.CLL)
contingency_table.CLL[2,]/colSums(contingency_table.CLL)

contingency_table.CLL[,2]/rowSums(contingency_table.CLL)

221/41985
contingency_table.CLL
chisq.test(contingency_table.CLL)
fisher.test(contingency_table.CLL)

proportion.CLL <- contingency_table.CLL[2,]/colSums(contingency_table.CLL)
CI.CLL <- 1.96*sqrt( proportion.CLL * (1-proportion.CLL) / sum(contingency_table.CLL) )
df.ggplot.CLL<-data.frame(proportion=proportion.CLL,CI=CI.CLL,"Gene Type"=c("Imprinted","Not Imprinted"),Tissue="CLL")

df.ggplot<-rbind(df.ggplot.B,df.ggplot.CLL)

df.ggplot.imprintedgene<-df.ggplot

save(df.ggplot.imprintedgene,file="C:/Users/User/Dropbox/projects/scrrbs/data/df.ggplot.imprintedgene.rda")


################################################################################
################################################################################
################################################################################
################################################################################
################################################################################




not.imprinted.genes.gr[names(not.imprinted.genes.gr)%in%unique(names(genes.asm))]

not.imprint.gr=not.imprinted.genes.gr[names(not.imprinted.genes.gr)%in%unique(names(genes.asm))]

sum(contingency_table)
contingency_table

contingency_table[2,1]/colSums(contingency_table)[1]
contingency_table[2,2]/colSums(contingency_table)[2]


chisq.test(contingency_table)
fisher.test(contingency_table)

write.table(contingency_table,file=paste0(path,"figs/table_ASM_imprinted.txt"),sep="\t")


#

