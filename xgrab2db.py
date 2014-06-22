#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import os, sys, sqlite3, argparse
from xgrablib import *

def main():
  xgrabPath = args.xgrabPath
  xgrabDB =   args.xgrabDB
  con = None

  try:
    if args.update == False:
       if os.path.exists( xgrabDB ): os.remove(xgrabDB)
       con = sqlite3.Connection(xgrabDB)
       xgrab = xgrab2db( xgrabPath, con)
       xgrab.createAll()
    elif os.path.exists( xgrabDB ) and ( args.update == True ) :
       con = sqlite3.Connection(xgrabDB)	
       xgrab = xgrab2db( xgrabPath, con)
       xgrab.updateAll()
    else:
      raise Exception("database does not exist: %s " % xgrabDB )

  finally:
    if con: con.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a sqlite database from a xGRAB-file')
    parser.add_argument('xgrabPath', help='The path to the xGRAB-file')
    parser.add_argument('xgrabDB', help='The output database (.sqlite)')
    parser.add_argument('--update', const=True, default=False,  dest='update', action='store_const', 
              help='use a xGRAB diff to update a existing database, instead of overwriting it')
    args = parser.parse_args()
      
    main()



### Voorbeeld SQL: join adresposities op huisnummers, straatnamen, postcode en herkomst ###
##SELECT ADRESPOSITIES."ID", MakePoint(  ADRESPOSITIES."X", ADRESPOSITIES."Y") AS SHAPE, HERKOMSTADRESPOSITIES."BESCHRIJVING" AS TYPE, HUISNUMMERS."HUISNUMMER",
##STRAATNAMEN."STRAATNAAM", POSTKANTONCODES."POSTKANTONCODE" AS PC, 'ANTWERPEN' AS GEMEENTE
##FROM "ADRESPOSITIES"
##INNER JOIN "HUISNUMMERS"
	##ON ADRESPOSITIES."ADRESID" = HUISNUMMERS."ID"

##LEFT JOIN "STRAATNAMEN"
	##ON HUISNUMMERS."STRAATNAAMID" = STRAATNAMEN."ID"

##LEFT JOIN "POSTKANTONCODES"
	##ON HUISNUMMERS."ID" = POSTKANTONCODES."HUISNUMMERID"

##LEFT JOIN "HERKOMSTADRESPOSITIES"
	##ON ADRESPOSITIES."HERKOMSTADRESPOSITIE" = HERKOMSTADRESPOSITIES."ID"

##ORDER BY STRAATNAMEN."STRAATNAAM", TYPE

# SELECT load_extension('libspatialite-4.dll');
# SELECT InitSpatialMetaData();

### MAKE Columns spatial ###
## SELECT InitSpatialMetaData();
## SELECT AddGeometryColumn('WEGVERBINDINGGEOMETRIEN','SHAPE',31370, 'LINESTRING' );
## UPDATE WEGVERBINDINGGEOMETRIEN SET "SHAPE"= SetSRID( GeomFromGML( "WEGVERBINDINGGEOMETRIE" ), 31370 );
##
## SELECT AddGeometryColumn( 'GEBOUWGEOMETRIEN',  'SHAPE', 31370, 'POLYGON' );
## UPDATE GEBOUWGEOMETRIEN SET "SHAPE"= SetSRID( GeomFromGML( "GEBOUWGEOMETRIE" ), 31370 );
##
## SELECT AddGeometryColumn( 'ADRESPOSITIES', 'SHAPE',31370, 'POINT');
## UPDATE ADRESPOSITIES SET "SHAPE"= MakePoint( "X", "Y", 31370);
