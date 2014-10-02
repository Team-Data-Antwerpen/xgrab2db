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
       con = sqlite3.Connection(xgrabDB, detect_types=sqlite3.PARSE_DECLTYPES)
       xgrab = xgrab2db( xgrabPath, con)
       xgrab.createAll()
    elif os.path.exists( xgrabDB ) and ( args.update == True ) :
       con = sqlite3.Connection(xgrabDB, detect_types=sqlite3.PARSE_DECLTYPES)
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


