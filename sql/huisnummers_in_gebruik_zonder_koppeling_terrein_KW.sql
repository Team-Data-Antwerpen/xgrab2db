SELECT  ap.ID AS id,
        s.straatnaam || ' ' || h.huisnummer AS label
        
FROM    HUISNUMMERS h
        INNER JOIN STRAATNAMEN s ON h.STRAATNAAMID = s.ID
        INNER JOIN ADRESPOSITIES ap ON h.ID = ap.ADRESID AND ap.AARDADRES = '2'
        INNER JOIN HUISNUMMERSTATUSSEN hs ON h.ID = hs.HUISNUMMERID
WHERE   h.einddatum IS NULL
        AND hs.einddatum IS NULL
        AND hs.huisnummerstatus = '3'
        AND ap.einddatum IS NULL
        AND ap.herkomstadrespositie NOT IN ( '8', '9' )
        AND NOT EXISTS ( SELECT NULL
                         FROM   TERREINOBJECT_HUISNUMMER_RELATIES th
                                INNER JOIN TERREINOBJECTEN t ON th.TERREINOBJECTID = t.ID
                         WHERE  th.HUISNUMMERID = h.ID
                                AND th.einddatum IS NULL
                                AND t.AARDTERREINOBJECT IN ( '1', '5' ) )