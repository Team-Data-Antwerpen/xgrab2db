#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import xgrablib as xg

xgrab = r"E:\crab\test\xGRABdif11002_20200604000002539.gml"
gdb = r'E:\crab\xgrab.gdb'

def main():
    xgr = xg.xgrab2geodb( xgrab, gdb)
    xgr.createAll()

if __name__ == '__main__':
    main()