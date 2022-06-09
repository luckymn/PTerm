library(ggplot2)

##loaddata, the data contains 4 cols, including,Gene,LF,LP,Type 
data =read.table("file.txt",header=T,row.names=1,sep="\t")

p <- ggplot(data,aes(LF,LP,color=Type,size=0.4))+geom_point()+
   xlim(-2,2) +  labs(x="log2(FoldChange)",y="-log10(FDR)")
p <- p + scale_color_manual(values =c("#0072B5","grey","#BC3C28"))
p <- p +theme(panel.grid =element_blank())+
    theme(axis.line = element_line(size=0))+
	ylim(0,4)
p <- p + geom_hline(aes(yintercept=-log(0.05,10)),colour="grey",linetype="dashed",size=1)+geom_vline(aes(xintercept=1),colour="grey",linetype="dashed",size=1)+geom_vline(aes(xintercept=-1),colour="grey",linetype="dashed",size=1)
p <- p +theme(axis.text=element_text(size=20),axis.title=element_text(size=20))
