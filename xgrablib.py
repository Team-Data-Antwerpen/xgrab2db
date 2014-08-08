# -*- coding: UTF-8 -*-
#-------------------------------------------------------------------------------
# Name:        xgrablib.py
# Purpose:     Create a sqlite database from a xGRAB-file and the other way
#              around.
# Author:      Kay Warrie
#
# Created:     28/04/2014
# Copyright:   (c) K-GIS 2014
# Licence:     MIT
#-------------------------------------------------------------------------------
import os, sys, codecs, datetime
import xml.etree.cElementTree as etree

etree.register_namespace("gml","http://www.opengis.net/gml")
etree.register_namespace("","http://crab.agiv.be")

class xgrab2db:
    def __init__(self, xgrabPath , DBconnection ):
        """create or update a xgrab Database using xgrab-xml
        xgrabPath = path to xgrab XML file,
        DBconnection = coonetion object to Database
        update = update or new db ?"""
        xmlGrab = etree.parse(xgrabPath)
        self.rootgrab = xmlGrab.getroot()
        self.con = DBconnection

    def createAll(self):
        ''
        #hard coded
        self.HERKOMSTADRESPOSITIES()
        self.ORGANISATIES()
        self.BEWERKINGEN()
        #from xml
        self.STRAATNAMEN()
        self.STRAATNAAMSTATUSSEN()
        self.HUISNUMMERS()
        self.HUISNUMMERSTATUSSEN()
        self.SUBADRESSEN()
        self.SUBADRESSTATUSSEN()
        self.POSTKANTONCODES()
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES()
        self.STRAATKANTEN()
        self.WEGOBJECTEN()
        self.WEGVERBINDINGSTATUSSEN()
        self.WEGVERBINDINGGEOMETRIEN()
        self.TERREINOBJECT_HUISNUMMER_RELATIES()
        self.TERREINOBJECTEN()
        self.GEBOUWSTATUSSEN()
        self.GEBOUWGEOMETRIEN()
        self.ADRESPOSITIES()
        self.RRADRESSEN()
        self.ADRES_RRADRES_RELATIES()
        self.KADADRESSEN()
        self.ADRES_KADADRES_RELATIES()

    def updateAll(self):
        ''
        #from xml
        self.STRAATNAMEN()
        self.STRAATNAAMSTATUSSEN()
        self.HUISNUMMERS()
        self.HUISNUMMERSTATUSSEN()
        self.SUBADRESSEN()
        self.SUBADRESSTATUSSEN()
        self.POSTKANTONCODES()
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES()
        self.STRAATKANTEN()
        self.WEGOBJECTEN()
        self.WEGVERBINDINGSTATUSSEN()
        self.WEGVERBINDINGGEOMETRIEN()
        self.TERREINOBJECT_HUISNUMMER_RELATIES()
        self.TERREINOBJECTEN()
        self.GEBOUWSTATUSSEN()
        self.GEBOUWGEOMETRIEN()
        self.ADRESPOSITIES()
        self.RRADRESSEN()
        self.ADRES_RRADRES_RELATIES()
        self.KADADRESSEN()
        self.ADRES_KADADRES_RELATIES()

    def STRAATNAMEN(self):
      with self.con as con:
        #STRAATNAMEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}STRAATNAMEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS STRAATNAMEN(ID INT PRIMARY KEY, STRAATCODE INT, NISGEMEENTECODE INT, STRAATNAAM TEXT, TAALCODESTRAATNAAM TEXT, "+
        "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
        " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          STRAATCODE =  row.find("{http://crab.agiv.be}STRAATCODE").text
          NISGEMEENTECODE = row.find("{http://crab.agiv.be}NISGEMEENTECODE").text
          STRAATNAAM = row.find("{http://crab.agiv.be}STRAATNAAM").text.replace("'", "''" )
          TAALCODESTRAATNAAM = row.find("{http://crab.agiv.be}TAALCODESTRAATNAAM").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute( "SELECT * FROM STRAATNAMEN WHERE ID = %s;" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= u"INSERT INTO STRAATNAMEN VALUES(%s,%s,%s,'%s','%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (id,STRAATCODE,
              NISGEMEENTECODE,STRAATNAAM,TAALCODESTRAATNAAM, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)

              cur.execute(sql)
          else:
              sql = u"UPDATE STRAATNAMEN"
              sql += u""" SET ID = %s ,
              STRAATCODE =  %s ,
              NISGEMEENTECODE =   %s ,
              STRAATNAAM =   '%s' ,
              TAALCODESTRAATNAAM =   '%s' ,
              BEGINDATUM =  '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s""" % (id,STRAATCODE,NISGEMEENTECODE,STRAATNAAM,TAALCODESTRAATNAAM,
                                                BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql += u" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def STRAATNAAMSTATUSSEN(self):
      with self.con as con:
        #STRAATNAAMSTATUSSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}STRAATNAAMSTATUSSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS STRAATNAAMSTATUSSEN(ID INT PRIMARY KEY, STRAATNAAMID INT, STRAATNAAMSTATUS INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          STRAATNAAMID =  row.find("{http://crab.agiv.be}STRAATNAAMID").text
          STRAATNAAMSTATUS = row.find("{http://crab.agiv.be}STRAATNAAMSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM STRAATNAAMSTATUSSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO STRAATNAAMSTATUSSEN VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
              id,STRAATNAAMID,STRAATNAAMSTATUS, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE STRAATNAAMSTATUSSEN"
              sql +=""" SET ID = %s ,
              STRAATNAAMID =  %s ,
              STRAATNAAMSTATUS =  %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,STRAATNAAMID,STRAATNAAMSTATUS,
                                                        BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def HUISNUMMERS(self):
      with self.con as con:
        #HUISNUMMERS
        rows = self.rootgrab[0].find("{http://crab.agiv.be}HUISNUMMERS")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS HUISNUMMERS(ID INT PRIMARY KEY, STRAATNAAMID INT, HUISNUMMER TEXT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          HUISNUMMER =  row.find("{http://crab.agiv.be}HUISNUMMER").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM HUISNUMMERS WHERE ID = %s ;" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO HUISNUMMERS VALUES(%s,%s,'%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (
              id,STRAATNAAMID,HUISNUMMER,BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE HUISNUMMERS"
              sql +=""" SET ID = %s ,
              STRAATNAAMID =  %s ,
              HUISNUMMER = '%s',
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,STRAATNAAMID,HUISNUMMER,
                                                            BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def HUISNUMMERSTATUSSEN(self):
      with self.con as con:
        #HUISNUMMERSTATUSSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}HUISNUMMERSTATUSSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS HUISNUMMERSTATUSSEN(ID INT PRIMARY KEY, HUISNUMMERID INT, HUISNUMMERSTATUS INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          HUISNUMMERSTATUS = row.find("{http://crab.agiv.be}HUISNUMMERSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM HUISNUMMERSTATUSSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO HUISNUMMERSTATUSSEN VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,HUISNUMMERID,HUISNUMMERSTATUS,
                                                                                          BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE HUISNUMMERSTATUSSEN"
              sql +=""" SET ID = %s ,
              HUISNUMMERID =  %s ,
              HUISNUMMERSTATUS = %s,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,HUISNUMMERID,HUISNUMMERSTATUS,
                                                            BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def SUBADRESSEN(self):
      with self.con as con:
        #SUBADRESSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}SUBADRESSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS SUBADRESSEN(ID INT PRIMARY KEY, HUISNUMMERID INT, SUBADRES TEXT, AARDSUBADRES INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
          SUBADRES = row.find("{http://crab.agiv.be}SUBADRES").text
          AARDSUBADRES  = row.find("{http://crab.agiv.be}AARDSUBADRES").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM SUBADRESSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO SUBADRESSEN VALUES(%s,%s,'%s',%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
              id,HUISNUMMERID,SUBADRES,AARDSUBADRES, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE SUBADRESSEN"
              sql +=""" SET ID = %s ,
              HUISNUMMERID =  %s ,
              SUBADRES = '%s',
              AARDSUBADRES =  %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,HUISNUMMERID,SUBADRES,AARDSUBADRES,
                                                         BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def SUBADRESSTATUSSEN(self):
      with self.con as con:
        #SUBADRESSTATUSSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}SUBADRESSTATUSSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS SUBADRESSTATUSSEN(ID INT PRIMARY KEY, SUBADRESID INT, SUBADRESSTATUS INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          SUBADRESID = row.find("{http://crab.agiv.be}SUBADRESID").text
          SUBADRESSTATUS = row.find("{http://crab.agiv.be}SUBADRESSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM SUBADRESSTATUSSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO SUBADRESSTATUSSEN VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,SUBADRESID,SUBADRESSTATUS,
                                                                                          BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE SUBADRESSTATUSSEN"
              sql +=""" SET ID = %s ,
              SUBADRESID =  %s ,
              SUBADRESSTATUS = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""% (id,SUBADRESID,SUBADRESSTATUS, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def POSTKANTONCODES(self):
      with self.con as con:
        #POSTKANTONCODES
        rows = self.rootgrab[0].find("{http://crab.agiv.be}POSTKANTONCODES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS POSTKANTONCODES(ID INT PRIMARY KEY, HUISNUMMERID INT, POSTKANTONCODE INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          "EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT, EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
          POSTKANTONCODE = row.find("{http://crab.agiv.be}POSTKANTONCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM POSTKANTONCODES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO POSTKANTONCODES VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,HUISNUMMERID,POSTKANTONCODE,
                                                                                          BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE POSTKANTONCODES"
              sql +=""" SET ID = %s ,
              HUISNUMMERID =  %s ,
              POSTKANTONCODE = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,HUISNUMMERID,POSTKANTONCODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def RRSTRAATNAAM_STRAATNAAM_RELATIES(self):
      with self.con as con:
        #RRSTRAATNAAM_STRAATNAAM_RELATIES
        rows = self.rootgrab[0].find("{http://crab.agiv.be}RRSTRAATNAAM_STRAATNAAM_RELATIES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS RRSTRAATNAAM_STRAATNAAM_RELATIES(ID INT PRIMARY KEY, STRAATNAAMID INT, SUBKANTONCODE TEXT, RRSTRAATCODE TEXt, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
          RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM RRSTRAATNAAM_STRAATNAAM_RELATIES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO RRSTRAATNAAM_STRAATNAAM_RELATIES VALUES(%s,%s,'%s','%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (
              id,STRAATNAAMID,SUBKANTONCODE,RRSTRAATCODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE RRSTRAATNAAM_STRAATNAAM_RELATIES"
              sql +=""" SET ID = %s ,
              STRAATNAAMID =  %s ,
              SUBKANTONCODE = '%s' ,
              RRSTRAATCODE = '%s' ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,STRAATNAAMID,SUBKANTONCODE,RRSTRAATCODE,
                                                                    BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def STRAATKANTEN(self):
      with self.con as con:
        #STRAATKANTEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}STRAATKANTEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS STRAATKANTEN(ID INT PRIMARY KEY, STRAATNAAMID INT, WEGOBJECTID INT, KANT INT, PARITEIT INT, EERSTEHUISNUMMER TEXT, LAATSTEHUISNUMMER TEXT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
          WEGOBJECTID =  row.find("{http://crab.agiv.be}WEGOBJECTID").text
          KANT =  row.find("{http://crab.agiv.be}KANT").text

          PARITEITnode = row.find("{http://crab.agiv.be}PARITEIT")
          if PARITEITnode != None: PARITEIT = PARITEITnode.text
          else: PARITEIT = "NULL"

          EERSTEHUISNUMMERnode = row.find("{http://crab.agiv.be}EERSTEHUISNUMMER")
          if EERSTEHUISNUMMERnode != None: EERSTEHUISNUMMER = EERSTEHUISNUMMERnode.text
          else: EERSTEHUISNUMMER = ""

          LAATSTEHUISNUMMERnode = row.find("{http://crab.agiv.be}LAATSTEHUISNUMMER")
          if LAATSTEHUISNUMMERnode != None: LAATSTEHUISNUMMER = LAATSTEHUISNUMMERnode.text
          else: LAATSTEHUISNUMMER = ""

          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM STRAATKANTEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
              sql= "INSERT INTO STRAATKANTEN VALUES(%s,%s,%s,%s,%s,'%s','%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (id,STRAATNAAMID,WEGOBJECTID,
              KANT,PARITEIT,EERSTEHUISNUMMER,LAATSTEHUISNUMMER, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              cur.execute(sql)
          else:
              sql = "UPDATE STRAATKANTEN"
              sql +=""" SET ID = %s ,
              STRAATNAAMID =  %s ,
              WEGOBJECTID = %s ,
              KANT = %s ,
              PARITEIT =  %s ,
              EERSTEHUISNUMMER = '%s' ,
              LAATSTEHUISNUMMER = '%s' ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(
              id,STRAATNAAMID,WEGOBJECTID,KANT,PARITEIT,EERSTEHUISNUMMER,LAATSTEHUISNUMMER,
                                   BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def WEGOBJECTEN(self):
      with self.con as con:
        #WEGOBJECTEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGOBJECTEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS WEGOBJECTEN(ID INT PRIMARY KEY, IDENTIFICATORWEGOBJECT TEXT, AARDWEGOBJECT INT,"+
            " MORFOLOGISCHEWEGKLASSE INT, AARDVERHARDING INT, BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
            " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          IDENTIFICATORWEGOBJECT = row.find("{http://crab.agiv.be}IDENTIFICATORWEGOBJECT").text
          AARDWEGOBJECT =  row.find("{http://crab.agiv.be}AARDWEGOBJECT").text

          MORFOLOGISCHEWEGKLASSEnode = row.find("{http://crab.agiv.be}WEGVERBINDING/{http://crab.agiv.be}MORFOLOGISCHEWEGKLASSE")
          if MORFOLOGISCHEWEGKLASSEnode != None: MORFOLOGISCHEWEGKLASSE = MORFOLOGISCHEWEGKLASSEnode.text
          else: MORFOLOGISCHEWEGKLASSE = "NULL"

          AARDVERHARDINGnode = row.find("{http://crab.agiv.be}WEGVERBINDING/{http://crab.agiv.be}AARDVERHARDING")
          if AARDVERHARDINGnode != None: AARDVERHARDING = AARDVERHARDINGnode.text
          else: AARDVERHARDING = "NULL"

          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM WEGOBJECTEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO WEGOBJECTEN VALUES(%s,'%s',%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,IDENTIFICATORWEGOBJECT,AARDWEGOBJECT,MORFOLOGISCHEWEGKLASSE,AARDVERHARDING, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE WEGOBJECTEN"
              sql +=""" SET ID = %s ,
              IDENTIFICATORWEGOBJECT =  '%s' ,
              AARDWEGOBJECT = %s ,
              MORFOLOGISCHEWEGKLASSE = %s ,
              AARDVERHARDING = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s """%(id,IDENTIFICATORWEGOBJECT,AARDWEGOBJECT,MORFOLOGISCHEWEGKLASSE,AARDVERHARDING,
                                                                    BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def WEGVERBINDINGSTATUSSEN(self):
        with self.con as con:
        #WEGVERBINDINGSTATUSSEN
            rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGVERBINDINGSTATUSSEN")

            cur = con.cursor()

            cur.execute("CREATE TABLE IF NOT EXISTS WEGVERBINDINGSTATUSSEN(ID INT PRIMARY KEY, WEGOBJECTID INT, WEGVERBINDINGSTATUS INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

            for row in rows.getchildren():
              id = row[0].text
              WEGOBJECTID = row.find("{http://crab.agiv.be}WEGOBJECTID").text
              WEGVERBINDINGSTATUS = row.find("{http://crab.agiv.be}WEGVERBINDINGSTATUS").text
              BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

              BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
              BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
              BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

              EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
              if EINDnode: EINDDATUM = EINDnode
              else: EINDDATUM = "Null"

              cur.execute("SELECT * FROM WEGVERBINDINGSTATUSSEN WHERE ID = %s" % id)
              data = cur.fetchall()

              if len(data) == 0:
                sql= "INSERT INTO WEGVERBINDINGSTATUSSEN VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,WEGOBJECTID,WEGVERBINDINGSTATUS,
                                                                           BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                cur.execute(sql)
              else:
                  sql = "UPDATE WEGVERBINDINGSTATUSSEN"
                  sql +=""" SET ID = %s ,
                  WEGOBJECTID =  %s ,
                  WEGVERBINDINGSTATUS = %s ,
                  BEGINDATUM = '%s',
                  BEGINTIJD = '%s',
                  BEGINORGANISATIE = %s,
                  BEGINBEWERKING = %s"""% (id,WEGOBJECTID,WEGVERBINDINGSTATUS,
                                                         BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                  sql +=" WHERE ID = %s ;" % id
                  cur.execute(sql)
        con.commit()

    #geo
    def WEGVERBINDINGGEOMETRIEN(self):
        with self.con as con:
        #WEGVERBINDINGGEOMETRIEN
            rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGVERBINDINGGEOMETRIEN")

            cur = con.cursor()

            cur.execute("CREATE TABLE IF NOT EXISTS WEGVERBINDINGGEOMETRIEN(ID INT PRIMARY KEY, WEGOBJECTID INT, WEGVERBINDINGGEOMETRIE TEXT, METHODEWEGVERBINDINGGEOMETRIE INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

            for row in rows.getchildren():
              id = row[0].text
              WEGOBJECTID = row.find("{http://crab.agiv.be}WEGOBJECTID").text

              #python inserts wrong namespace for some reason
              WEGVERBINDINGGEOMETRIE = "<LineString><posList> %s </posList></LineString>"%  row.find("{http://crab.agiv.be}WEGVERBINDINGGEOMETRIE")[0][0].text

              METHODEWEGVERBINDINGGEOMETRIE = row.find("{http://crab.agiv.be}METHODEWEGVERBINDINGGEOMETRIE").text
              BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

              BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
              BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
              BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

              EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
              if EINDnode: EINDDATUM = EINDnode
              else: EINDDATUM = "Null"

              cur.execute("SELECT * FROM WEGVERBINDINGGEOMETRIEN WHERE ID = %s" % id)
              data = cur.fetchall()

              if len(data) == 0:
                  sql= "INSERT INTO WEGVERBINDINGGEOMETRIEN VALUES(%s,%s,'%s',%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,WEGOBJECTID,WEGVERBINDINGGEOMETRIE,METHODEWEGVERBINDINGGEOMETRIE,
                                                                                          BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                  cur.execute(sql)
              else:
                  sql = "UPDATE WEGVERBINDINGGEOMETRIEN "
                  sql +=""" SET ID = %s ,
                  WEGOBJECTID =  %s ,
                  WEGVERBINDINGGEOMETRIE = '%s' ,
                  METHODEWEGVERBINDINGGEOMETRIE = %s ,
                  BEGINDATUM = '%s' ,
                  BEGINTIJD = '%s',
                  BEGINORGANISATIE = %s ,
                  BEGINBEWERKING = %s"""% (id,WEGOBJECTID,WEGVERBINDINGGEOMETRIE,METHODEWEGVERBINDINGGEOMETRIE,
                                                                                  BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                  sql +=" WHERE ID = %s ;" % id
                  cur.execute(sql)
        con.commit()

    def TERREINOBJECT_HUISNUMMER_RELATIES(self):
      with self.con as con:
        #TERREINOBJECT_HUISNUMMER_RELATIES
        rows = self.rootgrab[0].find("{http://crab.agiv.be}TERREINOBJECT_HUISNUMMER_RELATIES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS TERREINOBJECT_HUISNUMMER_RELATIES(ID INT PRIMARY KEY, TERREINOBJECTID INT, HUISNUMMERID INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM TERREINOBJECT_HUISNUMMER_RELATIES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO TERREINOBJECT_HUISNUMMER_RELATIES VALUES(%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (id,TERREINOBJECTID,HUISNUMMERID,
                                                                                          BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE TERREINOBJECT_HUISNUMMER_RELATIES "
              sql +=""" SET ID = %s ,
              TERREINOBJECTID =  %s ,
              HUISNUMMERID = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""% (id,TERREINOBJECTID,HUISNUMMERID,
                                                              BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def TERREINOBJECTEN(self):
      with self.con as con:
        #TERREINOBJECTEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}TERREINOBJECTEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS TERREINOBJECTEN(ID INT PRIMARY KEY, IDENTIFICATORTERREINOBJECT TEXT, AARDTERREINOBJECT INT, AARDGEBOUW INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          IDENTIFICATORTERREINOBJECT = row.find("{http://crab.agiv.be}IDENTIFICATORTERREINOBJECT").text
          AARDTERREINOBJECT = row.find("{http://crab.agiv.be}AARDTERREINOBJECT").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          #aardgeobouw = double node, sometimes NULL!
          AARDGEBOUWnode = row.find( "{http://crab.agiv.be}GEBOUW/{http://crab.agiv.be}AARDGEBOUW" )
          if AARDGEBOUWnode != None: AARDGEBOUW = AARDGEBOUWnode.text
          else: AARDGEBOUW = "NULL"

          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM TERREINOBJECTEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO TERREINOBJECTEN VALUES(%s,'%s',%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,IDENTIFICATORTERREINOBJECT,AARDTERREINOBJECT,AARDGEBOUW, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE TERREINOBJECTEN "
              sql +=""" SET ID = %s ,
              IDENTIFICATORTERREINOBJECT =  '%s' ,
              AARDTERREINOBJECT = %s ,
              AARDGEBOUW = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,IDENTIFICATORTERREINOBJECT,AARDTERREINOBJECT,AARDGEBOUW,
                                                                                  BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def GEBOUWSTATUSSEN(self):
      with self.con as con:
        #GEBOUWSTATUSSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}GEBOUWSTATUSSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS GEBOUWSTATUSSEN(ID INT PRIMARY KEY, TERREINOBJECTID TEXT, GEBOUWSTATUS INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
          GEBOUWSTATUS = row.find("{http://crab.agiv.be}GEBOUWSTATUS").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM GEBOUWSTATUSSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO GEBOUWSTATUSSEN VALUES(%s,'%s',%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,TERREINOBJECTID,GEBOUWSTATUS, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE GEBOUWSTATUSSEN "
              sql +=""" SET ID = %s ,
              TERREINOBJECTID =  %s ,
              GEBOUWSTATUS = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,TERREINOBJECTID,GEBOUWSTATUS,
                                                                  BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    #geo
    def GEBOUWGEOMETRIEN(self):
        with self.con as con:
        #GEBOUWGEOMETRIEN
            rows = self.rootgrab[0].find("{http://crab.agiv.be}GEBOUWGEOMETRIEN")

            cur = con.cursor()

            cur.execute("CREATE TABLE IF NOT EXISTS GEBOUWGEOMETRIEN(ID INT PRIMARY KEY, TERREINOBJECTID INT, GEBOUWGEOMETRIE TEXT, METHODEGEBOUWGEOMETRIE, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

            for row in rows.getchildren():
              id = row[0].text
              TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text

              #python inserts wrong namespace for some reason
              GEBOUWGEOMETRIE = "<Polygon ><exterior><LinearRing><posList> %s </posList></LinearRing></exterior></Polygon>" % row.find("{http://crab.agiv.be}GEBOUWGEOMETRIE")[0][0][0][0].text

              METHODEGEBOUWGEOMETRIE = row.find("{http://crab.agiv.be}METHODEGEBOUWGEOMETRIE").text
              BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

              BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
              BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
              BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

              EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
              if EINDnode: EINDDATUM = EINDnode
              else: EINDDATUM = "Null"

              cur.execute("SELECT * FROM GEBOUWGEOMETRIEN WHERE ID = %s" % id)
              data = cur.fetchall()

              if len(data) == 0:
                  sql= "INSERT INTO GEBOUWGEOMETRIEN VALUES(%s,%s,'%s',%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
                  id,TERREINOBJECTID,GEBOUWGEOMETRIE,METHODEGEBOUWGEOMETRIE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                  cur.execute(sql)
              else:
                  sql = "UPDATE GEBOUWGEOMETRIEN "
                  sql +=""" SET ID = %s ,
                  TERREINOBJECTID =  %s ,
                  GEBOUWGEOMETRIE = '%s' ,
                  METHODEGEBOUWGEOMETRIE = '%s' ,
                  BEGINDATUM = '%s' ,
                  BEGINTIJD = '%s' ,
                  BEGINORGANISATIE = %s ,
                  BEGINBEWERKING = %s"""%(
                  id,TERREINOBJECTID,GEBOUWGEOMETRIE,METHODEGEBOUWGEOMETRIE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
                  sql +=" WHERE ID = %s ;" % id
                  cur.execute(sql)
        con.commit()

    def RRADRESSEN(self):
      with self.con as con:
        #RRADRESSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}RRADRESSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS RRADRESSEN(ID INT PRIMARY KEY, RRHUISNUMMER TEXT, RRINDEX TEXT, SUBKANTONCODE TEXT, RRSTRAATCODE TEXT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          RRHUISNUMMER = row.find("{http://crab.agiv.be}RRHUISNUMMER").text
          SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
          RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text

          INDEXnode =  row.find("{http://crab.agiv.be}INDEX")
          if INDEXnode != None: RRINDEX = INDEXnode.text
          else: RRINDEX = ""

          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM RRADRESSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO RRADRESSEN VALUES(%s,'%s','%s','%s','%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,RRHUISNUMMER,RRINDEX,SUBKANTONCODE,RRSTRAATCODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE RRADRESSEN "
              sql +=""" SET ID = %s ,
              RRHUISNUMMER =  '%s' ,
              RRINDEX = '%s'
              SUBKANTONCODE = '%s' ,
              RRSTRAATCODE = '%s' ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(
              id,RRHUISNUMMER,RRINDEX,SUBKANTONCODE,RRSTRAATCODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def ADRES_RRADRES_RELATIES(self):
      with self.con as con:
        #ADRES_RRADRES_RELATIES
        rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRES_RRADRES_RELATIES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS ADRES_RRADRES_RELATIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, RRADRESID INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
          AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text
          RRADRESID = row.find("{http://crab.agiv.be}RRADRESID").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM ADRES_RRADRES_RELATIES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO ADRES_RRADRES_RELATIES VALUES(%s,%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,ADRESID,AARDADRES,RRADRESID,BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE ADRES_RRADRES_RELATIES "
              sql +=""" SET ID = %s ,
              ADRESID =  %s ,
              AARDADRES = %s ,
              RRADRESID = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,ADRESID,AARDADRES,RRADRESID,
                                            BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def KADADRESSEN(self):
      with self.con as con:
        #KADADRESSEN
        rows = self.rootgrab[0].find("{http://crab.agiv.be}KADADRESSEN")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS KADADRESSEN(ID INT PRIMARY KEY, KADHUISNUMMER TEXT, KADSTRAATCODE TEXT, NISGEMEENTECODE TEXT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          KADHUISNUMMER = row.find("{http://crab.agiv.be}KADHUISNUMMER").text
          KADSTRAATCODE = row.find("{http://crab.agiv.be}KADSTRAATCODE").text
          NISGEMEENTECODE = row.find("{http://crab.agiv.be}NISGEMEENTECODE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM KADADRESSEN WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO KADADRESSEN VALUES(%s,'%s','%s','%s','%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,KADHUISNUMMER,KADSTRAATCODE,NISGEMEENTECODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE KADADRESSEN "
              sql +=""" SET ID = %s ,
              KADHUISNUMMER =  '%s' ,
              KADSTRAATCODE = '%s' ,
              NISGEMEENTECODE = '%s' ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(
              id,KADHUISNUMMER,KADSTRAATCODE,NISGEMEENTECODE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    def ADRES_KADADRES_RELATIES(self):
      with self.con as con:
        #ADRES_KADADRES_RELATIES
        rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRES_KADADRES_RELATIES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS ADRES_KADADRES_RELATIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, KADADRESID INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
          AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text
          KADADRESID = row.find("{http://crab.agiv.be}KADADRESID").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM ADRES_KADADRES_RELATIES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO ADRES_KADADRES_RELATIES VALUES(%s,%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,ADRESID,AARDADRES,KADADRESID, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE ADRES_KADADRES_RELATIES "
              sql +=""" SET ID = %s ,
              ADRESID =  %s ,
              AARDADRES = %s ,
              KADADRESID = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""%(id,ADRESID,AARDADRES,KADADRESID,
                                               BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    #geo
    def ADRESPOSITIES(self):
      with self.con as con:
        rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRESPOSITIES")

        cur = con.cursor()

        cur.execute("CREATE TABLE IF NOT EXISTS ADRESPOSITIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, X REAL, Y REAL, HERKOMSTADRESPOSITIE INT, "+
                          "BEGINDATUM DATE, BEGINTIJD DATETIME, BEGINORGANISATIE INT, BEGINBEWERKING INT ,"+
                          " EINDDATUM DATE,  EINDTIJD DATETIME,  EINDORGANISATIE INT,  EINDBEWERKING INT );")

        for row in rows.getchildren():
          id = row[0].text
          ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
          AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text

          X, Y = row.find("{http://crab.agiv.be}ADRESPOSITIE")[0][0].text.split()

          HERKOMSTADRESPOSITIE= row.find("{http://crab.agiv.be}HERKOMSTADRESPOSITIE").text
          BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

          BEGINTIJD = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}TIJD").text
          BEGINORGANISATIE = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}ORGANISATIE").text
          BEGINBEWERKING = row.find("{http://crab.agiv.be}BEGINMETADATA/{http://crab.agiv.be}BEWERKING").text

          EINDnode = row.find("{http://crab.agiv.be}EINDDATUM")
          if EINDnode: EINDDATUM = EINDnode
          else: EINDDATUM = "Null"

          cur.execute("SELECT * FROM ADRESPOSITIES WHERE ID = %s" % id)
          data = cur.fetchall()

          if len(data) == 0:
            sql= "INSERT INTO ADRESPOSITIES VALUES(%s,%s,%s,%s,%s,%s,'%s','%s',%s,%s,Null,Null,Null,Null);" % (
            id,ADRESID,AARDADRES,X,Y,HERKOMSTADRESPOSITIE, BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
            cur.execute(sql)
          else:
              sql = "UPDATE ADRESPOSITIES "
              sql +=""" SET ID = %s ,
              ADRESID =  %s ,
              AARDADRES = %s ,
              X = %s,
              Y= %s,
              HERKOMSTADRESPOSITIE = %s ,
              BEGINDATUM = '%s' ,
              BEGINTIJD = '%s' ,
              BEGINORGANISATIE = %s ,
              BEGINBEWERKING = %s"""% (id,ADRESID,AARDADRES,X,Y,HERKOMSTADRESPOSITIE,
                                           BEGINDATUM,BEGINTIJD,BEGINORGANISATIE,BEGINBEWERKING)
              sql +=" WHERE ID = %s ;" % id
              cur.execute(sql)
        con.commit()

    #hard ooded
    def HERKOMSTADRESPOSITIES(self):
          with self.con as con:
              cur = con.cursor()
              cur.execute("CREATE TABLE HERKOMSTADRESPOSITIES(ID INT PRIMARY KEY, BESCHRIJVING TEXT);")
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(1, 'manuele aanduiding van lot' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(6, 'manuele aanduiding van toegang tot de weg' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(7, 'manuele aanduiding van ingang van gebouw' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(8, 'manuele aanduiding van standplaats' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(9, 'manuele aanduiding van ligplaats' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(10, 'afgeleid van gebouw' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(11, 'afgeleid van perceel GRB' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(12, 'afgeleid van perceel kadaster' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(13, 'geïnterpoleerd op basis van nevenliggende huisnummers gebouw' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(14, 'geïnterpoleerd op basis van nevenliggende huisnummers perceel GRB' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(15, 'geïnterpoleerd op basis van nevenliggende huisnummers perceel kadaster' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(16, 'geïnterpoleerd op basis van wegverbinding' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(17, 'afgeleid van straat' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(18, 'afgeleid van gemeente' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(2, 'manuele aanduiding van perceel' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(3, 'manuele aanduiding van gebouw' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(4, 'manuele aanduiding van brievenbus' );" )
              cur.execute("INSERT INTO HERKOMSTADRESPOSITIES VALUES(5, 'manuele aanduiding van nutsaansluiting' );" )
              con.commit()

    def ORGANISATIES(self):
          with self.con as con:
              cur = con.cursor()
              cur.execute("CREATE TABLE ORGANISATIES(ID INT PRIMARY KEY, BESCHRIJVING TEXT);")
              cur.execute("INSERT INTO ORGANISATIES VALUES(1, 'gemeente' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(2, 'rijksregister' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(3, 'AAPD' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(4, 'TeleAtlas' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(5, 'AGIV' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(6, 'NGI' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(7, 'bPost' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(8, 'NavTeq' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(9, 'VKBO' );" )
              cur.execute("INSERT INTO ORGANISATIES VALUES(99, 'andere' );" )
              con.commit()

    def BEWERKINGEN(self):
          with self.con as con:
              cur = con.cursor()
              cur.execute("CREATE TABLE BEWERKINGEN(ID INT PRIMARY KEY, BESCHRIJVING TEXT);")
              cur.execute("INSERT INTO BEWERKINGEN VALUES(1, 'invoer' );" )
              cur.execute("INSERT INTO BEWERKINGEN VALUES(2, 'historering' );" )
              cur.execute("INSERT INTO BEWERKINGEN VALUES(3, 'correctie' );" )
              cur.execute("INSERT INTO BEWERKINGEN VALUES(4, 'verwijdering' );" )
              con.commit()

class xgrabFromdb:
    def __init__(self, DBconnection, xgrabPath ):
        self.con = DBconnection
        self.xgrabPath = xgrabPath
        self.xgrabFile = codecs.open( xgrabPath, mode="wb", encoding="utf-8",
                                buffering=True )
        self.time =  datetime.datetime.now().isoformat()

        self.ZNcounter = 0

        self.xgrabFile.write( u'<?xml version="1.0" encoding="utf-8"?>\r\n' +
        '<CRAB HUIDIG_TIJDSTIP="%s" xmlns="http://crab.agiv.be"><COMPONENTEN>\r\n' % self.time )

    def close(self):
        if self.xgrabFile.closed == False:
            self.xgrabFile.write( u"</COMPONENTEN></CRAB>\r\n" )
            self.xgrabFile.close()

    def _begin_metaTag(self, beginTime=None,  organisatie=1 , bewerking=3 ):
        if organisatie == None: organisatie=1
        if bewerking == None: bewerking=3
        if beginTime == None: beginTime= datetime.datetime.now()

        BEGINMETADATA = etree.Element('BEGINMETADATA')
        if beginTime.__class__ == datetime.datetime:
            etree.SubElement(BEGINMETADATA , "TIJD").text = beginTime.isoformat()
        else :
            etree.SubElement(BEGINMETADATA , "TIJD").text = str( beginTime )

        etree.SubElement(BEGINMETADATA , "ORGANISATIE").text = str( organisatie )
        etree.SubElement(BEGINMETADATA , "BEWERKING").text = str( bewerking )
        return BEGINMETADATA

    def _end_metaTag(self, endTime=None,  organisatie=1 , bewerking=3 ):
        if organisatie == None: organisatie=1
        if bewerking == None: bewerking=3
        if endTime == None: endTime= datetime.datetime.now()

        EINDMETADATA = etree.Element('EINDMETADATA')
        if endTime.__class__ == datetime.datetime:
            etree.SubElement(EINDMETADATA , "TIJD").text = endTime.isoformat()
        else :
            etree.SubElement(EINDMETADATA , "TIJD").text = str( endTime )

        etree.SubElement(EINDMETADATA , "ORGANISATIE").text = str( organisatie )
        etree.SubElement(EINDMETADATA , "BEWERKING").text = str( bewerking )
        return EINDMETADATA

    def createAll(self):
        self.STRAATNAMEN()
        self.STRAATNAAMSTATUSSEN()
        self.HUISNUMMERS()
        self.HUISNUMMERSTATUSSEN()
        self.SUBADRESSEN()
        self.SUBADRESSTATUSSEN()
        self.POSTKANTONCODES()
        self.RRSTRAATNAAM_STRAATNAAM_RELATIES()
        self.STRAATKANTEN()
        self.WEGOBJECTEN()
        self.WEGVERBINDINGSTATUSSEN()
        self.WEGVERBINDINGGEOMETRIEN()
        self.TERREINOBJECT_HUISNUMMER_RELATIES()
        self.TERREINOBJECTEN()
        self.GEBOUWSTATUSSEN()
        self.GEBOUWGEOMETRIEN()
        self.RRADRESSEN()
        self.ADRES_RRADRES_RELATIES()
        self.KADADRESSEN()
        self.ADRES_KADADRES_RELATIES()
        self.ADRESPOSITIES()

    def STRAATNAMEN(self):
        with self.con as con:
            self.xgrabFile.write( '<STRAATNAMEN objecttype="straatnaam">\r\n' )

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM STRAATNAMEN;"):
                ID, STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING  = row
                STRAATNAAM_OBJECT = etree.Element('STRAATNAAM_OBJECT')
                etree.SubElement(STRAATNAAM_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATNAAM_OBJECT , "STRAATCODE").text = unicode( STRAATCODE )
                etree.SubElement(STRAATNAAM_OBJECT , "NISGEMEENTECODE").text = unicode( NISGEMEENTECODE )
                etree.SubElement(STRAATNAAM_OBJECT , "STRAATNAAM").text = STRAATNAAM
                etree.SubElement(STRAATNAAM_OBJECT , "TAALCODESTRAATNAAM").text = TAALCODESTRAATNAAM
                etree.SubElement(STRAATNAAM_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(STRAATNAAM_OBJECT , "EINDDATUM").text =  EINDDATUM

                STRAATNAAM_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING) )
                if EINDDATUM != None: STRAATNAAM_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( STRAATNAAM_OBJECT) + "\r\n")

            self.xgrabFile.write( '</STRAATNAMEN>\r\n' )

    def STRAATNAAMSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write(  '<STRAATNAAMSTATUSSEN objecttype="straatnaamstatus">\r\n' )

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, STRAATNAAMSTATUS, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING  FROM  STRAATNAAMSTATUSSEN;"):
                ID, STRAATNAAMID, STRAATNAAMSTATUS, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                STRAATNAAMSTATUS_OBJECT = etree.Element('STRAATNAAMSTATUS_OBJECT')
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "STRAATNAAMSTATUS").text = unicode( STRAATNAAMSTATUS )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(STRAATNAAMSTATUS_OBJECT , "EINDDATUM").text =  EINDDATUM

                STRAATNAAMSTATUS_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: STRAATNAAMSTATUS_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( STRAATNAAMSTATUS_OBJECT) + "\r\n")

            self.xgrabFile.write( "</STRAATNAAMSTATUSSEN>\r\n")

    def HUISNUMMERS(self):
        with self.con as con:
            self.xgrabFile.write( '<HUISNUMMERS objecttype="huisnummer">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, HUISNUMMER, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  HUISNUMMERS;"):
                ID, STRAATNAAMID, HUISNUMMER, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                HUISNUMMER_OBJECT = etree.Element('HUISNUMMER_OBJECT')
                etree.SubElement(HUISNUMMER_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(HUISNUMMER_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(HUISNUMMER_OBJECT , "HUISNUMMER").text = unicode( HUISNUMMER )
                etree.SubElement(HUISNUMMER_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(HUISNUMMER_OBJECT , "EINDDATUM").text =  EINDDATUM

                HUISNUMMER_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: HUISNUMMER_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(HUISNUMMER_OBJECT) + "\r\n")

            self.xgrabFile.write( "</HUISNUMMERS>\r\n")

    def HUISNUMMERSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<HUISNUMMERSTATUSSEN objecttype="huisnummerstatus">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, HUISNUMMERSTATUS, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  HUISNUMMERSTATUSSEN;"):
                ID, HUISNUMMERID, HUISNUMMERSTATUS, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                HUISNUMMERSTATUS_OBJECT = etree.Element('HUISNUMMERSTATUS_OBJECT')
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "HUISNUMMERSTATUS").text = unicode( HUISNUMMERSTATUS )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(HUISNUMMERSTATUS_OBJECT , "EINDDATUM").text =  EINDDATUM

                HUISNUMMERSTATUS_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: HUISNUMMERSTATUS_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( HUISNUMMERSTATUS_OBJECT) + "\r\n")

            self.xgrabFile.write( "</HUISNUMMERSTATUSSEN>\r\n")

    def SUBADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<SUBADRESSEN objecttype="subadres">\r\n' )

            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, SUBADRES, AARDSUBADRES, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  SUBADRESSEN;"):
                ID, HUISNUMMERID, SUBADRES, AARDSUBADRES, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                SUBADRES_OBJECT = etree.Element('SUBADRES_OBJECT')
                etree.SubElement(SUBADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(SUBADRES_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(SUBADRES_OBJECT , "SUBADRES").text = unicode( SUBADRES )
                etree.SubElement(SUBADRES_OBJECT , "AARDSUBADRES").text = unicode( AARDSUBADRES )
                etree.SubElement(SUBADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(SUBADRES_OBJECT , "EINDDATUM").text =  EINDDATUM

                SUBADRES_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: SUBADRES_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( SUBADRES_OBJECT) + "\r\n")

            self.xgrabFile.write( '</SUBADRESSEN>\r\n')

    def SUBADRESSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<SUBADRESSTATUSSEN objecttype="subadresstatus">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, SUBADRESID, SUBADRESSTATUS, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  SUBADRESSTATUSSEN;"):
                ID, SUBADRESID, SUBADRESSTATUS, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                SUBADRESSTATUS_OBJECT = etree.Element('SUBADRESSTATUS_OBJECT')
                etree.SubElement(SUBADRESSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "SUBADRESID").text = unicode( SUBADRESID )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "SUBADRESSTATUS").text = unicode( SUBADRESSTATUS )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(SUBADRESSTATUS_OBJECT , "EINDDATUM").text =  EINDDATUM

                SUBADRESSTATUS_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: SUBADRESSTATUS_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( SUBADRESSTATUS_OBJECT) + "\r\n")

            self.xgrabFile.write( '</SUBADRESSTATUSSEN>\r\n')

    def POSTKANTONCODES(self):
        with self.con as con:
            self.xgrabFile.write( '<POSTKANTONCODES objecttype="postkantoncode">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, POSTKANTONCODE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM POSTKANTONCODES;"):
                ID, HUISNUMMERID, POSTKANTONCODE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                POSTKANTONCODE_OBJECT = etree.Element('POSTKANTONCODE_OBJECT')
                etree.SubElement(POSTKANTONCODE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(POSTKANTONCODE_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(POSTKANTONCODE_OBJECT , "POSTKANTONCODE").text = unicode( POSTKANTONCODE )
                etree.SubElement(POSTKANTONCODE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(POSTKANTONCODE_OBJECT , "EINDDATUM").text =  EINDDATUM

                POSTKANTONCODE_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: POSTKANTONCODE_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( POSTKANTONCODE_OBJECT) + "\r\n")

            self.xgrabFile.write( '</POSTKANTONCODES>\r\n')

    def RRSTRAATNAAM_STRAATNAAM_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<RRSTRAATNAAM_STRAATNAAM_RELATIES objecttype="rrStraatnaamStraatnaam">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  RRSTRAATNAAM_STRAATNAAM_RELATIES;"):
                ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                RRSTRAATNAAM_STRAATNAAM_OBJECT = etree.Element('RRSTRAATNAAM_STRAATNAAM_OBJECT')
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "SUBKANTONCODE").text = unicode( SUBKANTONCODE )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "RRSTRAATCODE").text = unicode( RRSTRAATCODE )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "EINDDATUM").text =  EINDDATUM

                RRSTRAATNAAM_STRAATNAAM_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: RRSTRAATNAAM_STRAATNAAM_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( RRSTRAATNAAM_STRAATNAAM_OBJECT) + "\r\n")

            self.xgrabFile.write( '</RRSTRAATNAAM_STRAATNAAM_RELATIES>\r\n')

    def STRAATKANTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<STRAATKANTEN objecttype="straatkant">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, WEGOBJECTID, KANT, PARITEIT, EERSTEHUISNUMMER, LAATSTEHUISNUMMER, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING , EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  STRAATKANTEN;"):
                ID, STRAATNAAMID, WEGOBJECTID, KANT, PARITEIT, EERSTEHUISNUMMER, LAATSTEHUISNUMMER, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                STRAATKANT_OBJECT = etree.Element('STRAATKANT_OBJECT')
                etree.SubElement(STRAATKANT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATKANT_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(STRAATKANT_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )
                etree.SubElement(STRAATKANT_OBJECT , "KANT").text = unicode( KANT )

                if PARITEIT: etree.SubElement(STRAATKANT_OBJECT , "PARITEIT").text = unicode( PARITEIT )
                if EERSTEHUISNUMMER.strip(): etree.SubElement(STRAATKANT_OBJECT , "EERSTEHUISNUMMER").text = EERSTEHUISNUMMER
                if LAATSTEHUISNUMMER.strip(): etree.SubElement(STRAATKANT_OBJECT , "LAATSTEHUISNUMMER").text =  LAATSTEHUISNUMMER

                etree.SubElement(STRAATKANT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(STRAATKANT_OBJECT , "EINDDATUM").text =  EINDDATUM

                STRAATKANT_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: STRAATKANT_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( STRAATKANT_OBJECT) + "\r\n")

            self.xgrabFile.write( '</STRAATKANTEN>\r\n')

    def WEGOBJECTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGOBJECTEN objecttype="wegobject">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, IDENTIFICATORWEGOBJECT, AARDWEGOBJECT, MORFOLOGISCHEWEGKLASSE, AARDVERHARDING, BEGINDATUM,"+
                             " BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  WEGOBJECTEN;"):
                ID, IDENTIFICATORWEGOBJECT, AARDWEGOBJECT, MORFOLOGISCHEWEGKLASSE, AARDVERHARDING, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                WEGOBJECT_OBJECT = etree.Element('WEGOBJECT_OBJECT')
                etree.SubElement(WEGOBJECT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGOBJECT_OBJECT , "IDENTIFICATORWEGOBJECT").text = unicode( IDENTIFICATORWEGOBJECT )
                etree.SubElement(WEGOBJECT_OBJECT , "AARDWEGOBJECT").text = unicode( AARDWEGOBJECT )

                if MORFOLOGISCHEWEGKLASSE != None and AARDVERHARDING != None:
                    WEGVERBINDING = etree.Element('WEGVERBINDING')
                    etree.SubElement(WEGVERBINDING , "MORFOLOGISCHEWEGKLASSE").text = unicode( MORFOLOGISCHEWEGKLASSE )
                    etree.SubElement(WEGVERBINDING , "AARDVERHARDING").text = unicode( AARDVERHARDING )
                    WEGOBJECT_OBJECT.append( WEGVERBINDING )

                etree.SubElement(WEGOBJECT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(WEGOBJECT_OBJECT , "EINDDATUM").text =  EINDDATUM
                WEGOBJECT_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: WEGOBJECT_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( WEGOBJECT_OBJECT) + "\r\n")

            self.xgrabFile.write( '</WEGOBJECTEN>\r\n')

    def WEGVERBINDINGSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGVERBINDINGSTATUSSEN objecttype="wegverbindingstatus">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, WEGOBJECTID, WEGVERBINDINGSTATUS, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM  WEGVERBINDINGSTATUSSEN;"):
                ID, WEGOBJECTID, WEGVERBINDINGSTATUS, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                WEGVERBINDINGSTATUS_OBJECT = etree.Element('WEGVERBINDINGSTATUS_OBJECT')
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "WEGVERBINDINGSTATUS").text = unicode( WEGVERBINDINGSTATUS )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "EINDDATUM").text =  EINDDATUM
                WEGVERBINDINGSTATUS_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: WEGVERBINDINGSTATUS_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(  WEGVERBINDINGSTATUS_OBJECT) + "\r\n")

            self.xgrabFile.write( '</WEGVERBINDINGSTATUSSEN>\r\n' )

    def WEGVERBINDINGGEOMETRIEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGVERBINDINGGEOMETRIEN objecttype="wegverbindinggeometrie">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, WEGOBJECTID, WEGVERBINDINGGEOMETRIE, METHODEWEGVERBINDINGGEOMETRIE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM WEGVERBINDINGGEOMETRIEN;"):
                ID, WEGOBJECTID, WEGVERBINDINGGEOMETRIE, METHODEWEGVERBINDINGGEOMETRIE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                WEGVERBINDINGGEOMETRIE_OBJECT = etree.Element('WEGVERBINDINGGEOMETRIE_OBJECT')
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )

                geom = etree.XML(WEGVERBINDINGGEOMETRIE)
                geomS = '<LineString ><posList>' + geom[0].text + '</posList></LineString>'
                geomC = etree.XML(geomS)
                geomC.set("xmlns", "http://www.opengis.net/gml")

                geomXML = etree.Element("WEGVERBINDINGGEOMETRIE")
                geomXML.append(geomC)
                WEGVERBINDINGGEOMETRIE_OBJECT.append( geomXML )

                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "METHODEWEGVERBINDINGGEOMETRIE").text = unicode( METHODEWEGVERBINDINGGEOMETRIE )
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "EINDDATUM").text =  EINDDATUM
                WEGVERBINDINGGEOMETRIE_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: WEGVERBINDINGGEOMETRIE_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(  WEGVERBINDINGGEOMETRIE_OBJECT) + "\r\n")

            self.xgrabFile.write( '</WEGVERBINDINGGEOMETRIEN>\r\n')

    def TERREINOBJECT_HUISNUMMER_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<TERREINOBJECT_HUISNUMMER_RELATIES objecttype="terreinobjectHuisnummer">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, HUISNUMMERID, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM TERREINOBJECT_HUISNUMMER_RELATIES;"):
                ID, TERREINOBJECTID, HUISNUMMERID, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                TERREINOBJECT_HUISNUMMER_OBJECT = etree.Element('TERREINOBJECT_HUISNUMMER_OBJECT')
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "EINDDATUM").text =  EINDDATUM
                TERREINOBJECT_HUISNUMMER_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: TERREINOBJECT_HUISNUMMER_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(  TERREINOBJECT_HUISNUMMER_OBJECT) + "\r\n")

            self.xgrabFile.write( '</TERREINOBJECT_HUISNUMMER_RELATIES>\r\n')

    def TERREINOBJECTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<TERREINOBJECTEN objecttype="terreinobject">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, AARDGEBOUW, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM TERREINOBJECTEN;"):
                ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, AARDGEBOUW, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                TERREINOBJECT_OBJECT = etree.Element('TERREINOBJECT_OBJECT')
                etree.SubElement(TERREINOBJECT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(TERREINOBJECT_OBJECT , "IDENTIFICATORTERREINOBJECT").text = unicode( IDENTIFICATORTERREINOBJECT )
                etree.SubElement(TERREINOBJECT_OBJECT , "AARDTERREINOBJECT").text = unicode( AARDTERREINOBJECT )

                if AARDGEBOUW:
                    GEBOUWnode = etree.Element("GEBOUW")
                    etree.SubElement(GEBOUWnode , "AARDGEBOUW").text = unicode( AARDGEBOUW )
                    TERREINOBJECT_OBJECT.append(GEBOUWnode)

                etree.SubElement(TERREINOBJECT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(TERREINOBJECT_OBJECT , "EINDDATUM").text =  EINDDATUM
                TERREINOBJECT_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: TERREINOBJECT_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(  TERREINOBJECT_OBJECT) + "\r\n")

            self.xgrabFile.write( '</TERREINOBJECTEN>\r\n')

    def GEBOUWSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<GEBOUWSTATUSSEN objecttype="gebouwstatus">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, GEBOUWSTATUS, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM GEBOUWSTATUSSEN;"):
                ID, TERREINOBJECTID, GEBOUWSTATUS, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                GEBOUWSTATUS_OBJECT = etree.Element('GEBOUWSTATUS_OBJECT')
                etree.SubElement(GEBOUWSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "GEBOUWSTATUS").text = unicode( GEBOUWSTATUS )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(GEBOUWSTATUS_OBJECT , "EINDDATUM").text =  EINDDATUM
                GEBOUWSTATUS_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: GEBOUWSTATUS_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( GEBOUWSTATUS_OBJECT) + "\r\n")

            self.xgrabFile.write( '</GEBOUWSTATUSSEN>\r\n')

    def GEBOUWGEOMETRIEN(self):
        with self.con as con:
            self.xgrabFile.write( '<GEBOUWGEOMETRIEN objecttype="gebouwgeometrie">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, GEBOUWGEOMETRIE, METHODEGEBOUWGEOMETRIE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM GEBOUWGEOMETRIEN;"):
                ID, TERREINOBJECTID, GEBOUWGEOMETRIE, METHODEGEBOUWGEOMETRIE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                GEBOUWGEOMETRIE_OBJECT = etree.Element('GEBOUWGEOMETRIE_OBJECT')
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )

                geom = etree.XML(GEBOUWGEOMETRIE)
                geomS = '<Polygon><exterior><LinearRing><posList>' +  geom[0][0][0].text + '</posList></LinearRing></exterior></Polygon>'
                geomC =  etree.XML( geomS )
                geomC.set("xmlns", "http://www.opengis.net/gml")

                geomXML = etree.Element("GEBOUWGEOMETRIE")
                geomXML.append(geomC)
                GEBOUWGEOMETRIE_OBJECT.append( geomXML )

                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "METHODEGEBOUWGEOMETRIE").text = unicode( METHODEGEBOUWGEOMETRIE )
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "EINDDATUM").text =  EINDDATUM
                GEBOUWGEOMETRIE_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: GEBOUWGEOMETRIE_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( GEBOUWGEOMETRIE_OBJECT) + "\r\n")

            self.xgrabFile.write( '</GEBOUWGEOMETRIEN>\r\n')

    def RRADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<RRADRESSEN objecttype="rrAdres">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, RRHUISNUMMER, RRINDEX, SUBKANTONCODE, RRSTRAATCODE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM RRADRESSEN;"):
                ID, RRHUISNUMMER, RRINDEX, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                RRADRES_OBJECT = etree.Element('RRADRES_OBJECT')
                etree.SubElement(RRADRES_OBJECT , "ID").text = unicode( ID )

                if 0 < len(RRHUISNUMMER.strip()) < 11:
                    etree.SubElement(RRADRES_OBJECT , "RRHUISNUMMER").text =  RRHUISNUMMER
                else:
                    self.ZNcounter += 1             #ISSUE: double ZN not allowed
                    etree.SubElement(RRADRES_OBJECT , "RRHUISNUMMER").text = 'ZN %s' % str( self.ZNcounter )

                if RRINDEX.strip(): etree.SubElement(RRADRES_OBJECT , "INDEX").text = RRINDEX

                etree.SubElement(RRADRES_OBJECT , "SUBKANTONCODE").text = unicode( SUBKANTONCODE )
                etree.SubElement(RRADRES_OBJECT , "RRSTRAATCODE").text = unicode( RRSTRAATCODE )
                etree.SubElement(RRADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(RRADRES_OBJECT , "EINDDATUM").text =  EINDDATUM
                RRADRES_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: RRADRES_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( RRADRES_OBJECT) + "\r\n")

            self.xgrabFile.write( '</RRADRESSEN>\r\n')

    def ADRES_RRADRES_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRES_RRADRES_RELATIES objecttype="adresRrAdres">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, RRADRESID, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM ADRES_RRADRES_RELATIES;"):
                ID, ADRESID, AARDADRES, RRADRESID, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                ADRES_RRADRES_OBJECT = etree.Element('ADRES_RRADRES_OBJECT')
                etree.SubElement(ADRES_RRADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "AARDADRES").text = unicode( AARDADRES )
                etree.SubElement(ADRES_RRADRES_OBJECT , "RRADRESID").text = unicode( RRADRESID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(ADRES_RRADRES_OBJECT , "EINDDATUM").text =  EINDDATUM
                ADRES_RRADRES_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: ADRES_RRADRES_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring(  ADRES_RRADRES_OBJECT ))

            self.xgrabFile.write( '</ADRES_RRADRES_RELATIES>\r\n')

    def KADADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<KADADRESSEN objecttype="kadAdres">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, KADHUISNUMMER, KADSTRAATCODE, NISGEMEENTECODE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM KADADRESSEN;"):
                ID, KADHUISNUMMER, KADSTRAATCODE, NISGEMEENTECODE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                KADADRES_OBJECT = etree.Element('KADADRES_OBJECT')
                etree.SubElement(KADADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(KADADRES_OBJECT , "KADHUISNUMMER").text = unicode( KADHUISNUMMER )
                etree.SubElement(KADADRES_OBJECT , "KADSTRAATCODE").text = unicode( KADSTRAATCODE )
                etree.SubElement(KADADRES_OBJECT , "NISGEMEENTECODE").text = unicode( NISGEMEENTECODE )
                etree.SubElement(KADADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(KADADRES_OBJECT , "EINDDATUM").text =  EINDDATUM
                KADADRES_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: KADADRES_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( KADADRES_OBJECT) + "\r\n")

            self.xgrabFile.write( '</KADADRESSEN>\r\n')

    def ADRES_KADADRES_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRES_KADADRES_RELATIES objecttype="adresKadAdres">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, KADADRESID, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM ADRES_KADADRES_RELATIES;"):
                ID, ADRESID, AARDADRES, KADADRESID, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                ADRES_KADADRES_OBJECT = etree.Element('ADRES_KADADRES_OBJECT')
                etree.SubElement(ADRES_KADADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "AARDADRES").text = unicode( AARDADRES )
                etree.SubElement(ADRES_KADADRES_OBJECT , "KADADRESID").text = unicode( KADADRESID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(ADRES_KADADRES_OBJECT , "EINDDATUM").text =  EINDDATUM
                ADRES_KADADRES_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )
                if EINDDATUM != None: ADRES_KADADRES_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( ADRES_KADADRES_OBJECT) + "\r\n")

            self.xgrabFile.write( '</ADRES_KADADRES_RELATIES>\r\n')

    def ADRESPOSITIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRESPOSITIES objecttype="adrespositie">\r\n')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, X, Y, HERKOMSTADRESPOSITIE, " +
                "BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING FROM ADRESPOSITIES;"):
                ID, ADRESID, AARDADRES,  X, Y, HERKOMSTADRESPOSITIE, BEGINDATUM, BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING, EINDDATUM, EINDTIJD, EINDORGANISATIE, EINDBEWERKING = row
                ADRESPOSITIE_OBJECT = etree.Element('ADRESPOSITIE_OBJECT')
                etree.SubElement(ADRESPOSITIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRESPOSITIE_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRESPOSITIE_OBJECT , "AARDADRES").text = unicode( AARDADRES )

                ADRESPOSITIE = '<Point ><pos>%s %s</pos></Point>' % (X, Y)
                geom = etree.XML(ADRESPOSITIE)
                geom.set("xmlns", "http://www.opengis.net/gml")

                geomXML = etree.Element("ADRESPOSITIE")
                geomXML.append(geom)
                ADRESPOSITIE_OBJECT.append( geomXML )

                etree.SubElement(ADRESPOSITIE_OBJECT , "HERKOMSTADRESPOSITIE").text = unicode( HERKOMSTADRESPOSITIE )
                etree.SubElement(ADRESPOSITIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                if EINDDATUM != None: etree.SubElement(ADRESPOSITIE_OBJECT , "EINDDATUM").text =  EINDDATUM
                ADRESPOSITIE_OBJECT.append( self._begin_metaTag(BEGINTIJD, BEGINORGANISATIE, BEGINBEWERKING ) )


                if EINDDATUM != None: ADRESPOSITIE_OBJECT.append( self._end_metaTag(EINDTIJD, EINDORGANISATIE, EINDBEWERKING ) )
                self.xgrabFile.write( etree.tostring( ADRESPOSITIE_OBJECT) + "\r\n")

            self.xgrabFile.write( '</ADRESPOSITIES>\r\n')