# Written: 12th June 2017 by Shourya Shukla
# Last update: 12th June 2017 by Shourya Shukla

toplvlprompt <- 	fluidRow(
		column(width=12,
			box(width=2, solidHeader=TRUE,
				selectInput("studyArea", "Study Area",
				choices=c("Study Area 1", "Study Area 2", "Study Area 3"), multiple=FALSE, selectize=FALSE, width='100%')
			),		
			box(width=2, solidHeader=TRUE,
				selectInput("projectArea", "Project Area",
				choices=c("Project A", "Project B", "Project C"), multiple=FALSE, selectize=FALSE, width='100%')
			),		
			box(width=2, solidHeader=TRUE,
				selectInput("routeName", "Route Name",
				choices=c("Route X", "Route Y", "Route Z"), multiple=FALSE, selectize=FALSE, width='100%')
			),		
			box(width=2, solidHeader=TRUE,
				selectInput("sectionName", "Section Name",
				choices=c("Section AA", "Section BB", "Section CC"), multiple=FALSE, selectize=FALSE, width='100%')
			),		
			box(width=4, solidHeader=TRUE,
				h4("The prompts come here")
			)
		)
	)