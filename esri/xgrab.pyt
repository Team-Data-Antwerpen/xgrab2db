import arcpy, os, sys
import xgrab2esri as xg

class Toolbox(object):
    def __init__(self):
        self.label = "XGRAB TOOLS"
        self.alias = ""

        # List of tool classes associated with this toolbox
        self.tools = [Sel2def]


class Sel2def(object):
    def __init__(self):
        self.label = "XGRAB naar Geodatabase"
        self.description = ""
        self.canRunInBackground = False

    def getParameterInfo(self):
        param0 = arcpy.Parameter(
            displayName="Input XGRAB",
            name="input_xgrab",
            datatype="DEFile",
            parameterType="Required",
            direction="Input")

        param0.filter.list = ['gml','xml']  
            
        param1 = arcpy.Parameter(
            displayName="input geodatabase",
            name="input_geodatabase",
            datatype="DEWorkspace",
            parameterType="Required",
            direction="Input")

        param1.filter.list = ["Local Database", "Remote Database"]

        params = [ param0, param1 ]
        return params

    def execute(self, parameters, messages):
        xgrab = parameters[0].valueAsText
        gdb = parameters[1].valueAsText
        xgr = xg.xgrab2geodb( xgrab, gdb)
        xgr.createAll()