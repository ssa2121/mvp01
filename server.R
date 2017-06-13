# Original: 9th June 2017 by Shourya Shukla
# Last update: 12th June 2017 by Shourya Shukla

library(shiny)
# library(DT)
library(shinydashboard)
library(leaflet)
library(ggplot2)

if(!exists("bullet.graph",mode="function")) source("01-bulletchart.R")

total.delay <- data.frame(
	measure=c(""),
	high=c(2000),
	mean=c(1200),
	low=c(100), 
	target=c(500),
	value=c(1800)
)

total.delay.bg <- bullet.graph(total.delay)

avg.delay <- data.frame(
	measure=c(""),
	high=c(10),
	mean=c(5),
	low=c(2), 
	target=c(2),
	value=c(6.7)
)

avg.delay.bg <- bullet.graph(avg.delay)


losD.pct <- data.frame(
	measure=c(""),
	high=c(100),
	mean=c(75),
	low=c(30), 
	target=c(10),
	value=c(30)
)

losD.pct.bg <- bullet.graph(losD.pct)

tt.index <- data.frame(
	measure=c(""),
	high=c(1.5),
	mean=c(0.75),
	low=c(.5), 
	target=c(1),
	value=c(1.27)
)

tt.index.bg <- bullet.graph(tt.index)

pt.index <- data.frame(
	measure=c(""),
	high=c(1.5),
	mean=c(0.75),
	low=c(.5), 
	target=c(1),
	value=c(1.2)
)

pt.index.bg <- bullet.graph(pt.index)

my_data <- head(mtcars)

# heatmap <- ggplot(tslp, aes(x = Hour, y = Day)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name = 'Total Motor Vehicle Thefts', low = 'green', high = 'red') + theme(axis.title.y = element_blank())
# incidents.pct.bg <- bullet.graph(incidents.pct)

function(input, output, session) {
	

	# Show the bullet charts showing the various metrics
	output$level1.bullet1 <- renderPlot({
		total.delay.bg
	})

	output$level1.bullet2 <- renderPlot({
		avg.delay.bg
	})
	
	output$level1.bullet3 <- renderPlot({
		losD.pct.bg
	})
	output$level1.bullet4 <- renderPlot({
		tt.index.bg
	})
	output$level1.bullet5 <- renderPlot({
		pt.index.bg
	})

	# Show the map of the study area with the zones loaded
	output$studyAreaMap <- renderLeaflet({
		latY = 39.5482146
		lngX = -107.3269844

		map <- leaflet() %>%
		setView(lngX,latY,17) %>%
		addTiles('http://{s}.tile.thunderforest.com/transport/{z}/{x}/{y}.png')
	})

	output$tblCongSect <- renderTable(congdf)
	# output$tblCongSect <- DT::renderDataTable({
	# 	datatable(congdf) 
	# })

 	# output$tblCongSect <- DT::renderDataTable({datatable(my_data)})  

}


