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
import sys, os
try:
    import arcpy
except ImportError:
    print "arcpy is not detected, xgrab2geodb will not work"

def createTbl(dir,out_name, fields, geom=None):
    if not geom: 
        arcpy.CreateTable_management(dir, out_name)
    elif geom in ("POLYLINE", "POINT", "POLYGON", "MULTIPOINT"): 
        arcpy.CreateFeatureclass_management(dir, out_name, geom)
    else:
        raise Exception('geom should be POLYLINE, POINT, POLYGON or MULTIPOINT')

    for field in fields:
        arcpy.AddField_management(dir + "\\" + out_name,
        field.name, field.dtype, field_length= field.length )
        
def gmlPoly2esri( gmlNode , srid=31370 ):
    partArray = arcpy.Array()
    pntArray =  arcpy.Array()
    posLists = gmlNode.findall(".//{http://www.opengis.net/gml}posList")

    coordList = [zip(* [ 
                [ float(m) for m in n.text.split()][i::2]  
            for i in range(2)])         
        for n in posLists ]
    
    for coords in coordList:
        for xy in coords:
            point = arcpy.Point(*xy)
            pntArray.add(point)
        pntArray.add(pntArray.getObject(0)) #close the polygon 
        partArray.add(pntArray)
        pntArray.removeAll()
        
    Polygon = arcpy.Polygon(partArray,  arcpy.SpatialReference(srid) )
    partArray.removeAll()
    return Polygon
      
def gmlLineEsri( gmlNode , srid=31370 ):
    posList = gmlNode.find(".//{http://www.opengis.net/gml}posList")
    pntArray =  arcpy.Array()

    coords = zip(*[ [ float(m) for m in posList.text.split()][i::2] for i in range(2)])  
    for xy in coords:
        point = arcpy.Point(*xy)
        pntArray.add(point)
           
    Polyline = arcpy.Polyline( pntArray, arcpy.SpatialReference(srid) )

    return Polyline
      
class field:
    def __init__(self, name, dtype = 'TEXT', length = 255):
        self.name = name
        self.dtype = dtype
        self.length = length
