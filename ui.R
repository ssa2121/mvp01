library(shiny)

shinyUI(fluidPage(
	titlePanel("Traffic Analysis for Glenbridge"),

	sidebarLayout(
		sidebarPanel("sidebar Panel"),
		mainPanel(
			h1("Performance Measures", align="center"),
			h6("These are the performance measures"),
			h3("Heading 3")
		)
	)
))


