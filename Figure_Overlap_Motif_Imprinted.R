
load("C:/Users/User/Dropbox/projects/scrrbs/data/df.ggplot.motif.rda")
load("C:/Users/User/Dropbox/projects/scrrbs/data/df.ggplot.imprintedgene.rda")

df.ggplot.imprintedgene
df.ggplot.motif

df.ggplot<-rbind(df.ggplot.imprintedgene,df.ggplot.motif)


df.ggplot

df.ggplot.B<-df.ggplot[df.ggplot$Tissue=="B-cell",]
df.ggplot.B$Type<-c("Imprinted?","Imprinted?","Motif?","Motif?")
df.ggplot.B$Overlap<-c("No","Yes","No","Yes")
ggplot(data=df.ggplot.B, aes(x=Type, y=proportion,fill=Overlap)) +
  geom_bar(stat="identity",position="dodge")+ylab("Proportion Overlapping ASM")+xlab("")+
  scale_fill_manual(values=c("green3","green4"))+
  geom_errorbar(aes(ymin=proportion-CI, ymax=proportion+CI), width=.2,
                position=position_dodge(.9))  + ylim(0,0.75) + theme(legend.position = "none")
ggsave(filename = "C:/Users/User/Dropbox/projects/scrrbs/figs/Overlap_Motif_Imprinted_B.tiff", width = 5, height = 3.5, device='tiff', dpi=700)

df.ggplot.CLL<-df.ggplot[df.ggplot$Tissue=="CLL",]
df.ggplot.CLL$Type<-c("Imprinted?","Imprinted?","Motif?","Motif?")
df.ggplot.CLL$Overlap<-c("No","Yes","No","Yes")

ggplot(data=df.ggplot.CLL, aes(x=Type, y=proportion,fill=Overlap)) +
  geom_bar(stat="identity",position="dodge")+ylab("Proportion Overlapping ASM")+xlab("")+
  scale_fill_manual(values=c("darkgoldenrod2","darkgoldenrod4"))+
  geom_errorbar(aes(ymin=proportion-CI, ymax=proportion+CI), width=.2,
                position=position_dodge(.9))  + ylim(0,0.75) + theme(legend.position = "none")
ggsave(filename = "C:/Users/User/Dropbox/projects/scrrbs/figs/Overlap_Motif_Imprinted_CLL.tiff", width = 5, height = 3.5, device='tiff', dpi=700)
