library(BSgenome.Hsapiens.UCSC.hg38)
Hsapiens=BSgenome.Hsapiens.UCSC.hg38

seqlevels=seqlevels(Hsapiens)

for (i in 1:length(seqlevels)){
  print(i)
  assign(seqlevels[i],value=matchPattern("CCGG",Hsapiens[[i]]))
  try(
    gr<-makeGRangesFromDataFrame(
      data.frame(
        start=start(get(seqlevels[i])),
        end=end(get(seqlevels[i])),
        chr=rep(seqlevels[i],times=length(start))
      ))
  )
  assign(x=paste0(seqlevels[i],".gr"),value=gr)
}

gr=get(paste0(seqlevels[1],".gr"))
for (i in 2:length(seqlevels)){
  print(i)
  try(
    gr<-c(gr,get(paste0(seqlevels[i],".gr")))
  )
}
ccgg.gr=gr
ccgg.gr=ccgg.gr[order(ccgg.gr)]

# Here we are creating indices of all CCGGs except the first and last CCGG of each chromosome.
ind1.tmp=1:(length(ccgg.gr)-1)
ind2.tmp=2:length(ccgg.gr)
first.chr=which(!duplicated(as.character(seqnames(ccgg.gr))))
last.chr=which(!duplicated(as.character(seqnames(ccgg.gr)),fromLast=TRUE))
ind2=ind2.tmp[!ind2.tmp%in%first.chr] # 2nd element to last element (excluding first element of every chr)
ind1=ind1.tmp[!ind1.tmp%in%last.chr] # 1st element to 2nd to last element (excluding last element of every chr)

# Here we are making indices of all CCGGs that are greater than 1000 bp from the next CpG
ind1.1000<-ind1[(end(ccgg.gr)[ind2]-start(ccgg.gr)[ind1])>1000]
ind2.1000<-ind2[(end(ccgg.gr)[ind2]-start(ccgg.gr)[ind1])>1000]

# All the regions we want to remain unmasked. These regions have CCGGs at least every 1000 bp.
ccgg.regions1000.gr<-
  makeGRangesFromDataFrame(
    data.frame(
      chr=seqnames(ccgg.gr)[ind1.1000],
      start=start(ccgg.gr)[ind1.1000],
      end=end(ccgg.gr)[ind2.1000]
    )
  )

df <- data.frame(seqnames=seqnames(ccgg.regions1000.gr),
                 starts=start(ccgg.regions1000.gr)-1+4,
                 ends=end(ccgg.regions1000.gr)-4)

write.table(df, file="ccgg.regions1000.bed", quote=F, sep="\t", row.names=F, col.names=F)


