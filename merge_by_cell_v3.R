
# RUN THIS ON LINUX. DO NOT RUN ON WINDOWS! THE OUTPUT FILE WON'T WORK!

if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)
#path=c("C:/Users/User/Dropbox/projects/scrrbs_old/","/home/nick/Dropbox/projects/scrrbs_old/")[o];rm(o)

cov.names.B01=list.files(paste0("/home/nick/Dropbox/projects/scrrbs_old/data/cov_paired_B01_unmerged"))
cov.names.ALL=list.files(paste0("/home/nick/Dropbox/projects/scrrbs/data/cov_files_paired"))
cov.names=cov.names.B01[cov.names.B01%in%cov.names.ALL]

cov_sample_cell_B01=data.frame(cov.names,sample="B01",cell=NA,barcode1=NA,barcode2=NA)

b01.match=rbind(
  c("SRR6464059",	"AGGCAGAA"),
  c("SRR6464058",	"AGGCAGAA"),
  c("SRR6464057",	"TCCTGAGC"),
  c("SRR6464056",	"TCCTGAGC"),
  c("SRR6464055",	"TCCTGAGC"),
  c("SRR6464054",	"TCCTGAGC"),
  c("SRR6464053",	"TCCTGAGC"),
  c("SRR6464052",	"AGGCAGAA"),
  c("SRR6464051",	"TCCTGAGC"),
  c("SRR6464050",	"TAGGCATG"),
  c("SRR6464049",	"TAGGCATG"),
  c("SRR6464048",	"TAAGGCGA"),
  c("SRR6464047",	"TAAGGCGA"),
  c("SRR6464046",	"TAAGGCGA"),
  c("SRR6464045",	"TAAGGCGA"),
  c("SRR6464044",	"GGACTCCT"),
  c("SRR6464043",	'GGACTCCT'),
  c("SRR6464042",	"CGTACTAG"),
  c("SRR6464041",	'AGGCAGAA'),
  c("SRR6464064",	'CGTACTAG'),
  c("SRR6464063",	'CGTACTAG'),
  c("SRR6464062",	"CGTACTAG"),
  c("SRR6464061",	"AGGCAGAA"),
  c("SRR6464060",	"AGGCAGAA")
)

for (i in 1:nrow(b01.match)){
  print(i)
  cov_sample_cell_B01$barcode1[substr(cov_sample_cell_B01$cov.names,1,10)==b01.match[i,1]]<-b01.match[i,2]
}


factor_barcode=factor(paste0(substr(cov_sample_cell_B01$cov.names,12,17),"_",cov_sample_cell_B01$barcode1))
levels(factor_barcode)=1:length(levels(factor_barcode))
cov_sample_cell_B01$cell=factor_barcode

cov.names.B02=list.files(paste0("/home/nick/Dropbox/projects/scrrbs_old/data/cov_paired_B02_unmerged"))
cov.names.ALL=list.files(paste0("/home/nick/Dropbox/projects/scrrbs/data/cov_files_paired"))
cov.names=cov.names.B02[cov.names.B02%in%cov.names.ALL]

cov_sample_cell_B02=data.frame(cov.names,sample="B02",cell=NA,barcode1=NA,barcode2=NA)


b02.match=rbind(
  c('SRR6464082',	"CGAGGCTG"),
  c("SRR6464081",	"CGAGGCTG"),
  c("SRR6464088",	"TAAGGCGA"),
  c("SRR6464087",	"TAAGGCGA"),
  c("SRR6464086",	"GTAGAGGA"),
  c("SRR6464085",	"GTAGAGGA"),
  c("SRR6464084",	"CGTACTAG"),
  c("SRR6464083",	"CGTACTAG"),
  c("SRR6464076",	"CTCTCTAC"),
  c("SRR6464075",	"CAGAGAGG"),
  c("SRR6464074",	"CAGAGAGG"),
  c("SRR6464073",	"CAGAGAGG"),
  c("SRR6464072",	'TAGGCATG'),
  c('SRR6464071',	"TAGGCATG"),
  c('SRR6464070',	"TAGGCATG"),
  c('SRR6464069',	'TAGGCATG'),
  c('SRR6464068',	'GCTACGCT'),
  c("SRR6464067",	"GCTACGCT"),
  c("SRR6464066",	'GCTACGCT'),
  c('SRR6464065',	'CAGAGAGG'),
  c('SRR6464080',	'GCTACGCT'),
  c('SRR6464079',	'CTCTCTAC'),
  c("SRR6464078",	'CTCTCTAC'),
  c("SRR6464077",	'CTCTCTAC')
)


for (i in 1:nrow(b02.match)){
  print(i)
  cov_sample_cell_B02$barcode1[substr(cov_sample_cell_B02$cov.names,1,10)==b02.match[i,1]]<-b02.match[i,2]
}

factor_barcode=factor(paste0(substr(cov_sample_cell_B02$cov.names,12,17),"_",cov_sample_cell_B02$barcode1))
levels(factor_barcode)=1:length(levels(factor_barcode))
cov_sample_cell_B02$cell=factor_barcode

cov.names.B03=list.files(paste0("/home/nick/Dropbox/projects/scrrbs_old/data/cov_paired_B03_unmerged"))
cov.names.ALL=list.files(paste0("/home/nick/Dropbox/projects/scrrbs/data/cov_files_paired"))
cov.names=cov.names.B03[cov.names.B03%in%cov.names.ALL]

cov_sample_cell_B03=data.frame(cov.names,sample="B03",cell=NA,barcode1=NA,barcode2=NA)


b03.match=rbind(
  c("SRR6464090",	'AGGNAGAA'),
  c("SRR6464089",	'AGGCAGAA'),
  c("SRR6464096",	'TCCTGAGC'),
  c("SRR6464095",	'TCCTGAGC'),
  c("SRR6464094",	'TCCTGAGC'),
  c("SRR6464093",	"TCCTGAGC"),
  c("SRR6464092",	"AGGCAGAA"),
  c('SRR6464091',	"AGGCAGAA")
)

for (i in 1:nrow(b03.match)){
  print(i)
  cov_sample_cell_B03$barcode1[substr(cov_sample_cell_B03$cov.names,1,10)==b03.match[i,1]]<-b03.match[i,2]
}


factor_barcode=factor(paste0(substr(cov_sample_cell_B03$cov.names,12,17),"_",cov_sample_cell_B03$barcode1))
levels(factor_barcode)=1:length(levels(factor_barcode))
cov_sample_cell_B03$cell=factor_barcode


#########################################################################################################



# This script uses stuff from cov_to_small_B01B02B03.R

cellIDS=c(paste0("00",1:9),paste0("0",10:99),100:200)

in.names.tmp=substr(cov_sample_cell_B01$cov.names[cov_sample_cell_B01$cell==i],1,17)
in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
x.B01=paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.",cellIDS[i],".bam ",in.names)
x.B01=c("cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/notmerged",x.B01)

length(unique(cov_sample_cell_B01$cell))

for (i in 2:length(unique(cov_sample_cell_B01$cell))){
  print(i)
  in.names.tmp=substr(cov_sample_cell_B01$cov.names[cov_sample_cell_B01$cell==i],1,17)
  in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
  x.B01=c(x.B01,paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B01/merged_by_cell/B01.cell.",cellIDS[i],".bam ",in.names))
}

in.names.tmp=substr(cov_sample_cell_B02$cov.names[cov_sample_cell_B02$cell==i],1,17)
in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
x.B02=paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.",cellIDS[i],".bam ",in.names)
x.B02=c("cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/notmerged",x.B02)

for (i in 2:length(unique(cov_sample_cell_B02$cell))){
  print(i)
  in.names.tmp=substr(cov_sample_cell_B02$cov.names[cov_sample_cell_B02$cell==i],1,17)
  in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
  x.B02=c(x.B02,paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B02/merged_by_cell/B02.cell.",cellIDS[i],".bam ",in.names))
}

in.names.tmp=substr(cov_sample_cell_B03$cov.names[cov_sample_cell_B03$cell==i],1,17)
in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
x.B03=paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.",cellIDS[i],".bam ",in.names)
x.B03=c("cd /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/notmerged",x.B03)

for (i in 2:length(unique(cov_sample_cell_B03$cell))){
  print(i)
  in.names.tmp=substr(cov_sample_cell_B03$cov.names[cov_sample_cell_B03$cell==i],1,17)
  in.names=paste0(in.names.tmp,"sorted20.bam",collapse=" ")
  x.B03=c(x.B03,paste0("samtools merge -n /home/Shared/ConneelyLab/nick_method/scRRBS/sc_bam/B03/merged_by_cell/B03.cell.",cellIDS[i],".bam ",in.names))
}


x=c("#!/bin/bash","module load samtools/1.3",x.B01,x.B02,x.B03)

if(substr(getwd(),1,1)=="C"){o=1}else{o=2}
path=c("C:/Users/User/Dropbox/projects/scrrbs/","/home/nick/Dropbox/projects/scrrbs/")[o];rm(o)

write.table(x,quote=F,col.names=F,row.names=F,file=paste0(path,"code/hgcc_scripts/merge_by_cell_v3.sh"))


