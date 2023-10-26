library(data.table)
library(Gviz)
library(GenomicFeatures)
#setwd("C:/Users/depledgd/Dropbox/HSV-1/Luis&Esteban/")
setwd("I:/Dropbox/HSV-1/Luis&Esteban/")

myChr = "HSV1-Kos"
myStart = 1 #1
myEnd = 152000 #152000

### READ IN GENE MODELS & ASSOCIATED TRACKS 
gtrack<-GenomeAxisTrack(col="black") ##Adds genome axis
modelsPos<-makeTxDbFromGFF("../HSV1-KOS/annotation/HSV1-Kos-forward-v1.2.gff3")
modelsNeg<-makeTxDbFromGFF("../HSV1-KOS/annotation/HSV1-Kos-reverse-v1.2.gff3")
rtrackFor <- GeneRegionTrack(modelsPos, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense
rtrackRev <- GeneRegionTrack(modelsNeg, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense

gc <- fread('../HSV1-KOS/annotation/HSV1-Kos.fasta.gc_content.txt', col.names = c('chromosome', 'start', 'end', 'value'))
dataTrackGC <- DataTrack(range = gc, type = "l", chromosome=myChr, genome = 'HSV1', baseline = c(0,0.5,1), col.baseline = "black", fill = "blue3", col = "blue3", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,1))

regions<-read.table("../HSV1-KOS/annotation/Kos.genome.txt", header=T, sep="\t")
rtrackRegions <- GeneRegionTrack(regions, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", shape="box", background.title = "transparent")   # stacking="dense"


### READ IN DEPTH.FIXED.BEDs & PERFORM NORMALIZATION
file1 <- fread('./DepthBeds/LS5.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file2 <- fread('./DepthBeds/LS6.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file3 <- fread('./DepthBeds/LS7.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file4 <- fread('./DepthBeds/LS8.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))

file5 <- fread('./DepthBeds/LS69.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file6 <- fread('./DepthBeds/LS70.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file7 <- fread('./DepthBeds/LS71.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file8 <- fread('./DepthBeds/LS72.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))

file9 <- fread('./DepthBeds/LS37.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file10 <- fread('./DepthBeds/LS38.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file11 <- fread('./DepthBeds/LS39.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file12 <- fread('./DepthBeds/LS40.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))

file13 <- fread('./DepthBeds/LS53.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file14 <- fread('./DepthBeds/LS54.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file15 <- fread('./DepthBeds/LS55.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file16 <- fread('./DepthBeds/LS56.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))




### Process FLAG files
# CTRL BioRep #1
FLAG_rep1<-merge(file1,file3,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","Flag_noIP"))
FLAG_rep1$div <-FLAG_rep1$valueFlag_IP / FLAG_rep1$valueFlag_noIP
FLAG_rep1$log2 <-log(FLAG_rep1$div,2)
FLAG_rep1_final=subset(FLAG_rep1,select = -c(3:6))
FLAG_rep1_final<-FLAG_rep1_final[,c(2,1,1,3)]
colnames(FLAG_rep1_final)<-c("chromosome", "start", "end", "value")
# CTRL BioRep #2
FLAG_rep2<-merge(file5,file7,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","Flag_noIP"))
FLAG_rep2$div <-FLAG_rep2$valueFlag_IP / FLAG_rep2$valueFlag_noIP
FLAG_rep2$log2 <-log(FLAG_rep2$div,2)
FLAG_rep2_final=subset(FLAG_rep2,select = -c(3:6))
FLAG_rep2_final<-FLAG_rep2_final[,c(2,1,1,3)]
colnames(FLAG_rep2_final)<-c("chromosome", "start", "end", "value")
# CHX BioRep #1
FLAG_rep1_chx<-merge(file9,file11,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","Flag_noIP"))
FLAG_rep1_chx$div <-FLAG_rep1_chx$valueFlag_IP / FLAG_rep1_chx$valueFlag_noIP
FLAG_rep1_chx$log2 <-log(FLAG_rep1_chx$div,2)
FLAG_rep1_chx_final=subset(FLAG_rep1_chx,select = -c(3:6))
FLAG_rep1_chx_final<-FLAG_rep1_chx_final[,c(2,1,1,3)]
colnames(FLAG_rep1_chx_final)<-c("chromosome", "start", "end", "value")
# CHX BioRep #2
FLAG_rep2_chx<-merge(file13,file15,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","Flag_noIP"))
FLAG_rep2_chx$div <-FLAG_rep2_chx$valueFlag_IP / FLAG_rep2_chx$valueFlag_noIP
FLAG_rep2_chx$log2 <-log(FLAG_rep2_chx$div,2)
FLAG_rep2_chx_final=subset(FLAG_rep2_chx,select = -c(3:6))
FLAG_rep2_chx_final<-FLAG_rep2_chx_final[,c(2,1,1,3)]
colnames(FLAG_rep2_chx_final)<-c("chromosome", "start", "end", "value")

### Process H2B files
# CTRL BioRep #1
H2B_rep1<-merge(file2,file4,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","H2B_noIP"))
H2B_rep1$div <-H2B_rep1$valueH2B_IP / H2B_rep1$valueH2B_noIP
H2B_rep1$log2 <-log(H2B_rep1$div,2)
H2B_rep1_final=subset(H2B_rep1,select = -c(3:6))
H2B_rep1_final<-H2B_rep1_final[,c(2,1,1,3)]
colnames(H2B_rep1_final)<-c("chromosome", "start", "end", "value")
# CTRL BioRep #2
H2B_rep2<-merge(file6,file8,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","H2B_noIP"))
H2B_rep2$div <-H2B_rep2$valueH2B_IP / H2B_rep2$valueH2B_noIP
H2B_rep2$log2 <-log(H2B_rep2$div,2)
H2B_rep2_final=subset(H2B_rep2,select = -c(3:6))
H2B_rep2_final<-H2B_rep2_final[,c(2,1,1,3)]
colnames(H2B_rep2_final)<-c("chromosome", "start", "end", "value")
# CHX BioRep #2
H2B_rep1_chx<-merge(file10,file12,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","H2B_noIP"))
H2B_rep1_chx$div <-H2B_rep1_chx$valueH2B_IP / H2B_rep1_chx$valueH2B_noIP
H2B_rep1_chx$log2 <-log(H2B_rep1_chx$div,2)
H2B_rep1_chx_final=subset(H2B_rep1_chx,select = -c(3:6))
H2B_rep1_chx_final<-H2B_rep1_chx_final[,c(2,1,1,3)]
colnames(H2B_rep1_chx_final)<-c("chromosome", "start", "end", "value")
# CHX BioRep #1
H2B_rep2_chx<-merge(file14,file16,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","H2B_noIP"))
H2B_rep2_chx$div <-H2B_rep2_chx$valueH2B_IP / H2B_rep2_chx$valueH2B_noIP
H2B_rep2_chx$log2 <-log(H2B_rep2_chx$div,2)
H2B_rep2_chx_final=subset(H2B_rep2_chx,select = -c(3:6))
H2B_rep2_chx_final<-H2B_rep2_chx_final[,c(2,1,1,3)]
colnames(H2B_rep2_chx_final)<-c("chromosome", "start", "end", "value")


### CONVERT TO DATATRACKS
dataTrack1 <- DataTrack(range = FLAG_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#FFBE6A", col = "#FFBE6A", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack2 <- DataTrack(range = FLAG_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#FFBE6A", col = "#FFBE6A", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack3 <- DataTrack(range = FLAG_rep1_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#40B0A6", col = "#40B0A6", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack4 <- DataTrack(range = FLAG_rep2_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#40B0A6", col = "#40B0A6", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack5 <- DataTrack(range = H2B_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1AFF1A", col = "#1AFF1A", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack6 <- DataTrack(range = H2B_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1AFF1A", col = "#1AFF1A", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack7 <- DataTrack(range = H2B_rep1_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#4B0092", col = "#4B0092", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack8 <- DataTrack(range = H2B_rep2_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#4B0092", col = "#4B0092", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))


### INTERMEDIATE PLOTTING

### FLAG bioreps
#pdf(file = "H2A-FlagBioreps.pdf", width = 10, height = 5)
#plotTracks(list(dataTrack1,dataTrack2,dataTrack3,dataTrack4,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
#dev.off()

### H2B bioreps
#pdf(file = "H2A-H2BBioreps.pdf", width = 10, height = 5)
#plotTracks(list(dataTrack5,dataTrack6,dataTrack7,dataTrack8,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
#dev.off()

### Biorep #1
#pdf(file = "H2A-Flag&H2B-Biorep1.pdf", width = 10, height = 5)
#plotTracks(list(dataTrack1,dataTrack3,dataTrack5,dataTrack7,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
#dev.off()

### Biorep #2
pdf(file = "H2A-Flag&H2B-Biorep2.pdf", width = 10, height = 5)
plotTracks(list(dataTrack2,dataTrack4,dataTrack6,dataTrack8,rtrackRegions,rtrackFor,gtrack,rtrackRev), from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

### FINAL PROCESSING (Full normalization)
Norm_rep1<-merge(FLAG_rep1,H2B_rep1,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
Norm_rep1$divFull <-Norm_rep1$divFlag / Norm_rep1$divH2B
Norm_rep1$log2 <-log(Norm_rep1$divFull,2)
Norm_rep1_final=subset(Norm_rep1,select = c(1:2,15))
Norm_rep1_final<-Norm_rep1_final[,c(2,1,1,3)]
colnames(Norm_rep1_final)<-c("chromosome", "start", "end", "value")

Norm_rep2<-merge(FLAG_rep2,H2B_rep2,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
Norm_rep2$divFull <-Norm_rep2$divFlag / Norm_rep2$divH2B
Norm_rep2$log2 <-log(Norm_rep2$divFull,2)
Norm_rep2_final=subset(Norm_rep2,select = c(1:2,15))
Norm_rep2_final<-Norm_rep2_final[,c(2,1,1,3)]
colnames(Norm_rep2_final)<-c("chromosome", "start", "end", "value")

Norm_rep1_chx<-merge(FLAG_rep1_chx,H2B_rep1_chx,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
Norm_rep1_chx$divFull <-Norm_rep1_chx$divFlag / Norm_rep1_chx$divH2B
Norm_rep1_chx$log2 <-log(Norm_rep1_chx$divFull,2)
Norm_rep1_chx_final=subset(Norm_rep1_chx,select = c(1:2,15))
Norm_rep1_chx_final<-Norm_rep1_chx_final[,c(2,1,1,3)]
colnames(Norm_rep1_chx_final)<-c("chromosome", "start", "end", "value")

Norm_rep2_chx<-merge(FLAG_rep2_chx,H2B_rep2_chx,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
Norm_rep2_chx$divFull <-Norm_rep2_chx$divFlag / Norm_rep2_chx$divH2B
Norm_rep2_chx$log2 <-log(Norm_rep2_chx$divFull,2)
Norm_rep2_chx_final=subset(Norm_rep2_chx,select = c(1:2,15))
Norm_rep2_chx_final<-Norm_rep2_chx_final[,c(2,1,1,3)]
colnames(Norm_rep2_chx_final)<-c("chromosome", "start", "end", "value")

### CONVERT TO DATATRACKS
dataTrack9 <- DataTrack(range = Norm_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1A85E1", col = "#1A85E1", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack10 <- DataTrack(range = Norm_rep1_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#D41159", col = "#D41159", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack11 <- DataTrack(range = Norm_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1A85E1", col = "#1A85E1", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack12 <- DataTrack(range = Norm_rep2_chx_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#D41159", col = "#D41159", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))


### GENERATE FINAL PLOT
pdf(file = "H2A-Final-Biorep1.pdf", width = 10, height = 5)
plotTracks(list(dataTrack9,dataTrack10,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.4,0.4,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

pdf(file = "H2A-Final-Biorep2.pdf", width = 10, height = 5)
plotTracks(list(dataTrack11,dataTrack12,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.4,0.4,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

pdf(file = "H2A-Final-BothBioReps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack9,dataTrack11,dataTrack10,dataTrack12,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()






