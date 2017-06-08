cd ..
mkdir -p data
cd data
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/Routes.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/airports.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/cities.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/counties.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/highways.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/hydrology.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/lakes.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/LocalRoads.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/MajorRoads.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/Mileposts.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/NoxiousWeeds.zip
wget -nc http://dtdapps.coloradodot.info/StaticData/Downloads/StateGeoData/PWQ_Schema_Blank.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/railroads.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/Routes.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/StateGeoData/streams.zip
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/TrafficDataBase/cdot_traffic.xls
# 203837, 103498, 100391, 
wget -nc http://dtdapps.coloradodot.info/staticdata/Downloads/TrafficDataBase/cdot_traffic.xlsx
wget -nv http://dtdapps.coloradodot.info/otis/API/TRANSYS/GetTrafficStationsByFips/64255/null/true/true.csv -O TrafficStations.csv
for i in $( awk -F "\"*,\"*" '{print $4}' TrafficStations.csv ); do
	echo item: $i
	wget -nc http://dtdapps.coloradodot.info/otis/API/TRANSYS/GetDailyTrafficVolumeForStationByDay/$i/false/2015-7-7.csv -O $i-07-07-2015.csv
	wget -nc http://dtdapps.coloradodot.info/otis/API/TRANSYS/GetDailyTrafficVolumeForStationByDay/$i/false/2015-7-8.csv -O $i-08-07-2015.csv
done


