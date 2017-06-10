page1 <- dashboardBody(
	fluidRow(
		column(width=12,
			box(width=2, solidHeader=TRUE,
				selectInput("studyArea", "Study Area",
				choices=c("Study Area 1", "Study Area 2", "Study Area 3"), multiple=FALSE, selectize=FALSE, width='100%'),
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
	),
	fluidRow(
		column(width = 6,
			box(width=NULL, solidHeader=TRUE,
				#p(class="",paste("Total Delay (in Veh Hr)")),
				h4("Total Delay (in Veh Hr)"),
				plotOutput("level1.bullet1", height="80")
			),
			box(width=NULL, solidHeader=TRUE,
				#p(class="",paste("Average Delay (in Minutes)")),
				h4("Average Delay (in Minutes)"),
				plotOutput("level1.bullet2", height="80")
			),
			box(width=NULL, solidHeader=TRUE,
				#p(class="",paste("Percentage of Network in LOS D or higher during AM Peak")),
				h4("Percentage of Network in LOS D or higher during AM Peak"),
				plotOutput("level1.bullet3", height="80")
			),
			box(width=NULL, solidHeader=TRUE,
				#p(class="",paste("Travel Time Index")),
				h4("Travel Time Index"),
				plotOutput("level1.bullet4", height="80")
			),
			box(width=NULL, solidHeader=TRUE,
				# p(class="",paste("Planning Time Index")),
				h4("Planning Time Index"),
				plotOutput("level1.bullet5", height="80")
			)
		),
		column(width=6,
			box(width=NULL, status="warning",
				leafletOutput("studyAreaMap",height= 750),
				p(
					class="text-muted",
					paste("The map comes here")
				)
			)
		)
	)
)