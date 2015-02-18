1 xgrab2db
========

xgrab is the exchange standard for adressen in Flanders. They contain a extract of the CRAB-database.
This XML-file contains all the relevant entities of crab. 
They allow the adres manager to modify CRAB directly without using lara.

These tools convert a xgrab-xmlfile to a sqlite/spatialite database and back to xml.

Spatialite files are filebased spatial databases. (like shapefiles but a lot better)
They can be viewed and edited in qgis or arcgis 10.2. 

xgrab-files can only be downloaded by official adres-managers fromthe site: <a href="https://download.agiv.be/Producten/Detail?id=418&title=xGRAB" target="_blank">https://download.agiv.be/Producten/Detail?id=418</a>.

More info: <a href="https://www.agiv.be/producten/crab/x-grab-toepassingen" target="_blank">https://www.agiv.be/producten/crab/x-grab-toepassingen</a>

Dependencies
---
Python 2.7 is required to run the scripts.
The tool xgrab2spatialite.py requires <a href="https://github.com/lokkju/pyspatialite" target="_blank">pyspatialite</a>. 
The other tools use the build-in sqlite3 module.

The tool update_terrein_adrespositie requires pyspatialite and  python-gdal to read shapefiles.



Convert xgrab to a spatialite database
----
The xgrab file can be converted to a spatialite database directly with xgrab2spatialite.py.

    xgrab2spatialite.py  xgrab.xml database.sqlite

Convert to a regular sqlite database 
----
If can't install the pyspatialite python module, you create a regular sqlite database. 

    xgrab2db.py xgrab.xml database.sqlite
    
You can use the <a href="https://www.gaia-gis.it/fossil/spatialite-tools/index" target="_blank">spatialite commandline executable</a> convert this database to a spatial database.
     
    spatialite.exe database.sqlite < makeSpatial.sql
 
Convert back to xgrab xml
---
If you want send your changes back to AGIV, you need convert it back to XGRAB.

    db2xgrab.py database.sqlite xgrab.xml


2 Werkwijze updaten van de xgrab-db met eigen adressen: 
====
Stap 1: correctie via koppeling:
---- 
--> Aanmaak spatial view "geentTerreinKoppeling" op crab-db.

```sql
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

--creëer de spatial view 
INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
  VALUES ('geenterreinkoppeling', 'shape', 'rowid', 'adresposities', 'shape', 0);
``` 

Stap 2: creëer de koppelings shapefile tussen eigen adresposities and CRAB
----
In dit geval met Antwerpse GBKA ADRESSEN.

-->Export GEBOUW-punten uit SDEDACTUA met adresposities+straatnamen gejoined erop:
    -->Met volgende definition query:

```sql
NOT( sdedactua.BASIS.G_GEP.OBJK = 'GEBO' OR sdedactua.BASIS.G_GEP.OBJK IS NULL ) 
AND ( sdedactua.BASIS.T_GEBOBJ.TYPL = 'h' AND  NOT sdedactua.BASIS.T_GEBOBJ.HNRK = 'O' )
``` 

--> Splitten van huisnummers, 
veel gebouwen in gbka krijgen meerdere huisnummers op basis van de notatie: 
	
	- 10-14 (= 10, 12, 14)
	- 12, 15 ,16
    
Met de tool: *sso_adres_toolbox.py input_fc GBKA_ADRESSEN_split*
    --> export onder naam 'GBKA_ADRESSEN_split'

--> Koppeling view "geenTerreinKoppeling" aan GBKA_ADRESSEN.

```sql
SELECT 
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
SELECT 
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
--> Spatial join op CRAB-gebouwen (en eventueel ook op capakey-percelen.) met QGIS of Arcgis
> SHAPEFILE: GBKA_join_geenTerrein_join_crabGebouw.shp

Stap 3: update de  xgrab-db
----

-->INSERT into TERREINOBJECT_HUISNUMMER_RELATIES alle nieuwe terreinkoppellingen
-->UPDATE X en Y op ADRESPOSITIES met correcte locatie
Met python script: update_terrein_adrespositie.py

> update_terrein_adrespositie.py xGRAB11002_20150218.sqlite GBKA_join_geenTerrein_join_crabGebouw.shp
