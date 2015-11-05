import arcpy, os, sys
import xgrab2esri as xg

class Toolbox(object):
    def __init__(self):
        self.label = "XGRAB_TOOLS"
        self.alias = "XGRAB-TOOLS"

        # List of tool classes associated with this toolbox
        self.tools = [xgrab2gdb, xgrabgdbUpdate]

class xgrab2gdb(object):
    def __init__(self):
        self.label = "XGRAB naar Geodatabase"
        self.description = "Een XGRAB bestand toevoegen aan een bestaande Geodatabase, bestaande XGRAB-tabellen worden verwijderd en opnieuw gevuld met de contents van die XGRAB. Je kunt kiezen om records met einddatum (= verwijderd) mee te nemen of niet."
        self.canRunInBackground = False

    def getParameterInfo(self):
        param0 = arcpy.Parameter(
            displayName="Input XGRAB",
            name="Input xgrab",
            datatype="DEFile",
            parameterType="Required",
            direction="Input")
        param0.filter.list = ['gml','xml']  
            
        param1 = arcpy.Parameter(
            displayName="input geodatabase",
            name="Input geodatabase",
            datatype="DEWorkspace",
            parameterType="Required",
            direction="Input")
        param1.filter.list = ["Local Database", "Remote Database"]
        
        param2 = arcpy.Parameter(
            displayName="Records met einddatum meenemen",
            name="enddate",
            datatype="GPBoolean",
            parameterType="Required",
            direction="Input")
        param2.value = True
        
        params = [ param0, param1, param2 ]
        return params

    def execute(self, parameters, messages):
        xgrab = parameters[0].valueAsText
        gdb = parameters[1].valueAsText
        enddate = parameters[2].value
        
        xgr = xg.xgrab2geodb( xgrab, gdb)
        xgr.createAll(enddate)

class xgrabgdbUpdate(object):
    def __init__(self):
        self.label = "Geodatabase met XGRAB verschilbestand updaten"
        self.description = "Een database, die al de correcte tabellen heeft, updaten met een XGRAB verschil bestand. Records in database die in XGRAB voorkomen worden geupdate, de rest blijft behouden. Daarna worden alle nieuwe records uit xgrab geappend."
        self.canRunInBackground = False

    def getParameterInfo(self):
        param0 = arcpy.Parameter(
            displayName="Input XGRAB",
            name="Input xgrab",
            datatype="DEFile",
            parameterType="Required",
            direction="Input")
        param0.filter.list = ['gml','xml']  
            
        param1 = arcpy.Parameter(
            displayName="input geodatabase",
            name="Input geodatabase",
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
        xgr.updateAll()