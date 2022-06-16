#!/usr/bin/env python
# -*- coding: UTF-8 -*-
from .xgrablib import xgrab2geodb

xgrab = r'E:\crab\xGRAB11002.gml'
gdb = r'E:\crab\crab.gdb'

def main():
    xgr = xgrab2geodb( xgrab, gdb)
    xgr.createAll()

if __name__ == '__main__':
    main()