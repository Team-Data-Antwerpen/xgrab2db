SELECT  ap.adrespositieid AS id,
        s.straatnaam || ' ' || h.huisnummer || ', ' || gm.gemeentenaam AS label
        
FROM    tblhuisnummer h
        INNER JOIN tblstraatnaam s ON h.straatnaamid = s.straatnaamid  -- straten koppelen aan huisnummer
        INNER JOIN tblgemeentenaam gm ON s.gemeenteid = gm.gemeenteid  -- NIS-CODE straat == Gemeente 
        INNER JOIN tbladrespositie ap ON h.huisnummerid = ap.adresid AND ap.aardadres = '2' -- Enkel hoofdadressen
        INNER JOIN tblhuisnummer_postkanton hp ON h.huisnummerid = hp.huisnummerid -- Koppellen huisnummers aan POSTKANTONS
        
WHERE   h.einddatum IS NULL AND ap.einddatum IS NULL -- Geen verwijderde huisnummers of adresposities
        AND hp.einddatum IS NULL                     -- Geen verwijderde POSTKANTON CODES 
        AND gm.gemeentenaam = 'ANTWERPEN'            -- Gemeente in kwestie
        AND NOT EXISTS ( 
            SELECT NULL
                 FROM   tblpostkanton pk
                        INNER JOIN tblsubkanton sk ON pk.postkantonid = sk.postkantonid
                        INNER JOIN tblsubkanton_gemeente sg ON sk.subkantonid = sg.subkantonid 
                 WHERE  pk.postkantonid = hp.postkantonid
                        AND sg.gemeenteid = s.gemeenteid 
            )
    -- tblsubkanton_gemeente heb ik niet in XGRAB, tblsubkanton is Rijksregister 
    -- > dus rijksregister postcode van adres komt niet overeen met postcode van het crab adres, de rrstraat wordt niet gebruikt. 