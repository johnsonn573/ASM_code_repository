
# RUN THIS ON LINUX. DO NOT RUN ON WINDOWS! THE OUTPUT FILE WON'T WORK!
# This code does something but it is not used for anything.
# Fixing the numbering. Went from 1 to 92 then skipped to 100.

if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)
path=c("C:/Users/User/Dropbox/projects/scrrbs_old/","/home/nick/Dropbox/projects/scrrbs_old/")[o];rm(o)

# These matches are found on GEO
# https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&page_size=10&acc=SRR6463911&display=reads
CLL01.match=rbind(
  c("SRR6463911","CAGAGAGG"),
  c("SRR6463912","CTCTCTAC"),
  c("SRR6463913","TAAGGCGA"),
  c("SRR6463914","TAAGGCGA"),
  c("SRR6463915","TAGGCATG"),
  c("SRR6463916","TAGGCATG"),
  c("SRR6463917","TAGGCATG"),
  c("SRR6463918","TAGGCATG"),
  c("SRR6463919","CAGAGAGG"),
  c("SRR6463920","CAGAGAGG"),
  c("SRR6463921","CAGAGAGG"),
  c("SRR6463922","CGTACTAG"),
  c("SRR6463923","CGTACTAG"),
  c("SRR6463924","CTCTCTAC"),
  c("SRR6463925","CTCTCTAC"),
  c("SRR6463926","CTCTCTAC"),
  c("SRR6463927","CGTACTAG")
)
CLL01.match<-data.frame(CLL01.match)

bam.names.CLL01<-read.csv(file="/home/nick/Dropbox/projects/scrrbs/CLL01_bam_names.txt")[,1]

SRR.cell.match.CLL01<-data.frame(bam.names.CLL01)
SRR.cell.match.CLL01$SRR<-substr(SRR.cell.match.CLL01$bam.names.CLL01,1,10)
SRR.cell.match.CLL01$barcode1<-substr(SRR.cell.match.CLL01$bam.names.CLL01,12,17)
SRR.cell.match.CLL01$barcode.match<-NA

for(i in 1:nrow(CLL01.match)){
  SRR.cell.match.CLL01$barcode.match[SRR.cell.match.CLL01$SRR%in%CLL01.match$X1[i]]<-CLL01.match$X2[i]
}

SRR.cell.match.CLL01$cellids<-paste0(SRR.cell.match.CLL01$barcode1,".",SRR.cell.match.CLL01$barcode.match)

cellids<-unique(paste0(SRR.cell.match.CLL01$barcode1,".",SRR.cell.match.CLL01$barcode.match))
cell.numbers<-
c(
  paste0("00",1:9),
  paste0("0",10:99),
  100:120)
df.CLL01.cellids<-data.frame(cellids,cell.numbers=paste0("CLL01.",cell.numbers))

i=1
in.names.tmp=SRR.cell.match.CLL01$bam.names.CLL01[SRR.cell.match.CLL01$cellids%in%df.CLL01.cellids$cellids[i]]
in.names<-paste0(in.names.tmp,collapse=" ")
x.CLL01=paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL01/merged_by_cell/",df.CLL01.cellids$cell.numbers[i],".bam ",in.names)
x.CLL01=c("cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL01/notmerged",x.CLL01)

for (i in 2:nrow(df.CLL01.cellids)){
  print(i)
  in.names.tmp=SRR.cell.match.CLL01$bam.names.CLL01[SRR.cell.match.CLL01$cellids%in%df.CLL01.cellids$cellids[i]]
  in.names<-paste0(in.names.tmp,collapse=" ")
  x.CLL01=c(x.CLL01,paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL01/merged_by_cell/",df.CLL01.cellids$cell.numbers[i],".bam ",in.names))
}

###########################################################################################

CLL02.match=rbind(
  c("SRR6463927","CGTACTAG"),
  c("SRR6463928","CGTACTAG"),
  c("SRR6463929","CGTACTAG"),
  c("SRR6463930","CGTACTAG"),
  c("SRR6463931","TAAGGCGA"),
  c("SRR6463932","TAAGGCGA"),
  c("SRR6463933","TAAGGCGA"),
  c("SRR6463934","TAAGGCGA")
)

CLL02.match<-data.frame(CLL02.match)

bam.names.CLL02<-read.csv(file="/home/nick/Dropbox/projects/scrrbs/CLL02_bam_names.txt")[,1]

SRR.cell.match.CLL02<-data.frame(bam.names.CLL02)
SRR.cell.match.CLL02$SRR<-substr(SRR.cell.match.CLL02$bam.names.CLL02,1,10)
SRR.cell.match.CLL02$barcode1<-substr(SRR.cell.match.CLL02$bam.names.CLL02,12,17)
SRR.cell.match.CLL02$barcode.match<-NA

for(i in 1:nrow(CLL02.match)){
  SRR.cell.match.CLL02$barcode.match[SRR.cell.match.CLL02$SRR%in%CLL02.match$X1[i]]<-CLL02.match$X2[i]
}

SRR.cell.match.CLL02$cellids<-paste0(SRR.cell.match.CLL02$barcode1,".",SRR.cell.match.CLL02$barcode.match)

cellids<-unique(paste0(SRR.cell.match.CLL02$barcode1,".",SRR.cell.match.CLL02$barcode.match))
cell.numbers<-
  c(
    paste0("00",1:9),
    paste0("0",10:48))
df.CLL02.cellids<-data.frame(cellids,cell.numbers=paste0("CLL02.",cell.numbers))

i=1
in.names.tmp=SRR.cell.match.CLL02$bam.names.CLL02[SRR.cell.match.CLL02$cellids%in%df.CLL02.cellids$cellids[i]]
in.names<-paste0(in.names.tmp,collapse=" ")
x.CLL02=paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL02/merged_by_cell/",df.CLL02.cellids$cell.numbers[i],".bam ",in.names)
x.CLL02=c("cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL02/notmerged",x.CLL02)

for (i in 2:nrow(df.CLL02.cellids)){
  print(i)
  in.names.tmp=SRR.cell.match.CLL02$bam.names.CLL02[SRR.cell.match.CLL02$cellids%in%df.CLL02.cellids$cellids[i]]
  in.names<-paste0(in.names.tmp,collapse=" ")
  x.CLL02=c(x.CLL02,paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/CLL02/merged_by_cell/",df.CLL02.cellids$cell.numbers[i],".bam ",in.names))
}

x=c("#!/bin/bash","module load samtools/1.3",x.CLL01,x.CLL02)

if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

write.table(x,quote=F,col.names=F,row.names=F,file=paste0(path,"code/hgcc_scripts/merge_by_cell_CLL.sh"))


