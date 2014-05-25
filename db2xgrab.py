#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import sqlite3 as db
import os, sys, argparse
from xgrablib import *

def main():
  xgrabPath = args.xgrabPath
  xgrabDB =   args.xgrabDB
  con = None

  try:
      con = db.Connection(xgrabDB) 
      xgrab = xgrabFromdb(con)
      xgrab.createAll()
      xgrab.saveToFile(xgrabPath)
      
  finally:
      if con: con.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a xGRAB-file from a sqlite database')
    parser.add_argument('xgrabDB', help='The input database (.sqlite)')
    parser.add_argument('xgrabPath', help='The path to the xGRAB-file')
    args = parser.parse_args()
    
    main()