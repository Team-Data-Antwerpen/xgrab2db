from distutils.core import setup
setup(name='xgrablib',
    description='These tools convert a xgrab-xmlfile to a sqlite/spatialite database and back to xml',
    author='Kay Warrie',
    author_email='kaywarrie@gmail.com',
    version='1.0',
    packages=['xgrablib'],
    package_dir={'xgrablib': 'xgrablib'},
    package_data={'xgrablib': ['esri/toolboxes/*.*']},
    scripts=['xgrab2db.py','xgrab2spatialite.py','xgrab2gdb.py',
    'db2xgrab.py','update_terrein_adrespositie.py'],
    extras_require = {
        'spatialite':  ["pyspatialite"]
        }
    )