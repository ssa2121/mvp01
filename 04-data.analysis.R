# Original: 12th June 2017 by Shourya Shukla
# Last update: 12th June 2017 by Shourya Shukla


library(reshape)
library(plyr)
library(ggplot2)

# setwd("C:/Work/Transportation/ColoradoDOT/Traffic/analysis/data")
# data.path <- "../data"
data.path <- "C:/Work/Transportation/ColoradoDOT/Traffic/analysis/data"
ts <- read.csv(paste(data.path,"/TrafficStations.csv",sep=""))
ts10028907 <- read.csv(paste(data.path,"/100289-07-07-2015.csv",sep=""))

ts100289l <- reshape(data=ts10028907, idvar="COUNTDIR", 
varying=c("HOUR0","HOUR1","HOUR2","HOUR3","HOUR4","HOUR5","HOUR6","HOUR7","HOUR8","HOUR9","HOUR10","HOUR11","HOUR12","HOUR13","HOUR14","HOUR15","HOUR16","HOUR17","HOUR18","HOUR19","HOUR20","HOUR21","HOUR22","HOUR23"), 
direction="long",
sep="")
ts100289l$Day="THURSDAY"

tsl <- ts100289l
tsl <- rename(tsl,c("COUNTDIR"="Direction", "time"="Hour", "HOUR"="Volume"))
tslp <- tsl[which(tsl$Direction=="P"),]
tsls <- tsl[which(tsl$Direction=="S"),]
tslc <- tsl[which(tsl$Direction=="C"),]
# prim.plot <- plot(tslp$Hour,tslp$Volume,"l")
prim.plot <- ggplot(tslp, aes(x= Hour, y = Volume))

heatmap.table <- traffic.heatmap(tslp, tslp$Hour, tslp$Day, tslp$Volume)

# plot(tsls$time,tsls$HOUR,"l")
# plot(tslc$time,tslc$HOUR,"l")

# ts100289l <- reshape(data=ts100289, idvar="COUNTDIR", 
# varying=0:23, 
# v.names="HOUR",
# direction="long",
# sep="")

sec.name <- c("Section A", "Section B", "Section C", "Section D", "Section E")
avg.delay <- c(2.4,2.1,2,1.6, 1.5)
tot.delay <- c(125.3,108.9,99.2,86.3,80.1)
am.p.vol <- c(1243,1189,997,1678,106)
am.s.vol <- c(619,267,397,84,99)
pm.p.vol <- c(321,667,89,390,185)
pm.s.vol <- c(1551,671,982,388,1907)

congdf <- data.frame(sec.name,avg.delay,tot.delay, am.p.vol, am.s.vol,pm.p.vol,pm.s.vol)
