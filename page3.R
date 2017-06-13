# Original: 9th June 2017 by Shourya Shukla
# Last update: 9th June 2017 by Shourya Shukla

page3 <- dashboardBody(
	fluidRow(
		column(width=12,
			box(width=NULL, solidHeader=TRUE,
				h4("This is page 3")
			)
		)
	)
	#,
	# fluidRow(
	# 	column(width = 6,
	# 		box(width=NULL, solidHeader=TRUE,
	# 			#p(class="",paste("Total Delay (in Veh Hr)")),
	# 			h4("Total Delay (in Veh Hr)"),
	# 			plotOutput("level1.bullet1", height="80")
	# 		),
	# 		box(width=NULL, solidHeader=TRUE,
	# 			#p(class="",paste("Average Delay (in Minutes)")),
	# 			h4("Average Delay (in Minutes)"),
	# 			plotOutput("level1.bullet2", height="80")
	# 		),
	# 		box(width=NULL, solidHeader=TRUE,
	# 			#p(class="",paste("Percentage of Network in LOS D or higher during AM Peak")),
	# 			h4("Percentage of Network in LOS D or higher during AM Peak"),
	# 			plotOutput("level1.bullet3", height="80")
	# 		),
	# 		box(width=NULL, solidHeader=TRUE,
	# 			#p(class="",paste("Travel Time Index")),
	# 			h4("Travel Time Index"),
	# 			plotOutput("level1.bullet4", height="80")
	# 		),
	# 		box(width=NULL, solidHeader=TRUE,
	# 			# p(class="",paste("Planning Time Index")),
	# 			h4("Planning Time Index"),
	# 			plotOutput("level1.bullet5", height="80")
	# 		)
	# 	),
	# 	column(width=6,
	# 		box(width=NULL, status="warning",
	# 			leafletOutput("studyAreaMap",height= 750),
	# 			p(
	# 				class="text-muted",
	# 				paste("The map comes here")
	# 			)
	# 		)
	# 	)
	# )
)