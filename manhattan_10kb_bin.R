path=paste0(getwd(),"/")
#rm(list=ls());gc()
# adapted from cpgs_per_bin_manhattan_Dave_v4.R


# Script purpose:
# Count ASM sites for each sample on both strands.

load(paste0(path,"annot/cov_sample_cell.rda"))
samples=unique(cov_sample_cell$sample);rm(cov_sample_cell)
samples=samples[order(samples)];samples

files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired"),full.names=TRUE)
for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

sampleIDs=samples[1:3]
# Computing p-values for criteria 1
# LRT for whether the ASM reads is more consistent with 50/50 binomial expectation or 1% sequencing error.

load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B02.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B03.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B04.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B05.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B06.rda"))

coverageB01=rowSums(cts.B01)>0
coverageB02=rowSums(cts.B02)>0
coverageB03=rowSums(cts.B03)>0
coverageB04=rowSums(cts.B04)>0
coverageB05=rowSums(cts.B05)>0
coverageB06=rowSums(cts.B06)>0

coverage=coverageB01|coverageB02|coverageB03|coverageB04|coverageB05|coverageB06

cov.num=as.numeric(coverageB01)+as.numeric(coverageB02)+as.numeric(coverageB03)+as.numeric(coverageB04)+as.numeric(coverageB05)+as.numeric(coverageB06)

rm(cts.B01,cts.B02,cts.B03,cts.B04,cts.B05,cts.B06)

# Make a manhattan plot

# Load the library
#BiocManager::install("qqman")
library(qqman)

load(paste0(path,"annot/cg_genome38.rda"))
load(paste0(path,"annot/na1_B_v3.rda"))
load(paste0(path,"annot/na2_B_v3.rda"))

cg=cg_genome38[!na1|!na2]

###############################################
library(rtracklayer)
library(GenomicRanges)

gtf=rtracklayer::readGFF(paste0(path,"annot/prefixed_Homo_sapiens.GRCh38.87.chr.gtf"))
genes.all=gtf[gtf$type=="gene",]

genes.all.gr=makeGRangesFromDataFrame(data.frame(chr=genes.all$seqid,start=genes.all$start,end=genes.all$end,strand=genes.all$strand))
names(genes.all.gr)=genes.all$gene_name
genes.all.gr.tmp<-genes.all.gr

imprintedgenes<-read.xlsx(paste0(path,"annot/Imprinted_Genes2023_coordinates.xlsx",sheetIndex = 1))
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

load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B01.rda"))
load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B02.rda"))
load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B03.rda"))
load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B04.rda"))
load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B05.rda"))
load(paste0(path,"data/asm_per_sample/bothstrands_paired/asm.strict_B06.rda"))

cg.asm=cg_genome38[!na1|!na2][asm.strict.B01|asm.strict.B02|asm.strict.B03|asm.strict.B04|asm.strict.B05|asm.strict.B06]

genes.imrint.asm=imprinted.genes.gr[countOverlaps(imprinted.genes.gr,cg.asm)>0]
cg.asm.imprint=cg.asm[countOverlaps(cg.asm,imprinted.genes.gr)>0]

###############################################

chr=substr(seqnames(cg),4,nchar(as.character(seqnames(cg)))+1)
chr=factor(chr)
levels(chr)=1:24
chr=as.numeric(as.character(chr))

# This requires using the script asm_bothstrand_paired_B01B02B03_v2.R

#samples=c("B01","B02","B03")

#files.samples=list.files(path=paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03"),full.names=TRUE)
#for (i in 1:length(files.samples)){print(i);load(files.samples[i])}

sampleIDs=c("B01","B02","B03")

load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B01.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B02.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired_B01B02B03/cts.B03.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B04.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B05.rda"))
load(paste0(path,"data/cts_per_sample/bothstrands_paired/cts.B06.rda"))

#load(paste0(path,"data/global_v_null_dave_v2.rda"),verbose=T)
load(paste0(path,"data/sample_matrices/LRTpvalues_v3_20230418.rda",verbose=T))
load(paste0(path,"data/sample_matrices/pval2metaZ.rda",verbose=T))

log.10.pvalue<-vector(length=length(coverage))
log.10.pvalue[include]=log10.pval.global.vs.null
log.10.pvalue[pval2.metaZ<.05]<-0
binsize=10000;idx = paste0("chr", 1:22);idx = c(idx, "chrX", "chrY")
#binsize=100;idx = paste0("chr", 1:22);idx = c(idx, "chrX", "chrY")
library(BSgenome.Hsapiens.UCSC.hg38)
Allbins.gr=tileGenome(seqinfo(BSgenome.Hsapiens.UCSC.hg38)[idx],tilewidth=binsize,cut.last.tile.in.chrom=TRUE)

#cts=countOverlaps(Allbins.gr,cg.asm)
bins.coverage=Allbins.gr[countOverlaps(Allbins.gr,cg.coverage)>0] # Bins with CpGs with coverage

find=findOverlaps(bins.coverage,cg)
log10pval10kb=matrix(data=NA,nrow=length(bins.coverage),ncol=1)
log.pvalue=log.10.pvalue/log10(exp(1))
log10=log(10)

################################################################################
################################################################################
################################################################################

################################################################################
################################################################################
################################################################################

UM.cell.cts<-(cts.B01[,1]+cts.B02[,1]+cts.B03[,1]+cts.B04[,1]+cts.B05[,1]+cts.B06[,1])>1
log.pvalue[!UM.cell.cts]<-0
for (i in 1:nrow(log10pval10kb)){
  print(i)
  inc=queryHits(find)==i
  df=2*sum(inc)
  chisq=-2*sum(log.pvalue[subjectHits(find)[inc]])
  log.10.pvalue=pchisq(chisq,df=df,log.p=T,lower.tail = F)/log10
  log10pval10kb[i,1]=log.10.pvalue
  
}

res=data.frame(chr=as.character(seqnames(bins.coverage)),bp=start(bins.coverage),snp=as.character(1:length(bins.coverage)),p=log10pval10kb)
save(res,file=paste0(path,"results/resbin_v3.rda"))
load(paste0(path,"results/resbin_v3.rda"),verbose = T)
snpsOfInterest=res$snp[which(countOverlaps(bins.coverage,imprinted.genes.gr)>0)]

sum(10^res$p<0.05/length(bins.coverage))


list.genes.10kb<-list()
for (i in 1:1000){
  list.genes.10kb[[i]]<-print(names(genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][i]])>0]))
}

save(list.genes.10kb,file=paste0(path,"data/list.genes.10kb.rda"))
load(paste0(path,"data/list.genes.10kb.rda"))


genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][1]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][2]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][3]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][4]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][5]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][6]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][7]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][8]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][9]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][10]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][11]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][12]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][13]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][14]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][15]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][16]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][17]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][18]])>0]
genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==res$p[order(res$p)][19]])>0]


genes.all.gr[countOverlaps(genes.all.gr,bins.coverage[res$p==min(res$p)])>0]

res$p==min(res$p[res$p != min(res$p)])


res.bin<-res
range(res.bin$p)
res.bin2=res.bin[res.bin$p<log10(0.05/nrow(res)),]
sum(res.bin$p<log10(0.05/nrow(res)))
snpsOfInterest2=snpsOfInterest[snpsOfInterest%in%res.bin2$snp]

cutoff=10^(log10((0.05/nrow(res)))/1000)
cutoff
sum(res.bin2$p<0.05/nrow(res))
res.bin2$chr<-factor(res.bin2$chr)
levels(res.bin2$chr)
levels(res.bin2$chr)<-c(1,10,11,12:19,2,20:22,3:9,23,24)
res.bin2$chr<-as.numeric(as.character(res.bin2$chr))
res.bin2$p=10^(res.bin2$p/1000)
head(res.bin2)

class(res.bin2$chr)
class(res.bin2$bp)
class(res.bin2$snp)
class(res.bin2$p)

pdf(file=paste0(path,"figs/manhattan_strict_10kb_v3.pdf"),width=7,height=5)
manhattan(res.bin2, chr="chr", bp="bp", snp="snp", p="p",highlight = snpsOfInterest2,genomewideline=-log10(cutoff),suggestiveline=F)
dev.off()



which(res.bin2$p==min(res.bin2$p,na.rm=TRUE))
range(res.bin2$p,na.rm=TRUE)

max.bin.gr<-
  makeGRangesFromDataFrame(
    data.frame(
      chr="chr20",start=26200001,end=26200001+9999
    )
  )

names(genes.all.gr)[which(countOverlaps(genes.all.gr,max.bin.gr)>0)]


which(countOverlaps(imprinted.genes.gr,max.bin.gr)>0)

res.bin2$p
min()

min=min(res.bin2$p)
secondmin=min(res.bin2$p[res.bin2$p!=min(res.bin2$p)])

thirdmin=min(res.bin2$p[res.bin2$p!=min&res.bin2$p!=secondmin])

res.bin2[res.bin2$p==thirdmin,]
res.bin2[res.bin2$p==secondmin,]

second.bin=makeGRangesFromDataFrame(
  data.frame(
    chr="chr19",
    start=8740001,
    end=8750000
  )
)
imprinted.bin=makeGRangesFromDataFrame(
  data.frame(
    chr="chr20",
    start=58850001,
    end=58851000
  )
)

imprinted.genes.gr[countOverlaps(imprinted.genes.gr,imprinted.bin)>0]
genes.all.gr[countOverlaps(genes.all.gr,second.bin)>0]

max.bin.gr=makeGRangesFromDataFrame(data.frame(
  chr=res$chr[res$p==min(res$p)],
  start=res$bp[res$p==min(res$p)],
  end=res$bp[res$p==min(res$p)]))

imprinted.genes.gr

"MIR663AHG"


0.05/nrow(res.bin)

sum(res.bin2$p<cutoff)


nrow(res.bin)

-log10((0.05/nrow(res))/1000)



pdf(file=paste0(path,"figs/manhattan_10kb.pdf"),width=7,height=5)
manhattan(res.bin, chr="chr", bp="bp", snp="snp", p="p",highlight = snpsOfInterest2,genomewideline=(0.05/nrow(res))/1000,suggestiveline=F)
dev.off()


range(res.bin2$p)

sum(res.bin2$p<((0.05/nrow(res.bin2))))

res.bin=res

max.bin.gr=makeGRangesFromDataFrame(data.frame(
  chr=res$chr[res$p==min(res$p)],
  start=res$bp[res$p==min(res$p)],
  end=res$bp[res$p==min(res$p)]))

save(list=c("res.bin","max.bin.gr"),file=paste0(path,"results/max.bin.rda"))

max.B01.gr
max.B02.gr
max.B03.gr


dim(res)
length(bins.coverage)
range(res$p)
which(res$p<(0.05/nrow(res)))


length(bins.coverage[res$p<log10(0.05/nrow(res))])/length(bins.coverage)

seqlevels(max.main.gr)="chr20" # From asm_bothstrand_paired_v4.R
countOverlaps(max.main.gr,bins.coverage[res.bin$p<0.05/nrow(res)])>0

seqlevels(max.B01.gr)=paste0("chr",seqlevels(max.B01.gr))
seqlevels(max.B02.gr)=paste0("chr",seqlevels(max.B02.gr))
seqlevels(max.B03.gr)=paste0("chr",seqlevels(max.B03.gr))


res.main
res.main.gr=makeGRangesFromDataFrame(data.frame(
  chr=res.main$chr,
  start=res.main$bp,
  end=res.main$bp))
seqlevels(res.main.gr)=paste0("chr",seqlevels(res.main.gr))
seqlevels(res.main.gr)[23:24]=c("chrX","chrY")

countOverlaps(max.B01.gr,bins.coverage[res.bin$p==min(res.bin$p)])
countOverlaps(max.B02.gr,bins.coverage[res.bin$p==min(res.bin$p)])
countOverlaps(max.B03.gr,bins.coverage[res.bin$p==min(res.bin$p)])
countOverlaps(max.B04.gr,bins.coverage[res.bin$p==min(res.bin$p)])
countOverlaps(max.B05.gr,bins.coverage[res.bin$p==min(res.bin$p)])
countOverlaps(max.B06.gr,bins.coverage[res.bin$p==min(res.bin$p)])

countOverlaps(max.B01.gr,res.main.gr)>0
countOverlaps(bins.coverage[res.bin$p==min(res.bin$p)],res.main.gr)>0
countOverlaps(bins.coverage[res.bin$p==min(res.bin$p)],max.B01.gr)>0

range(res.bin$p)

sum(res.bin$p<log10(0.05/nrow(res)))


