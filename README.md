xgrab2db
========

xgrab is the exchange standard for adressen in Flanders. They contain a extract of the CRAB-database.
This XML-file contains all the relevant entities of crab. 
They allow the adres manager to modify CRAB directly without using lara.

Some tools to convert a xgrab-file to a sqlite/spatialite db and back to xml.
Spatialite files are file based spatial databases. 
They can be viewed and edited in qgis or arcgis 10.2. 

xgrab-files can only be downloaded by official adres-managers fromthe site: <a href="https://download.agiv.be/Producten/Detail?id=418&title=xGRAB" target="_blank">https://download.agiv.be/Producten/Detail?id=418</a>.

More info: <a href="https://www.agiv.be/producten/crab/x-grab-toepassingen" target="_blank">https://www.agiv.be/producten/crab/x-grab-toepassingen</a>

##Dependencies
Python 2.7 is required to run the scripts.
The tool xgrab2spatialite.py requires <a href="https://github.com/lokkju/pyspatialite" target="_blank">pyspatialite</a>. The other tools use the build-in sqlite3 module.

##Convert xgrab to a spatialite database
The xgrab file can be converted to a spatialite database directly with xgrab2spatialite.py.

    xgrab2spatialite.py  xgrab.xml database.sqlite

##Convert to a regular sqlite database 
If can't install the pyspatialite python module, you create a regular sqlite database. 

    xgrab2db.py xgrab.xml database.sqlite
    
You can use the <a href="https://www.gaia-gis.it/fossil/spatialite-tools/index" target="_blank">spatialite commandline executable</a> convert this database to spatial database.
    
    spatialite.exe database.sqlite < makeSpatial.sql
 
##Convert back to xgrab xml
If you want send your changes back to AGIV, you need convert it back to XGRAB.

    db2xgrab.py database.sqlite xgrab.xml


