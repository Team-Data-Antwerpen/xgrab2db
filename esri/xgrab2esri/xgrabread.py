# -*- coding: UTF-8 -*-
#-------------------------------------------------------------------------------
# Name:        xgrablib.py
# Purpose:     Create a sqlite database from a xGRAB-file and the other way
#              around.
# Author:      Kay Warrie
#
# Created:     28/04/2014
# Copyright:   (c) Kay Warrie 2014
# Licence:     MIT
#-------------------------------------------------------------------------------
import os, sys, codecs, datetime
import xml.etree.cElementTree as etree
import arcpy
from _helpers import *
etree.register_namespace("gml","http://www.opengis.net/gml")
etree.register_namespace("","http://crab.agiv.be")

arcpy.env.overwriteOutput = True

class xgrab2geodb:
    def __init__(self, xgrabPath , geoDB ):
        xmlGrab = etree.parse(xgrabPath)
        self.rootgrab = xmlGrab.getroot()
        self.components = self.rootgrab.find("{http://crab.agiv.be}COMPONENTEN")
        self.geoDB = geoDB

    def createAll(self):
        self.STRAATNAMEN(False)
        self.STRAATNAAMSTATUSSEN(False)
        self.HUISNUMMERS(False)
        self.HUISNUMMERSTATUSSEN(False)
        self.POSTKANTONCODES(False)
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES(False)
        self.TERREINOBJECT_HUISNUMMER_RELATIES(False)
        self.TERREINOBJECTEN(False, [2,3,5,99])
        self.GEBOUWSTATUSSEN(False)
        self.GEBOUWGEOMETRIEN(False)
        # self.ADRESPOSITIES()

    def STRAATNAMEN(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}STRAATNAMEN")

        createTbl(self.geoDB, "STRAATNAMEN",
            [field("ID","LONG"),
             field("STRAATCODE","LONG"),
             field("NISGEMEENTECODE","LONG"),
             field("STRAATNAAM","TEXT"),
             field("TAALCODESTRAATNAAM","TEXT", 10),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])

        curs = arcpy.da.InsertCursor( self.geoDB + "\\STRAATNAMEN",
               ("ID","STRAATCODE", "NISGEMEENTECODE", "STRAATNAAM", "TAALCODESTRAATNAAM",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATCODE =  row.find("{http://crab.agiv.be}STRAATCODE").text
          NISGEMEENTECODE = row.find("{http://crab.agiv.be}NISGEMEENTECODE").text
          STRAATNAAM = row.find("{http://crab.agiv.be}STRAATNAAM").text
          TAALCODESTRAATNAAM = row.find("{http://crab.agiv.be}TAALCODESTRAATNAAM").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID,STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID,STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def STRAATNAAMSTATUSSEN(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}STRAATNAAMSTATUSSEN")

        createTbl(self.geoDB, "STRAATNAAMSTATUSSEN",
            [field("ID","LONG"),
             field("STRAATNAAMID","LONG"),
             field("STRAATNAAMSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\" + "STRAATNAAMSTATUSSEN",
               ("ID","STRAATNAAMID", "STRAATNAAMSTATUS",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID =  row.find("{http://crab.agiv.be}STRAATNAAMID").text
          STRAATNAAMSTATUS = row.find("{http://crab.agiv.be}STRAATNAAMSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID,STRAATNAAMID, STRAATNAAMSTATUS,
                 BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID,STRAATNAAMID, STRAATNAAMSTATUS,
                 BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def HUISNUMMERS(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}HUISNUMMERS")

        createTbl(self.geoDB, "HUISNUMMERS",
            [field("ID","LONG"),
             field("STRAATNAAMID","LONG"),
             field("HUISNUMMER","TEXT", 64),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "HUISNUMMERS",
               ("ID","STRAATNAAMID", "HUISNUMMER",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          HUISNUMMER =  row.find("{http://crab.agiv.be}HUISNUMMER").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, STRAATNAAMID, HUISNUMMER,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, STRAATNAAMID, HUISNUMMER,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def HUISNUMMERSTATUSSEN(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}HUISNUMMERSTATUSSEN")

        createTbl(self.geoDB, "HUISNUMMERSTATUSSEN",
            [field("ID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("HUISNUMMERSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "HUISNUMMERSTATUSSEN",
               ("ID","HUISNUMMERID", "HUISNUMMERSTATUS",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          HUISNUMMERSTATUS = row.find("{http://crab.agiv.be}HUISNUMMERSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and  EINDDATUM == None:
            curs.insertRow((ID, HUISNUMMERID, HUISNUMMERSTATUS,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, HUISNUMMERID, HUISNUMMERSTATUS,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def POSTKANTONCODES(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}POSTKANTONCODES")

        createTbl(self.geoDB, "POSTKANTONCODES",
            [field("ID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("POSTKANTONCODE","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "POSTKANTONCODES",
               ("ID", "HUISNUMMERID", "POSTKANTONCODE",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
          POSTKANTONCODE = row.find("{http://crab.agiv.be}POSTKANTONCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, HUISNUMMERID, POSTKANTONCODE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, HUISNUMMERID, POSTKANTONCODE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def RRSTRAATNAAM_STRAATNAAM_RELATIES(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}RRSTRAATNAAM_STRAATNAAM_RELATIES")

        createTbl(self.geoDB, "RRSTRAATNAAM_STRAATNAAM_RELATIES",
            [field("ID","LONG"),
             field("STRAATNAAMID","LONG"),
             field("SUBKANTONCODE","TEXT", 24),
             field("RRSTRAATCODE","TEXT", 128),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "RRSTRAATNAAM_STRAATNAAM_RELATIES",
               ("ID", "STRAATNAAMID", "SUBKANTONCODE", "RRSTRAATCODE",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
          RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def TERREINOBJECT_HUISNUMMER_RELATIES(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}TERREINOBJECT_HUISNUMMER_RELATIES")

        createTbl(self.geoDB, "TERREINOBJECT_HUISNUMMER_RELATIES",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "TERREINOBJECT_HUISNUMMER_RELATIES",
               ("ID", "TERREINOBJECTID", "HUISNUMMERID",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, TERREINOBJECTID, HUISNUMMERID,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, TERREINOBJECTID, HUISNUMMERID,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def TERREINOBJECTEN(self, includeEndDates=True, aardAllowed=[1,2,3,4,5,99]):
        """	aardAllowed=  1: kadastraal perceel
                    2: GRB gebouw
                    3: GRB kunstwerk
                    4: GRB administratief perceel
                    5: gebouw volgens de gemeente
                    99: andere """
        rows = self.components.find("{http://crab.agiv.be}TERREINOBJECTEN")

        createTbl(self.geoDB, "TERREINOBJECTEN",
            [field("ID","LONG"),
             field("IDENTIFICATORTERREINOBJECT","TEXT"),
             field("AARDTERREINOBJECT","LONG"),
             field("AARDGEBOUW","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "TERREINOBJECTEN",
           ("ID", "IDENTIFICATORTERREINOBJECT", "AARDTERREINOBJECT", "AARDGEBOUW",
            "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          IDENTIFICATORTERREINOBJECT = row.find("{http://crab.agiv.be}IDENTIFICATORTERREINOBJECT").text
          AARDTERREINOBJECT = row.find("{http://crab.agiv.be}AARDTERREINOBJECT").text

          #aardgeobouw = double node, sometimes NULL!
          AARDGEBOUWnode = row.find( "{http://crab.agiv.be}GEBOUW/{http://crab.agiv.be}AARDGEBOUW" )
          if AARDGEBOUWnode != None: AARDGEBOUW = AARDGEBOUWnode.text
          else: AARDGEBOUW = None

          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None and int(AARDTERREINOBJECT) in aardAllowed:
              curs.insertRow((ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, AARDGEBOUW,
                    BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
              curs.insertRow((ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, AARDGEBOUW,
                    BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def GEBOUWSTATUSSEN(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}GEBOUWSTATUSSEN")

        createTbl(self.geoDB, "GEBOUWSTATUSSEN",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("GEBOUWSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "GEBOUWSTATUSSEN",
           ("ID", "TERREINOBJECTID", "GEBOUWSTATUS",
            "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          GEBOUWSTATUS = row.find("{http://crab.agiv.be}GEBOUWSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, TERREINOBJECTID, GEBOUWSTATUS,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))
          elif includeEndDates:
            curs.insertRow((ID, TERREINOBJECTID, GEBOUWSTATUS,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM ))

        del curs

    def GEBOUWGEOMETRIEN(self, includeEndDates=True):
        rows = self.components.find("{http://crab.agiv.be}GEBOUWGEOMETRIEN")

        createTbl(self.geoDB, "GEBOUWGEOMETRIEN",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("METHODEGEBOUWGEOMETRIE","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ], "POLYGON")
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "GEBOUWGEOMETRIEN",
           ("ID", "TERREINOBJECTID", "METHODEGEBOUWGEOMETRIE",
            "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM", "SHAPE@") )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text

          GEBOUWGEOMETRIE =  row.find("{http://crab.agiv.be}GEBOUWGEOMETRIE")[0]
          SHAPE = gmlPoly2esri( GEBOUWGEOMETRIE )

          METHODEGEBOUWGEOMETRIE = row.find("{http://crab.agiv.be}METHODEGEBOUWGEOMETRIE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, TERREINOBJECTID,  METHODEGEBOUWGEOMETRIE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, SHAPE ))
          elif includeEndDates:
            curs.insertRow((ID, TERREINOBJECTID,  METHODEGEBOUWGEOMETRIE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, SHAPE ))

        del curs

    #geo
    # def ADRESPOSITIES(self):
        # rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRESPOSITIES")

        # cur.execute("CREATE TABLE IF NOT EXISTS ADRESPOSITIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, X REAL, Y REAL, HERKOMSTADRESPOSITIE INT, "+
                          # " BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          # " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        # for row in rows.getchildren():
          # ID = row.find("{http://crab.agiv.be}ID").text
          # ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
          # AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text

          # X, Y = row.find("{http://crab.agiv.be}ADRESPOSITIE")[0][0].text.split()

          # HERKOMSTADRESPOSITIE= row.find("{http://crab.agiv.be}HERKOMSTADRESPOSITIE").text
          # BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          # BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          # BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          # BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          # EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          # if EINDnode != None: EINDDATUM =  EINDnode.text
          # else: EINDDATUM = None

