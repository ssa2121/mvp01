# Original: 9th June 2017 by Shourya Shukla
# Last update: 9th June 2017 by Shourya Shukla

library(shiny)
# library(DT)
library(shinydashboard)
library(leaflet)


header <- dashboardHeader(
	title="Glenwood Springs"
)

source("05-traffic.heatmap.R")
source("04-data.analysis.R")
source("03-toplvlprompt.R")
source("page1.R")
source("page2.R")
source("page3.R")


getpage <- function(index) {
	switch(index, 
		P1={return(page1)},
		P2={return(page2)},
		P3={return(page3)}
	)
}



body <- dashboardBody(uiOutput("body"))
dashboardPage(
	header,
	dashboardSidebar(disable=TRUE),
	getpage("P1")
	# body
)
	
	
