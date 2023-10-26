library(data.table)
library(tidyverse)

setwd("set/working/directory")

### READ IN INSERTLENGTH DATA
#BIOREP1
file1 <- read.csv('../Histogram/LS93.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file2 <- read.csv('../Histogram/LS94.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file3 <- read.csv('../Histogram/LS95.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file4 <- read.csv('../Histogram/LS96.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file5 <- read.csv('../Histogram/LS97.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file6 <- read.csv('../Histogram/LS98.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file7 <- read.csv('../Histogram/LS99.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file8 <- read.csv('../Histogram/LS100.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file9 <- read.csv('../Histogram/LS101.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file10 <- read.csv('../Histogram/LS102.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file11 <- read.csv('../Histogram/LS103.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file12 <- read.csv('../Histogram/LS104.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file13 <- read.csv('../Histogram/LS93.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file14 <- read.csv('../Histogram/LS94.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file15 <- read.csv('../Histogram/LS95.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file16 <- read.csv('../Histogram/LS96.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file17 <- read.csv('../Histogram/LS97.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file18 <- read.csv('../Histogram/LS98.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file19 <- read.csv('../Histogram/LS99.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file20 <- read.csv('../Histogram/LS100.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file21 <- read.csv('../Histogram/LS101.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file22 <- read.csv('../Histogram/LS102.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file23 <- read.csv('../Histogram/LS103.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file24 <- read.csv('../Histogram/LS104.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
#BIOREP2
file25 <- read.csv('../Histogram/LS141.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file26 <- read.csv('../Histogram/LS142.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file27 <- read.csv('../Histogram/LS143.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file28 <- read.csv('../Histogram/LS144.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file29 <- read.csv('../Histogram/LS145.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file30 <- read.csv('../Histogram/LS146.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file31 <- read.csv('../Histogram/LS147.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file32 <- read.csv('../Histogram/LS148.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file33 <- read.csv('../Histogram/LS149.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file34 <- read.csv('../Histogram/LS150.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file35 <- read.csv('../Histogram/LS151.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file36 <- read.csv('../Histogram/LS152.HG38-X1000.Filtered.sorted.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file37 <- read.csv('../Histogram/LS141.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file38 <- read.csv('../Histogram/LS142.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file39 <- read.csv('../Histogram/LS143.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file40 <- read.csv('../Histogram/LS144.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file41 <- read.csv('../Histogram/LS145.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file42 <- read.csv('../Histogram/LS146.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file43 <- read.csv('../Histogram/LS147.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file44 <- read.csv('../Histogram/LS148.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file45 <- read.csv('../Histogram/LS149.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file46 <- read.csv('../Histogram/LS150.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file47 <- read.csv('../Histogram/LS151.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))
file48 <- read.csv('../Histogram/LS152.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt', sep='\t', col.names = c('pos', 'value'))

### PLOTTING H2A-INPUT
pdf(file = "H2A-INPUT-Digestion-FragmentSizeDistributions-both-bioreps.pdf", width = 10, height = 10)
par(mfrow = c(2,2))
plot(file1$pos,file1$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A INPUT all")
lines(file2$pos,file2$value,lty=1,lwd=1,col="darkorchid4")
lines(file3$pos,file3$value,lty=1,lwd=1,col="dodgerblue4")
lines(file13$pos,file13$value,lty=1,lwd=1,col="red")
lines(file14$pos,file14$value,lty=1,lwd=1,col="gold")
lines(file15$pos,file15$value,lty=1,lwd=1,col="darkorange3")
lines(file25$pos,file25$value,lty=1,lwd=1,col="grey")
lines(file26$pos,file26$value,lty=1,lwd=1,col="darkorchid1")
lines(file27$pos,file27$value,lty=1,lwd=1,col="dodgerblue1")
lines(file37$pos,file37$value,lty=1,lwd=1,col="pink")
lines(file38$pos,file38$value,lty=1,lwd=1,col="yellow")
lines(file39$pos,file39$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("INPUT_Cell_Flag_IP_rep1", "INPUT_Cell_H2B_IP_rep1", "INPUT_Cell_noIP_rep1", "INPUT_HSV_Flag_IP_rep1", "INPUT_HSV_H2B_IP_rep1", "INPUT_HSV_noIP_rep1","INPUT_Cell_Flag_IP_rep2", "INPUT_Cell_H2B_IP_rep2", "INPUT_Cell_noIP_rep2", "INPUT_HSV_Flag_IP_rep2", "INPUT_HSV_H2B_IP_rep2", "INPUT_HSV_noIP_rep2"),
       col=c("black","darkorchid4","dodgerblue4","red","gold","darkorange3","grey","darkorchid1","dodgerblue1","pink","yellow","darkorange1"), lty = 1:1, cex=0.8)

plot(file1$pos,file1$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A INPUT Flag_IP")
lines(file25$pos,file25$value,lty=1,lwd=1,col="grey")
lines(file13$pos,file13$value,lty=1,lwd=1,col="red")
lines(file37$pos,file37$value,lty=1,lwd=1,col="pink")
legend("topright", legend=c("INPUT_Cell_Flag_IP_rep1", "INPUT_Cell_Flag_IP_rep2","INPUT_HSV_Flag_IP_rep1", "INPUT_HSV_Flag_IP_rep2"),
       col=c("black", "grey", "red","pink"), lty = 1:1, cex=0.8)

plot(file2$pos,file2$value,type="l", lty=1,lwd=1,col="darkorchid4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A INPUT H2B_IP")
lines(file26$pos,file26$value,lty=1,lwd=1,col="darkorchid1")
lines(file14$pos,file14$value,lty=1,lwd=1,col="gold")
lines(file38$pos,file38$value,lty=1,lwd=1,col="yellow")
legend("topright", legend=c("INPUT_Cell_H2B_IP_rep1", "INPUT_Cell_H2B_IP_rep2","INPUT_HSV_H2B_IP_rep1", "INPUT_HSV_H2B_IP_rep2"),
       col=c("darkorchid4","darkorchid1","gold","yellow"), lty = 1:1, cex=0.8)

plot(file3$pos,file3$value,type="l", lty=1,lwd=1,col="dodgerblue4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A INPUT noIP")
lines(file27$pos,file27$value,lty=1,lwd=1,col="dodgerblue1")
lines(file15$pos,file15$value,lty=1,lwd=1,col="darkorange3")
lines(file39$pos,file39$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("INPUT_Cell_noIP_rep1", "INPUT_Cell_noIP_rep2","INPUT_HSV_noIP_rep1", "INPUT_HSV_noIP_rep2"),
       col=c("dodgerblue4","dodgerblue1","darkorange3","darkorange1"), lty = 1:1, cex=0.8)
dev.off()

### PLOTTING H2A-LONG
pdf(file = "H2A-LONG-Digestion-FragmentSizeDistributions-both-bioreps.pdf", width = 10, height = 10)
par(mfrow = c(2,2))
plot(file4$pos,file4$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A all LONG")
lines(file5$pos,file5$value,lty=1,lwd=1,col="darkorchid4")
lines(file6$pos,file6$value,lty=1,lwd=1,col="dodgerblue4")
lines(file16$pos,file16$value,lty=1,lwd=1,col="red")
lines(file17$pos,file17$value,lty=1,lwd=1,col="gold")
lines(file18$pos,file18$value,lty=1,lwd=1,col="darkorange3")
lines(file28$pos,file28$value,lty=1,lwd=1,col="grey")
lines(file29$pos,file29$value,lty=1,lwd=1,col="darkorchid1")
lines(file30$pos,file30$value,lty=1,lwd=1,col="dodgerblue1")
lines(file40$pos,file40$value,lty=1,lwd=1,col="pink")
lines(file41$pos,file41$value,lty=1,lwd=1,col="yellow")
lines(file42$pos,file42$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("LONG_Cell_Flag_IP_rep1", "LONG_Cell_H2B_IP_rep1", "LONG_Cell_noIP_rep1", "LONG_HSV_Flag_IP_rep1", "LONG_HSV_H2B_IP_rep1", "LONG_HSV_noIP_rep1","LONG_Cell_Flag_IP_rep2", "LONG_Cell_H2B_IP_rep2", "LONG_Cell_noIP_rep2", "LONG_HSV_Flag_IP_rep2", "LONG_HSV_H2B_IP_rep2", "LONG_HSV_noIP_rep2"),
       col=c("black","darkorchid4","dodgerblue4","red","gold","darkorange3","grey","darkorchid1","dodgerblue1","pink","yellow","darkorange1"), lty = 1:1, cex=0.8)

plot(file4$pos,file4$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A Flag_IP")
lines(file28$pos,file28$value,lty=1,lwd=1,col="grey")
lines(file16$pos,file16$value,lty=1,lwd=1,col="red")
lines(file40$pos,file40$value,lty=1,lwd=1,col="pink")
legend("topright", legend=c("LONG_Cell_Flag_IP_rep1", "LONG_Cell_Flag_IP_rep2","LONG_HSV_Flag_IP_rep1", "LONG_HSV_Flag_IP_rep2"),
       col=c("black", "grey", "red","pink"), lty = 1:1, cex=0.8)

plot(file5$pos,file5$value,type="l", lty=1,lwd=1,col="darkorchid4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A H2B_IP")
lines(file29$pos,file29$value,lty=1,lwd=1,col="darkorchid1")
lines(file17$pos,file17$value,lty=1,lwd=1,col="gold")
lines(file41$pos,file41$value,lty=1,lwd=1,col="yellow")
legend("topright", legend=c("LONG_Cell_H2B_IP_rep1", "LONG_Cell_H2B_IP_rep2","LONG_HSV_H2B_IP_rep1", "LONG_HSV_H2B_IP_rep2"),
       col=c("darkorchid4","darkorchid1","gold","yellow"), lty = 1:1, cex=0.8)

plot(file6$pos,file6$value,type="l", lty=1,lwd=1,col="dodgerblue4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A noIP")
lines(file30$pos,file30$value,lty=1,lwd=1,col="dodgerblue1")
lines(file18$pos,file18$value,lty=1,lwd=1,col="darkorange3")
lines(file42$pos,file42$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("LONG_Cell_noIP_rep1", "LONG_Cell_noIP_rep2","LONG_HSV_noIP_rep1", "LONG_HSV_noIP_rep2"),
       col=c("dodgerblue4","dodgerblue1","darkorange3","darkorange1"), lty = 1:1, cex=0.8)
dev.off()


### PLOTTING H2A-PELLET
pdf(file = "H2A-PELLET-Digestion-FragmentSizeDistributions-both-bioreps.pdf", width = 10, height = 10)
par(mfrow = c(2,2))
plot(file7$pos,file7$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A all PELLET")
lines(file8$pos,file8$value,lty=1,lwd=1,col="darkorchid4")
lines(file9$pos,file9$value,lty=1,lwd=1,col="dodgerblue4")
lines(file19$pos,file19$value,lty=1,lwd=1,col="red")
lines(file20$pos,file20$value,lty=1,lwd=1,col="gold")
lines(file21$pos,file21$value,lty=1,lwd=1,col="darkorange3")
lines(file31$pos,file31$value,lty=1,lwd=1,col="grey")
lines(file32$pos,file32$value,lty=1,lwd=1,col="darkorchid1")
lines(file33$pos,file33$value,lty=1,lwd=1,col="dodgerblue1")
lines(file43$pos,file43$value,lty=1,lwd=1,col="pink")
lines(file44$pos,file44$value,lty=1,lwd=1,col="yellow")
lines(file45$pos,file45$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("PELLET_Cell_Flag_IP_rep1", "PELLET_Cell_H2B_IP_rep1", "PELLET_Cell_noIP_rep1", "PELLET_HSV_Flag_IP_rep1", "PELLET_HSV_H2B_IP_rep1", "PELLET_HSV_noIP_rep1","PELLET_Cell_Flag_IP_rep2", "PELLET_Cell_H2B_IP_rep2", "PELLET_Cell_noIP_rep2", "PELLET_HSV_Flag_IP_rep2", "PELLET_HSV_H2B_IP_rep2", "PELLET_HSV_noIP_rep2"),
       col=c("black","darkorchid4","dodgerblue4","red","gold","darkorange3","grey","darkorchid1","dodgerblue1","pink","yellow","darkorange1"), lty = 1:1, cex=0.8)

plot(file7$pos,file7$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A Flag_IP")
lines(file31$pos,file31$value,lty=1,lwd=1,col="grey")
lines(file19$pos,file19$value,lty=1,lwd=1,col="red")
lines(file43$pos,file43$value,lty=1,lwd=1,col="pink")
legend("topright", legend=c("PELLET_Cell_Flag_IP_rep1", "PELLET_Cell_Flag_IP_rep2","PELLET_HSV_Flag_IP_rep1", "PELLET_HSV_Flag_IP_rep2"),
       col=c("black", "grey", "red","pink"), lty = 1:1, cex=0.8)

plot(file8$pos,file8$value,type="l", lty=1,lwd=1,col="darkorchid4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A H2B_IP")
lines(file32$pos,file32$value,lty=1,lwd=1,col="darkorchid1")
lines(file20$pos,file20$value,lty=1,lwd=1,col="gold")
lines(file44$pos,file44$value,lty=1,lwd=1,col="yellow")
legend("topright", legend=c("PELLET_Cell_H2B_IP_rep1", "PELLET_Cell_H2B_IP_rep2","PELLET_HSV_H2B_IP_rep1", "PELLET_HSV_H2B_IP_rep2"),
       col=c("darkorchid4","darkorchid1","gold","yellow"), lty = 1:1, cex=0.8)

plot(file9$pos,file9$value,type="l", lty=1,lwd=1,col="dodgerblue4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A noIP")
lines(file33$pos,file33$value,lty=1,lwd=1,col="dodgerblue1")
lines(file21$pos,file21$value,lty=1,lwd=1,col="darkorange3")
lines(file45$pos,file45$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("PELLET_Cell_noIP_rep1", "PELLET_Cell_noIP_rep2","PELLET_HSV_noIP_rep1", "PELLET_HSV_noIP_rep2"),
       col=c("dodgerblue4","dodgerblue1","darkorange3","darkorange1"), lty = 1:1, cex=0.8)
dev.off()

### PLOTTING H2A-SHORT
pdf(file = "H2A-SHORT-Digestion-FragmentSizeDistributions-both-bioreps.pdf", width = 10, height = 10)
par(mfrow = c(2,2))
plot(file10$pos,file10$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A all SHORT")
lines(file11$pos,file11$value,lty=1,lwd=1,col="darkorchid4")
lines(file12$pos,file12$value,lty=1,lwd=1,col="dodgerblue4")
lines(file22$pos,file22$value,lty=1,lwd=1,col="red")
lines(file23$pos,file23$value,lty=1,lwd=1,col="gold")
lines(file24$pos,file24$value,lty=1,lwd=1,col="darkorange3")
lines(file34$pos,file34$value,lty=1,lwd=1,col="grey")
lines(file35$pos,file35$value,lty=1,lwd=1,col="darkorchid1")
lines(file36$pos,file36$value,lty=1,lwd=1,col="dodgerblue1")
lines(file46$pos,file46$value,lty=1,lwd=1,col="pink")
lines(file47$pos,file47$value,lty=1,lwd=1,col="yellow")
lines(file48$pos,file48$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("SHORT_Cell_Flag_IP_rep1", "SHORT_Cell_H2B_IP_rep1", "SHORT_Cell_noIP_rep1", "SHORT_HSV_Flag_IP_rep1", "SHORT_HSV_H2B_IP_rep1", "SHORT_HSV_noIP_rep1","SHORT_Cell_Flag_IP_rep2", "SHORT_Cell_H2B_IP_rep2", "SHORT_Cell_noIP_rep2", "SHORT_HSV_Flag_IP_rep2", "SHORT_HSV_H2B_IP_rep2", "SHORT_HSV_noIP_rep2"),
       col=c("black","darkorchid4","dodgerblue4","red","gold","darkorange3","grey","darkorchid1","dodgerblue1","pink","yellow","darkorange1"), lty = 1:1, cex=0.8)

plot(file10$pos,file10$value,type="l", lty=1,lwd=1,col="black", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A Flag_IP")
lines(file34$pos,file34$value,lty=1,lwd=1,col="grey")
lines(file22$pos,file22$value,lty=1,lwd=1,col="red")
lines(file46$pos,file46$value,lty=1,lwd=1,col="pink")
legend("topright", legend=c("SHORT_Cell_Flag_IP_rep1", "SHORT_Cell_Flag_IP_rep2","SHORT_HSV_Flag_IP_rep1", "SHORT_HSV_Flag_IP_rep2"),
       col=c("black", "grey", "red","pink"), lty = 1:1, cex=0.8)

plot(file11$pos,file11$value,type="l", lty=1,lwd=1,col="darkorchid4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A H2B_IP")
lines(file35$pos,file35$value,lty=1,lwd=1,col="darkorchid1")
lines(file23$pos,file23$value,lty=1,lwd=1,col="gold")
lines(file47$pos,file47$value,lty=1,lwd=1,col="yellow")
legend("topright", legend=c("SHORT_Cell_H2B_IP_rep1", "SHORT_Cell_H2B_IP_rep2","SHORT_HSV_H2B_IP_rep1", "SHORT_HSV_H2B_IP_rep2"),
       col=c("darkorchid4","darkorchid1","gold","yellow"), lty = 1:1, cex=0.8)

plot(file12$pos,file12$value,type="l", lty=1,lwd=1,col="dodgerblue4", ylim=c(0,400), xlim=c(0,1000),xlab = "fragment length", ylab = "abundance", main="H2A noIP")
lines(file36$pos,file36$value,lty=1,lwd=1,col="dodgerblue1")
lines(file24$pos,file24$value,lty=1,lwd=1,col="darkorange3")
lines(file48$pos,file48$value,lty=1,lwd=1,col="darkorange1")
legend("topright", legend=c("SHORT_Cell_noIP_rep1", "SHORT_Cell_noIP_rep2","SHORT_HSV_noIP_rep1", "SHORT_HSV_noIP_rep2"),
       col=c("dodgerblue4","dodgerblue1","darkorange3","darkorange1"), lty = 1:1, cex=0.8)
dev.off()

