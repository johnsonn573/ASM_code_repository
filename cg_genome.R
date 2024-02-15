citation("Biostrings")
# BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")
library(BSgenome.Hsapiens.UCSC.hg38)
Hsapiens=BSgenome.Hsapiens.UCSC.hg38

seqlevels=seqlevels(Hsapiens)

seqlevels<-seqlevels[1:24]

for (i in 1:length(seqlevels)){
  print(i)
  assign(seqlevels[i],value=matchPattern("CG",Hsapiens[[i]]))
  gr<-makeGRangesFromDataFrame(
    data.frame(
      start=start(get(seqlevels[i])),
      end=end(get(seqlevels[i])),
      chr=rep(seqlevels[i],times=length(start))
    ))
  assign(x=paste0(seqlevels[i],".gr"),value=gr)
}

gr=get(paste0(seqlevels[1],".gr"))

for (i in 2:length(seqlevels)){
  print(i)
  gr=c(gr,get(paste0(seqlevels[i],".gr")))
}

cg_genome38.gr=gr

save(cg_genome38.gr,file="cg_genome38.rda")

