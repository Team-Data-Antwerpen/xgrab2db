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

      cur.execute("CREATE TABLE IF NOT EXISTS STRAATNAMEN(ID INT PRIMARY KEY, STRAATCODE INT, NISGEMEENTECODE INT, STRAATNAAM TEXT, TAALCODESTRAATNAAM TEXT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        STRAATCODE =  row.find("{http://crab.agiv.be}STRAATCODE").text
        NISGEMEENTECODE = row.find("{http://crab.agiv.be}NISGEMEENTECODE").text
        STRAATNAAM = row.find("{http://crab.agiv.be}STRAATNAAM").text.replace("'", "''" )
        TAALCODESTRAATNAAM = row.find("{http://crab.agiv.be}TAALCODESTRAATNAAM").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute( "SELECT * FROM STRAATNAMEN WHERE ID = %s;" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= u"INSERT INTO STRAATNAMEN VALUES(%s,%s,%s,'%s','%s','%s');" % (id,STRAATCODE,NISGEMEENTECODE,STRAATNAAM,TAALCODESTRAATNAAM,BEGINDATUM)

            cur.execute(sql)
        else:
            sql = u"UPDATE STRAATNAMEN"
            sql += u""" SET ID = %s ,
            STRAATCODE =  %s ,
            NISGEMEENTECODE =   %s ,
            STRAATNAAM =   '%s' ,
            TAALCODESTRAATNAAM =   '%s' ,
            BEGINDATUM =  '%s' """ % (id,STRAATCODE,NISGEMEENTECODE,STRAATNAAM,TAALCODESTRAATNAAM,BEGINDATUM)
            sql += u" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def STRAATNAAMSTATUSSEN(self):
    with self.con as con:
      #STRAATNAAMSTATUSSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}STRAATNAAMSTATUSSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS STRAATNAAMSTATUSSEN(ID INT PRIMARY KEY, STRAATNAAMID INT, STRAATNAAMSTATUS INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        STRAATNAAMID =  row.find("{http://crab.agiv.be}STRAATNAAMID").text
        STRAATNAAMSTATUS = row.find("{http://crab.agiv.be}STRAATNAAMSTATUS").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM STRAATNAAMSTATUSSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO STRAATNAAMSTATUSSEN VALUES(%s,%s,%s,'%s');" % (id,STRAATNAAMID,STRAATNAAMSTATUS,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE STRAATNAAMSTATUSSEN"
            sql +=""" SET ID = %s ,
            STRAATNAAMID =  %s ,
            STRAATNAAMSTATUS =  %s ,
            BEGINDATUM = '%s' """ % (id,STRAATNAAMID,STRAATNAAMSTATUS,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def HUISNUMMERS(self):
    with self.con as con:
      #HUISNUMMERS
      rows = self.rootgrab[0].find("{http://crab.agiv.be}HUISNUMMERS")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS HUISNUMMERS(ID INT PRIMARY KEY, STRAATNAAMID INT, HUISNUMMER TEXT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
        HUISNUMMER =  row.find("{http://crab.agiv.be}HUISNUMMER").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM HUISNUMMERS WHERE ID = %s ;" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO HUISNUMMERS VALUES(%s,%s,'%s','%s');" % (id,STRAATNAAMID,HUISNUMMER,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE HUISNUMMERS"
            sql +=""" SET ID = %s ,
            STRAATNAAMID =  %s ,
            HUISNUMMER = '%s',
            BEGINDATUM = '%s' """ % (id,STRAATNAAMID,HUISNUMMER,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def HUISNUMMERSTATUSSEN(self):
    with self.con as con:
      #HUISNUMMERSTATUSSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}HUISNUMMERSTATUSSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS HUISNUMMERSTATUSSEN(ID INT PRIMARY KEY, HUISNUMMERID INT, HUISNUMMERSTATUS INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
        HUISNUMMERSTATUS = row.find("{http://crab.agiv.be}HUISNUMMERSTATUS").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM HUISNUMMERSTATUSSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO HUISNUMMERSTATUSSEN VALUES(%s,%s,%s,'%s');" % (id,HUISNUMMERID,HUISNUMMERSTATUS,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE HUISNUMMERSTATUSSEN"
            sql +=""" SET ID = %s ,
            HUISNUMMERID =  %s ,
            HUISNUMMERSTATUS = %s,
            BEGINDATUM = '%s' """ % (id,HUISNUMMERID,HUISNUMMERSTATUS,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def SUBADRESSEN(self):
    with self.con as con:
      #SUBADRESSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}SUBADRESSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS SUBADRESSEN(ID INT PRIMARY KEY, HUISNUMMERID INT, SUBADRES TEXT, AARDSUBADRES INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
        SUBADRES = row.find("{http://crab.agiv.be}SUBADRES").text
        AARDSUBADRES  = row.find("{http://crab.agiv.be}AARDSUBADRES").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM SUBADRESSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO SUBADRESSEN VALUES(%s,%s,'%s',%s,'%s');" % (id,HUISNUMMERID,SUBADRES,AARDSUBADRES,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE SUBADRESSEN"
            sql +=""" SET ID = %s ,
            HUISNUMMERID =  %s ,
            SUBADRES = '%s',
            AARDSUBADRES =  %s ,
            BEGINDATUM = '%s' """ % (id,HUISNUMMERID,SUBADRES,AARDSUBADRES,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def SUBADRESSTATUSSEN(self):
    with self.con as con:
      #SUBADRESSTATUSSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}SUBADRESSTATUSSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS SUBADRESSTATUSSEN(ID INT PRIMARY KEY, SUBADRESID INT, SUBADRESSTATUS INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        SUBADRESID = row.find("{http://crab.agiv.be}SUBADRESID").text
        SUBADRESSTATUS = row.find("{http://crab.agiv.be}SUBADRESSTATUS").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM SUBADRESSTATUSSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO SUBADRESSTATUSSEN VALUES(%s,%s,%s,'%s');" % (id,SUBADRESID,SUBADRESSTATUS,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE SUBADRESSTATUSSEN"
            sql +=""" SET ID = %s ,
            SUBADRESID =  %s ,
            SUBADRESSTATUS = %s ,
            BEGINDATUM = '%s' """ %  (id,SUBADRESID,SUBADRESSTATUS,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def POSTKANTONCODES(self):
    with self.con as con:
      #POSTKANTONCODES
      rows = self.rootgrab[0].find("{http://crab.agiv.be}POSTKANTONCODES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS POSTKANTONCODES(ID INT PRIMARY KEY, HUISNUMMERID INT, POSTKANTONCODE INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        HUISNUMMERID = row.find("{http://crab.agiv.be}HUISNUMMERID").text
        POSTKANTONCODE = row.find("{http://crab.agiv.be}POSTKANTONCODE").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM POSTKANTONCODES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO POSTKANTONCODES VALUES(%s,%s,%s,'%s');" % (id,HUISNUMMERID,POSTKANTONCODE,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE POSTKANTONCODES"
            sql +=""" SET ID = %s ,
            HUISNUMMERID =  %s ,
            POSTKANTONCODE = %s ,
            BEGINDATUM = '%s' """ % (id,HUISNUMMERID,POSTKANTONCODE,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def RRSTRAATNAAM_STRAATNAAM_RELATIES(self):
    with self.con as con:
      #RRSTRAATNAAM_STRAATNAAM_RELATIES
      rows = self.rootgrab[0].find("{http://crab.agiv.be}RRSTRAATNAAM_STRAATNAAM_RELATIES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS RRSTRAATNAAM_STRAATNAAM_RELATIES(ID INT PRIMARY KEY, STRAATNAAMID INT, SUBKANTONCODE TEXT, RRSTRAATCODE TEXt, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        STRAATNAAMID = row.find("{http://crab.agiv.be}STRAATNAAMID").text
        SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
        RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM RRSTRAATNAAM_STRAATNAAM_RELATIES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO RRSTRAATNAAM_STRAATNAAM_RELATIES VALUES(%s,%s,'%s','%s','%s');" % (id,STRAATNAAMID,SUBKANTONCODE,RRSTRAATCODE,BEGINDATUM)
            cur.execute(sql)
        else:
            sql = "UPDATE RRSTRAATNAAM_STRAATNAAM_RELATIES"
            sql +=""" SET ID = %s ,
            STRAATNAAMID =  %s ,
            SUBKANTONCODE = '%s' ,
            RRSTRAATCODE = '%s' ,
            BEGINDATUM = '%s' """ % (id,STRAATNAAMID,SUBKANTONCODE,RRSTRAATCODE,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def STRAATKANTEN(self):
    with self.con as con:
      #STRAATKANTEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}STRAATKANTEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS STRAATKANTEN(ID INT PRIMARY KEY, STRAATNAAMID INT, WEGOBJECTID INT, KANT INT, PARITEIT INT, EERSTEHUISNUMMER TEXT, LAATSTEHUISNUMMER TEXT, BEGINDATUM TEXT);")

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
        else: EERSTEHUISNUMMER = "NULL"

        LAATSTEHUISNUMMERnode = row.find("{http://crab.agiv.be}LAATSTEHUISNUMMER")
        if LAATSTEHUISNUMMERnode != None: LAATSTEHUISNUMMER = LAATSTEHUISNUMMERnode.text
        else: LAATSTEHUISNUMMER = "NULL"

        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM STRAATKANTEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
            sql= "INSERT INTO STRAATKANTEN VALUES(%s,%s,%s,%s,%s,'%s','%s','%s');" % (id,STRAATNAAMID,WEGOBJECTID,KANT,PARITEIT,EERSTEHUISNUMMER,LAATSTEHUISNUMMER,BEGINDATUM)
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
            BEGINDATUM = '%s' """ % (id,STRAATNAAMID,WEGOBJECTID,KANT,PARITEIT,EERSTEHUISNUMMER,LAATSTEHUISNUMMER,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def WEGOBJECTEN(self):
    with self.con as con:
      #WEGOBJECTEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGOBJECTEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS WEGOBJECTEN(ID INT PRIMARY KEY, IDENTIFICATORWEGOBJECT TEXT, AARDWEGOBJECT INT,  BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        IDENTIFICATORWEGOBJECT = row.find("{http://crab.agiv.be}IDENTIFICATORWEGOBJECT").text
        AARDWEGOBJECT =  row.find("{http://crab.agiv.be}AARDWEGOBJECT").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM WEGOBJECTEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO WEGOBJECTEN VALUES(%s,'%s',%s,'%s');" % (id,IDENTIFICATORWEGOBJECT,AARDWEGOBJECT,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE WEGOBJECTEN"
            sql +=""" SET ID = %s ,
            IDENTIFICATORWEGOBJECT =  '%s' ,
            AARDWEGOBJECT = %s ,
            BEGINDATUM = '%s' """ % (id,IDENTIFICATORWEGOBJECT,AARDWEGOBJECT,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def WEGVERBINDINGSTATUSSEN(self):
      with self.con as con:
      #WEGVERBINDINGSTATUSSEN
          rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGVERBINDINGSTATUSSEN")

          cur = con.cursor()

          cur.execute("CREATE TABLE IF NOT EXISTS WEGVERBINDINGSTATUSSEN(ID INT PRIMARY KEY, WEGOBJECTID INT, WEGVERBINDINGSTATUS INT, BEGINDATUM TEXT);")

          for row in rows.getchildren():
            id = row[0].text
            WEGOBJECTID = row.find("{http://crab.agiv.be}WEGOBJECTID").text
            WEGVERBINDINGSTATUS = row.find("{http://crab.agiv.be}WEGVERBINDINGSTATUS").text
            BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

            cur.execute("SELECT * FROM WEGVERBINDINGSTATUSSEN WHERE ID = %s" % id)
            data = cur.fetchall()

            if len(data) == 0:
              sql= "INSERT INTO WEGVERBINDINGSTATUSSEN VALUES(%s,%s,%s,'%s');" % (id,WEGOBJECTID,WEGVERBINDINGSTATUS,BEGINDATUM)
              cur.execute(sql)
            else:
                sql = "UPDATE WEGVERBINDINGSTATUSSEN"
                sql +=""" SET ID = %s ,
                WEGOBJECTID =  %s ,
                WEGVERBINDINGSTATUS = %s ,
                BEGINDATUM = '%s' """ %  (id,WEGOBJECTID,WEGVERBINDINGSTATUS,BEGINDATUM)
                sql +=" WHERE ID = %s ;" % id
                cur.execute(sql)
      con.commit()

  #geo
  def WEGVERBINDINGGEOMETRIEN(self):
      with self.con as con:
      #WEGVERBINDINGGEOMETRIEN
          rows = self.rootgrab[0].find("{http://crab.agiv.be}WEGVERBINDINGGEOMETRIEN")

          cur = con.cursor()

          cur.execute("CREATE TABLE IF NOT EXISTS WEGVERBINDINGGEOMETRIEN(ID INT PRIMARY KEY, WEGOBJECTID INT, WEGVERBINDINGGEOMETRIE TEXT, METHODEWEGVERBINDINGGEOMETRIE INT, BEGINDATUM TEXT);")

          for row in rows.getchildren():
            id = row[0].text
            WEGOBJECTID = row.find("{http://crab.agiv.be}WEGOBJECTID").text

            #python inserts wrong namespace for some reason
            WEGVERBINDINGGEOMETRIE = "<LineString><posList> %s </posList></LineString>"%  row.find("{http://crab.agiv.be}WEGVERBINDINGGEOMETRIE")[0][0].text

            METHODEWEGVERBINDINGGEOMETRIE = row.find("{http://crab.agiv.be}METHODEWEGVERBINDINGGEOMETRIE").text
            BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

            cur.execute("SELECT * FROM WEGVERBINDINGGEOMETRIEN WHERE ID = %s" % id)
            data = cur.fetchall()

            if len(data) == 0:
                sql= "INSERT INTO WEGVERBINDINGGEOMETRIEN VALUES(%s,%s,'%s',%s,'%s');" % (id,WEGOBJECTID,WEGVERBINDINGGEOMETRIE,METHODEWEGVERBINDINGGEOMETRIE,BEGINDATUM)
                cur.execute(sql)
            else:
                sql = "UPDATE WEGVERBINDINGGEOMETRIEN "
                sql +=""" SET ID = %s ,
                WEGOBJECTID =  %s ,
                WEGVERBINDINGGEOMETRIE = '%s' ,
                METHODEWEGVERBINDINGGEOMETRIE = %s ,
                BEGINDATUM = '%s' """ %  (id,WEGOBJECTID,WEGVERBINDINGGEOMETRIE,METHODEWEGVERBINDINGGEOMETRIE,BEGINDATUM)
                sql +=" WHERE ID = %s ;" % id
                cur.execute(sql)
      con.commit()

  def TERREINOBJECT_HUISNUMMER_RELATIES(self):
    with self.con as con:
      #TERREINOBJECT_HUISNUMMER_RELATIES
      rows = self.rootgrab[0].find("{http://crab.agiv.be}TERREINOBJECT_HUISNUMMER_RELATIES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS TERREINOBJECT_HUISNUMMER_RELATIES(ID INT PRIMARY KEY, TERREINOBJECTID INT, HUISNUMMERID INT,  BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
        HUISNUMMERID =  row.find("{http://crab.agiv.be}HUISNUMMERID").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM TERREINOBJECT_HUISNUMMER_RELATIES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO TERREINOBJECT_HUISNUMMER_RELATIES VALUES(%s,%s,%s,'%s');" % (id,TERREINOBJECTID,HUISNUMMERID,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE TERREINOBJECT_HUISNUMMER_RELATIES "
            sql +=""" SET ID = %s ,
            TERREINOBJECTID =  %s ,
            HUISNUMMERID = %s ,
            BEGINDATUM = '%s' """ %  (id,TERREINOBJECTID,HUISNUMMERID,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def TERREINOBJECTEN(self):
    with self.con as con:
      #TERREINOBJECTEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}TERREINOBJECTEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS TERREINOBJECTEN(ID INT PRIMARY KEY, IDENTIFICATORTERREINOBJECT TEXT, AARDTERREINOBJECT INT,  BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        IDENTIFICATORTERREINOBJECT = row.find("{http://crab.agiv.be}IDENTIFICATORTERREINOBJECT").text
        AARDTERREINOBJECT = row.find("{http://crab.agiv.be}AARDTERREINOBJECT").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM TERREINOBJECTEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO TERREINOBJECTEN VALUES(%s,'%s',%s,'%s');" % (id,IDENTIFICATORTERREINOBJECT,AARDTERREINOBJECT,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE TERREINOBJECTEN "
            sql +=""" SET ID = %s ,
            IDENTIFICATORTERREINOBJECT =  '%s' ,
            AARDTERREINOBJECT = %s ,
            BEGINDATUM = '%s' """ % (id,IDENTIFICATORTERREINOBJECT,AARDTERREINOBJECT,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def GEBOUWSTATUSSEN(self):
    with self.con as con:
      #GEBOUWSTATUSSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}GEBOUWSTATUSSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS GEBOUWSTATUSSEN(ID INT PRIMARY KEY, TERREINOBJECTID TEXT, GEBOUWSTATUS INT,  BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text
        GEBOUWSTATUS = row.find("{http://crab.agiv.be}GEBOUWSTATUS").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM GEBOUWSTATUSSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO GEBOUWSTATUSSEN VALUES(%s,'%s',%s,'%s');" % (id,TERREINOBJECTID,GEBOUWSTATUS,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE GEBOUWSTATUSSEN "
            sql +=""" SET ID = %s ,
            TERREINOBJECTID =  %s ,
            GEBOUWSTATUS = %s ,
            BEGINDATUM = '%s' """ % (id,TERREINOBJECTID,GEBOUWSTATUS,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  #geo
  def GEBOUWGEOMETRIEN(self):
      with self.con as con:
      #GEBOUWGEOMETRIEN
          rows = self.rootgrab[0].find("{http://crab.agiv.be}GEBOUWGEOMETRIEN")

          cur = con.cursor()

          cur.execute("CREATE TABLE IF NOT EXISTS GEBOUWGEOMETRIEN(ID INT PRIMARY KEY, TERREINOBJECTID INT, GEBOUWGEOMETRIE TEXT, METHODEGEBOUWGEOMETRIE, BEGINDATUM TEXT);")

          for row in rows.getchildren():
            id = row[0].text
            TERREINOBJECTID = row.find("{http://crab.agiv.be}TERREINOBJECTID").text

            #python inserts wrong namespace for some reason
            GEBOUWGEOMETRIE = "<Polygon ><exterior><LinearRing><posList> %s </posList></LinearRing></exterior></Polygon>" % row.find("{http://crab.agiv.be}GEBOUWGEOMETRIE")[0][0][0][0].text

            METHODEGEBOUWGEOMETRIE = row.find("{http://crab.agiv.be}METHODEGEBOUWGEOMETRIE").text
            BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

            cur.execute("SELECT * FROM GEBOUWGEOMETRIEN WHERE ID = %s" % id)
            data = cur.fetchall()

            if len(data) == 0:
                sql= "INSERT INTO GEBOUWGEOMETRIEN VALUES(%s,%s,'%s',%s,'%s');" % (id,TERREINOBJECTID,GEBOUWGEOMETRIE,METHODEGEBOUWGEOMETRIE,BEGINDATUM)
                cur.execute(sql)
            else:
                sql = "UPDATE GEBOUWGEOMETRIEN "
                sql +=""" SET ID = %s ,
                TERREINOBJECTID =  %s ,
                GEBOUWGEOMETRIE = '%s' ,
                METHODEGEBOUWGEOMETRIE = '%s' ,
                BEGINDATUM = '%s' """ % (id,TERREINOBJECTID,GEBOUWGEOMETRIE,METHODEGEBOUWGEOMETRIE,BEGINDATUM)
                sql +=" WHERE ID = %s ;" % id
                cur.execute(sql)
      con.commit()

  def RRADRESSEN(self):
    with self.con as con:
      #RRADRESSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}RRADRESSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS RRADRESSEN(ID INT PRIMARY KEY, RRHUISNUMMER TEXT, SUBKANTONCODE TEXT, RRSTRAATCODE TEXT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        RRHUISNUMMER = row.find("{http://crab.agiv.be}RRHUISNUMMER").text
        SUBKANTONCODE = row.find("{http://crab.agiv.be}SUBKANTONCODE").text
        RRSTRAATCODE = row.find("{http://crab.agiv.be}RRSTRAATCODE").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
        #TODO: Metadata???

        cur.execute("SELECT * FROM RRADRESSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO RRADRESSEN VALUES(%s,'%s','%s','%s','%s');" % (id,RRHUISNUMMER,SUBKANTONCODE,RRSTRAATCODE,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE RRADRESSEN "
            sql +=""" SET ID = %s ,
            RRHUISNUMMER =  '%s' ,
            SUBKANTONCODE = '%s' ,
            RRSTRAATCODE = '%s' ,
            BEGINDATUM = '%s' """ % (id,RRHUISNUMMER,SUBKANTONCODE,RRSTRAATCODE,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def ADRES_RRADRES_RELATIES(self):
    with self.con as con:
      #ADRES_RRADRES_RELATIES
      rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRES_RRADRES_RELATIES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS ADRES_RRADRES_RELATIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, RRADRESID INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
        AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text
        RRADRESID = row.find("{http://crab.agiv.be}RRADRESID").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM ADRES_RRADRES_RELATIES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO ADRES_RRADRES_RELATIES VALUES(%s,%s,%s,%s,'%s');" % (id,ADRESID,AARDADRES,RRADRESID,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE ADRES_RRADRES_RELATIES "
            sql +=""" SET ID = %s ,
            ADRESID =  %s ,
            AARDADRES = %s ,
            RRADRESID = %s ,
            BEGINDATUM = '%s' """ % (id,ADRESID,AARDADRES,RRADRESID,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def KADADRESSEN(self):
    with self.con as con:
      #KADADRESSEN
      rows = self.rootgrab[0].find("{http://crab.agiv.be}KADADRESSEN")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS KADADRESSEN(ID INT PRIMARY KEY, KADHUISNUMMER TEXT, KADSTRAATCODE TEXT, NISGEMEENTECODE TEXT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        KADHUISNUMMER = row.find("{http://crab.agiv.be}KADHUISNUMMER").text
        KADSTRAATCODE = row.find("{http://crab.agiv.be}KADSTRAATCODE").text
        NISGEMEENTECODE = row.find("{http://crab.agiv.be}NISGEMEENTECODE").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text
        #TODO: Metadata???

        cur.execute("SELECT * FROM KADADRESSEN WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO KADADRESSEN VALUES(%s,'%s','%s','%s','%s');" % (id,KADHUISNUMMER,KADSTRAATCODE,NISGEMEENTECODE,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE KADADRESSEN "
            sql +=""" SET ID = %s ,
            KADHUISNUMMER =  '%s' ,
            KADSTRAATCODE = '%s' ,
            NISGEMEENTECODE = '%s' ,
            BEGINDATUM = '%s' """ % (id,KADHUISNUMMER,KADSTRAATCODE,NISGEMEENTECODE,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  def ADRES_KADADRES_RELATIES(self):
    with self.con as con:
      #ADRES_KADADRES_RELATIES
      rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRES_KADADRES_RELATIES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS ADRES_KADADRES_RELATIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, KADADRESID INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
        AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text
        KADADRESID = row.find("{http://crab.agiv.be}KADADRESID").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM ADRES_KADADRES_RELATIES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO ADRES_KADADRES_RELATIES VALUES(%s,%s,%s,%s,'%s');" % (id,ADRESID,AARDADRES,KADADRESID,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE ADRES_KADADRES_RELATIES "
            sql +=""" SET ID = %s ,
            ADRESID =  %s ,
            AARDADRES = %s ,
            KADADRESID = %s ,
            BEGINDATUM = '%s' """ % (id,ADRESID,AARDADRES,KADADRESID,BEGINDATUM)
            sql +=" WHERE ID = %s ;" % id
            cur.execute(sql)
      con.commit()

  #geo
  def ADRESPOSITIES(self):
    with self.con as con:
      rows = self.rootgrab[0].find("{http://crab.agiv.be}ADRESPOSITIES")

      cur = con.cursor()

      cur.execute("CREATE TABLE IF NOT EXISTS ADRESPOSITIES(ID INT PRIMARY KEY, ADRESID INT, AARDADRES INT, X REAL, Y REAL, HERKOMSTADRESPOSITIE INT, BEGINDATUM TEXT);")

      for row in rows.getchildren():
        id = row[0].text
        ADRESID = row.find("{http://crab.agiv.be}ADRESID").text
        AARDADRES = row.find("{http://crab.agiv.be}AARDADRES").text

        X, Y = row.find("{http://crab.agiv.be}ADRESPOSITIE")[0][0].text.split()

        HERKOMSTADRESPOSITIE= row.find("{http://crab.agiv.be}HERKOMSTADRESPOSITIE").text
        BEGINDATUM = row.find("{http://crab.agiv.be}BEGINDATUM").text

        cur.execute("SELECT * FROM ADRESPOSITIES WHERE ID = %s" % id)
        data = cur.fetchall()

        if len(data) == 0:
          sql= "INSERT INTO ADRESPOSITIES VALUES(%s,%s,%s,%s,%s,%s,'%s');" % (id,ADRESID,AARDADRES,X,Y,HERKOMSTADRESPOSITIE,BEGINDATUM)
          cur.execute(sql)
        else:
            sql = "UPDATE ADRESPOSITIES "
            sql +=""" SET ID = %s ,
            ADRESID =  %s ,
            AARDADRES = %s ,
            X = %s,
            Y= %s,
            HERKOMSTADRESPOSITIE = %s ,
            BEGINDATUM = '%s' """% (id,ADRESID,AARDADRES,X,Y,HERKOMSTADRESPOSITIE,BEGINDATUM)
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


class xgrabFromdb:
    def __init__(self, DBconnection, xgrabPath ):
        self.con = DBconnection
        self.xgrabPath = xgrabPath
        self.xgrabFile = codecs.open( xgrabPath, mode="wb", encoding="utf-8",
                                buffering=True )
        self.time =  datetime.datetime.now().isoformat()

        self.xgrabFile.write( u'<?xml version="1.0" encoding="utf-8"?>\r\n' +
        '<CRAB HUIDIG_TIJDSTIP="%s" xmlns="http://crab.agiv.be"><COMPONENTEN>\r\n' % self.time )

    def close(self):
        if self.xgrabFile.closed == False:
            self.xgrabFile.write( u"</COMPONENTEN></CRAB>" )
            self.xgrabFile.close()

    def _begin_metaTag(self,  organisatie=1 , bewerking=3 ):
        BEGINMETADATA = etree.Element('BEGINMETADATA')
        etree.SubElement(BEGINMETADATA , "TIJD").text = self.time
        etree.SubElement(BEGINMETADATA , "ORGANISATIE").text = str( organisatie )
        etree.SubElement(BEGINMETADATA , "BEWERKING").text = str( bewerking )
        return BEGINMETADATA

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
            self.xgrabFile.write( '<STRAATNAMEN objecttype="straatnaam">' )
            
            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM, BEGINDATUM FROM STRAATNAMEN;"):
                ID, STRAATCODE, NISGEMEENTECODE, STRAATNAAM, TAALCODESTRAATNAAM, BEGINDATUM = row
                STRAATNAAM_OBJECT = etree.Element('STRAATNAAM_OBJECT')
                etree.SubElement(STRAATNAAM_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATNAAM_OBJECT , "STRAATCODE").text = unicode( STRAATCODE )
                etree.SubElement(STRAATNAAM_OBJECT , "NISGEMEENTECODE").text = unicode( NISGEMEENTECODE )
                etree.SubElement(STRAATNAAM_OBJECT , "STRAATNAAM").text = STRAATNAAM
                etree.SubElement(STRAATNAAM_OBJECT , "TAALCODESTRAATNAAM").text = TAALCODESTRAATNAAM
                etree.SubElement(STRAATNAAM_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                STRAATNAAM_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( STRAATNAAM_OBJECT ))

            self.xgrabFile.write( '</STRAATNAMEN>' )

    def STRAATNAAMSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write(  '<STRAATNAAMSTATUSSEN objecttype="straatnaamstatus">' )
            
            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, STRAATNAAMSTATUS, BEGINDATUM FROM  STRAATNAAMSTATUSSEN;"):
                ID, STRAATNAAMID, STRAATNAAMSTATUS, BEGINDATUM = row
                STRAATNAAMSTATUS_OBJECT = etree.Element('STRAATNAAMSTATUS_OBJECT')
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "STRAATNAAMSTATUS").text = unicode( STRAATNAAMSTATUS )
                etree.SubElement(STRAATNAAMSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                STRAATNAAMSTATUS_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( STRAATNAAMSTATUS_OBJECT ))

            self.xgrabFile.write( "</STRAATNAAMSTATUSSEN>")

    def HUISNUMMERS(self):
        with self.con as con: 
            self.xgrabFile.write( '<HUISNUMMERS objecttype="huisnummer">')
            
            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, HUISNUMMER, BEGINDATUM FROM  HUISNUMMERS;"):
                ID, STRAATNAAMID, HUISNUMMER, BEGINDATUM = row
                HUISNUMMER_OBJECT = etree.Element('HUISNUMMER_OBJECT')
                etree.SubElement(HUISNUMMER_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(HUISNUMMER_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(HUISNUMMER_OBJECT , "HUISNUMMER").text = unicode( HUISNUMMER )
                etree.SubElement(HUISNUMMER_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                HUISNUMMER_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(HUISNUMMER_OBJECT ))

            self.xgrabFile.write( "</HUISNUMMERS>")

    def HUISNUMMERSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<HUISNUMMERSTATUSSEN objecttype="huisnummerstatus">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, HUISNUMMERSTATUS, BEGINDATUM FROM  HUISNUMMERSTATUSSEN;"):
                ID, HUISNUMMERID, HUISNUMMERSTATUS, BEGINDATUM = row
                HUISNUMMERSTATUS_OBJECT = etree.Element('HUISNUMMERSTATUS_OBJECT')
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "HUISNUMMERSTATUS").text = unicode( HUISNUMMERSTATUS )
                etree.SubElement(HUISNUMMERSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                HUISNUMMERSTATUS_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( HUISNUMMERSTATUS_OBJECT ))

            self.xgrabFile.write( "</HUISNUMMERSTATUSSEN>")

    def SUBADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<SUBADRESSEN objecttype="subadres">' )
            
            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, SUBADRES, AARDSUBADRES, BEGINDATUM  FROM  SUBADRESSEN;"):
                ID, HUISNUMMERID, SUBADRES, AARDSUBADRES, BEGINDATUM = row
                SUBADRES_OBJECT = etree.Element('SUBADRES_OBJECT')
                etree.SubElement(SUBADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(SUBADRES_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(SUBADRES_OBJECT , "SUBADRES").text = unicode( SUBADRES )
                etree.SubElement(SUBADRES_OBJECT , "AARDSUBADRES").text = unicode( AARDSUBADRES )
                etree.SubElement(SUBADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                SUBADRES_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( SUBADRES_OBJECT ) )

            self.xgrabFile.write( '</SUBADRESSEN>')

    def SUBADRESSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<SUBADRESSTATUSSEN objecttype="subadresstatus">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, SUBADRESID, SUBADRESSTATUS, BEGINDATUM FROM  SUBADRESSTATUSSEN;"):
                ID, SUBADRESID, SUBADRESSTATUS, BEGINDATUM = row
                SUBADRESSTATUS_OBJECT = etree.Element('SUBADRESSTATUS_OBJECT')
                etree.SubElement(SUBADRESSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "SUBADRESID").text = unicode( SUBADRESID )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "SUBADRESSTATUS").text = unicode( SUBADRESSTATUS )
                etree.SubElement(SUBADRESSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                SUBADRESSTATUS_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( SUBADRESSTATUS_OBJECT ) )

            self.xgrabFile.write( '</SUBADRESSTATUSSEN>')

    def POSTKANTONCODES(self):
        with self.con as con:
            self.xgrabFile.write( '<POSTKANTONCODES objecttype="postkantoncode">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, HUISNUMMERID, POSTKANTONCODE, BEGINDATUM FROM  POSTKANTONCODES;"):
                ID, HUISNUMMERID, POSTKANTONCODE, BEGINDATUM = row
                POSTKANTONCODE_OBJECT = etree.Element('POSTKANTONCODE_OBJECT')
                etree.SubElement(POSTKANTONCODE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(POSTKANTONCODE_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(POSTKANTONCODE_OBJECT , "POSTKANTONCODE").text = unicode( POSTKANTONCODE )
                etree.SubElement(POSTKANTONCODE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                POSTKANTONCODE_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( POSTKANTONCODE_OBJECT ) )

            self.xgrabFile.write( '</POSTKANTONCODES>')

    def RRSTRAATNAAM_STRAATNAAM_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<RRSTRAATNAAM_STRAATNAAM_RELATIES objecttype="rrStraatnaamStraatnaam">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM FROM  RRSTRAATNAAM_STRAATNAAM_RELATIES;"):
                ID, STRAATNAAMID, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM = row
                RRSTRAATNAAM_STRAATNAAM_OBJECT = etree.Element('RRSTRAATNAAM_STRAATNAAM_OBJECT')
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "SUBKANTONCODE").text = unicode( SUBKANTONCODE )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "RRSTRAATCODE").text = unicode( RRSTRAATCODE )
                etree.SubElement(RRSTRAATNAAM_STRAATNAAM_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                RRSTRAATNAAM_STRAATNAAM_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( RRSTRAATNAAM_STRAATNAAM_OBJECT ) )

            self.xgrabFile.write( '</RRSTRAATNAAM_STRAATNAAM_RELATIES>')

    def STRAATKANTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<STRAATKANTEN objecttype="straatkant">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, STRAATNAAMID, WEGOBJECTID, KANT, PARITEIT, EERSTEHUISNUMMER, LAATSTEHUISNUMMER, BEGINDATUM FROM  STRAATKANTEN;"):
                ID, STRAATNAAMID, WEGOBJECTID, KANT, PARITEIT, EERSTEHUISNUMMER, LAATSTEHUISNUMMER, BEGINDATUM = row
                STRAATKANT_OBJECT = etree.Element('STRAATKANT_OBJECT')
                etree.SubElement(STRAATKANT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(STRAATKANT_OBJECT , "STRAATNAAMID").text = unicode( STRAATNAAMID )
                etree.SubElement(STRAATKANT_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )
                etree.SubElement(STRAATKANT_OBJECT , "KANT").text = unicode( KANT )
                etree.SubElement(STRAATKANT_OBJECT , "PARITEIT").text = unicode( PARITEIT )
                etree.SubElement(STRAATKANT_OBJECT , "EERSTEHUISNUMMER").text = unicode( EERSTEHUISNUMMER )
                etree.SubElement(STRAATKANT_OBJECT , "LAATSTEHUISNUMMER").text = unicode( LAATSTEHUISNUMMER )
                etree.SubElement(STRAATKANT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                STRAATKANT_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( STRAATKANT_OBJECT ))

            self.xgrabFile.write( '</STRAATKANTEN>')

    def WEGOBJECTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGOBJECTEN objecttype="wegobject">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, IDENTIFICATORWEGOBJECT, AARDWEGOBJECT, BEGINDATUM FROM  WEGOBJECTEN;"):
                ID, IDENTIFICATORWEGOBJECT, AARDWEGOBJECT, BEGINDATUM = row
                WEGOBJECT_OBJECT = etree.Element('WEGOBJECT_OBJECT')
                etree.SubElement(WEGOBJECT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGOBJECT_OBJECT , "IDENTIFICATORWEGOBJECT").text = unicode( IDENTIFICATORWEGOBJECT )
                etree.SubElement(WEGOBJECT_OBJECT , "AARDWEGOBJECT").text = unicode( AARDWEGOBJECT )
                etree.SubElement(WEGOBJECT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                WEGOBJECT_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( WEGOBJECT_OBJECT ))

            self.xgrabFile.write( '</WEGOBJECTEN>')

    def WEGVERBINDINGSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGVERBINDINGSTATUSSEN objecttype="wegverbindingstatus">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, WEGOBJECTID, WEGVERBINDINGSTATUS, BEGINDATUM FROM  WEGVERBINDINGSTATUSSEN;"):
                ID, WEGOBJECTID, WEGVERBINDINGSTATUS, BEGINDATUM = row
                WEGVERBINDINGSTATUS_OBJECT = etree.Element('WEGVERBINDINGSTATUS_OBJECT')
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "WEGVERBINDINGSTATUS").text = unicode( WEGVERBINDINGSTATUS )
                etree.SubElement(WEGVERBINDINGSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                WEGVERBINDINGSTATUS_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(  WEGVERBINDINGSTATUS_OBJECT ))

            self.xgrabFile.write( '</WEGVERBINDINGSTATUSSEN>')

    def WEGVERBINDINGGEOMETRIEN(self):
        with self.con as con:
            self.xgrabFile.write( '<WEGVERBINDINGGEOMETRIEN objecttype="wegverbindinggeometrie">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, WEGOBJECTID, WEGVERBINDINGGEOMETRIE, METHODEWEGVERBINDINGGEOMETRIE, BEGINDATUM FROM WEGVERBINDINGGEOMETRIEN;"):
                ID, WEGOBJECTID, WEGVERBINDINGGEOMETRIE, METHODEWEGVERBINDINGGEOMETRIE, BEGINDATUM = row
                WEGVERBINDINGGEOMETRIE_OBJECT = etree.Element('WEGVERBINDINGGEOMETRIE_OBJECT')
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "WEGOBJECTID").text = unicode( WEGOBJECTID )

                geom = etree.XML(WEGVERBINDINGGEOMETRIE)
                geomXML = etree.Element("WEGVERBINDINGGEOMETRIE")
                geomXML.append(geom)
                WEGVERBINDINGGEOMETRIE_OBJECT.append( geomXML )

                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "METHODEWEGVERBINDINGGEOMETRIE").text = unicode( METHODEWEGVERBINDINGGEOMETRIE )
                etree.SubElement(WEGVERBINDINGGEOMETRIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                WEGVERBINDINGGEOMETRIE_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(  WEGVERBINDINGGEOMETRIE_OBJECT ))

            self.xgrabFile.write( '</WEGVERBINDINGGEOMETRIEN>')
            
    def TERREINOBJECT_HUISNUMMER_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<TERREINOBJECT_HUISNUMMER_RELATIES objecttype="terreinobjectHuisnummer">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, HUISNUMMERID, BEGINDATUM FROM TERREINOBJECT_HUISNUMMER_RELATIES;"):
                ID, TERREINOBJECTID, HUISNUMMERID, BEGINDATUM = row
                TERREINOBJECT_HUISNUMMER_OBJECT = etree.Element('TERREINOBJECT_HUISNUMMER_OBJECT')
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "HUISNUMMERID").text = unicode( HUISNUMMERID )
                etree.SubElement(TERREINOBJECT_HUISNUMMER_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                TERREINOBJECT_HUISNUMMER_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(  TERREINOBJECT_HUISNUMMER_OBJECT ))

            self.xgrabFile.write( '</TERREINOBJECT_HUISNUMMER_RELATIES>')

    def TERREINOBJECTEN(self):
        with self.con as con:
            self.xgrabFile.write( '<TERREINOBJECTEN objecttype="terreinobject">')
            
            cur = con.cursor()
            for row in cur.execute("SELECT ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, BEGINDATUM FROM TERREINOBJECTEN;"):
                ID, IDENTIFICATORTERREINOBJECT, AARDTERREINOBJECT, BEGINDATUM = row
                TERREINOBJECT_OBJECT = etree.Element('TERREINOBJECT_OBJECT')
                etree.SubElement(TERREINOBJECT_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(TERREINOBJECT_OBJECT , "IDENTIFICATORTERREINOBJECT").text = unicode( IDENTIFICATORTERREINOBJECT )
                etree.SubElement(TERREINOBJECT_OBJECT , "AARDTERREINOBJECT").text = unicode( AARDTERREINOBJECT )
                etree.SubElement(TERREINOBJECT_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                TERREINOBJECT_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(  TERREINOBJECT_OBJECT ))

            self.xgrabFile.write( '</TERREINOBJECTEN>')

    def GEBOUWSTATUSSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<GEBOUWSTATUSSEN objecttype="gebouwstatus">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, GEBOUWSTATUS, BEGINDATUM FROM GEBOUWSTATUSSEN;"):
                ID, TERREINOBJECTID, GEBOUWSTATUS, BEGINDATUM = row
                GEBOUWSTATUS_OBJECT = etree.Element('GEBOUWSTATUS_OBJECT')
                etree.SubElement(GEBOUWSTATUS_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "GEBOUWSTATUS").text = unicode( GEBOUWSTATUS )
                etree.SubElement(GEBOUWSTATUS_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                GEBOUWSTATUS_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( GEBOUWSTATUS_OBJECT ))

            self.xgrabFile.write( '</GEBOUWSTATUSSEN>')
            
    def GEBOUWGEOMETRIEN(self):
        with self.con as con:
            self.xgrabFile.write( '<GEBOUWGEOMETRIEN objecttype="gebouwgeometrie">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, TERREINOBJECTID, GEBOUWGEOMETRIE, METHODEGEBOUWGEOMETRIE, BEGINDATUM FROM GEBOUWGEOMETRIEN;"):
                ID, TERREINOBJECTID, GEBOUWGEOMETRIE, METHODEGEBOUWGEOMETRIE, BEGINDATUM = row
                GEBOUWGEOMETRIE_OBJECT = etree.Element('GEBOUWGEOMETRIE_OBJECT')
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "TERREINOBJECTID").text = unicode( TERREINOBJECTID )

                geom = etree.XML(GEBOUWGEOMETRIE)
                geomXML = etree.Element("GEBOUWGEOMETRIE")
                geomXML.append(geom)
                GEBOUWGEOMETRIE_OBJECT.append( geomXML )

                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "METHODEGEBOUWGEOMETRIE").text = unicode( METHODEGEBOUWGEOMETRIE )
                etree.SubElement(GEBOUWGEOMETRIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                GEBOUWGEOMETRIE_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( GEBOUWGEOMETRIE_OBJECT ))

            self.xgrabFile.write( '</GEBOUWGEOMETRIEN>')

    def RRADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<RRADRESSEN objecttype="rrAdres">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, RRHUISNUMMER, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM FROM RRADRESSEN;"):
                ID, RRHUISNUMMER, SUBKANTONCODE, RRSTRAATCODE, BEGINDATUM = row
                RRADRES_OBJECT = etree.Element('RRADRES_OBJECT')
                etree.SubElement(RRADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(RRADRES_OBJECT , "RRHUISNUMMER").text = unicode( RRHUISNUMMER )
                etree.SubElement(RRADRES_OBJECT , "SUBKANTONCODE").text = unicode( SUBKANTONCODE )
                etree.SubElement(RRADRES_OBJECT , "RRSTRAATCODE").text = unicode( RRSTRAATCODE )
                etree.SubElement(RRADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                RRADRES_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( RRADRES_OBJECT ))

            self.xgrabFile.write( '</RRADRESSEN>')

    def ADRES_RRADRES_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRES_RRADRES_RELATIES objecttype="adresRrAdres">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, RRADRESID, BEGINDATUM FROM ADRES_RRADRES_RELATIES;"):
                ID, ADRESID, AARDADRES, RRADRESID, BEGINDATUM = row
                ADRES_RRADRES_OBJECT = etree.Element('ADRES_RRADRES_OBJECT')
                etree.SubElement(ADRES_RRADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "AARDADRES").text = unicode( AARDADRES )
                etree.SubElement(ADRES_RRADRES_OBJECT , "RRADRESID").text = unicode( RRADRESID )
                etree.SubElement(ADRES_RRADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                ADRES_RRADRES_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring(  ADRES_RRADRES_OBJECT ))

            self.xgrabFile.write( '</ADRES_RRADRES_RELATIES>')

    def KADADRESSEN(self):
        with self.con as con:
            self.xgrabFile.write( '<KADADRESSEN objecttype="adresRrAdres">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, KADHUISNUMMER, KADSTRAATCODE, NISGEMEENTECODE, BEGINDATUM FROM KADADRESSEN;"):
                ID, KADHUISNUMMER, KADSTRAATCODE, NISGEMEENTECODE, BEGINDATUM = row
                KADADRES_OBJECT = etree.Element('KADADRES_OBJECT')
                etree.SubElement(KADADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(KADADRES_OBJECT , "KADHUISNUMMER").text = unicode( KADHUISNUMMER )
                etree.SubElement(KADADRES_OBJECT , "KADSTRAATCODE").text = unicode( KADSTRAATCODE )
                etree.SubElement(KADADRES_OBJECT , "NISGEMEENTECODE").text = unicode( NISGEMEENTECODE )
                etree.SubElement(KADADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                KADADRES_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( KADADRES_OBJECT ))

            self.xgrabFile.write( '</KADADRESSEN>')

    def ADRES_KADADRES_RELATIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRES_KADADRES_RELATIES objecttype="adresKadAdres">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, KADADRESID, BEGINDATUM FROM ADRES_KADADRES_RELATIES;"):
                ID, ADRESID, AARDADRES, KADADRESID, BEGINDATUM = row
                ADRES_KADADRES_OBJECT = etree.Element('ADRES_KADADRES_OBJECT')
                etree.SubElement(ADRES_KADADRES_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "AARDADRES").text = unicode( AARDADRES )
                etree.SubElement(ADRES_KADADRES_OBJECT , "KADADRESID").text = unicode( KADADRESID )
                etree.SubElement(ADRES_KADADRES_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                ADRES_KADADRES_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( ADRES_KADADRES_OBJECT ))

            self.xgrabFile.write( '</ADRES_KADADRES_RELATIES>')

    def ADRESPOSITIES(self):
        with self.con as con:
            self.xgrabFile.write( '<ADRESPOSITIES objecttype="adrespositie">')

            cur = con.cursor()
            for row in cur.execute("SELECT ID, ADRESID, AARDADRES, X, Y, HERKOMSTADRESPOSITIE, BEGINDATUM FROM ADRESPOSITIES;"):
                ID, ADRESID, AARDADRES,  X, Y, HERKOMSTADRESPOSITIE, BEGINDATUM = row
                ADRESPOSITIE_OBJECT = etree.Element('ADRESPOSITIE_OBJECT')
                etree.SubElement(ADRESPOSITIE_OBJECT , "ID").text = unicode( ID )
                etree.SubElement(ADRESPOSITIE_OBJECT , "ADRESID").text = unicode( ADRESID )
                etree.SubElement(ADRESPOSITIE_OBJECT , "AARDADRES").text = unicode( AARDADRES )

                ADRESPOSITIE = """<Point ><pos>%s %s </pos></Point>""" % (X, Y)
                geom = etree.XML(ADRESPOSITIE)
                geomXML = etree.Element("ADRESPOSITIE")
                geomXML.append(geom)
                ADRESPOSITIE_OBJECT.append( geomXML )

                etree.SubElement(ADRESPOSITIE_OBJECT , "HERKOMSTADRESPOSITIE").text = unicode( HERKOMSTADRESPOSITIE )
                etree.SubElement(ADRESPOSITIE_OBJECT , "BEGINDATUM").text =  BEGINDATUM
                ADRESPOSITIE_OBJECT.append( self._begin_metaTag() )
                self.xgrabFile.write( etree.tostring( ADRESPOSITIE_OBJECT ))

            self.xgrabFile.write( '</ADRESPOSITIES>')