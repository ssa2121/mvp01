library(rgdal)

shpFilePath="C:/Work/Transportation/ColoradoDOT/Traffic/analysis/data/SHP/STATEWIDE"

convert.wgs84 <- function(shpFilePath,shpFileName, writeFile) {
    ogrInfo(shpFilePath,shpFileName)
    orig.shp <- readOGR(shpFilePath,shpFileName)
    CRS.old <- proj4string(orig.shp)
    print(paste("The old CRS for ",shpFileName," is ",CRS.old))
    CRS.new <- CRS("+init=epsg:4326")
    wgs84.shp <- spTransform(orig.shp, CRS.new)
    if( writeFile) {
        new.filename <- paste(shpFileName,"_WGS84",sep="")
        td <- file.path(shpFilePath)
        writeOGR(wgs84.shp, td, new.filename, driver="ESRI Shapefile")
    }
    print(paste("The new CRS for ",shpFileName," is ",proj4string(wgs84.shp)))
    plot(wgs84.shp, axes=TRUE, border="gray")
    return(wgs84.shp)
}
ls()
writeFile <- FALSE
major.rds <- convert.wgs84(shpFilePath, "MAJOR_ROADS", writeFile)
local.rds <- convert.wgs84(shpFilePath, "LOCAL_ROADS", writeFile)
counties <- convert.wgs84(shpFilePath, "COUNTIES", writeFile)
cities <- convert.wgs84(shpFilePath, "CITIES", writeFile)
routes <- convert.wgs84(shpFilePath, "ROUTES", writeFile)
ls()
gsprings <- cities[which(cities$CITY_NAME=="GLENWOOD SPRINGS"),]
gs.major <- major.rds[gsprings,]
gs.local <- local.rds[gsprings,]
gs.routes <- routes[gsprings,]