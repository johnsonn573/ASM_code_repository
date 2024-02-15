path=paste(getwd(),'/')
#rm(list=ls());gc()
# Script purpose:
# Count ASM sites for each sample on both strands.

load(paste0(path,"annot/cov_sample_cell_CLL.rda"))
samples=unique(cov_sample_cell_CLL$sample);rm(cov_sample_cell_CLL)
samples=samples[order(samples)];samples

files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_CLL"),full.names=TRUE)
inc<-files.samples!=paste0(path,"data/cts_per_sample/bothstrands_paired_CLL/cts.CLL11.rda")
for (i in 1:length(files.samples[inc])){print(i);load(files.samples[inc][i])}

for(i in 1:length(samples[inc])){
  cts<-get(paste0("cts.",samples[inc][i]))
  assign(x=paste0("coverage",samples[inc][i]),value=rowSums(cts)>0)
}

coverage=coverageCLL01|coverageCLL02|coverageCLL03|coverageCLL04|coverageCLL05|coverageCLL06|coverageCLL07|coverageCLL08|coverageCLL09|coverageCLL10|coverageCLL12

cov.num=as.numeric(coverageCLL01)+as.numeric(coverageCLL02)+as.numeric(coverageCLL03)+as.numeric(coverageCLL04)+as.numeric(coverageCLL05)+as.numeric(coverageCLL06)+as.numeric(coverageCLL07)+as.numeric(coverageCLL08)+as.numeric(coverageCLL08)+as.numeric(coverageCLL09)+as.numeric(coverageCLL10)+as.numeric(coverageCLL12)

# Make a manhattan plot
# Load the library
#BiocManager::install("qqman")
library(qqman)

load(paste0(path,"annot/cg_genome38.rda"))
load(paste0(path,"annot/na1_CLL.rda"))
load(paste0(path,"annot/na2_CLL.rda"))

cg=cg_genome38[!na1|!na2]

###############################################
# BiocManager::install("rtracklayer")
library(rtracklayer)
library(GenomicRanges)
gtf=rtracklayer::readGFF(paste0(path,"annot/prefixed_Homo_sapiens.GRCh38.87.chr.gtf"))
genes.all=gtf[gtf$type=="gene",]

genes.all.gr=makeGRangesFromDataFrame(data.frame(chr=genes.all$seqid,start=genes.all$start,end=genes.all$end,strand=genes.all$strand))
names(genes.all.gr)=genes.all$gene_name
genes.all.gr.tmp<-genes.all.gr

library(xlsx)
imprintedgenes<-read.xlsx(paste0(path,"annot/Imprinted_Genes2023_coordinates.xlsx",sheetName = "Imprinted_Genes2023_coordinates"))
imprintedgenes<-imprintedgenes[is.na(imprintedgenes$Remove),]
imprinted.genes.gr<-makeGRangesFromDataFrame(imprintedgenes)
names(imprinted.genes.gr)<-imprintedgenes$gene_name
add.these.imprinted.genes.gr<-imprinted.genes.gr[!names(imprinted.genes.gr)%in%names(genes.all.gr)]
genes.all.gr<-c(genes.all.gr.tmp,add.these.imprinted.genes.gr)
genes.all.gr<-genes.all.gr[!duplicated(names(genes.all.gr))]

genes.all.gr.tmp=genes.all.gr
start(genes.all.gr)[as.logical(strand(genes.all.gr)=="+")]=start(genes.all.gr.tmp)[as.logical(strand(genes.all.gr.tmp)=="+")]-2000
end(genes.all.gr)[as.logical(strand(genes.all.gr)=="-")]=end(genes.all.gr.tmp)[as.logical(strand(genes.all.gr.tmp)=="-")]+2000

imprinted.genes.gr.tmp=imprinted.genes.gr
start(imprinted.genes.gr)[as.logical(strand(imprinted.genes.gr)=="+")]=start(imprinted.genes.gr.tmp)[as.logical(strand(imprinted.genes.gr.tmp)=="+")]-2000
end(imprinted.genes.gr)[as.logical(strand(imprinted.genes.gr)=="-")]=end(imprinted.genes.gr.tmp)[as.logical(strand(imprinted.genes.gr.tmp)=="-")]+2000

cg.coverage=cg_genome38[!na1|!na2][coverage]
genes.coverage=genes.all.gr[countOverlaps(genes.all.gr,cg.coverage)>0]
print(paste0("genes with coverage: ",length(genes.coverage)))

###############################################

chr=substr(seqnames(cg),4,nchar(as.character(seqnames(cg)))+1)
chr=factor(chr)
levels(chr)=1:24
chr=as.numeric(as.character(chr))

# This requires using the script asm_bothstrand_paired_B01B02B03_v2.R

#samples=c("B01","B02","B03")

#files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03"),full.names=TRUE)
#for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

sampleIDs=c("CLL01","CLL02","CLL03","CLL04","CLL05","CLL06","CLL07","CLL08","CLL09","CLL10","CLL12")

load(paste0(path,"data/sample_matrices/LRTpvalues_CLL.rda"))

alpha<-0.05/sum(coverage)
# Number of significant ASM CpGs

# Number of significant ASM CpGs overlapping imprinted genes

library(GenomicRanges)

log10pval<-vector("numeric",length(include))
log10pval[include]<-log10.pval.global.vs.null

cg.include=cg_genome38[!na1|!na2][include] # CpGs included in the analysis because that had both U and M reads
cg.coverage=cg_genome38[!na1|!na2][coverage] # CpGs with coverage


cg=cg_genome38[!na1|!na2]
cg.imprint=cg.coverage[countOverlaps(cg.coverage,imprinted.genes.gr)>0]

res=data.frame(chr=as.character(seqnames(cg)),bp=start(cg),snp=as.character(1:length(cg)),p=log10pval)
load(paste0(path,"data/sample_matrices/pval2metaZ_CLL.rda"))
res.all=data.frame(chr=as.character(seqnames(cg)),bp=start(cg),snp=as.character(1:length(cg)),p=log10pval)


UM.cell.cts<-(cts.CLL01[,1]+cts.CLL02[,1]+cts.CLL03[,1]+cts.CLL04[,1]+cts.CLL05[,1]+cts.CLL06[,1]+cts.CLL07[,1]+cts.CLL08[,1]+cts.CLL09[,1]+cts.CLL10[,1]+cts.CLL12[,1])>1
# Fisher's Method
dim(res.all)
length(cg)
cg.sig<-cg[10^res.all$p<alpha&UM.cell.cts&pval2.metaZ>0.05]

sum(10^res.all$p<alpha&UM.cell.cts&pval2.metaZ>0.05)
sum(10^res.all$p<alpha&UM.cell.cts)
384521
32862

length(cpgs.global.ASM.CLL)
cpgs.global.ASM.CLL<-cg.sig
save(list=c("cpgs.global.ASM.CLL","cg.coverage"),file=paste0(path,"data/cg.global.ASM.CLL.rda"))

sum(countOverlaps(imprinted.genes.gr,cg.coverage)>0)
sum(countOverlaps(imprinted.genes.gr,cg.sig)>0)


length(cg.sig)
sum(countOverlaps(cg.sig,cg.imprint)>0)

global.ASM<-10^res.all$p<alpha&UM.cell.cts&pval2.metaZ>0.05


sum(global.ASM,na.rm=T)
#fisher.test(table(asm.number>0,global.ASM))

res.all$p=10^(res.all$p)

cutoff=10^(log10(alpha))

cg.in.res.all<-cg[which(res.all$p!=0&UM.cell.cts&pval2.metaZ>0.05)];length(cg.in.res.all)
res.all<-res.all[res.all$p!=0&UM.cell.cts&pval2.metaZ>0.05,];dim(res.all)
snpsOfInterest.all=res.all$snp[which(countOverlaps(cg.in.res.all,cg.imprint)>0)]

res.all$chr=factor(res.all$chr)
levels(res.all$chr)[23:24]=paste0("chr",23:24)
levels(res.all$chr)=substr(levels(res.all$chr),4,100)
res.all$chr=as.numeric(as.character(res.all$chr))
table(res.all$chr)
cg.in.res.all<-cg.in.res.all[res.all$p!=1]
res.all<-res.all[res.all$p!=1,]
range(res.all$p)
res.all$p[is.na(res.all$p)]<-1
head(res.all$bp)
res.all$snp<-as.numeric(res.all$snp)
range(res.all$p)
res.all<-res.all[!is.na(res.all$snp),]

length(cg.in.res.all)
countOverlaps(cg.in.res.all,cg.imprint)>0


#par(mfrow=c(1,2))
pdf(file=paste0(path,"figs/manhattan_MetaZ_CLL_v3.pdf"),width=10*2,height=5*2)
manhattan(res.all, chr="chr", bp="bp", snp="snp", p="p",highlight = snpsOfInterest.all,genomewideline=-log10(alpha),suggestiveline=F)
dev.off()


res.all[order(res.all$p)[1],]

cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][1]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][1]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][2]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][2]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][3]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][3]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][4]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][4]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][5]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][5]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][6]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][6]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][7]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][7]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][8]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][8]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][9]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][9]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][10]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][10]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][11]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][11]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][12]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][12]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][13]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][13]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][14]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][14]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][15]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][15]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][16]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][16]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][17]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][17]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][18]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][18]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][19]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][19]]))
cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][20]];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][20]]))


genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][1]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][1]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][2]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][2]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][3]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][3]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][4]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][4]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][5]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][5]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][6]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][6]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][7]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][7]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][8]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][8]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][9]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][9]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][10]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][10]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][11]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][11]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][12]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][12]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][13]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][13]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][14]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][14]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][15]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][15]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][16]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][16]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][17]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][17]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][18]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][18]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][19]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][19]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][20]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][20]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][21]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][21]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][22]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][22]]))
genes.all.gr[countOverlaps(genes.all.gr,cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][23]])>0];as.character(seqnames(cg.in.res.all[res.all$p==res.all$p[order(res.all$p)][23]]))
