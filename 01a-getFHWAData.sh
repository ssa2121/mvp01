cd ../../data
mkdir -p nbi
cd nbi
for i in `seq 10 16`;
	do 
		wget -nc https://www.fhwa.dot.gov/bridge/nbi/20${i}/delimited/CO${i}.txt
	done
for i in `seq 0 9`;
	do 
		wget -nc https://www.fhwa.dot.gov/bridge/nbi/200${i}del.zip
	done
cd ..
mkdir -p hpms
cd hpms
for i in `seq 10 17`;
	do
		wget -nc https://www.fhwa.dot.gov/policyinformation/hpms/shapefiles/colorado20${i}.zip
		unzip colorado20${i}.zip
	done

