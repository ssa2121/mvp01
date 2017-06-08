sudo add-apt-repository ppa:marutter/rrutter
sudo apt-get install apt-file
sudo apt-get update
sudo apt full-upgrade
sudo apt-get install libgdal1h
sudo apt-get install libgdal1-dev libproj-dev
sudo R -e 'install.packages(c("rgdal", "rgeos", "ggmap", "maptools","shiny"), lib="/usr/local/lib/R/site-library", repos="http://cran.utstat.utoronto.ca/")'
sudo R -e 'install.packages(c("shinydashboard","leaflet","plotly","jsonlite","dplyr"), lib="/usr/local/lib/R/site-library", repos="http://cran.ustat.utoronto.ca/")'



