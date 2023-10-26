library(data.table)
library(Gviz)
library(GenomicFeatures)

setwd("set/working/directory")

myChr = "HSV1-Kos"
myStart = 1 #1
myEnd = 152000 #152000

### READ IN GENE MODELS & ASSOCIATED TRACKS 
gtrack<-GenomeAxisTrack(col="black") ##Adds genome axis
modelsPos<-makeTxDbFromGFF("../annotation/HSV1-Kos-forward-v1.2.gff3")
modelsNeg<-makeTxDbFromGFF("../annotation/HSV1-Kos-reverse-v1.2.gff3")
rtrackFor <- GeneRegionTrack(modelsPos, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense
rtrackRev <- GeneRegionTrack(modelsNeg, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", stacking="squish", shape="smallArrow", background.title = "transparent", options(ucscChromosomeNames=FALSE)) #squish #dense

gc <- fread('..//annotation/HSV1-Kos.fasta.gc_content.txt', col.names = c('chromosome', 'start', 'end', 'value'))
dataTrackGC <- DataTrack(range = gc, type = "l", chromosome=myChr, genome = 'HSV1', baseline = c(0,0.5,1), col.baseline = "black", fill = "blue3", col = "blue3", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(0,1))

regions<-read.table("../annotation/Kos.genome.txt", header=T, sep="\t")
rtrackRegions <- GeneRegionTrack(regions, genome = "HSV1", chromosome = myChr, name = "Gene Model", col="black", fill="grey", shape="box", background.title = "transparent")   # stacking="dense"

### READ IN DEPTH.FIXED.BEDs & PERFORM NORMALIZATION
#BIOREP1
file1 <- fread('../DepthBeds/LS105.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file2 <- fread('../DepthBeds/LS106.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file3 <- fread('../DepthBeds/LS107.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file4 <- fread('../DepthBeds/LS108.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file5 <- fread('../DepthBeds/LS109.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file6 <- fread('../DepthBeds/LS110.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file7 <- fread('../DepthBeds/LS111.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file8 <- fread('../DepthBeds/LS112.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file9 <- fread('../DepthBeds/LS113.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file10 <- fread('../DepthBeds/LS114.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file11 <- fread('../DepthBeds/LS115.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file12 <- fread('../DepthBeds/LS116.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
#BIOREP2
file13 <- fread('../DepthBeds/LS153.HSV1-Kos-X1000.Filtered.12k.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file14 <- fread('../DepthBeds/LS154.HSV1-Kos-X1000.Filtered.12k.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file15 <- fread('../DepthBeds/LS155.HSV1-Kos-X1000.Filtered.12k.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file16 <- fread('../DepthBeds/LS156.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file17 <- fread('../DepthBeds/LS157.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file18 <- fread('../DepthBeds/LS158.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file19 <- fread('../DepthBeds/LS159.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file20 <- fread('../DepthBeds/LS160.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file21 <- fread('../DepthBeds/LS161.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file22 <- fread('../DepthBeds/LS162.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file23 <- fread('../DepthBeds/LS163.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))
file24 <- fread('../DepthBeds/LS164.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed', col.names = c('chromosome', 'pos', 'value'))

### PROCESS INPUT FILES
# INPUT FLAG BioRep #1
INPUT_FLAG_rep1<-merge(file1,file3,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
INPUT_FLAG_rep1$div <-INPUT_FLAG_rep1$valueFlag_IP / INPUT_FLAG_rep1$value_noIP
INPUT_FLAG_rep1$log2 <-log(INPUT_FLAG_rep1$div,2)
INPUT_FLAG_rep1_final=subset(INPUT_FLAG_rep1,select = -c(3:6))
INPUT_FLAG_rep1_final<-INPUT_FLAG_rep1_final[,c(2,1,1,3)]
colnames(INPUT_FLAG_rep1_final)<-c("chromosome", "start", "end", "value")
# INPUT FLAG BioRep #2
INPUT_FLAG_rep2<-merge(file13,file15,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
INPUT_FLAG_rep2$div <-INPUT_FLAG_rep2$valueFlag_IP / INPUT_FLAG_rep2$value_noIP
INPUT_FLAG_rep2$log2 <-log(INPUT_FLAG_rep2$div,2)
INPUT_FLAG_rep2_final=subset(INPUT_FLAG_rep2,select = -c(3:6))
INPUT_FLAG_rep2_final<-INPUT_FLAG_rep2_final[,c(2,1,1,3)]
colnames(INPUT_FLAG_rep2_final)<-c("chromosome", "start", "end", "value")
# INPUT H2B BioRep #1
INPUT_H2B_rep1<-merge(file2,file3,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
INPUT_H2B_rep1$div <-INPUT_H2B_rep1$valueH2B_IP / INPUT_H2B_rep1$value_noIP
INPUT_H2B_rep1$log2 <-log(INPUT_H2B_rep1$div,2)
INPUT_H2B_rep1_final=subset(INPUT_H2B_rep1,select = -c(3:6))
INPUT_H2B_rep1_final<-INPUT_H2B_rep1_final[,c(2,1,1,3)]
colnames(INPUT_H2B_rep1_final)<-c("chromosome", "start", "end", "value")
# INPUT H2B BioRep #2
INPUT_H2B_rep2<-merge(file14,file15,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
INPUT_H2B_rep2$div <-INPUT_H2B_rep2$valueH2B_IP / INPUT_H2B_rep2$value_noIP
INPUT_H2B_rep2$log2 <-log(INPUT_H2B_rep2$div,2)
INPUT_H2B_rep2_final=subset(INPUT_H2B_rep2,select = -c(3:6))
INPUT_H2B_rep2_final<-INPUT_H2B_rep2_final[,c(2,1,1,3)]
colnames(INPUT_H2B_rep2_final)<-c("chromosome", "start", "end", "value")

### PROCESS LONG FILES
# LONG FLAG BioRep #1
LONG_FLAG_rep1<-merge(file4,file6,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
LONG_FLAG_rep1$div <-LONG_FLAG_rep1$valueFlag_IP / LONG_FLAG_rep1$value_noIP
LONG_FLAG_rep1$log2 <-log(LONG_FLAG_rep1$div,2)
LONG_FLAG_rep1_final=subset(LONG_FLAG_rep1,select = -c(3:6))
LONG_FLAG_rep1_final<-LONG_FLAG_rep1_final[,c(2,1,1,3)]
colnames(LONG_FLAG_rep1_final)<-c("chromosome", "start", "end", "value")
# LONG FLAG BioRep #2
LONG_FLAG_rep2<-merge(file16,file18,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
LONG_FLAG_rep2$div <-LONG_FLAG_rep2$valueFlag_IP / LONG_FLAG_rep2$value_noIP
LONG_FLAG_rep2$log2 <-log(LONG_FLAG_rep2$div,2)
LONG_FLAG_rep2_final=subset(LONG_FLAG_rep2,select = -c(3:6))
LONG_FLAG_rep2_final<-LONG_FLAG_rep2_final[,c(2,1,1,3)]
colnames(LONG_FLAG_rep2_final)<-c("chromosome", "start", "end", "value")
# LONG H2B BioRep #1
LONG_H2B_rep1<-merge(file5,file6,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
LONG_H2B_rep1$div <-LONG_H2B_rep1$valueH2B_IP / LONG_H2B_rep1$value_noIP
LONG_H2B_rep1$log2 <-log(LONG_H2B_rep1$div,2)
LONG_H2B_rep1_final=subset(LONG_H2B_rep1,select = -c(3:6))
LONG_H2B_rep1_final<-LONG_H2B_rep1_final[,c(2,1,1,3)]
colnames(LONG_H2B_rep1_final)<-c("chromosome", "start", "end", "value")
# LONG H2B BioRep #2
LONG_H2B_rep2<-merge(file17,file18,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
LONG_H2B_rep2$div <-LONG_H2B_rep2$valueH2B_IP / LONG_H2B_rep2$value_noIP
LONG_H2B_rep2$log2 <-log(LONG_H2B_rep2$div,2)
LONG_H2B_rep2_final=subset(LONG_H2B_rep2,select = -c(3:6))
LONG_H2B_rep2_final<-LONG_H2B_rep2_final[,c(2,1,1,3)]
colnames(LONG_H2B_rep2_final)<-c("chromosome", "start", "end", "value")

### PROCESS PELLET FILES
# PELLET FLAG BioRep #1
PELLET_FLAG_rep1<-merge(file7,file9,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
PELLET_FLAG_rep1$div <-PELLET_FLAG_rep1$valueFlag_IP / PELLET_FLAG_rep1$value_noIP
PELLET_FLAG_rep1$log2 <-log(PELLET_FLAG_rep1$div,2)
PELLET_FLAG_rep1_final=subset(PELLET_FLAG_rep1,select = -c(3:6))
PELLET_FLAG_rep1_final<-PELLET_FLAG_rep1_final[,c(2,1,1,3)]
colnames(PELLET_FLAG_rep1_final)<-c("chromosome", "start", "end", "value")
# PELLET FLAG BioRep #2
PELLET_FLAG_rep2<-merge(file19,file21,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
PELLET_FLAG_rep2$div <-PELLET_FLAG_rep2$valueFlag_IP / PELLET_FLAG_rep2$value_noIP
PELLET_FLAG_rep2$log2 <-log(PELLET_FLAG_rep2$div,2)
PELLET_FLAG_rep2_final=subset(PELLET_FLAG_rep2,select = -c(3:6))
PELLET_FLAG_rep2_final<-PELLET_FLAG_rep2_final[,c(2,1,1,3)]
colnames(PELLET_FLAG_rep2_final)<-c("chromosome", "start", "end", "value")
# PELLET H2B BioRep #1
PELLET_H2B_rep1<-merge(file8,file9,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
PELLET_H2B_rep1$div <-PELLET_H2B_rep1$valueH2B_IP / PELLET_H2B_rep1$value_noIP
PELLET_H2B_rep1$log2 <-log(PELLET_H2B_rep1$div,2)
PELLET_H2B_rep1_final=subset(PELLET_H2B_rep1,select = -c(3:6))
PELLET_H2B_rep1_final<-PELLET_H2B_rep1_final[,c(2,1,1,3)]
colnames(PELLET_H2B_rep1_final)<-c("chromosome", "start", "end", "value")
# PELLET H2B BioRep #2
PELLET_H2B_rep2<-merge(file20,file21,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
PELLET_H2B_rep2$div <-PELLET_H2B_rep2$valueH2B_IP / PELLET_H2B_rep2$value_noIP
PELLET_H2B_rep2$log2 <-log(PELLET_H2B_rep2$div,2)
PELLET_H2B_rep2_final=subset(PELLET_H2B_rep2,select = -c(3:6))
PELLET_H2B_rep2_final<-PELLET_H2B_rep2_final[,c(2,1,1,3)]
colnames(PELLET_H2B_rep2_final)<-c("chromosome", "start", "end", "value")

### PROCESS SHORT FILES
# SHORT FLAG BioRep #1
SHORT_FLAG_rep1<-merge(file10,file12,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
SHORT_FLAG_rep1$div <-SHORT_FLAG_rep1$valueFlag_IP / SHORT_FLAG_rep1$value_noIP
SHORT_FLAG_rep1$log2 <-log(SHORT_FLAG_rep1$div,2)
SHORT_FLAG_rep1_final=subset(SHORT_FLAG_rep1,select = -c(3:6))
SHORT_FLAG_rep1_final<-SHORT_FLAG_rep1_final[,c(2,1,1,3)]
colnames(SHORT_FLAG_rep1_final)<-c("chromosome", "start", "end", "value")
# SHORT FLAG BioRep #2
SHORT_FLAG_rep2<-merge(file22,file24,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag_IP","_noIP"))
SHORT_FLAG_rep2$div <-SHORT_FLAG_rep2$valueFlag_IP / SHORT_FLAG_rep2$value_noIP
SHORT_FLAG_rep2$log2 <-log(SHORT_FLAG_rep2$div,2)
SHORT_FLAG_rep2_final=subset(SHORT_FLAG_rep2,select = -c(3:6))
SHORT_FLAG_rep2_final<-SHORT_FLAG_rep2_final[,c(2,1,1,3)]
colnames(SHORT_FLAG_rep2_final)<-c("chromosome", "start", "end", "value")
# SHORT H2B BioRep #1
SHORT_H2B_rep1<-merge(file11,file12,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
SHORT_H2B_rep1$div <-SHORT_H2B_rep1$valueH2B_IP / SHORT_H2B_rep1$value_noIP
SHORT_H2B_rep1$log2 <-log(SHORT_H2B_rep1$div,2)
SHORT_H2B_rep1_final=subset(SHORT_H2B_rep1,select = -c(3:6))
SHORT_H2B_rep1_final<-SHORT_H2B_rep1_final[,c(2,1,1,3)]
colnames(SHORT_H2B_rep1_final)<-c("chromosome", "start", "end", "value")
# SHORT H2B BioRep #2
SHORT_H2B_rep2<-merge(file23,file24,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("H2B_IP","_noIP"))
SHORT_H2B_rep2$div <-SHORT_H2B_rep2$valueH2B_IP / SHORT_H2B_rep2$value_noIP
SHORT_H2B_rep2$log2 <-log(SHORT_H2B_rep2$div,2)
SHORT_H2B_rep2_final=subset(SHORT_H2B_rep2,select = -c(3:6))
SHORT_H2B_rep2_final<-SHORT_H2B_rep2_final[,c(2,1,1,3)]
colnames(SHORT_H2B_rep2_final)<-c("chromosome", "start", "end", "value")

### CONVERT TO DATATRACKS
dataTrack1 <- DataTrack(range = INPUT_FLAG_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#d81b60", col = "#d81b60", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack2 <- DataTrack(range = INPUT_FLAG_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#d81b60", col = "#d81b60", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack3 <- DataTrack(range = INPUT_H2B_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1e88e5", col = "#1e88e5", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack4 <- DataTrack(range = INPUT_H2B_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#1e88e5", col = "#1e88e5", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack5 <- DataTrack(range = LONG_FLAG_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ffc107", col = "#ffc107", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack6 <- DataTrack(range = LONG_FLAG_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ffc107", col = "#ffc107", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack7 <- DataTrack(range = LONG_H2B_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#004d40", col = "#004d40", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack8 <- DataTrack(range = LONG_H2B_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#004d40", col = "#004d40", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack9 <- DataTrack(range = PELLET_FLAG_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ff9797", col = "#ff9797", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack10 <- DataTrack(range = PELLET_FLAG_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ff9797", col = "#ff9797", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack11 <- DataTrack(range = PELLET_H2B_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#c37154", col = "#c37154", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack12 <- DataTrack(range = PELLET_H2B_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#c37154", col = "#c37154", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack13 <- DataTrack(range = SHORT_FLAG_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#774196", col = "#774196", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack14 <- DataTrack(range = SHORT_FLAG_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#774196", col = "#774196", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack15 <- DataTrack(range = SHORT_H2B_rep1_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#919491", col = "#919491", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack16 <- DataTrack(range = SHORT_H2B_rep2_final, type = "l", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#919491", col = "#919491", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))

### INTERMEDIATE PLOTTING
### INPUT bioreps
pdf(file = "H2B-INPUT-Bioreps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack1,dataTrack2,dataTrack3,dataTrack4,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()
### LONG bioreps
pdf(file = "H2B-LONG-Bioreps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack5,dataTrack6,dataTrack7,dataTrack8,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()
### PELLET bioreps
pdf(file = "H2B-PELLET-Bioreps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack9,dataTrack10,dataTrack11,dataTrack12,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()
### SHORT bioreps
pdf(file = "H2B-SHORT-Bioreps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack13,dataTrack14,dataTrack15,dataTrack16,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

### FINAL PROCESSING (Full normalization)
### INPUT
INPUT_rep1<-merge(INPUT_FLAG_rep1,INPUT_H2B_rep1,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
INPUT_rep1$divFull <-INPUT_rep1$divFlag / INPUT_rep1$divH2B
INPUT_rep1$log2 <-log(INPUT_rep1$divFull,2)
INPUT_rep1_final=subset(INPUT_rep1,select = c(1:2,15))
INPUT_rep1_final<-INPUT_rep1_final[,c(2,1,1,3)]
colnames(INPUT_rep1_final)<-c("chromosome", "start", "end", "value")

INPUT_rep2<-merge(INPUT_FLAG_rep2,INPUT_H2B_rep2,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
INPUT_rep2$divFull <-INPUT_rep2$divFlag / INPUT_rep2$divH2B
INPUT_rep2$log2 <-log(INPUT_rep2$divFull,2)
INPUT_rep2_final=subset(INPUT_rep2,select = c(1:2,15))
INPUT_rep2_final<-INPUT_rep2_final[,c(2,1,1,3)]
colnames(INPUT_rep2_final)<-c("chromosome", "start", "end", "value")

### LONG
LONG_rep1<-merge(LONG_FLAG_rep1,LONG_H2B_rep1,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
LONG_rep1$divFull <-LONG_rep1$divFlag / LONG_rep1$divH2B
LONG_rep1$log2 <-log(LONG_rep1$divFull,2)
LONG_rep1_final=subset(LONG_rep1,select = c(1:2,15))
LONG_rep1_final<-LONG_rep1_final[,c(2,1,1,3)]
colnames(LONG_rep1_final)<-c("chromosome", "start", "end", "value")

LONG_rep2<-merge(LONG_FLAG_rep2,LONG_H2B_rep2,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
LONG_rep2$divFull <-LONG_rep2$divFlag / LONG_rep2$divH2B
LONG_rep2$log2 <-log(LONG_rep2$divFull,2)
LONG_rep2_final=subset(LONG_rep2,select = c(1:2,15))
LONG_rep2_final<-LONG_rep2_final[,c(2,1,1,3)]
colnames(LONG_rep2_final)<-c("chromosome", "start", "end", "value")

### PELLET
PELLET_rep1<-merge(PELLET_FLAG_rep1,PELLET_H2B_rep1,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
PELLET_rep1$divFull <-PELLET_rep1$divFlag / PELLET_rep1$divH2B
PELLET_rep1$log2 <-log(PELLET_rep1$divFull,2)
PELLET_rep1_final=subset(PELLET_rep1,select = c(1:2,15))
PELLET_rep1_final<-PELLET_rep1_final[,c(2,1,1,3)]
colnames(PELLET_rep1_final)<-c("chromosome", "start", "end", "value")

PELLET_rep2<-merge(PELLET_FLAG_rep2,PELLET_H2B_rep2,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
PELLET_rep2$divFull <-PELLET_rep2$divFlag / PELLET_rep2$divH2B
PELLET_rep2$log2 <-log(PELLET_rep2$divFull,2)
PELLET_rep2_final=subset(PELLET_rep2,select = c(1:2,15))
PELLET_rep2_final<-PELLET_rep2_final[,c(2,1,1,3)]
colnames(PELLET_rep2_final)<-c("chromosome", "start", "end", "value")

### SHORT
SHORT_rep1<-merge(SHORT_FLAG_rep1,SHORT_H2B_rep1,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
SHORT_rep1$divFull <-SHORT_rep1$divFlag / SHORT_rep1$divH2B
SHORT_rep1$log2 <-log(SHORT_rep1$divFull,2)
SHORT_rep1_final=subset(SHORT_rep1,select = c(1:2,15))
SHORT_rep1_final<-SHORT_rep1_final[,c(2,1,1,3)]
colnames(SHORT_rep1_final)<-c("chromosome", "start", "end", "value")

SHORT_rep2<-merge(SHORT_FLAG_rep2,SHORT_H2B_rep2,by="pos", all.x = TRUE, all.y = TRUE, suffixes=c("Flag","H2B"))
SHORT_rep2$divFull <-SHORT_rep2$divFlag / SHORT_rep2$divH2B
SHORT_rep2$log2 <-log(SHORT_rep2$divFull,2)
SHORT_rep2_final=subset(SHORT_rep2,select = c(1:2,15))
SHORT_rep2_final<-SHORT_rep2_final[,c(2,1,1,3)]
colnames(SHORT_rep2_final)<-c("chromosome", "start", "end", "value")

### CONVERT TO DATATRACKS
dataTrack20 <- DataTrack(range = INPUT_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#d81b60", col = "#d81b60", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack21 <- DataTrack(range = INPUT_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#d81b60", col = "#d81b60", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack24 <- DataTrack(range = PELLET_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ffc107", col = "#ffc107", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack25 <- DataTrack(range = PELLET_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ffc107", col = "#ffc107", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack22 <- DataTrack(range = LONG_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ff9797", col = "#ff9797", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack23 <- DataTrack(range = LONG_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#ff9797", col = "#ff9797", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack26 <- DataTrack(range = SHORT_rep1_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#774196", col = "#774196", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))
dataTrack27 <- DataTrack(range = SHORT_rep2_final, type = "hist", chromosome=myChr, baseline = c(-1,0,1), col.baseline = c('black'), lty.baseline = c(2,1,2), genome = 'HSV1', fill = "#774196", col = "#774196", options(ucscChromosomeNames=FALSE),col.axis="black", background.title = "transparent", ylim=c(-4,4))


### GENERATE FINAL PLOT
pdf(file = "H2B-Digestion-Biorep1.pdf", width = 10, height = 5)
plotTracks(list(dataTrack20,dataTrack24,dataTrack22,dataTrack26,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

pdf(file = "H2B-Digestion-Biorep2.pdf", width = 10, height = 5)
plotTracks(list(dataTrack21,dataTrack25,dataTrack23,dataTrack27,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.2,0.2,0.2,0.2,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()

pdf(file = "H2B-Digestion-BothBioReps.pdf", width = 10, height = 5)
plotTracks(list(dataTrack20,dataTrack21,dataTrack24,dataTrack25,dataTrack22,dataTrack23,dataTrack26,dataTrack27,dataTrackGC,rtrackRegions,rtrackFor,gtrack,rtrackRev), type="l", from = myStart, to = myEnd, sizes=c(0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.02,0.06,0.1,0.1), col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)
dev.off()





