##########GO##############
library(DOSE)
library(org.Hs.eg.db)
library(topGO)
library(clusterProfiler)
library(pathview)
library(ggplot2)
library(tidyverse)

########loaddata, contains
pathway = read.table("GOData.txt",header=TRUE,row.names=1,sep="\t")  

p = ggplot(pathway,aes(x=Ratio,Pathway))
p=p + geom_point()  

p=p + geom_point(aes(size=Number))

pbubble = p+ geom_point(aes(size=Number,color=Pvalue))

pr = pbubble+scale_color_gradient(low="red",high = "blue")

pr = pr + theme_bw()

####################KEGG####
###load_data, file contains gene symbol.
data =read.table("file.txt",header=F,sep="\t")

test1 = bitr(data[,1], fromType="SYMBOL", toType=c("ENSEMBL", "ENTREZID"), OrgDb="org.Hs.eg.db")

m <- enrichKEGG(test1$ENTREZID, organism ="hsa", keyType = "kegg", pvalueCutoff = 0.2,pAdjustMethod = "fdr", minGSSize = 10, maxGSSize = 500,qvalueCutoff = 0.2, use_internal_data = FALSE)

dotplot(m,orderBy = "x")
