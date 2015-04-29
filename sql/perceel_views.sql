BEGIN TRANSACTION;
CREATE VIEW "geenTerreinKoppeling_join_perceelhisto" AS 
SELECT 
ADRESID,
HUISNUMMERID As HUISNR_ID,
HERKOMST,
PERCEEL_OF_GEBOUW AS PERCEEL, 
ST_CENTROID( PERCEELHISTO.shape ) AS SHAPE
 
FROM geenTerreinKoppeling

INNER JOIN PERCEELHISTO
	ON PERCEEL = PERCEELHISTO.capakey;

INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
VALUES ('geenTerreinKoppeling_join_perceelhisto', 'shape', 'rowid', 'geenTerreinKoppeling', 'shape', 0);

CREATE VIEW "perceelhisto_join_tereinObj" AS 
SELECT ID AS TERREINOBJ, 
IDENTIFICATORTERREINOBJECT AS PERCEEL ,
TERREINOBJECTEN.BEGINDATUM,
PERCEELHISTO.SHAPE AS SHAPE
FROM TERREINOBJECTEN

INNER JOIN PERCEELHISTO
	ON PERCEELHISTO.capakey = PERCEEL

WHERE TERREINOBJECTEN.EINDDATUM IS NULL
AND AARDTERREINOBJECT = 1;

INSERT INTO views_geometry_columns
    (view_name, view_geometry, view_rowid, f_table_name, f_geometry_column, read_only)
VALUES ('perceelhisto_join_tereinObj', 'shape', 'rowid', 'terreinobjecten', 'shape', 0);
COMMIT;