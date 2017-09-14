#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import sys
import xgrablib as xg

def main():
    xgr = xg.xgrab2geodb( xgrab, gdb)
    xgr.updateAll()

if __name__ == '__main__':
    if len(sys.argv) < 3:
       print( """Geef een input xgrab en geodatabase op:
            xgrab2gdb-update.py <xgrab> <gdb>""")
    else:
        xgrab = sys.argv[1]
        gdb = sys.argv[2]
        main()