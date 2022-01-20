require(MASS)

##############################RR################################
#================ QT = 0.3 ================================#
rr.dat <- read.csv(file = "rr.txt")

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/tat_rr_qt03.png",
    width=600, height=350)
truehist(rr.dat[,6], nbins = "FD",col="skyblue3", prob = TRUE,xlab = "Turnaround Time", ylab = "Density", main = "Turnaround Time Histogram")
lines(density(rr.dat[,6]), lwd = 2,col="red",lty = "dashed")
rug(rr.dat[,6])
dev.off()

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/wt_rr_qt03.png",
    width=600, height=350)

truehist(rr.dat[,7], nbins = "FD", col="skyblue3", prob = TRUE,xlab = "Waiting Time", ylab = "Density", main = "Waiting Time Histogram")
lines(density(rr.dat[,7]), lwd = 2,col="red",lty = "dashed")
rug(rr.dat[,7])
dev.off()

sprintf("TAT RR QT= 0.3: %.2f", mean(rr.dat[,6]))
sprintf("WT  RR QT= 0.3: %.2f", mean(rr.dat[,7]))
sprintf("RT QT= 0.3: %.2f", mean(rr.dat[,8]))

#================ QT = 1 ================================#
rr1.dat <- read.csv(file = "rr1.txt")

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/tat_rr_qt1.png",
    width=600, height=350)
truehist(rr1.dat[,6], nbins = "FD", col="skyblue3", prob = TRUE,xlab = "Turnaround Time", ylab = "Density", main = "Turnaround Time Histogram")
lines(density(rr1.dat[,6]), lwd = 2,col="red",lty = "dashed")
rug(rr1.dat[,6])
dev.off()

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/wt_rr_qt1.png",
    width=600, height=350)

truehist(rr1.dat[,7], nbins = "FD", col="skyblue3", prob = TRUE,xlab = "Waiting Time", ylab = "Density", main = "Waiting Time Histogram")
lines(density(rr1.dat[,7]), lwd = 2,col="red",lty = "dashed")
rug(rr1.dat[,7])
dev.off()

sprintf("TAT RR QT= 1: %.2f", mean(rr1.dat[,6]))
sprintf("WT  RR QT= 1: %.2f", mean(rr1.dat[,7]))
sprintf("RT QT= 1: %.2f", mean(rr1.dat[,8]))
#================ QT = 0.8 ================================#
rr08.dat <- read.csv(file = "rr08.txt")
attach(rr08.dat)
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/tat_rr_qt08.png",
    width=600, height=350)
truehist(rr08.dat[,6], nbins = "FD", col="skyblue3", prob = TRUE,xlab = "Turnaround Time", ylab = "Density", main = "Turnaround Time Histogram")
lines(density(rr08.dat[,6]), lwd = 2,col="red",lty = "dashed")
rug(rr08.dat[,6])
dev.off()

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/wt_rr_qt08.png",
    width=600, height=350)

truehist(rr08.dat[,7], nbins = "FD", col="skyblue3", prob = TRUE,xlab = "Waiting Time", ylab = "Density", main = "Waiting Time Histogram")
lines(density(rr08.dat[,7]), lwd = 2,col="red",lty = "dashed")
rug(rr08.dat[,7])
dev.off()

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/plots/rr/REL_rr_qt08.png",
    width=600, height=350)
pairs(cbind(arrival_time, cpu_bursts_time, tat, ready_wait_time), gap = 0, panel = panel.smooth)
dev.off()

sprintf("TAT RR QT= 0.8: %.2f", mean(rr08.dat[,6]))
sprintf("WT  RR QT= 0.8: %.2f", mean(rr08.dat[,7]))
sprintf("RT QT= 0.8: %.2f", mean(rr08.dat[,8]))
