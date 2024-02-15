if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)


# 02/01/2021

# Here, we are trying to find a sequence in the genome.
# Specifically, we are trying to find the imprinting binding motif.
# TGCCGC
citation("Biostrings")
# BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")
library(BSgenome.Hsapiens.UCSC.hg38)
Hsapiens=BSgenome.Hsapiens.UCSC.hg38

chr.names=paste0("chr",c(1:22,"X","Y"))
chr1=matchPattern("TGCCGC", Hsapiens$chr1)
chr2=matchPattern("TGCCGC", Hsapiens$chr2)
chr3=matchPattern("TGCCGC", Hsapiens$chr3)
chr4=matchPattern("TGCCGC", Hsapiens$chr4)
chr5=matchPattern("TGCCGC", Hsapiens$chr5)
chr6=matchPattern("TGCCGC", Hsapiens$chr6)
chr7=matchPattern("TGCCGC", Hsapiens$chr7)
chr8=matchPattern("TGCCGC", Hsapiens$chr8)
chr9=matchPattern("TGCCGC", Hsapiens$chr9)
chr10=matchPattern("TGCCGC", Hsapiens$chr10)
chr11=matchPattern("TGCCGC", Hsapiens$chr11)
chr12=matchPattern("TGCCGC", Hsapiens$chr12)
chr13=matchPattern("TGCCGC", Hsapiens$chr13)
chr14=matchPattern("TGCCGC", Hsapiens$chr14)
chr15=matchPattern("TGCCGC", Hsapiens$chr15)
chr16=matchPattern("TGCCGC", Hsapiens$chr16)
chr17=matchPattern("TGCCGC", Hsapiens$chr17)
chr18=matchPattern("TGCCGC", Hsapiens$chr18)
chr19=matchPattern("TGCCGC", Hsapiens$chr19)
chr20=matchPattern("TGCCGC", Hsapiens$chr20)
chr21=matchPattern("TGCCGC", Hsapiens$chr21)
chr22=matchPattern("TGCCGC", Hsapiens$chr22)
chrX=matchPattern("TGCCGC", Hsapiens$chrX)
chrY=matchPattern("TGCCGC", Hsapiens$chrY)

for (i in 1:24){
  print(i)
  chr=get(chr.names[i])
  len=length(start(chr))
  df=data.frame(chr=rep(chr.names[i],times=len),start=start(chr),end=end(chr))
  assign(x=paste0(chr.names[i],".gr"),value=makeGRangesFromDataFrame(df))
}

motif.gr=c(chr1.gr,chr2.gr,chr3.gr,chr4.gr,chr5.gr,chr6.gr,chr7.gr,chr8.gr,chr9.gr,
           chr10.gr,chr11.gr,chr12.gr,chr13.gr,chr14.gr,chr15.gr,chr16.gr,chr17.gr,
           chr18.gr,chr19.gr,chr20.gr,chr21.gr,chr22.gr,chrX.gr,chrY.gr)

save(motif.gr,file=paste0(path,"annot/motif.rda"))


