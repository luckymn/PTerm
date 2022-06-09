library("pheatmap") 

##load data contains profile for heatmap, each row represesnt a gene and each col represesnt a sample.
x <- read.table("file.txt",header=T,row.names=1)

k <- c(rep("Preterm",20),rep("Fullterm",20))
Group <- as.matrix(k,40,1)

k2 <- data.frame(Group)

rownames(k2) <- colnames(x)

annotation_colors =list(Group = c("Preterm"="#E18727FF","Fullterm" = "#20854EFF"))

pheatmap(x,color = colorRampPalette(rev(c("#BC3C29FF","#FFFFFF","#0072B5FF")))(100), cluster_row = TRUE, cluster_col = TRUE,show_rownames=F,show_colnames=F, scale="row",annotation=k2,annotation_colors = annotation_colors,cex=1,treeheight_col = 25,treeheight_row = 30)

