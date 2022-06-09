library("ggord")
library("ggplot2")

pca_group=factor(c(rep('Preterm',20),rep('Fullterm',20)))

pca1=prcomp(y,center=TRUE,retx=T,scale=TRUE)

p1 <- ggord(pca1, grp_in = pca_group, arrow=0, vec_ext =0,txt=NULL,col=c("#20854EFF","#E18727FF"),xlims=c(-15,15),ylims=c(-15,15),polylntyp = pca_group, ptslab = TRUE,size = 4.5)

p2 <- p1+theme(panel.grid=element_blank(),axis.text.x=element_text(size=15),axis.text.y=element_text(size=15))+ geom_hline(aes(yintercept=0),colour="grey",linetype="dashed",size=1)+geom_vline(aes(xintercept=0),colour="grey",linetype="dashed",size=1)
