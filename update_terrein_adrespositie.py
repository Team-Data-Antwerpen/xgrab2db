#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Update the location of a adrespositie and and add a terrein koppeling using a shapeFile

import os, sys, codecs, datetime, argparse
import osgeo.ogr as ogr
from pyspatialite import dbapi2 as sqlite3 #import sqlite3

def updateTerrein(cur, TERREINOBJECTID , HUISNUMMERID):
    cur.execute("""INSERT INTO TERREINOBJECT_HUISNUMMER_RELATIES
          (ID, TERREINOBJECTID , HUISNUMMERID, BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING )
          VALUES ( (SELECT MAX("ID")+ 1 FROM "TERREINOBJECT_HUISNUMMER_RELATIES"),
          ?, ?, date('now'), 1, 1) ;""", (TERREINOBJECTID , HUISNUMMERID))

def updateAdresPosistie(cur, X , Y , herkomst, ADRESID ):
    'herkomst: 2= perceel, 3= gebouw'
    cur.execute("""UPDATE ADRESPOSITIES
                 SET X=?, Y=?, BEGINORGANISATIE=1, BEGINBEWERKING=3,
                 HERKOMSTADRESPOSITIE=? WHERE ID=? ;""", (X, Y, herkomst, ADRESID))

def readShape( shapefile, xgrabDB ):
    driver = ogr.GetDriverByName("ESRI Shapefile")
    dataSource = driver.Open(shapefile, 0)
    layer = dataSource.GetLayer(0)

    con = sqlite3.connect( xgrabDB )
    with con:
        cur = con.cursor()    
        
        for feature in layer:
            geom = feature.GetGeometryRef()
            adresID = feature.GetFieldAsInteger("ADRESID")
            terreinID = feature.GetFieldAsInteger("TERREINOBJ")
            huisnrID = feature.GetFieldAsInteger("HUISNR_ID")
            X, Y = ( geom.GetX() , geom.GetY() )
            updateAdresPosistie(cur, X, Y, 3, adresID)
            updateTerrein(cur, terreinID , huisnrID)
        
        con.commit()
    
    if con:
        con.close()
        
def main():
    readShape(args.shapeFile, args.xgrabDB)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='update adresposities in a xgrab-db using a shapefile, requires spatialite and gdal-python')
    parser.add_argument('xgrabDB', help='The input database (.sqlite)' , 
                         default=r'C:\work\xgrab\deel2methode\xGRAB11002_20150204.sqlite')
    parser.add_argument('shapeFile', help='The path to the shapefile, has a TERREINOBJ, HUISNR_ID and adresID', 
                         default=r'C:\work\xgrab\deel2methode\SHP\GBKA_join_geenTerrein_join_crabGebouw.shp')
    args = parser.parse_args()

    main()
