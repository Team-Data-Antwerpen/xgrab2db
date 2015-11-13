#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import sys
import xgrab2esri as xg

def main():
    xgr = xg.xgrab2geodb( xgrab, gdb)
    xgr.createAll()

if __name__ == '__main__':
    if len(sys.argv) < 3:
       print """Geef een input xgrab en geodatabase op:
            xgrab2gdb.py <xgrab> <gdb>"""
    else:
        xgrab = sys.argv[1]
        gdb = sys.argv[2]
        main()