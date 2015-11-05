# -*- coding: UTF-8 -*-
#-------------------------------------------------------------------------------
# Name:        xgrablib.py
# Purpose:     Create a File Geo database from a xGRAB-file 
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

class xgrab2geodb:
    def __init__(self, xgrabPath , geoDB ):
        xmlGrab = etree.parse(xgrabPath)
        self.rootgrab = xmlGrab.getroot()
        self.components = self.rootgrab.find("{http://crab.agiv.be}COMPONENTEN")
        self.geoDB = geoDB
        arcpy.env.overwriteOutput = True
        arcpy.env.workspace =  geoDB

    def createAll(self, includeEndDates=True ):
        self.STRAATNAMEN(includeEndDates, True, False)
        self.STRAATNAAMSTATUSSEN(includeEndDates, True, False)
        self.HUISNUMMERS(includeEndDates, True, False)
        self.HUISNUMMERSTATUSSEN(includeEndDates, True, False)
        self.POSTKANTONCODES(includeEndDates, True, False)
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES(includeEndDates, True, False)
        self.TERREINOBJECT_HUISNUMMER_RELATIES(includeEndDates, True, False)
        self.TERREINOBJECTEN(includeEndDates, [2,3,5,99], True, False)
        self.GEBOUWSTATUSSEN(includeEndDates, True, False)
        self.GEBOUWGEOMETRIEN(includeEndDates, True, False)
        self.ADRESPOSITIES(includeEndDates, True, False)

    def updateAll(self):
        self.STRAATNAMEN(True, False,True)
        self.STRAATNAAMSTATUSSEN(True, False,True)
        self.HUISNUMMERS(True, False,True)
        self.HUISNUMMERSTATUSSEN(True, False,True)
        self.POSTKANTONCODES(True, False,True)
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES(True, False,True)
        self.TERREINOBJECT_HUISNUMMER_RELATIES(True, False,True)
        self.TERREINOBJECTEN(True, [2,3,5,99], False,True)
        self.GEBOUWSTATUSSEN(True, False,True)
        self.GEBOUWGEOMETRIEN(True, False,True)   
        self.ADRESPOSITIES(True, False,True)           
        
    def STRAATNAMEN(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}STRAATNAMEN")

        if create and not arcpy.Exists('STRAATNAMEN'):
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
        elif arcpy.Exists('STRAATNAMEN') and not append:
            arcpy.management.DeleteRows('STRAATNAMEN')
        elif arcpy.Exists('STRAATNAMEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\STRAATNAMEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
            
            
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

    def STRAATNAAMSTATUSSEN(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}STRAATNAAMSTATUSSEN")

        if create and not arcpy.Exists('STRAATNAAMSTATUSSEN'):
           createTbl(self.geoDB, "STRAATNAAMSTATUSSEN",
            [field("ID","LONG"),
             field("STRAATNAAMID","LONG"),
             field("STRAATNAAMSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('STRAATNAAMSTATUSSEN') and not append:
            arcpy.management.DeleteRows('STRAATNAAMSTATUSSEN')    
        elif arcpy.Exists('STRAATNAAMSTATUSSEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\STRAATNAAMSTATUSSEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\" + "STRAATNAAMSTATUSSEN",
               ("ID","STRAATNAAMID", "STRAATNAAMSTATUS",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID =  row.find("{http://crab.agiv.be}STRAATNAAMID").text
          STRAATNAAMSTATUS = row.find("{http://crab.agiv.be}STRAATNAAMSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def HUISNUMMERS(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}HUISNUMMERS")

        if create and not arcpy.Exists('HUISNUMMERS'):
           createTbl(self.geoDB, "HUISNUMMERS",
            [field("ID","LONG"),
             field("STRAATNAAMID","LONG"),
             field("HUISNUMMER","TEXT", 64),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('HUISNUMMERS') and not append:
            arcpy.management.DeleteRows('HUISNUMMERS')
        elif arcpy.Exists('HUISNUMMERS') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\HUISNUMMERS", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "HUISNUMMERS",
               ("ID","STRAATNAAMID", "HUISNUMMER",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          HUISNUMMER =  row.find("{http://crab.agiv.be}HUISNUMMER").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def HUISNUMMERSTATUSSEN(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}HUISNUMMERSTATUSSEN")

        if create and not arcpy.Exists('HUISNUMMERSTATUSSEN'):
           createTbl(self.geoDB, "HUISNUMMERSTATUSSEN",
            [field("ID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("HUISNUMMERSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('HUISNUMMERSTATUSSEN') and not append:
            arcpy.management.DeleteRows('HUISNUMMERSTATUSSEN')
        elif arcpy.Exists('HUISNUMMERSTATUSSEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\HUISNUMMERSTATUSSEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
            
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "HUISNUMMERSTATUSSEN",
               ("ID","HUISNUMMERID", "HUISNUMMERSTATUS",
                "BEGINDATUM","BEGINORGANISATIE","BEGINBEWERKING","EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          HUISNUMMERSTATUS = row.find("{http://crab.agiv.be}HUISNUMMERSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def POSTKANTONCODES(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}POSTKANTONCODES")

        if create and not arcpy.Exists('POSTKANTONCODES'):
           createTbl(self.geoDB, "POSTKANTONCODES",
            [field("ID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("POSTKANTONCODE","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('POSTKANTONCODES') and not append:
            arcpy.management.DeleteRows('POSTKANTONCODES')
        elif arcpy.Exists('POSTKANTONCODES') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\POSTKANTONCODES", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "POSTKANTONCODES",
               ("ID", "HUISNUMMERID", "POSTKANTONCODE",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
          POSTKANTONCODE = row.find("{http://crab.agiv.be}POSTKANTONCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def RRSTRAATNAAM_STRAATNAAM_RELATIES(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}RRSTRAATNAAM_STRAATNAAM_RELATIES")

        if create and not arcpy.Exists('RRSTRAATNAAM_STRAATNAAM_RELATIES'):
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
        elif arcpy.Exists('RRSTRAATNAAM_STRAATNAAM_RELATIES') and not append:
            arcpy.management.DeleteRows('RRSTRAATNAAM_STRAATNAAM_RELATIES')
        elif arcpy.Exists('RRSTRAATNAAM_STRAATNAAM_RELATIES') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\RRSTRAATNAAM_STRAATNAAM_RELATIES", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "RRSTRAATNAAM_STRAATNAAM_RELATIES",
               ("ID", "STRAATNAAMID", "SUBKANTONCODE", "RRSTRAATCODE",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
          RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def TERREINOBJECT_HUISNUMMER_RELATIES(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}TERREINOBJECT_HUISNUMMER_RELATIES")

        if create and not arcpy.Exists('TERREINOBJECT_HUISNUMMER_RELATIES'):
           createTbl(self.geoDB, "TERREINOBJECT_HUISNUMMER_RELATIES",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("HUISNUMMERID","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('TERREINOBJECT_HUISNUMMER_RELATIES') and not append:
            arcpy.management.DeleteRows('TERREINOBJECT_HUISNUMMER_RELATIES')          
        elif arcpy.Exists('TERREINOBJECT_HUISNUMMER_RELATIES') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\TERREINOBJECT_HUISNUMMER_RELATIES", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "TERREINOBJECT_HUISNUMMER_RELATIES",
               ("ID", "TERREINOBJECTID", "HUISNUMMERID",
                "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def TERREINOBJECTEN(self, includeEndDates=True, aardAllowed=[1,2,3,4,5,99], create=True, append=False):
        """	aardAllowed=1: kadastraal perceel
                        2: GRB gebouw
                        3: GRB kunstwerk
                        4: GRB administratief perceel
                        5: gebouw volgens de gemeente
                        99: andere """
        rows = self.components.find("{http://crab.agiv.be}TERREINOBJECTEN")

        if create and not arcpy.Exists('TERREINOBJECTEN'):
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
        elif arcpy.Exists('TERREINOBJECTEN') and not append:
            arcpy.management.DeleteRows('TERREINOBJECTEN')        
        elif arcpy.Exists('TERREINOBJECTEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\TERREINOBJECTEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
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

    def GEBOUWSTATUSSEN(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}GEBOUWSTATUSSEN")

        if create and not arcpy.Exists('GEBOUWSTATUSSEN'):
           createTbl(self.geoDB, "GEBOUWSTATUSSEN",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("GEBOUWSTATUS","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ])
        elif arcpy.Exists('GEBOUWSTATUSSEN') and not append:
            arcpy.management.DeleteRows('GEBOUWSTATUSSEN')                  
        elif arcpy.Exists('GEBOUWSTATUSSEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\GEBOUWSTATUSSEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "GEBOUWSTATUSSEN",
           ("ID", "TERREINOBJECTID", "GEBOUWSTATUS",
            "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM" ) )

        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          GEBOUWSTATUS = row.find("{http://crab.agiv.be}GEBOUWSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
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

    def GEBOUWGEOMETRIEN(self, includeEndDates=True, create=True, append=False):
        rows = self.components.find("{http://crab.agiv.be}GEBOUWGEOMETRIEN")

        if create and not arcpy.Exists('GEBOUWGEOMETRIEN'):
           createTbl(self.geoDB, "GEBOUWGEOMETRIEN",
            [field("ID","LONG"),
             field("TERREINOBJECTID","LONG"),
             field("METHODEGEBOUWGEOMETRIE","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ], "POLYGON")
        elif arcpy.Exists('GEBOUWGEOMETRIEN') and not append:
            arcpy.management.DeleteFeatures('GEBOUWGEOMETRIEN')
        elif arcpy.Exists('GEBOUWGEOMETRIEN') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\GEBOUWGEOMETRIEN", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                    
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
    def ADRESPOSITIES(self, includeEndDates=True, create=True, append=False):
        rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRESPOSITIES")

        if create and not arcpy.Exists('ADRESPOSITIES'):
           createTbl(self.geoDB, "ADRESPOSITIES",
            [field("ID","LONG"),
             field("ADRESID","LONG"),
             field("AARDADRES","LONG"),
             field("HERKOMSTADRESPOSITIE","LONG"),
             field("BEGINDATUM","DATE"),
             field("BEGINORGANISATIE","LONG"),
             field("BEGINBEWERKING","LONG"),
             field("EINDDATUM","DATE")
            ], "POINT")
        elif arcpy.Exists('ADRESPOSITIES') and not append:
            arcpy.management.DeleteFeatures('ADRESPOSITIES')
        elif arcpy.Exists('ADRESPOSITIES') and append:
            ids = [r.find("{http://crab.agiv.be}ID").text for r in rows.getchildren()]
            with arcpy.da.UpdateCursor(self.geoDB + "\\ADRESPOSITIES", ["ID"]) as cursor:
                for row in cursor:
                    if row[0] in ids: cursor.deleteRow()
                            
        curs = arcpy.da.InsertCursor( self.geoDB + "\\"+ "ADRESPOSITIES",
           ("ID", "ADRESID", "AARDADRES", "HERKOMSTADRESPOSITIE",
            "BEGINDATUM", "BEGINORGANISATIE", "BEGINBEWERKING", "EINDDATUM", "SHAPE@XY") ) 
               
        for row in rows.getchildren():
          ID = row.find("{http://crab.agiv.be}ID").text
          ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
          AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text

          X, Y = row.find("{http://crab.agiv.be}ADRESPOSITIE")[0][0].text.split()

          HERKOMSTADRESPOSITIE = row.find("{http://crab.agiv.be}HERKOMSTADRESPOSITIE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode != None: EINDDATUM =  EINDnode.text
          else: EINDDATUM = None

          if not includeEndDates and EINDDATUM == None:
            curs.insertRow((ID, ADRESID, AARDADRES, HERKOMSTADRESPOSITIE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, [double(X),double(Y)] )) 
          elif includeEndDates:
            curs.insertRow((ID, ADRESID, AARDADRES, HERKOMSTADRESPOSITIE,
                BEGINDATUM, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, [double(X),double(Y)] ))

        del curs     
          
