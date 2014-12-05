BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS validatiefouten    
(
          validatieid INTEGER PRIMARY KEY ,
          objecttype TEXT,
          id INTEGER,
          BEGINTIJD DATETIME,
          boodschap TEXT
) ;
-- clear existing rows
DELETE FROM "validatiefouten";
	
/*Begindatum is minimaal 1 januari 1830*/
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaam',ID,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    STRAATNAMEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaamstatus',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    STRAATNAAMSTATUSSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummer',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    HUISNUMMERS
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummerstatus',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    HUISNUMMERSTATUSSEN
    WHERE   begindatum <'1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadres',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    SUBADRESSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadresstatus',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    SUBADRESSTATUSSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'postkantoncode',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    POSTKANTONCODES
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrStraatnaamStraatnaam',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    RRSTRAATNAAM_STRAATNAAM_RELATIES
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatkant',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    STRAATKANTEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegobject',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    WEGOBJECTEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindingstatus',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    WEGVERBINDINGSTATUSSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindinggeometrie',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    WEGVERBINDINGGEOMETRIEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobjectHuisnummer',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    TERREINOBJECT_HUISNUMMER_RELATIES
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobject',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    TERREINOBJECTEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwstatus',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    GEBOUWSTATUSSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwgeometrie',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    GEBOUWGEOMETRIEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrAdres',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    RRADRESSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresRrAdres',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    ADRES_RRADRES_RELATIES
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'kadAdres',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    KADADRESSEN
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresKadAdres',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    ADRES_KADADRES_RELATIES
    WHERE   begindatum < '1830-01-01';
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adrespositie',id,BEGINTIJD,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    ADRESPOSITIES
    WHERE   begindatum < '1830-01-01';
    
/*Einddatum is leeg of is kleiner dan begindatum*/
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaam',ID,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    STRAATNAMEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaamstatus',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    STRAATNAAMSTATUSSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummer',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    HUISNUMMERS
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummerstatus',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    HUISNUMMERSTATUSSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadres',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    SUBADRESSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadresstatus',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    SUBADRESSTATUSSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'postkantoncode',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    POSTKANTONCODES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrStraatnaamStraatnaam',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    RRSTRAATNAAM_STRAATNAAM_RELATIES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatkant',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    STRAATKANTEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegobject',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    WEGOBJECTEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindingstatus',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    WEGVERBINDINGSTATUSSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindinggeometrie',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    WEGVERBINDINGGEOMETRIEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobjectHuisnummer',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    TERREINOBJECT_HUISNUMMER_RELATIES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobject',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    TERREINOBJECTEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwstatus',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    GEBOUWSTATUSSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwgeometrie',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    GEBOUWGEOMETRIEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrAdres',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    RRADRESSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresRrAdres',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    ADRES_RRADRES_RELATIES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'kadAdres',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    KADADRESSEN
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresKadAdres',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    ADRES_RRADRES_RELATIES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adrespositie',id,BEGINTIJD,'Einddatum moet recenter zijn dan begindatum.'
    FROM    ADRESPOSITIES
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum;

/*Eindtijd is leeg of is kleiner dan BEGINTIJD*/
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaam',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    straatnamen
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatnaamstatus',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    STRAATNAAMSTATUSSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummer',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    HUISNUMMERS
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'huisnummerstatus',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    HUISNUMMERSTATUSSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadres',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    SUBADRESSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'subadresstatus',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    SUBADRESSTATUSSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'postkantoncode',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    POSTKANTONCODES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrStraatnaamStraatnaam',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    RRSTRAATNAAM_STRAATNAAM_RELATIES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'straatkant',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    STRAATKANTEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegobject',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    WEGOBJECTEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindingstatus',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    WEGVERBINDINGSTATUSSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'wegverbindinggeometrie',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    WEGVERBINDINGGEOMETRIEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobjectHuisnummer',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    TERREINOBJECT_HUISNUMMER_RELATIES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'terreinobject',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    TERREINOBJECTEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwstatus',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    GEBOUWSTATUSSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'gebouwgeometrie',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    GEBOUWGEOMETRIEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'rrAdres',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    RRADRESSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresRrAdres',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    ADRES_RRADRES_RELATIES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD ;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'kadAdres',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    KADADRESSEN
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adresKadAdres',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    ADRES_RRADRES_RELATIES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
    INSERT  INTO validatiefouten(objecttype,id,BEGINTIJD,boodschap)
    SELECT  'adrespositie',id,BEGINTIJD,'Eindtijd moet recenter zijn dan BEGINTIJD.'
    FROM    ADRESPOSITIES
    WHERE   eindtijd IS NOT NULL AND eindtijd < BEGINTIJD;
	
    
    
--straatnamen
    --PK_straatnaam_act
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele straatnaam is niet uniek.'
    FROM STRAATNAMEN t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT ID FROM STRAATNAMEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
    --UK_straatnaam_act
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele straatnaam is niet uniek.'
    FROM STRAATNAMEN t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NISGEMEENTECODE, straatnaam, begindatum FROM STRAATNAMEN t2 WHERE eindtijd IS NULL AND t1.NISGEMEENTECODE = t2.NISGEMEENTECODE AND t1.straatnaam = t2.straatnaam AND t1.begindatum = t2.begindatum GROUP BY NISGEMEENTECODE, straatnaam, begindatum HAVING COUNT(*) > 1 );
    --verplicht voorkomen straatnaamstatus
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De straatnaamstatus voor de straatnaam met id ' || ID || ' ontbreekt.'
    FROM STRAATNAMEN t1
    WHERE NOT EXISTS(SELECT NULL FROM STRAATNAAMSTATUSSEN WHERE STRAATNAAMID = t1.ID);
    --interne temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De geldigheidsperiode van de straatnaam overlapt met de geldigheidsperiode van een andere straatnaam met dezelfde identificerende kenmerken.'
    FROM STRAATNAMEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND NISGEMEENTECODE = t1.NISGEMEENTECODE AND straatnaam = t1.straatnaam 
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
    --beperking organisatiecode
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De beginorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAMEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De eindorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAMEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*straatnaamstatussen*/
	--PK_straatnaamstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele straatnaamstatus is niet uniek.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT ID FROM STRAATNAAMSTATUSSEN t2 
        WHERE eindtijd IS NULL 
        AND t1.ID = t2.ID 
        GROUP BY ID HAVING COUNT(*) > 1 );
    --UK_straatnaamstatus_act
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus',  ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele straatnaamstatus is niet uniek.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS
    (   SELECT ID, begindatum FROM STRAATNAAMSTATUSSEN t2 
        WHERE eindtijd IS NULL 
        AND t1.ID = t2.ID 
        AND t1.begindatum = t2.begindatum 
        GROUP BY ID, begindatum HAVING COUNT(*) > 1 );
    --FK_straatnaamstatus_straatnaam
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'Straatnaamid ' || ID || ' bestaat niet.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE NOT EXISTS(
        SELECT NULL FROM STRAATNAMEN 
        WHERE ID = t1.straatnaamid);
    --interne temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'De geldigheidsperiode van de straatnaamstatus overlapt met de geldigheidsperiode van een andere straatnaamstatus met dezelfde identificerende kenmerken.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM STRAATNAAMSTATUSSEN
        WHERE eindtijd IS NULL 
        AND ID <> t1.ID 
        AND straatnaamid = t1.straatnaamid 
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
    --externe temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'Begindatum van de straatnaamstatus moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(   
        SELECT NULL FROM STRAATNAMEN
        WHERE eindtijd IS NULL 
        AND ID = t1.straatnaamid 
        AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'Einddatum van de straatnaamstatus moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS
    (   SELECT NULL FROM STRAATNAMEN
        WHERE eindtijd IS NULL 
        AND ID = t1.straatnaamid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --beperking organisatiecode
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'De beginorganisatie van de straatnaamstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaamstatus', ID, BEGINTIJD, 'De eindorganisatie van de straatnaamstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAAMSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*huisnummers*/
	--PK_huisnummer_act
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De betekenisloze sleutel van het actuele huisnummer is niet uniek.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT id FROM HUISNUMMERS t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
    --UK_huisnummer_act
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
	SELECT 'huisnummer', id, BEGINTIJD, 
	'De combinatie van identificerende velden van het actuele huisnummer is niet uniek.'
	FROM HUISNUMMERS t1
	WHERE eindtijd IS NULL AND 
	EXISTS(
	SELECT straatnaamid, huisnummer, begindatum 
	FROM HUISNUMMERS t2 WHERE eindtijd IS NULL 
	AND t1.straatnaamid = t2.straatnaamid 
	AND t1.huisnummer = t2.huisnummer AND t1.begindatum = t2.begindatum 
	GROUP BY straatnaamid, huisnummer, begindatum HAVING COUNT(*) > 1 );
    --FK_huisnummer_straatnaam
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'Straatnaamid ' || id ||  ' bestaat niet.'
    FROM HUISNUMMERS t1
    WHERE NOT EXISTS(SELECT NULL FROM STRAATNAMEN WHERE ID = t1.straatnaamid);
    --verplicht voorkomen huisnummerstatus
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De huisnummerstatus voor het huisnummer met id ' || id ||  ' ontbreekt.'
    FROM HUISNUMMERS t1
    WHERE NOT EXISTS(SELECT NULL FROM HUISNUMMERSTATUSSEN WHERE HUISNUMMERID = t1.id);
    --interne temporele integriteit
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De geldigheidsperiode van het huisnummer overlapt met de geldigheidsperiode van een ander huisnummer met dezelfde identificerende kenmerken.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL AND EXISTS(
    SELECT ID FROM HUISNUMMERS WHERE eindtijd IS NULL 
        AND id <> t1.id 
        AND straatnaamid = t1.straatnaamid  
        AND huisnummer = t1.huisnummer
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum) ;
    
    --externe temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'Begindatum van het huisnummer moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'Einddatum van het huisnummer moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')) ;
    --beperking organisatiecode
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De beginorganisatie van het huisnummer moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM HUISNUMMERS t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De eindorganisatie van het huisnummer moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM HUISNUMMERS t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*huisnummerstatussen*/
	--PK_huisnummerstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele huisnummerstatus is niet uniek.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT id FROM HUISNUMMERSTATUSSEN t2 
        WHERE eindtijd IS NULL AND t1.id = t2.id 
        GROUP BY id HAVING COUNT(*) > 1 );
	--UK_huisnummerstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele huisnummerstatus is niet uniek.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT huisnummerid, begindatum FROM HUISNUMMERSTATUSSEN t2
        WHERE eindtijd IS NULL 
        AND t1.huisnummerid = t2.huisnummerid 
        AND t1.begindatum = t2.begindatum 
        GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_huisnummerstatus_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'Huisnummerid ' || huisnummerid ||  ' bestaat niet.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE NOT EXISTS (
        SELECT NULL FROM HUISNUMMERS
        WHERE ID = t1.huisnummerid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De geldigheidsperiode van de huisnummerstatus overlapt met de geldigheidsperiode van een andere huisnummerstatus met dezelfde identificerende kenmerken.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM HUISNUMMERSTATUSSEN t3
        WHERE t3.eindtijd IS NULL AND t3.id <> t1.id 
        AND t3.huisnummerid = t1.huisnummerid 
        AND t3.begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(t3.einddatum, '9999-01-01') >= t1.begindatum
        );
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 
    'Begindatum van de huisnummerstatus moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL AND ID = t1.huisnummerid 
        AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 
    'Einddatum van de huisnummerstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL AND ID = t1.huisnummerid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De beginorganisatie van de huisnummerstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De eindorganisatie van de huisnummerstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*subadressen*/
	--PK_subadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De betekenisloze sleutel van het actuele subadres is niet uniek.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS(SELECT ID FROM SUBADRESSEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_subadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De combinatie van identificerende velden van het actuele subadres is niet uniek.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT huisnummerid, subadres, aardsubadres, begindatum 
        FROM SUBADRESSEN t2 
        WHERE eindtijd IS NULL 
        AND t1.huisnummerid = t2.huisnummerid 
        AND t1.subadres = t2.subadres AND t1.aardsubadres = t2.aardsubadres 
        AND t1.begindatum = t2.begindatum 
        GROUP BY huisnummerid, subadres, aardsubadres, begindatum HAVING COUNT(*) > 1 );
	--FK_subadres_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'Huisnummerid ' || huisnummerid ||  ' bestaat niet.'
    FROM SUBADRESSEN t1
    WHERE NOT EXISTS (
        SELECT NULL FROM HUISNUMMERS 
        WHERE ID = t1.huisnummerid);
	--verplicht voorkomen subadresstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 
    'De subadresstatus voor het subadres met id ' || ID ||  ' ontbreekt.'
    FROM SUBADRESSEN t1
    WHERE NOT EXISTS(
        SELECT NULL FROM SUBADRESSTATUSSEN 
        WHERE SUBADRESID = t1.ID);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 
    'De geldigheidsperiode van het subadres overlapt met de geldigheidsperiode van een ander subadres met dezelfde identificerende kenmerken.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM SUBADRESSEN 
        WHERE eindtijd IS NULL AND ID <> t1.ID 
        AND huisnummerid = t1.huisnummerid
        AND subadres = t1.subadres
        AND aardsubadres = t1.aardsubadres
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 
    'Begindatum van het subadres moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL AND ID = t1.huisnummerid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 
    'Einddatum van het subadres moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL 
        AND ID = t1.huisnummerid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De beginorganisatie van het subadres moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De eindorganisatie van het subadres moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*Subadresstatussen*/
	--PK_subadresstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele subadresstatus is niet uniek.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT id FROM SUBADRESSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_subadresstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele subadresstatus is niet uniek.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID, begindatum FROM SUBADRESSEN t2 WHERE eindtijd IS NULL AND t1.SUBADRESID = t2.ID AND t1.begindatum = t2.begindatum GROUP BY ID, begindatum HAVING COUNT(*) > 1 );
	--FK_subadresstatus_subadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'Subadresid ' || ID ||  ' bestaat niet.'
    FROM SUBADRESSTATUSSEN t1
    WHERE NOT EXISTS (SELECT NULL FROM SUBADRESSEN WHERE ID = t1.SUBADRESID);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'De geldigheidsperiode van de subadresstatus overlapt met de geldigheidsperiode van een andere subadresstatus met dezelfde identificerende kenmerken.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM SUBADRESSTATUSSEN 
        WHERE eindtijd IS NULL 
        AND id <> t1.id 
        AND subadresid = t1.subadresid
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 
	'Begindatum van de subadresstatus moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM SUBADRESSEN 
        WHERE eindtijd IS NULL 
        AND ID = t1.SUBADRESID 
        AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'Einddatum van de subadresstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.SUBADRESID AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'De beginorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', id, BEGINTIJD, 'De eindorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*Postkantoncodes*/
	--PK_postkantoncode_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele postkantoncode is niet uniek.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM POSTKANTONCODES t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_postkantoncode_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele postkantoncode is niet uniek.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT huisnummerid, begindatum FROM POSTKANTONCODES t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_postkantoncode_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'Huisnummerid ' || huisnummerid ||  ' bestaat niet.'
    FROM POSTKANTONCODES t1
    WHERE NOT EXISTS (SELECT NULL FROM HUISNUMMERS WHERE ID = t1.huisnummerid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'De geldigheidsperiode van de postkantoncode overlapt met de geldigheidsperiode van een andere postkantoncode met dezelfde identificerende kenmerken.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM POSTKANTONCODES WHERE eindtijd IS NULL AND ID <> t1.ID 
        AND huisnummerid = t1.huisnummerid
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 
    'Begindatum van de postkantoncode moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
    SELECT NULL FROM HUISNUMMERS 
    WHERE eindtijd IS NULL AND ID = t1.huisnummerid AND begindatum > t1.begindatum
    );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 
    'Einddatum van de postkantoncode moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL 
        AND ID = t1.huisnummerid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'De beginorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM POSTKANTONCODES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', ID, BEGINTIJD, 'De eindorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM POSTKANTONCODES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*rrstraatnaam-straatnaam relaties*/
	--PK_rrstraatnaam_straatnaam_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_rrstraatnaam_straatnaam_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT RRSTRAATCODE, begindatum FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t2 
                WHERE eindtijd IS NULL AND t1.RRSTRAATCODE = t2.RRSTRAATCODE 
                AND t1.SUBKANTONCODE = t2.SUBKANTONCODE AND t1.begindatum = t2.begindatum 
                GROUP BY RRSTRAATCODE, begindatum HAVING COUNT(*) > 1 );
	--FK_rrstraatnaamstraatnaam_straatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'Straatnaamid ' || straatnaamid ||  ' bestaat niet.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE NOT EXISTS (
        SELECT NULL FROM STRAATNAMEN 
        WHERE ID = t1.straatnaamid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'De geldigheidsperiode van de rrstraatnaam-straatnaam relatie overlapt met de geldigheidsperiode van een andere rrstraatnaam-straatnaam relatie met dezelfde identificerende kenmerken.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM RRSTRAATNAAM_STRAATNAAM_RELATIES 
        WHERE eindtijd IS NULL AND ID <> t1.ID 
        AND RRSTRAATCODE = t1.RRSTRAATCODE
        AND SUBKANTONCODE =  t1.SUBKANTONCODE
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'Begindatum van de rrstraatnaam-straatnaam relatie moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'Einddatum van de rrstraatnaam-straatnaam relatie moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'De beginorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE beginorganisatie NOT IN ('1','5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', ID, BEGINTIJD, 'De eindorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1','5', '99');
    
/*straatkanten*/  
	--PK_straatkant_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele straatkant is niet uniek.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM STRAATKANTEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_straatkant_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele straatkant is niet uniek.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT straatnaamid, wegobjectid, kant, begindatum FROM STRAATKANTEN t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid AND t1.wegobjectid = t2.wegobjectid AND t1.kant = t2.kant AND t1.begindatum = t2.begindatum GROUP BY straatnaamid, wegobjectid, kant, begindatum HAVING COUNT(*) > 1 );
	--FK_straatkant_straatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'Straatnaamid ' || straatnaamid ||  ' bestaat niet.'
    FROM STRAATKANTEN t1
    WHERE NOT EXISTS (SELECT NULL FROM STRAATNAMEN WHERE ID = t1.straatnaamid);
	--FK_straatkant_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'Wegobjectid ' || wegobjectid ||  ' bestaat niet.'
    FROM STRAATKANTEN t1
    WHERE NOT EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, BEGINTIJD, 'De geldigheidsperiode van de straatkant overlapt met de geldigheidsperiode van een andere straatkant met dezelfde identificerende kenmerken.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM STRAATKANTEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND straatnaamid = t1.straatnaamid
    AND wegobjectid = t1.wegobjectid
    AND kant = t1.kant
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, BEGINTIJD, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND ID = t1.straatnaamid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van het gerelateerde wegobject.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND ID = t1.wegobjectid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', ID, BEGINTIJD, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van het gerelateerde wegobject.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND id = t1.wegobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, BEGINTIJD, 'De beginorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, BEGINTIJD, 'De eindorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99');
    --
    INSERT INTO validatiefouten (objecttype, ID ,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '1' AND t1.beginorganisatie NOT IN ('4', '99');
    --
    INSERT INTO validatiefouten (objecttype, ID ,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99');
    --
   INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '4' AND t1.beginorganisatie NOT IN ('8', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '5' AND t1.beginorganisatie NOT IN ('1', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.id
    WHERE t2.aardwegobject = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99');

/*wegobjecten*/   
	--PK_wegobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', id, BEGINTIJD, 'De betekenisloze sleutel van het actuele wegobject is niet uniek.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT id FROM WEGOBJECTEN t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_wegobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', id, BEGINTIJD, 'De combinatie van identificerende velden van het actuele wegobject is niet uniek.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT identificatorwegobject, aardwegobject, begindatum FROM WEGOBJECTEN t2 WHERE eindtijd IS NULL AND t1.identificatorwegobject = t2.identificatorwegobject AND t1.aardwegobject = t2.aardwegobject AND t1.begindatum = t2.begindatum GROUP BY identificatorwegobject, aardwegobject, begindatum HAVING COUNT(*) > 1 );
	--wegverbinding heeft aardwegobject '5'
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'Aardwegobject ' + aardwegobject +  ' is niet toegestaan voor entiteit wegverbinding.'
    FROM WEGOBJECTEN t1
    WHERE (aardverharding IS NOT NULL OR morfologischewegklasse IS NOT NULL) AND aardwegobject <> '5'  ;
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'Wegobject met aard ''5'' moet subtype wegverbinding zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '5' AND (aardverharding IS NULL OR morfologischewegklasse IS NULL);
	--verplicht voorkomen wegverbindingstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De wegverbindingstatus voor de wegverbinding met id ' || ID ||  ' ontbreekt.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '5' AND NOT EXISTS(SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE wegobjectid = t1.id);
	--verplicht voorkomen wegverbindinggeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', id, BEGINTIJD, 'De wegverbindinggeometrie voor de wegverbinding met id ' || id ||  ' ontbreekt.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '5' AND NOT EXISTS(SELECT NULL FROM WEGVERBINDINGGEOMETRIEN WHERE wegobjectid = t1.id);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', id, BEGINTIJD, 'De geldigheidsperiode van het wegobject overlapt met de geldigheidsperiode van een ander wegobject met dezelfde identificerende kenmerken.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND identificatorwegobject = t1.identificatorwegobject
    AND aardwegobject = t1.aardwegobject
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De beginorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De eindorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '1' AND beginorganisatie NOT IN ('4', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '4' AND t1.beginorganisatie NOT IN ('8', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '5' AND t1.beginorganisatie NOT IN ('1', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', ID, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobject = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99');
	
/*wegverbindingstatussen*/
	--PK_wegverbindingstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele wegverbindingstatus is niet uniek.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT ID FROM WEGVERBINDINGSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.ID = ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_wegverbindingstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele wegverbindingstatus is niet uniek.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT wegobjectid, begindatum FROM WEGVERBINDINGSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_wegverbindingstatus_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'Wegverbinding met id ' || wegobjectid ||  ' bestaat niet.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE NOT EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE id = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'De geldigheidsperiode van de wegverbindingstatus overlapt met de geldigheidsperiode van een andere wegverbindingstatus met dezelfde identificerende kenmerken.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND wegobjectid = t1.wegobjectid
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'Begindatum van de wegverbindingstatus moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND ID = t1.wegobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'Einddatum van de wegverbindingstatus moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND ID = t1.wegobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--berperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'De beginorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', ID, BEGINTIJD, 'De eindorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*wegverbindinggeometrien*/
	--PK_wegverbindinggeometrie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele wegverbindinggeometrie is niet uniek.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT ID FROM WEGVERBINDINGGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_wegverbindinggeometrie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele wegverbindinggeometrie is niet uniek.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT wegobjectid, begindatum FROM WEGVERBINDINGGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_wegverbindinggeometrie_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'Wegverbinding met id ' || wegobjectid ||  ' bestaat niet.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE NOT EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE ID = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'De geldigheidsperiode van de wegverbindinggeometrie overlapt met de geldigheidsperiode van een andere wegverbindinggeometrie met dezelfde identificerende kenmerken.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM WEGVERBINDINGGEOMETRIEN
        WHERE eindtijd IS NULL AND ID <> t1.ID 
        AND wegobjectid = t1.wegobjectid
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'Begindatum van de wegverbindinggeometrie moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND ID = t1.wegobjectid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'Einddatum van de wegverbindinggeometrie moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND ID = t1.wegobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'De beginorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', ID, BEGINTIJD, 'De eindorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*terreinobject-huisnummer relaties*/
	--PK_terreinobject_huisnummer_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT ID FROM TERREINOBJECT_HUISNUMMER_RELATIES t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_terreinobject_huisnummer_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT terreinobjectid, huisnummerid, begindatum FROM TERREINOBJECT_HUISNUMMER_RELATIES t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_terreinobjecthuisnummer_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Huisnummerid ' || huisnummerid ||  ' bestaat niet.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE ID = t1.huisnummerid);
	--FK_terreinobjecthuisnummer_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Terreinobjectid ' || terreinobjectid ||  ' bestaat niet.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE ID = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'De geldigheidsperiode van de terreinobject-huisnummer relatie overlapt met de geldigheidsperiode van een andere terreinobject-huisnummer relatie met dezelfde identificerende kenmerken.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES 
        WHERE eindtijd IS NULL AND ID <> t1.ID 
        AND terreinobjectid = t1.terreinobjectid
        AND huisnummerid = t1.huisnummerid
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL 
        AND ID = t1.huisnummerid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND ID = t1.huisnummerid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde terreinobject.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde terreinobject.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL  AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', ID, BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.id
    WHERE t2.aardterreinobject IN ('2', '3', '4') AND t1.beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.id
    WHERE t2.aardterreinobject IN ('2', '3', '4') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', t1.ID, t1.BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.id
    WHERE t2.aardterreinobject = '5' AND t1.beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', t1.ID, t1.BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.id
    WHERE t2.aardterreinobject = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99');
	
/*terreinobjecten*/
	--PK_terreinobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De betekenisloze sleutel van het actuele terreinobject is niet uniek.'
    FROM TERREINOBJECTEN t1
    WHERE eindtijd IS NULL
    AND EXISTS  (SELECT ID FROM TERREINOBJECTEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_terreinobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De combinatie van identificerende velden van het actuele terreinobject is niet uniek.'
    FROM TERREINOBJECTEN t1
     WHERE eindtijd IS NULL 
     AND EXISTS (SELECT identificatorterreinobject, aardterreinobject, begindatum FROM TERREINOBJECTEN t2 WHERE eindtijd IS NULL AND t1.identificatorterreinobject = t2.identificatorterreinobject AND t1.aardterreinobject = t2.aardterreinobject AND t1.begindatum = t2.begindatum
     GROUP BY identificatorterreinobject, aardterreinobject, begindatum HAVING COUNT(*) > 1 );
	--gebouw heeft aardterreinobject '5'
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'Aardterreinobject ' + aardterreinobject +  ' is niet toegestaan voor entiteit gebouw.'
    FROM TERREINOBJECTEN t1
    WHERE aardgebouw IS NOT NULL AND aardterreinobject <> '5';
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'Terreinobject met aard ''5'' moet subtype gebouw zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '5' AND aardgebouw IS NULL;
	--verplicht voorkomen gebouwstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De gebouwstatus voor het gebouw met id ' || ID ||  ' ontbreekt.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '5' AND NOT EXISTS(SELECT NULL FROM GEBOUWSTATUSSEN WHERE terreinobjectid = t1.ID);
    --verplicht voorkomen gebouwgeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De gebouwgeometrie voor het gebouw met id ' || ID ||  ' ontbreekt.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '5' AND NOT EXISTS(SELECT NULL FROM GEBOUWGEOMETRIEN WHERE terreinobjectid = t1.ID);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De geldigheidsperiode van het terreinobject overlapt met de geldigheidsperiode van een ander terreinobject met dezelfde identificerende kenmerken.'
    FROM TERREINOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND identificatorterreinobject = t1.identificatorterreinobject
    AND aardterreinobject = t1.aardterreinobject
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--beperking organisatiecode
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De beginorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De eindorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '1' AND beginorganisatie NOT IN ('3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '1' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('3', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject IN ('2', '3', '4') AND beginorganisatie NOT IN ('5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject IN ('2', '3', '4') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '5' AND beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', ID, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobject = '5' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*gebouwstatussen*/
	--PK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele gebouwstatus is niet uniek.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM GEBOUWSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele gebouwstatus is niet uniek.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT terreinobjectid, begindatum FROM GEBOUWSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_gebouwstatus_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'Gebouw met id ' || terreinobjectid ||  ' bestaat niet.'
    FROM GEBOUWSTATUSSEN t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE ID = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'De geldigheidsperiode van de gebouwstatus overlapt met de geldigheidsperiode van een andere gebouwstatus met dezelfde identificerende kenmerken.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM GEBOUWSTATUSSEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
    --externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'Begindatum van de gebouwstatus moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'Einddatum van de gebouwstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	
    --beperking organisatiecode  
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'De beginorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', ID, BEGINTIJD, 'De eindorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*gebouwgeometrien*/
	--PK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'De betekenisloze sleutel van de actuele gebouwgeometrie is niet uniek.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS 
    (SELECT ID FROM GEBOUWGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'De combinatie van identificerende velden van de actuele gebouwgeometrie is niet uniek.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS 
    (SELECT terreinobjectid, begindatum FROM GEBOUWGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_gebouwstatus_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'Gebouw met id ' || terreinobjectid ||  ' bestaat niet.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE ID = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'De geldigheidsperiode van de gebouwgeometrie overlapt met de geldigheidsperiode van een andere gebouwgeometrie met dezelfde identificerende kenmerken.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM GEBOUWGEOMETRIEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'Begindatum van de gebouwgeometrie moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'Einddatum van de gebouwgeometrie moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND ID = t1.terreinobjectid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'De beginorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', ID, BEGINTIJD, 'De eindorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*rradresssen*/
	--PK_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', ID, BEGINTIJD, 'De betekenisloze sleutel van het actuele rradres is niet uniek.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM RRADRESSEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID GROUP BY ID HAVING COUNT(*) > 1 );
	--UK_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', ID, BEGINTIJD, 'De combinatie van identificerende velden van het actuele rradres is niet uniek.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL 
	AND EXISTS  (SELECT rrhuisnummer, rrindex, RRSTRAATCODE, begindatum 
              FROM RRADRESSEN t2 
              WHERE eindtijd IS NULL AND t1.rrhuisnummer = t2.rrhuisnummer AND t1.rrindex = t2.rrindex AND t1.SUBKANTONCODE = t2.SUBKANTONCODE
              AND t1.RRSTRAATCODE = t2.RRSTRAATCODE AND t1.begindatum = t2.begindatum 
              GROUP BY rrhuisnummer, rrindex, RRSTRAATCODE, begindatum HAVING COUNT(*) > 1 );
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', ID, BEGINTIJD, 'De geldigheidsperiode van het rradres overlapt met de geldigheidsperiode van een ander rradres met dezelfde identificerende kenmerken.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(
            SELECT NULL FROM RRADRESSEN 
            WHERE eindtijd IS NULL 
            AND ID <> t1.ID 
            AND rrhuisnummer = t1.rrhuisnummer
            AND IFNULL(rrindex,'') = IFNULL(t1.rrindex,'')
            AND RRSTRAATCODE = t1.RRSTRAATCODE
            AND SUBKANTONCODE = t1.SUBKANTONCODE
            AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
            AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', ID, BEGINTIJD, 'De beginorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
    FROM RRADRESSEN t1
    WHERE beginorganisatie NOT IN ('1', '2', '9', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', ID, BEGINTIJD, 'De eindorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
    FROM RRADRESSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '2', '9', '99');

/*adres-rradres relaties*/
	--PK_adres_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele adres-rradres relatie is niet uniek.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT id FROM ADRES_RRADRES_RELATIES t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_adres_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele adres-rradres relatie is niet uniek.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT rradresid, adresid, aardadres, begindatum FROM ADRES_RRADRES_RELATIES t2 WHERE eindtijd IS NULL AND t1.rradresid = t2.rradresid AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY rradresid, adresid, aardadres, begindatum HAVING COUNT(*) > 1 );
	--FK_adresrradres_rradres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', id, BEGINTIJD, 'Rijksregisteradresid ' || rradresid ||  ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM RRADRESSEN WHERE ID = t1.rradresid);
	--FK_adresrradres_crabadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 'Subadresid ' || adresid ||  ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 'Huisnummerid ' || adresid ||  ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE ID = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'De geldigheidsperiode van de adres-rradres relatie overlapt met de geldigheidsperiode van een andere adres-rradres relatie met dezelfde identificerende kenmerken.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE eindtijd IS NULL 
        AND ID <> t1.ID 
        AND rradresid = t1.rradresid
        AND adresid = t1.adresid
        AND aardadres = t1.aardadres
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde rradres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (
        SELECT NULL FROM RRADRESSEN WHERE eindtijd IS NULL 
        AND ID = t1.rradresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde rradres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS 
    (
        SELECT NULL FROM RRADRESSEN WHERE eindtijd IS NULL 
        AND ID = t1.rradresid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS  (
        SELECT NULL FROM SUBADRESSEN 
        WHERE eindtijd IS NULL 
        AND ID = t1.adresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS  (
        SELECT NULL FROM SUBADRESSEN 
        WHERE eindtijd IS NULL 
        AND ID = t1.adresid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 
    'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL 
        AND ID = t1.adresid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 'De beginorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', ID, BEGINTIJD, 'De eindorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*kadadressen*/
	--PK_kadadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres',id, BEGINTIJD, 'De betekenisloze sleutel van het actuele kadadres is niet uniek.'
    FROM KADADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT id FROM KADADRESSEN t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_kadadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres', id, BEGINTIJD, 'De combinatie van identificerende velden van het actuele kadadres is niet uniek.'
    FROM KADADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT kadhuisnummer, KADSTRAATCODE, begindatum FROM KADADRESSEN t2 WHERE eindtijd IS NULL AND t1.kadhuisnummer = t2.kadhuisnummer AND t1.KADSTRAATCODE = t2.KADSTRAATCODE AND t1.begindatum = t2.begindatum GROUP BY kadhuisnummer, KADSTRAATCODE, begindatum HAVING COUNT(*) > 1 );
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres', id, BEGINTIJD, 'De geldigheidsperiode van het kadadres overlapt met de geldigheidsperiode van een ander kadadres met dezelfde identificerende kenmerken.'
    FROM KADADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM KADADRESSEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND kadhuisnummer = t1.kadhuisnummer
    AND KADSTRAATCODE = t1.KADSTRAATCODE
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres',id, BEGINTIJD, 'De beginorganisatie van het kadadres moet ofwel 3 (AAPD) ofwel 99 (andere) zijn.'
    FROM KADADRESSEN t1
    WHERE beginorganisatie NOT IN ('3', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres', id, BEGINTIJD, 'De eindorganisatie van het kadadres moet ofwel 3 (AAPD) ofwel 99 (andere) zijn.'
    FROM KADADRESSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('3', '99');
    
/*adres-kadadres relaties*/
	--PK_adres_kadadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele adres-kadadres relatie is niet uniek.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT id FROM ADRES_KADADRES_RELATIES t2 
    WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_adres_kadadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele adres-kadadres relatie is niet uniek.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT KADADRESID, adresid, aardadres, begindatum FROM ADRES_KADADRES_RELATIES t2 
    WHERE eindtijd IS NULL AND t1.KADADRESID = t2.KADADRESID AND t1.adresid = t2.adresid 
    AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum 
    GROUP BY KADADRESID, adresid, aardadres, begindatum HAVING COUNT(*) > 1 );
	--FK_adreskadadres_kadadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'KADADRESID ' || KADADRESID ||  ' bestaat niet.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM KADADRESSEN WHERE ID = t1.KADADRESID);
    --FK_adreskadadres_crabadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Subadresid ' || adresid ||  ' bestaat niet.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Huisnummerid ' || adresid ||  ' bestaat niet.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE ID = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De geldigheidsperiode van de adres-kadadres relatie overlapt met de geldigheidsperiode van een andere adres-kadadres relatie met dezelfde identificerende kenmerken.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM ADRES_KADADRES_RELATIES WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND KADADRESID = t1.KADADRESID
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
    --externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', ID, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde kadadres.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID FROM KADADRESSEN 
    WHERE eindtijd IS NULL AND ID = t1.KADADRESID AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde kadadres.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM KADADRESSEN WHERE eindtijd IS NULL AND id = t1.KADADRESID AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', ID, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 
    'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS (
        SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND ID = t1.adresid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 
    'De beginorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE beginorganisatie NOT IN ('5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De eindorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_KADADRES_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99');
  
/*adresposities*/
	--PK_adrespositie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De betekenisloze sleutel van de actuele adrespositie is niet uniek.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT id FROM ADRESPOSITIES t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_adrespositie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele adrespositie is niet uniek.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL 
   AND EXISTS  (SELECT herkomstadrespositie, adresid, aardadres, begindatum FROM ADRESPOSITIES t2 WHERE eindtijd IS NULL AND t1.herkomstadrespositie = t2.herkomstadrespositie AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY herkomstadrespositie, adresid, aardadres, begindatum HAVING COUNT(*) > 1 );
	--FK_adrespositie_crabadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Subadresid ' || adresid ||  ' bestaat niet.'
    FROM ADRESPOSITIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Huisnummerid ' || adresid ||  ' bestaat niet.'
    FROM ADRESPOSITIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE ID = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De geldigheidsperiode van de adrespositie overlapt met de geldigheidsperiode van een andere adrespositie met dezelfde identificerende kenmerken.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND EXISTS(
        SELECT NULL FROM ADRESPOSITIES WHERE eindtijd IS NULL AND id <> t1.id 
        AND herkomstadrespositie = t1.herkomstadrespositie
        AND adresid = t1.adresid
        AND aardadres = t1.aardadres
        AND begindatum <= IFNULL(t1.einddatum, '9999-01-01') 
        AND IFNULL(einddatum, '9999-01-01') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS  (
        SELECT NULL FROM SUBADRESSEN
        WHERE eindtijd IS NULL AND ID = t1.adresid 
        AND begindatum > t1.begindatum
        );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS (
        SELECT NULL FROM SUBADRESSEN 
        WHERE eindtijd IS NULL AND ID = t1.adresid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01')
        );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (
        SELECT NULL FROM HUISNUMMERS 
        WHERE eindtijd IS NULL AND ID = t1.adresid 
        AND IFNULL(einddatum, '9999-01-01') < IFNULL(t1.einddatum, '9999-01-01'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'De beginorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'De eindorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'De beginorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND beginorganisatie NOT IN ('1', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'De eindorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 
    'De beginorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') 
    AND beginorganisatie NOT IN ('5', '99');
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De eindorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') 
    AND eindorganisatie IS NOT NULL 
    AND eindorganisatie NOT IN ('5', '99');
	--beperking voorkomen ifv koppeling aan terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', t1.id, t1.BEGINTIJD, 
    'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM ADRESPOSITIES t1
    INNER JOIN HUISNUMMERSTATUSSEN t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie IN ('3', '7') AND t2.huisnummerstatus = '3' 
    AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 
    INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.ID 
    WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobject IN ('2','5')
    );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', t1.id, t1.BEGINTIJD, 
    'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM ADRESPOSITIES t1
    INNER JOIN SUBADRESSTATUSSEN t2 
    ON t1.adresid = t2.SUBADRESID  
    INNER JOIN SUBADRESSEN t5 
    ON t1.adresid = t5.ID
    WHERE t1.aardadres = '1' AND t1.eindtijd IS NULL 
    AND t1.herkomstadrespositie IN ('3', '7') AND t2.subadresstatus = '3' 
    AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 
    INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.ID 
    WHERE t3.huisnummerid = t5.huisnummerid AND t4.aardterreinobject IN ('2','5')
    );
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', t1.id, t1.BEGINTIJD, 'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM ADRESPOSITIES t1
    INNER JOIN HUISNUMMERSTATUSSEN t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie = '2' AND t2.huisnummerstatus = '3' 
    AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 
    INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.ID 
    WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobject IN ('1','4'));
    --
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', t1.id, t1.BEGINTIJD, 
    'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM ADRESPOSITIES t1
    INNER JOIN SUBADRESSTATUSSEN t2 
    ON t1.adresid = t2.SUBADRESID  
    INNER JOIN SUBADRESSEN t5 
    ON t1.adresid = t5.ID
    WHERE t1.aardadres = '1' 
        AND t1.eindtijd IS NULL 
        AND t1.herkomstadrespositie = '2' 
        AND t2.subadresstatus = '3' 
        AND NOT EXISTS(
            SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 
            INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.ID 
            WHERE t3.huisnummerid = t5.huisnummerid 
            AND t4.aardterreinobject IN ('1','4')
        );

COMMIT;
