xgrab2db
=========
<em>xgrab is the exchange standard for adresses in Flanders. They contain a extract of the CRAB-database.
This XML-file contains all the relevant entities of crab. 
They allow the adres manager to update CRAB directly without using lara.
These tools convert a xgrab-xmlfile to a sqlite/spatialite database and back to xml 
Many GIS-tools support reading/writing spatialite like arcgis10.2 and QGIS and you can automate it using SQL scripts.
This allows you to combine with your local data or do large changes very quickly. </em>

Dependencies
-----
Python 2.7 is required to run the scripts.
The tool xgrab2spatialite.py requires [https://github.com/lokkju/pyspatialite](pyspatialite). 
The other tools use the build-in sqlite3 module.

The tool update_terrein_adrespositie requires pyspatialite and  python-gdal to read shapefiles.

You can run update_terrein_adrespositie.py and xgrab2spatialite.py in the osgeo4w-shell (download from http://trac.osgeo.org/osgeo4w/).

Part 1: xgrab2db, main functions
=====
These tools convert a xgrab-xmlfile to a sqlite/spatialite database and back to xml.

Spatialite files are filebased spatial databases. (like shapefiles but a lot better)
They can be viewed and edited both in qgis or arcgis 10.2. 

xgrab-files can only be downloaded by official adres-managers fromthe site: https://download.agiv.be/Producten/Detail?id=418&title=xGRAB

More info: https://www.agiv.be/producten/crab/x-grab-toepassingen

Convert xgrab to a spatialite database
----
The xgrab file can be converted to a spatialite database directly with xgrab2spatialite.py.

    xgrab2spatialite.py  xgrab.xml database.sqlite

Convert to a regular sqlite database 
----
If can't install the pyspatialite python module, you create a regular sqlite database. 

    xgrab2db.py xgrab.xml database.sqlite
    
You can use the [https://www.gaia-gis.it/fossil/spatialite-tools/index](spatialite commandline executable) convert this database to a spatial database.
     
    spatialite.exe database.sqlite < makeSpatial.sql
 
Convert back to xgrab xml
---
If you want send your changes back to AGIV, you need convert it back to XGRAB.

    db2xgrab.py database.sqlite xgrab.xml

Part 2: Validate and correct the db
====
 
The contents of the db can be corrected and validated using a sql script (in the sql folder):

they can by be executed using the commandline tool: spatialite of using the gui

**CORRECTION**
```Batchfile
spatialite xGRAB11002_20150204.sqlite correcties.sql 
```   
**VALIDATION**
```Batchfile
spatialite xGRAB11002_20150204.sqlite xgrabValidate_KW.sql
```    
--> this creates a extra table called *validatiefouten* that contains al records that aren't valid
    
Part 3: Method to update the xgrab-db with your own adres-data 
====
> in this case we will use the Anwerp GBKA ADRES data

Step 1: correction using koppeling:
---- 
--> Creation of a spatial view "geentTerreinKoppeling" on crab-db, that contains al addresses without a terrein koppeling 

```sql
-- create a regular view but with a geometry column
CREATE VIEW geenTerreinKoppeling AS
SELECT ADRESPOSITIES."SHAPE" AS shape, ADRESPOSITIES."ID" AS ADRESID,  
HUISNUMMERS."ID" AS HUISNUMMERID,
ADRESPOSITIES."X" AS X, ADRESPOSITIES."Y" AS Y, ADRESPOSITIES."HERKOMSTADRESPOSITIE",
HERKOMSTADRESPOSITIES."BESCHRIJVING" AS HERKOMST, HUISNUMMERS."HUISNUMMER" AS HUISNUMMER,
STRAATNAMEN."STRAATNAAM" AS STRAATNAAM, STRAATNAMEN."STRAATCODE" AS STRAATCODE, 
POSTKANTONCODES."POSTKANTONCODE" AS POSTCODE, 
'ANTWERPEN' AS GEMEENTE,  TERREINOBJECTEN."IDENTIFICATORTERREINOBJECT" AS PERCEEL

FROM "ADRESPOSITIES"
INNER JOIN "HUISNUMMERS"
	ON ADRESPOSITIES."ADRESID" = HUISNUMMERS."ID"

LEFT JOIN "STRAATNAMEN"
	ON HUISNUMMERS."STRAATNAAMID" = STRAATNAMEN."ID"

LEFT JOIN "POSTKANTONCODES"
	ON HUISNUMMERS."ID" = POSTKANTONCODES."HUISNUMMERID"

LEFT JOIN "HERKOMSTADRESPOSITIES"
	ON ADRESPOSITIES."HERKOMSTADRESPOSITIE" = HERKOMSTADRESPOSITIES."ID"

LEFT JOIN "TERREINOBJECT_HUISNUMMER_RELATIES"
    ON  ADRESPOSITIES."ADRESID" = TERREINOBJECT_HUISNUMMER_RELATIES."HUISNUMMERID"

LEFT JOIN "TERREINOBJECTEN"
    ON TERREINOBJECT_HUISNUMMER_RELATIES."TERREINOBJECTID" = TERREINOBJECTEN."ID"

WHERE TERREINOBJECT_HUISNUMMER_RELATIES."HUISNUMMERID" IS NULL;

--make the view a spatial view 
INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
  VALUES ('geenterreinkoppeling', 'shape', 'rowid', 'adresposities', 'shape', 0);
``` 

Step 2: create the shapefile that will be used as input for the update of the adresposities with your own data
----
With the Antwerp GBKA ADRESSEN.

-->Export the Building-points from the GBKA in the SDEDACTUA (the Antwerp database) with both addresses and streetnames join on it:

with this definition query:
```sql
SELECT * FROM SDEDACTUA.GEB WHERE
NOT( sdedactua.BASIS.G_GEP.OBJK = 'GEBO' OR sdedactua.BASIS.G_GEP.OBJK IS NULL ) 
AND ( sdedactua.BASIS.T_GEBOBJ.TYPL = 'h' AND  NOT sdedactua.BASIS.T_GEBOBJ.HNRK = 'O' )
``` 

--> Split housenumbers, 
many buildings in GBKA get multiple housenumbers using this notation: 
	
> 10-14 (= 10, 12, 14)
    
With the tool: *sso_adres_toolbox.py input_fc GBKA_ADRESSEN_split*  (arcgis)
    --> export with the name 'GBKA_ADRESSEN_split'

--> import shapefile into xgrab-db and if necessary delete the doubles     
```sql
DELETE FROM GBKA_ADRESSEN
WHERE ROWID NOT IN
(
   SELECT MIN(ROWID) FROM GBKA_ADRESSEN
   GROUP BY CAST( CRABCODE aS INTEGER), HUISNR
)
```
--> Attach view "geenTerreinKoppeling" on GBKA_ADRESSEN using this query:
```sql
SELECT DISTINCT
geenTerreinKoppeling.ADRESID AS ADRESID,
geenTerreinKoppeling.HUISNUMMERID AS HUISNR_ID,
geenTerreinKoppeling.HUISNUMMER as HUISNR, 
geenTerreinKoppeling.STRAATNAAM as straat, 
geenTerreinKoppeling.POSTCODE as postcode, 
GBKA_ADRESSEN.ENTK as ENTK, 
GBKA_ADRESSEN.OBJK as OBJK, 
GBKA_ADRESSEN.CRABCODE as CRABCODE, 
GBKA_ADRESSEN.SHAPE as SHAPE
FROM geenTerreinKoppeling
INNER JOIN  GBKA_ADRESSEN
	ON ( CAST( geenTerreinKoppeling.STRAAT_CRABCODE AS INTEGER ) = 
	     CAST( GBKA_ADRESSEN.CRABCODE AS INTEGER )
         AND  HUISNR  = geenTerreinKoppeling.HUISNUMMER 
        )
UNION
SELECT DISTINCT
geenTerreinKoppeling.ADRESID AS ADRESID,
geenTerreinKoppeling.HUISNUMMERID AS HUISNR_ID,
geenTerreinKoppeling.HUISNUMMER as HUISNR, 
geenTerreinKoppeling.STRAATNAAM as straat, 
geenTerreinKoppeling.POSTCODE as postcode, 
GBKA_ADRESSEN.ENTK as ENTK, 
GBKA_ADRESSEN.OBJK as OBJK, 
GBKA_ADRESSEN.CRABCODE as CRABCODE, 
GBKA_ADRESSEN.SHAPE as SHAPE
FROM geenTerreinKoppeling
INNER JOIN  GBKA_ADRESSEN        
    ON (  CAST( geenTerreinKoppeling.STRAAT_CRABCODE AS INTEGER ) = 
	      CAST( GBKA_ADRESSEN.CRABCODE AS INTEGER )
          AND NOT HUISNR  = geenTerreinKoppeling.HUISNUMMER 
          AND CAST( HUISNR AS INTEGER ) = CAST( geenTerreinKoppeling.HUISNUMMER AS INTEGER )
        ) 
```
--> Spatial join on CRAB-buildings (and optionally on capakey-parcels.) with QGIS of Arcgis

> OUTPUT SHAPEFILE: GBKA_join_geenTerrein_join_crabGebouw.shp


Idem for addresses with old terreinkoppeling, find where they where and join with new buildings.
load PERCEELHISTO Into the database and create the selection:

```sql
CREATE VIEW "geenTerreinKoppeling_join_perceelhisto" AS 
SELECT 
ADRESID,
HUISNUMMERID As HUISNR_ID,
HERKOMST,
PERCEEL_OF_GEBOUW AS PERCEEL, 
ST_CENTROID( PERCEELHISTO.shape ) AS SHAPE
 
FROM geenTerreinKoppeling

INNER JOIN PERCEELHISTO
	ON PERCEEL = PERCEELHISTO.capakey;

INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
VALUES ('geenterreinkoppeling_join_perceelhisto', 'shape', 'rowid', 'geenterreinkoppeling', 'shape', 0);
```

create a feature class from TERREINOBJECTEN and PERCEELHISTO:

```sql
CREATE VIEW "perceelhisto_join_tereinObj" AS 
SELECT ID AS TERREINOBJ, 
IDENTIFICATORTERREINOBJECT AS PERCEEL ,
TERREINOBJECTEN.BEGINDATUM,
PERCEELHISTO.SHAPE AS SHAPE
FROM TERREINOBJECTEN

INNER JOIN PERCEELHISTO
	ON PERCEELHISTO.capakey = PERCEEL

WHERE TERREINOBJECTEN.EINDDATUM IS NULL
AND AARDTERREINOBJECT = 1;

INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
VALUES ('perceelhisto_join_tereinObj', 'shape', 'rowid', 'terreinobjecten', 'shape', 0);
```

Step 3: update the xgrab-db
----
We have to do 2 things:
-->INSERT into TERREINOBJECT_HUISNUMMER_RELATIES all new terreinkoppellingen
```python 
cur.execute("""INSERT INTO TERREINOBJECT_HUISNUMMER_RELATIES
          (ID, TERREINOBJECTID , HUISNUMMERID, BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING )
          VALUES ( (SELECT MAX("ID")+ 1 FROM "TERREINOBJECT_HUISNUMMER_RELATIES"),
          ?, ?, date('now'), 1, 1) ;""", (TERREINOBJECTID , HUISNUMMERID))
```
-->UPDATE X en Y op ADRESPOSITIES with their correct location
```python 
cur.execute("""UPDATE ADRESPOSITIES
           SET X=?, Y=?, BEGINORGANISATIE=1, BEGINBEWERKING=3,
           HERKOMSTADRESPOSITIE=? WHERE ID=? ;""", (X, Y, herkomst, ADRESID))
```
These queries are executed for every record in the shapefile with the python script: update_terrein_adrespositie.py
This script uses the gdal-python bindings and pyspatialite, so run it in the osgeo4w-shell.

```Batchfile
python update_terrein_adrespositie.py xGRAB11002_20150218.sqlite GBKA_join_geenTerrein_join_crabGebouw.shp
```

Summary
=======

```Batchfile
xgrab2spatialite.py xgrab.xml xgrab.sqlite
spatialite xgrab.sqlite < correcties.sql
spatialite xgrab.sqlite <  geenTerreinKoppeling.sql
spatialite_tool -i -shp SHP\GBKA_ADRESSEN_Split -t GBKA_ADRESSEN -g SHAPE -c CP1252 -s 31370 -d xgrab.sqlite 
spatialite_tool -i -shp SHP\WOONEENHEID2015 -t WOONEENHEID2015 -g SHAPE -c CP1252 -s 31370 -d xgrab.sqlite 
spatialite_tool -i -shp SHP\PERCEELHISTO -t PERCEELHISTO -g SHAPE -c CP1252 -s 31370 -d xgrab.sqlite 
spatialite xgrab.sqlite < geenTerreinKoppeling_join_WE_GBKA.sql
```

... create a spatial joined table on CRAB-buildings ... in qgis/arcgis, output= GBKA_join_geenTerrein_join_crabGebouw.shp
... idem for parcels

```Batchfile
update_terrein_adrespositie.py xgrab.sqlite GBKA_join_geenTerrein_join_crabGebouw.shp 3 
update_terrein_adrespositie.py xgrab.sqlite GBKA_join_geenTerrein_join_crabPerceel.shp 2
spatialite xgrab.sqlite <  correcties.sql
spatialite xgrab.sqlite <  xgrabValidate_KW.sql
db2xgrab.py xgrab.sqlite xgrab_out.xml
```
