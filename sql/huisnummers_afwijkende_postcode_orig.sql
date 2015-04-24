SELECT  ap.adrespositieid AS id,
        s.straatnaam + ' ' + h.huisnummer AS label
FROM    odb.tblhuisnummer h
        INNER JOIN odb.tblstraatnaam s ON h.straatnaamid = s.straatnaamid
        INNER JOIN odb.tblgemeentenaam gm ON s.gemeenteid = gm.gemeenteid
        INNER JOIN odb.tbladrespositie ap ON h.huisnummerid = ap.adresid
                                             AND ap.aardadres = '2'
        INNER JOIN odb.tblhuisnummer_postkanton hp ON h.huisnummerid = hp.huisnummerid
WHERE   h.einddatum IS NULL
        AND ap.einddatum IS NULL
        AND gm.gemeentenaam = @gemeente
        AND gm.taalcodegemeentenaam = 'nl'
        AND hp.einddatum IS NULL
        AND NOT EXISTS ( SELECT NULL
                         FROM   odb.tblpostkanton pk
                                INNER JOIN odb.tblsubkanton sk ON pk.postkantonid = sk.postkantonid
                                INNER JOIN odb.tblsubkanton_gemeente sg ON sk.subkantonid = sg.subkantonid
                         WHERE  pk.postkantonid = hp.postkantonid
                                AND sg.gemeenteid = s.gemeenteid )