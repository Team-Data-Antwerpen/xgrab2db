#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
from pyspatialite import dbapi2 as db
import os, sys, argparse
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
       makeSpatialite(con)
    elif os.path.exists( xgrabDB ) and ( args.update == True ) :
       con = sqlite3.Connection(xgrabDB)    
       xgrab = xgrab2db( xgrabPath, con)
       xgrab.updateAll()
    else:
       raise Exception("database does not exist: %s " % xgrabDB )


  finally:
    if con: con.close()

def makeSpatialite(Connection):
    with Connection as con:
      print "started making spatial"
      shapes ="""BEGIN TRANSACTION;
              SELECT InitSpatialMetaData();
              SELECT AddGeometryColumn('WEGVERBINDINGGEOMETRIEN','SHAPE',31370, 'LINESTRING' );
              UPDATE WEGVERBINDINGGEOMETRIEN SET "SHAPE"= SetSRID( GeomFromGML( "WEGVERBINDINGGEOMETRIE" ), 31370 );
              SELECT AddGeometryColumn( 'GEBOUWGEOMETRIEN',  'SHAPE', 31370, 'POLYGON' );
              UPDATE GEBOUWGEOMETRIEN SET "SHAPE"= SetSRID( GeomFromGML( "GEBOUWGEOMETRIE" ), 31370 );
              SELECT AddGeometryColumn( 'ADRESPOSITIES', 'SHAPE',31370, 'POINT');
              UPDATE ADRESPOSITIES SET "SHAPE"= MakePoint( "X", "Y", 31370);
              COMMIT; """
      trigger = """BEGIN TRANSACTION;
                  CREATE TRIGGER ADRESPOSITIES_UPDATE_XY AFTER UPDATE OF "SHAPE" ON ADRESPOSITIES
                  BEGIN
                    UPDATE ADRESPOSITIES 
                    SET "X"= X( "SHAPE" ), Y= "Y"( "SHAPE" )
                    WHERE ID = old.ID;
                  END;
                  CREATE TRIGGER ADRESPOSITIES_UPDATE_XSHAPE AFTER UPDATE OF "X" ON ADRESPOSITIES
                  BEGIN
                    UPDATE ADRESPOSITIES 
                    SET SHAPE = MakePoint( "X", "Y", 31370)
                    WHERE ID = old.ID;
                  END;
                  CREATE TRIGGER ADRESPOSITIES_UPDATE_YSHAPE AFTER UPDATE OF "Y" ON ADRESPOSITIES
                  BEGIN
                    UPDATE ADRESPOSITIES 
                    SET SHAPE = MakePoint( "X", "Y", 31370)
                    WHERE ID = old.ID;
                  END;
                  CREATE TRIGGER WEGVERBINDINGGEOMETRIEN_UPDATE_GEOM AFTER UPDATE OF "SHAPE" ON WEGVERBINDINGGEOMETRIEN
                  BEGIN
                    UPDATE WEGVERBINDINGGEOMETRIEN 
                    SET "WEGVERBINDINGGEOMETRIE" = AsGml( "SHAPE" )
                    WHERE ID = old.ID;
                  END;
                  CREATE TRIGGER GEBOUWGEOMETRIEN_UPDATE_GEOM AFTER UPDATE OF "SHAPE" ON GEBOUWGEOMETRIEN
                  BEGIN
                    UPDATE GEBOUWGEOMETRIEN 
                    SET "GEBOUWGEOMETRIE" = AsGml( "SHAPE" )
                    WHERE ID = old.ID;
                  END;
                  COMMIT;"""

      con.executescript(shapes)
      con.commit()
      con.executescript(trigger)
      con.commit()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a sqlite database from a xGRAB-file')
    parser.add_argument('xgrabPath', help='The path to the xGRAB-file')
    parser.add_argument('xgrabDB', help='The output database (.sqlite)')
    parser.add_argument('--update', const=True, default=False,  dest='update', action='store_const', 
              help='use a xGRAB diff to update a existing database, instead of overwriting it')

    args = parser.parse_args()
    
    main()