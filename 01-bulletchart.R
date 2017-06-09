bullet.graph <- function(bg.data){
  
  # compute max and half for the ticks and labels
  max.bg <- max(bg.data$high)
  mid.bg <- max.bg / 2

  gg <- ggplot(bg.data) 
  gg <- gg + geom_bar(aes(measure, high),  fill="#eeeeee", stat="identity", width=0.5, alpha=0.2) 
  gg <- gg + geom_bar(aes(measure, mean),  fill="#dddddd", stat="identity", width=0.5, alpha=0.2) 
  gg <- gg + geom_bar(aes(measure, low),   fill="#cccccc", stat="identity", width=0.5, alpha=0.2) 
  gg <- gg + geom_bar(aes(measure, value), fill="#4682b4",  stat="identity", width=0.2) 
  gg <- gg + geom_errorbar(aes(y=target, x=measure, ymin=target, ymax=target), color="black", width=0.45) 
  # gg <- gg + geom_point(aes(measure, target), colour="black", size=2.5) 
  gg <- gg + scale_y_continuous(breaks=seq(0,max.bg,mid.bg))
  gg <- gg + coord_flip()
  gg <- gg + theme(axis.text.x=element_text(size=10),
                   axis.title.x=element_blank(),
                   axis.line.y=element_blank(), 
                   axis.text.y=element_text(hjust=1, color="black"), 
                   axis.ticks.y=element_blank(),
                   axis.title.y=element_blank(),
                   legend.position="none",
                   panel.background=element_blank(), 
                   panel.border=element_blank(),
                   panel.grid.major=element_blank(),
                   panel.grid.minor=element_blank(),
                   plot.background=element_blank())

  return(gg)

}

# test it out!

# 5/1 seems to be a good ratio for individual bullet graphs but you
# can change it up to fit your dashboard needs


# incidents.pct <- data.frame(
#  measure=c("Total Events (%)", "Security Events (%)", "Filtered (%)", "Tickets (%)"),
#  high=c(100,100,100,100),
#  mean=c(45,40,50,30),
#  low=c(25,20,10,5), 
#  target=c(55,40,45,35),
#  value=c(50,45,60,25)
# )

# incidents.pct.bg <- bullet.graph(incidents.pct)
# incidents.pct.bg

# ggsave("incident-total-events-pct.pdf", incidents.pct.bg, width=10, height=5)

