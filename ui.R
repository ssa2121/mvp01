library(shiny)
library(shinydashboard)
library(leaflet)

header <- dashboardHeader(
	title="Glenwood Springs"
)

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

dashboardPage(
	header,
	dashboardSidebar(disable=TRUE),
	getpage("P1")
)
	
	
