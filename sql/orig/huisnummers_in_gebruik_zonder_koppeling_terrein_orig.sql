SELECT  ap.adrespositieid AS id,
        s.straatnaam + ' ' + h.huisnummer AS label
FROM    odb.tblhuisnummer h
        INNER JOIN odb.tblstraatnaam s ON h.straatnaamid = s.straatnaamid
        INNER JOIN odb.tblgemeentenaam gm ON s.gemeenteid = gm.gemeenteid
        INNER JOIN odb.tbladrespositie ap ON h.huisnummerid = ap.adresid
                                             AND ap.aardadres = '2'
        INNER JOIN odb.tblhuisnummerstatus hs ON h.huisnummerid = hs.huisnummerid
WHERE   h.einddatum IS NULL
        AND hs.einddatum IS NULL
        AND hs.huisnummerstatus = '3'
        AND ap.einddatum IS NULL
        AND ap.herkomstadrespositie NOT IN ( '8', '9' )
        AND gm.gemeentenaam = @gemeente
        AND gm.taalcodegemeentenaam = 'nl'
        AND NOT EXISTS ( SELECT NULL
                         FROM   odb.tblterreinobject_huisnummer th
                                INNER JOIN odb.tblterreinobject t ON th.terreinobjectid = t.terreinobjectid
                         WHERE  th.huisnummerid = h.huisnummerid
                                AND th.einddatum IS NULL
                                AND t.aardterreinobjectcode IN ( '1', '5' ) )