# Original: 12th June 2017 by Shourya Shukla
# Last update: 12th June 2017 by Shourya Shukla


library(reshape)
library(plyr)
library(ggplot2)

# setwd("C:/Work/Transportation/ColoradoDOT/Traffic/analysis/data")
# data.path <- "../data"
data.path <- "C:/Work/Transportation/ColoradoDOT/Traffic/analysis/data"
files <- list.files(path=data.path, pattern="^[0-9].{16}.csv")

tcDf <- NULL

for (i in seq_along(files)) {
    fname <- paste(data.path,files[i],sep="/")
    tryCatch({
            if(file.size(fname)>0) {
                tc <- read.csv(fname)
                tc$StationName <- substr(files[i],1,6)
                curDate <- as.Date(substr(files[i],8,16),format="%d-%m-%Y")
                tc$CountDate <- curDate
                tc$Day <- weekdays(curDate)
                tc$Rownum <- as.integer(rownames(tc))+(i*100)
            }
            tcDf <- rbind(tcDf, tc)
        }, error = function(err) {
            # error handler picks up where error was generated
            print(paste("Read.table didn't work!:  ",err))
    })
}

# ts <- read.csv(paste(data.path,"/TrafficStations.csv",sep=""))
# ts10028907 <- read.csv(paste(data.path,"/100289-07-07-2015.csv",sep=""))

tcDfl <- reshape(data=tcDf, new.row.names=NULL, # idvar="Rownum", 
varying=c("HOUR0","HOUR1","HOUR2","HOUR3","HOUR4","HOUR5","HOUR6","HOUR7","HOUR8","HOUR9","HOUR10","HOUR11","HOUR12","HOUR13","HOUR14","HOUR15","HOUR16","HOUR17","HOUR18","HOUR19","HOUR20","HOUR21","HOUR22","HOUR23"), 
direction="long",
sep="")

tsl <- tcDfl
tsl <- rename(tsl,c("COUNTDIR"="Direction", "time"="Hour", "HOUR"="Volume"))
tslp <- tsl[which(tsl$Direction=="P"),]
tsls <- tsl[which(tsl$Direction=="S"),]
tslc <- tsl[which(tsl$Direction=="C"),]
# prim.plot <- plot(tslp$Hour,tslp$Volume,"l")
prim.plot <- ggplot(tslp, aes(x= Hour, y = Volume, colour = StationName)) + geom_line()

tslp289 <- tslp[which(tsl$StationName=="100289"),]
heatmap.wk <- traffic.heatmap(tslp289, tslp289$Hour, tslp289$Day, tslp289$Volume, TRUE)
heatmap.wk

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
