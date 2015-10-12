DECLARE @tijdstip DATETIME = GETDATE()
DECLARE @gemeenteid INT = ( SELECT TOP ( 1 )
                                    gemeenteId
                            FROM    odb.tblGemeenteNaam
                            WHERE   gemeenteNaam = 'antwerpen'
                          )
DECLARE @versnijding VARCHAR(3)= 'gem'
DECLARE @geometrie GEOMETRY  = ( SELECT geometrie
                                 FROM   pdb.tblVersnijdingGeometrie(@versnijding)
                                 WHERE  id = @gemeenteid
                               )                                         
SELECT  DISTINCT
        ( SELECT    straatNaam
          FROM      odb.tblStraatNaam s
          WHERE     sss.straatNaamId = s.straatNaamId
        ) AS straatnaam ,
        huisNummer ,
        ( SELECT    postKantonCode
          FROM      odb.tblPostKanton pk
          WHERE     pk.postKantonId = hp.postKantonId
        ) AS postcodeVolgensHuisnummer ,
        ( SELECT    postKantonCode
          FROM      odb.tblPostKanton pk
          WHERE     pk.postKantonId = sk.postKantonId
        ) AS postcodeVolgensRrstraat
FROM    [odb].[tblhuisnummer_prev_gem](@tijdstip, @versnijding, @gemeenteid,
                                       @geometrie) h
        INNER JOIN odb.tblHuisNummer_postKanton hp ON hp.huisNummerId = h.huisNummerId
        INNER JOIN odb.tblSubStraat_straatNaam sss ON h.straatNaamId = sss.straatNaamId
        INNER JOIN odb.tblSubStraat ss ON ss.subStraatId = sss.subStraatId
        INNER JOIN odb.tblSubKanton sk ON sk.subKantonId = ss.subKantonId
WHERE   hp.postKantonId <> sk.postKantonId
        AND hp.eindDatum IS NULL
        AND sss.eindDatum IS NULL
        AND NOT EXISTS ( SELECT 1
                         FROM   odb.tblSubStraat_straatNaam sss2
                                INNER JOIN odb.tblSubStraat ss2 ON ss2.subStraatId = sss2.subStraatId
                                INNER JOIN odb.tblSubKanton sk2 ON sk2.subKantonId = ss2.subKantonId
                         WHERE  sss.straatNaamId = sss2.straatNaamId
                                AND hp.postKantonId = sk2.postKantonId
                                AND sss2.eindDatum IS NULL )
ORDER BY 1 , 2