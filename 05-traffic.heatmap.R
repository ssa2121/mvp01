# Original: 9th June 2017 by Shourya Shukla
# Last update: 12th June 2017 by Shourya Shukla

library(ggplot2)

# hm.data <- tslp
# X <- tslp$Hour
# Y <- tslp$Day
# HeatValue <- tslp$Volume
# showYLbl <- FALSE

traffic.heatmap <- function(hm.data, X, Y, HeatValue, showYLbl) {
    gg <-  ggplot(hm.data, aes(x = X, y = Y)) 
    gg <- gg + geom_tile(aes(fill = HeatValue)) 
    gg <- gg + scale_fill_gradient(name = '', low = 'green', high = 'red') 
    # gg <- gg + geom_raster(aes(fill = HeatValue)) 
    # gg <- gg + scale_fill_gradientn(colours = terrain.colors(10)) 
    gg <- gg + theme(axis.title.y = element_blank())
    gg <- gg + theme(axis.title.x = element_blank())
    gg <- gg + guides(fill=FALSE) # Remove the legend
    if (!showYLbl) {
        gg <- gg + theme(axis.text.y = element_blank())
    }
    return (gg)
}
