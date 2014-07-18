BEGIN TRANSACTION;

/*
CREATE TABLE IF NOT EXISTS validatiefouten    
(
          validatieid INTEGER PRIMARY KEY ,
          objecttype TEXT,
          id INTEGER,
          BEGINTIJD DATETIME,
          boodschap TEXT
) ;
	*/
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
    SELECT 'straatnaam', ID, BEGINTIJD, 'De straatnaamstatus voor de straatnaam met id ' + CAST(ID AS TEXT) + ' ontbreekt.'
    FROM STRAATNAMEN t1
    WHERE NOT EXISTS(SELECT NULL FROM STRAATNAAMSTATUSSEN WHERE ID = t1.ID);
    --interne temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De geldigheidsperiode van de straatnaam overlapt met de geldigheidsperiode van een andere straatnaam met dezelfde identificerende kenmerken.'
    FROM STRAATNAMEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND NISGEMEENTECODE = t1.NISGEMEENTECODE AND straatnaam = t1.straatnaam 
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
    --beperking organisatiecode
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De beginorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAMEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatnaam', ID, BEGINTIJD, 'De eindorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATNAMEN t1
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
    SELECT 'huisnummer', id, BEGINTIJD, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM HUISNUMMERS t1
    WHERE NOT EXISTS(SELECT NULL FROM STRAATNAMEN WHERE straatnaamid = t1.straatnaamid);
    --verplicht voorkomen huisnummerstatus
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De huisnummerstatus voor het huisnummer met id ' + CAST(id AS VARCHAR) + ' ontbreekt.'
    FROM HUISNUMMERS t1
    WHERE NOT EXISTS(SELECT NULL FROM HUISNUMMERSTATUSSEN WHERE id = t1.id);
    --interne temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'De geldigheidsperiode van het huisnummer overlapt met de geldigheidsperiode van een ander huisnummer met dezelfde identificerende kenmerken.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND id <> t1.id 
    AND straatnaamid = t1.straatnaamid 
    AND huisnummer = t1.huisnummer
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum) ;
    --externe temporele integriteit
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'Begindatum van het huisnummer moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum) ;
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummer', id, BEGINTIJD, 'Einddatum van het huisnummer moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM HUISNUMMERS t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101')) ;
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
    AND EXISTS (SELECT id FROM HUISNUMMERSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_huisnummerstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele huisnummerstatus is niet uniek.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT huisnummerid, begindatum FROM HUISNUMMERSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_huisnummerstatus_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE NOT EXISTS (SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.huisnummerid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De geldigheidsperiode van de huisnummerstatus overlapt met de geldigheidsperiode van een andere huisnummerstatus met dezelfde identificerende kenmerken.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM HUISNUMMERSTATUSSEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum) ;
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'Begindatum van de huisnummerstatus moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'Einddatum van de huisnummerstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'huisnummerstatus', id, BEGINTIJD, 'De beginorganisatie van de huisnummerstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM HUISNUMMERSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
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
    AND EXISTS (SELECT huisnummerid, subadres, aardsubadrescode, begindatum FROM SUBADRESSEN t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.subadres = t2.subadres AND t1.aardsubadrescode = t2.aardsubadrescode AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, subadres, aardsubadrescode, begindatum HAVING COUNT(*) > 1 );
	--FK_subadres_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM SUBADRESSEN t1
    WHERE NOT EXISTS (SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.huisnummerid);
	--verplicht voorkomen subadresstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De subadresstatus voor het subadres met id ' + CAST(ID AS VARCHAR) + ' ontbreekt.'
    FROM SUBADRESSEN t1
    WHERE NOT EXISTS(SELECT NULL FROM SUBADRESSTATUSSEN WHERE ID = t1.ID);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'De geldigheidsperiode van het subadres overlapt met de geldigheidsperiode van een ander subadres met dezelfde identificerende kenmerken.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID <> t1.ID 
    AND huisnummerid = t1.huisnummerid
    AND subadres = t1.subadres
    AND aardsubadrescode = t1.aardsubadrescode
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'Begindatum van het subadres moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadres', ID, BEGINTIJD, 'Einddatum van het subadres moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM SUBADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
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
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'De betekenisloze sleutel van de actuele subadresstatus is niet uniek.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT subadresstatusid FROM SUBADRESSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.subadresstatusid = t2.subadresstatusid GROUP BY subadresstatusid HAVING COUNT(*) > 1 );
	--UK_subadresstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele subadresstatus is niet uniek.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT ID, begindatum FROM SUBADRESSEN t2 WHERE eindtijd IS NULL AND t1.ID = t2.ID AND t1.begindatum = t2.begindatum GROUP BY ID, begindatum HAVING COUNT(*) > 1 );
	--FK_subadresstatus_subadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'Subadresid ' + CAST(ID AS VARCHAR) + ' bestaat niet.'
    FROM SUBADRESSTATUSSEN t1
    WHERE NOT EXISTS (SELECT NULL FROM SUBADRESSEN WHERE ID = t1.ID);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'De geldigheidsperiode van de subadresstatus overlapt met de geldigheidsperiode van een andere subadresstatus met dezelfde identificerende kenmerken.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM SUBADRESSTATUSSEN WHERE eindtijd IS NULL AND subadresstatusid <> t1.subadresstatusid 
    AND ID = t1.ID
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 
	'Begindatum van de subadresstatus moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.ID AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'Einddatum van de subadresstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.ID AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'De beginorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'subadresstatus', subadresstatusid, BEGINTIJD, 'De eindorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM SUBADRESSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*Postkantoncodes*/
	--PK_postkantoncode_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'De betekenisloze sleutel van de actuele postkantoncode is niet uniek.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT huisnummer_postkanton_id FROM POSTKANTONCODES t2 WHERE eindtijd IS NULL AND t1.huisnummer_postkanton_id = t2.huisnummer_postkanton_id GROUP BY huisnummer_postkanton_id HAVING COUNT(*) > 1 );
	--UK_postkantoncode_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele postkantoncode is niet uniek.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT huisnummerid, begindatum FROM POSTKANTONCODES t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_postkantoncode_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM POSTKANTONCODES t1
    WHERE NOT EXISTS (SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.huisnummerid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'De geldigheidsperiode van de postkantoncode overlapt met de geldigheidsperiode van een andere postkantoncode met dezelfde identificerende kenmerken.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM POSTKANTONCODES WHERE eindtijd IS NULL AND huisnummer_postkanton_id <> t1.huisnummer_postkanton_id 
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'Begindatum van de postkantoncode moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'Einddatum van de postkantoncode moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM POSTKANTONCODES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'De beginorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM POSTKANTONCODES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, BEGINTIJD, 'De eindorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM POSTKANTONCODES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
/*rrstraatnaam-straatnaam relaties*/
	--PK_rrstraatnaam_straatnaam_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'De betekenisloze sleutel van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT substraat_straatnaam_id FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t2 WHERE eindtijd IS NULL AND t1.substraat_straatnaam_id = t2.substraat_straatnaam_id GROUP BY substraat_straatnaam_id HAVING COUNT(*) > 1 );
	--UK_rrstraatnaam_straatnaam_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT substraatid, begindatum FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t2 WHERE eindtijd IS NULL AND t1.substraatid = t2.substraatid AND t1.begindatum = t2.begindatum GROUP BY substraatid, begindatum HAVING COUNT(*) > 1 );
	--FK_rrstraatnaamstraatnaam_straatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE NOT EXISTS (SELECT NULL FROM STRAATNAMEN WHERE straatnaamid = t1.straatnaamid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'De geldigheidsperiode van de rrstraatnaam-straatnaam relatie overlapt met de geldigheidsperiode van een andere rrstraatnaam-straatnaam relatie met dezelfde identificerende kenmerken.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM RRSTRAATNAAM_STRAATNAAM_RELATIES WHERE eindtijd IS NULL AND substraat_straatnaam_id <> t1.substraat_straatnaam_id 
    AND substraatid = t1.substraatid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'Begindatum van de rrstraatnaam-straatnaam relatie moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'Einddatum van de rrstraatnaam-straatnaam relatie moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'De beginorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE beginorganisatie NOT IN ('1','5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, BEGINTIJD, 'De eindorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM RRSTRAATNAAM_STRAATNAAM_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1','5', '99');
    
/*straatkanten*/
	--PK_straatkant_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'De betekenisloze sleutel van de actuele straatkant is niet uniek.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT straatkantid FROM STRAATKANTEN t2 WHERE eindtijd IS NULL AND t1.straatkantid = t2.straatkantid GROUP BY straatkantid HAVING COUNT(*) > 1 );
	--UK_straatkant_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele straatkant is niet uniek.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT straatnaamid, wegobjectid, kantcode, begindatum FROM STRAATKANTEN t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid AND t1.wegobjectid = t2.wegobjectid AND t1.kantcode = t2.kantcode AND t1.begindatum = t2.begindatum GROUP BY straatnaamid, wegobjectid, kantcode, begindatum HAVING COUNT(*) > 1 );
	--FK_straatkant_straatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM STRAATKANTEN t1
    WHERE NOT EXISTS (SELECT NULL FROM STRAATNAMEN WHERE straatnaamid = t1.straatnaamid);
	--FK_straatkant_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Wegobjectid ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM STRAATKANTEN t1
    WHERE NOT EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'De geldigheidsperiode van de straatkant overlapt met de geldigheidsperiode van een andere straatkant met dezelfde identificerende kenmerken.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM STRAATKANTEN WHERE eindtijd IS NULL AND straatkantid <> t1.straatkantid 
    AND straatnaamid = t1.straatnaamid
    AND wegobjectid = t1.wegobjectid
    AND kantcode = t1.kantcode
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM STRAATNAMEN WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van het gerelateerde wegobject.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van het gerelateerde wegobject.'
    FROM STRAATKANTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'De beginorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, BEGINTIJD, 'De eindorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '1' AND t1.beginorganisatie NOT IN ('4', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '4' AND t1.beginorganisatie NOT IN ('8', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'straatkant', straatkantid, t1.BEGINTIJD, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM STRAATKANTEN t1
    INNER JOIN WEGOBJECTEN t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99');
	
/*wegobjecten*/
	--PK_wegobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De betekenisloze sleutel van het actuele wegobject is niet uniek.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT wegobjectid FROM WEGOBJECTEN t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid GROUP BY wegobjectid HAVING COUNT(*) > 1 );
	--UK_wegobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De combinatie van identificerende velden van het actuele wegobject is niet uniek.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT identificatorwegobject, aardwegobjectcode, begindatum FROM WEGOBJECTEN t2 WHERE eindtijd IS NULL AND t1.identificatorwegobject = t2.identificatorwegobject AND t1.aardwegobjectcode = t2.aardwegobjectcode AND t1.begindatum = t2.begindatum GROUP BY identificatorwegobject, aardwegobjectcode, begindatum HAVING COUNT(*) > 1 );
	--wegverbinding heeft aardwegobjectcode '5'
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'Aardwegobjectcode ' + aardwegobjectcode +  ' is niet toegestaan voor entiteit wegverbinding.'
    FROM WEGOBJECTEN t1
    WHERE (aardverharding IS NOT NULL OR morfologischewegklasse IS NOT NULL) AND aardwegobjectcode <> '5'  ;
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'Wegobject met aard ''5'' moet subtype wegverbinding zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '5' AND (aardverharding IS NULL OR morfologischewegklasse IS NULL);
	--verplicht voorkomen wegverbindingstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De wegverbindingstatus voor de wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' ontbreekt.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE wegobjectid = t1.wegobjectid);
	--verplicht voorkomen wegverbindinggeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De wegverbindinggeometrie voor de wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' ontbreekt.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM WEGVERBINDINGGEOMETRIEN WHERE wegobjectid = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De geldigheidsperiode van het wegobject overlapt met de geldigheidsperiode van een ander wegobject met dezelfde identificerende kenmerken.'
    FROM WEGOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid <> t1.wegobjectid 
    AND identificatorwegobject = t1.identificatorwegobject
    AND aardwegobjectcode = t1.aardwegobjectcode
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De beginorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De eindorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '1' AND beginorganisatie NOT IN ('4', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '4' AND t1.beginorganisatie NOT IN ('8', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De beginorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegobject', wegobjectid, BEGINTIJD, 'De eindorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM WEGOBJECTEN t1
    WHERE aardwegobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99');
	
/*wegverbindingstatussen*/
	--PK_wegverbindingstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'De betekenisloze sleutel van de actuele wegverbindingstatus is niet uniek.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL 
   AND EXISTS  (SELECT wegverbindingstatusid FROM WEGVERBINDINGSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.wegverbindingstatusid = t2.wegverbindingstatusid GROUP BY wegverbindingstatusid HAVING COUNT(*) > 1 );
	--UK_wegverbindingstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele wegverbindingstatus is niet uniek.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL 
   AND EXISTS  (SELECT wegobjectid, begindatum FROM WEGVERBINDINGSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_wegverbindingstatus_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'Wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE NOT EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'De geldigheidsperiode van de wegverbindingstatus overlapt met de geldigheidsperiode van een andere wegverbindingstatus met dezelfde identificerende kenmerken.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE eindtijd IS NULL AND wegverbindingstatusid <> t1.wegverbindingstatusid 
    AND wegobjectid = t1.wegobjectid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'Begindatum van de wegverbindingstatus moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'Einddatum van de wegverbindingstatus moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--berperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'De beginorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, BEGINTIJD, 'De eindorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*wegverbindinggeometrien*/
	--PK_wegverbindinggeometrie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'De betekenisloze sleutel van de actuele wegverbindinggeometrie is niet uniek.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT wegverbindinggeometrieid FROM WEGVERBINDINGGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.wegverbindinggeometrieid = t2.wegverbindinggeometrieid GROUP BY wegverbindinggeometrieid HAVING COUNT(*) > 1 );
	--UK_wegverbindinggeometrie_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele wegverbindinggeometrie is niet uniek.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT wegobjectid, begindatum FROM WEGVERBINDINGGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_wegverbindinggeometrie_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'Wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE NOT EXISTS(SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.wegobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'De geldigheidsperiode van de wegverbindinggeometrie overlapt met de geldigheidsperiode van een andere wegverbindinggeometrie met dezelfde identificerende kenmerken.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM WEGVERBINDINGGEOMETRIEN WHERE eindtijd IS NULL AND wegverbindinggeometrieid <> t1.wegverbindinggeometrieid 
    AND wegobjectid = t1.wegobjectid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'Begindatum van de wegverbindinggeometrie moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'Einddatum van de wegverbindinggeometrie moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM WEGOBJECTEN WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'De beginorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, BEGINTIJD, 'De eindorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM WEGVERBINDINGGEOMETRIEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*terreinobject-huisnummer relaties*/
	--PK_terreinobject_huisnummer_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'De betekenisloze sleutel van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS (SELECT terreinobject_huisnummer_id FROM TERREINOBJECT_HUISNUMMER_RELATIES t2 WHERE eindtijd IS NULL AND t1.terreinobject_huisnummer_id = t2.terreinobject_huisnummer_id GROUP BY terreinobject_huisnummer_id HAVING COUNT(*) > 1 );
	--UK_terreinobject_huisnummer_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT terreinobjectid, huisnummerid, begindatum FROM TERREINOBJECT_HUISNUMMER_RELATIES t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, huisnummerid, begindatum HAVING COUNT(*) > 1 );
	--FK_terreinobjecthuisnummer_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.huisnummerid);
	--FK_terreinobjecthuisnummer_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Terreinobjectid ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE terreinobjectid = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'De geldigheidsperiode van de terreinobject-huisnummer relatie overlapt met de geldigheidsperiode van een andere terreinobject-huisnummer relatie met dezelfde identificerende kenmerken.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES WHERE eindtijd IS NULL AND terreinobject_huisnummer_id <> t1.terreinobject_huisnummer_id 
    AND terreinobjectid = t1.terreinobjectid
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde terreinobject.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde terreinobject.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindtijd IS NULL  AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode IN ('2', '3', '4') AND t1.beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode IN ('2', '3', '4') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.BEGINTIJD, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.BEGINTIJD, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECT_HUISNUMMER_RELATIES t1
    INNER JOIN TERREINOBJECTEN t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99');
	
/*terreinobjecten*/
	--PK_terreinobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De betekenisloze sleutel van het actuele terreinobject is niet uniek.'
    FROM TERREINOBJECTEN t1
    WHERE eindtijd IS NULL
    AND EXISTS  (SELECT terreinobjectid FROM TERREINOBJECTEN t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid GROUP BY terreinobjectid HAVING COUNT(*) > 1 );
	--UK_terreinobject_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De combinatie van identificerende velden van het actuele terreinobject is niet uniek.'
    FROM TERREINOBJECTEN t1
     WHERE eindtijd IS NULL 
     AND EXISTS (SELECT identificatorterreinobject, aardterreinobjectcode, begindatum FROM TERREINOBJECTEN t2 WHERE eindtijd IS NULL AND t1.identificatorterreinobject = t2.identificatorterreinobject AND t1.aardterreinobjectcode = t2.aardterreinobjectcode AND t1.begindatum = t2.begindatum GROUP BY identificatorterreinobject, aardterreinobjectcode, begindatum HAVING COUNT(*) > 1 );
	--gebouw heeft aardterreinobjectcode '5'
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'Aardterreinobjectcode ' + aardterreinobjectcode +  ' is niet toegestaan voor entiteit gebouw.'
    FROM TERREINOBJECTEN t1
    WHERE aardgebouw IS NOT NULL AND aardterreinobjectcode <> '5';
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'Terreinobject met aard ''5'' moet subtype gebouw zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '5' AND aardgebouw IS NULL;
	--verplicht voorkomen gebouwstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De gebouwstatus voor het gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' ontbreekt.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM GEBOUWSTATUSSEN WHERE terreinobjectid = t1.terreinobjectid);
    --verplicht voorkomen gebouwgeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De gebouwgeometrie voor het gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' ontbreekt.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM GEBOUWGEOMETRIEN WHERE terreinobjectid = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De geldigheidsperiode van het terreinobject overlapt met de geldigheidsperiode van een ander terreinobject met dezelfde identificerende kenmerken.'
    FROM TERREINOBJECTEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid <> t1.terreinobjectid 
    AND identificatorterreinobject = t1.identificatorterreinobject
    AND aardterreinobjectcode = t1.aardterreinobjectcode
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De beginorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De eindorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '1' AND beginorganisatie NOT IN ('3', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '1' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('3', '5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode IN ('2', '3', '4') AND beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode IN ('2', '3', '4') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De beginorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '5' AND beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'terreinobject', terreinobjectid, BEGINTIJD, 'De eindorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM TERREINOBJECTEN t1
    WHERE aardterreinobjectcode = '5' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
	
/*gebouwstatussen*/
	--PK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'De betekenisloze sleutel van de actuele gebouwstatus is niet uniek.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
   AND EXISTS (SELECT gebouwstatusid FROM GEBOUWSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.gebouwstatusid = t2.gebouwstatusid GROUP BY gebouwstatusid HAVING COUNT(*) > 1 );
	--UK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele gebouwstatus is niet uniek.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT terreinobjectid, begindatum FROM GEBOUWSTATUSSEN t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_gebouwstatus_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'Gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM GEBOUWSTATUSSEN t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE terreinobjectid = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'De geldigheidsperiode van de gebouwstatus overlapt met de geldigheidsperiode van een andere gebouwstatus met dezelfde identificerende kenmerken.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM GEBOUWSTATUSSEN WHERE eindtijd IS NULL AND gebouwstatusid <> t1.gebouwstatusid 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'Begindatum van de gebouwstatus moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'Einddatum van de gebouwstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'De beginorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWSTATUSSEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, BEGINTIJD, 'De eindorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWSTATUSSEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*gebouwgeometrien*/
	--PK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'De betekenisloze sleutel van de actuele gebouwgeometrie is niet uniek.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS 
    (SELECT gebouwgeometrieid FROM GEBOUWGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.gebouwgeometrieid = t2.gebouwgeometrieid GROUP BY gebouwgeometrieid HAVING COUNT(*) > 1 );
	--UK_gebouwstatus_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'De combinatie van identificerende velden van de actuele gebouwgeometrie is niet uniek.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS 
    (SELECT terreinobjectid, begindatum FROM GEBOUWGEOMETRIEN t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 );
	--FK_gebouwstatus_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'Gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE NOT EXISTS(SELECT NULL FROM TERREINOBJECTEN WHERE terreinobjectid = t1.terreinobjectid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'De geldigheidsperiode van de gebouwgeometrie overlapt met de geldigheidsperiode van een andere gebouwgeometrie met dezelfde identificerende kenmerken.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM GEBOUWGEOMETRIEN WHERE eindtijd IS NULL AND gebouwgeometrieid <> t1.gebouwgeometrieid 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'Begindatum van de gebouwgeometrie moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'Einddatum van de gebouwgeometrie moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM TERREINOBJECTEN WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'De beginorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, BEGINTIJD, 'De eindorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM GEBOUWGEOMETRIEN t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');

/*rradresssen*/
	--PK_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', rradresid, BEGINTIJD, 'De betekenisloze sleutel van het actuele rradres is niet uniek.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT rradresid FROM RRADRESSEN t2 WHERE eindtijd IS NULL AND t1.rradresid = t2.rradresid GROUP BY rradresid HAVING COUNT(*) > 1 );
	--UK_rradres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', rradresid, BEGINTIJD, 'De combinatie van identificerende velden van het actuele rradres is niet uniek.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL 
	AND EXISTS  (SELECT rrhuisnummer, rrindex, substraatid, begindatum FROM RRADRESSEN t2 WHERE eindtijd IS NULL AND t1.rrhuisnummer = t2.rrhuisnummer AND t1.rrindex = t2.rrindex AND t1.substraatid = t2.substraatid AND t1.begindatum = t2.begindatum GROUP BY rrhuisnummer, rrindex, substraatid, begindatum HAVING COUNT(*) > 1 );
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', rradresid, BEGINTIJD, 'De geldigheidsperiode van het rradres overlapt met de geldigheidsperiode van een ander rradres met dezelfde identificerende kenmerken.'
    FROM RRADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM RRADRESSEN WHERE eindtijd IS NULL AND rradresid <> t1.rradresid 
    AND rrhuisnummer = t1.rrhuisnummer
    AND IFNULL(rrindex,'') = IFNULL(t1.rrindex,'')
    AND substraatid = t1.substraatid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', rradresid, BEGINTIJD, 'De beginorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
    FROM RRADRESSEN t1
    WHERE beginorganisatie NOT IN ('1', '2', '9', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'rradres', rradresid, BEGINTIJD, 'De eindorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
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
    SELECT 'adresRrAdres', id, BEGINTIJD, 'Rijksregisteradresid ' + CAST(rradresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM RRADRESSEN WHERE rradresid = t1.rradresid);
	--FK_adresrradres_crabadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'De geldigheidsperiode van de adres-rradres relatie overlapt met de geldigheidsperiode van een andere adres-rradres relatie met dezelfde identificerende kenmerken.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE eindtijd IS NULL AND adres_rradres_id <> t1.adres_rradres_id 
    AND rradresid = t1.rradresid
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde rradres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM RRADRESSEN WHERE eindtijd IS NULL AND rradresid = t1.rradresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde rradres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS 
    (SELECT NULL FROM RRADRESSEN WHERE eindtijd IS NULL AND rradresid = t1.rradresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
   AND EXISTS  (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
   AND EXISTS  (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'De beginorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, BEGINTIJD, 'De eindorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
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
    AND EXISTS  (SELECT kadhuisnummer, kadstraatnaamcodeid, begindatum FROM KADADRESSEN t2 WHERE eindtijd IS NULL AND t1.kadhuisnummer = t2.kadhuisnummer AND t1.kadstraatnaamcodeid = t2.kadstraatnaamcodeid AND t1.begindatum = t2.begindatum GROUP BY kadhuisnummer, kadstraatnaamcodeid, begindatum HAVING COUNT(*) > 1 );
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'kadadres', id, BEGINTIJD, 'De geldigheidsperiode van het kadadres overlapt met de geldigheidsperiode van een ander kadadres met dezelfde identificerende kenmerken.'
    FROM KADADRESSEN t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM KADADRESSEN WHERE eindtijd IS NULL AND id <> t1.id 
    AND kadhuisnummer = t1.kadhuisnummer
    AND kadstraatnaamcodeid = t1.kadstraatnaamcodeid
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
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
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT id FROM ADRES_RRADRES_RELATIES t2 WHERE eindtijd IS NULL AND t1.id = t2.id GROUP BY id HAVING COUNT(*) > 1 );
	--UK_adres_kadadres_act
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De combinatie van identificerende velden van de actuele adres-kadadres relatie is niet uniek.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT kadadresid, adresid, aardadres, begindatum FROM ADRES_RRADRES_RELATIES t2 WHERE eindtijd IS NULL AND t1.kadadresid = t2.kadadresid AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY kadadresid, adresid, aardadres, begindatum HAVING COUNT(*) > 1 );
	--FK_adreskadadres_kadadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Kadadresid ' + CAST(kadadresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE NOT EXISTS(SELECT NULL FROM KADADRESSEN WHERE kadadresid = t1.kadadresid);
	--FK_adreskadadres_crabadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De geldigheidsperiode van de adres-kadadres relatie overlapt met de geldigheidsperiode van een andere adres-kadadres relatie met dezelfde identificerende kenmerken.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE eindtijd IS NULL AND adres_kadadres_id <> t1.adres_kadadres_id 
    AND kadadresid = t1.kadadresid
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde kadadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS  (SELECT NULL FROM KADADRESSEN WHERE eindtijd IS NULL AND kadadresid = t1.kadadresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde kadadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL 
    AND EXISTS (SELECT NULL FROM KADADRESSEN WHERE eindtijd IS NULL AND id = t1.kadadresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
    AND EXISTS (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
    AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De beginorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_RRADRES_RELATIES t1
    WHERE beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adresKadAdres', id, BEGINTIJD, 'De eindorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRES_RRADRES_RELATIES t1
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
    SELECT 'adrespositie', id, BEGINTIJD, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRESPOSITIES t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM SUBADRESSEN WHERE ID = t1.adresid);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM ADRESPOSITIES t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.adresid);
	--interne temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De geldigheidsperiode van de adrespositie overlapt met de geldigheidsperiode van een andere adrespositie met dezelfde identificerende kenmerken.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM ADRESPOSITIES WHERE eindtijd IS NULL AND id <> t1.id 
    AND herkomstadrespositie = t1.herkomstadrespositie
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= IFNULL(t1.einddatum, '99990101') AND IFNULL(einddatum, '99990101') >= t1.begindatum);
	--externe temporele integriteit
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
   AND EXISTS  (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '1' 
  AND EXISTS   (SELECT NULL FROM SUBADRESSEN WHERE eindtijd IS NULL AND ID = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
   AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum);
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM ADRESPOSITIES t1
    WHERE eindtijd IS NULL AND aardadres = '2' 
  AND EXISTS  (SELECT NULL FROM HUISNUMMERS WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND IFNULL(einddatum, '99990101') < IFNULL(t1.einddatum, '99990101'));
	--beperking organisatiecode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De beginorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE beginorganisatie NOT IN ('1', '5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De eindorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De beginorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND beginorganisatie NOT IN ('1', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De eindorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '99');
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De beginorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') AND beginorganisatie NOT IN ('5', '99');
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, BEGINTIJD, 'De eindorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM ADRESPOSITIES t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99');
	--beperking voorkomen ifv koppeling aan terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, t1.BEGINTIJD, 'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM ADRESPOSITIES t1
    INNER JOIN HUISNUMMERSTATUSSEN t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie IN ('3', '7') AND t2.huisnummerstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobjectcode IN ('2','5'));
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, t1.BEGINTIJD, 'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM ADRESPOSITIES t1
    INNER JOIN SUBADRESSTATUSSEN t2 ON t1.adresid = t2.ID
    INNER JOIN SUBADRESSEN t5 ON t2.ID = t5.ID
    WHERE t1.aardadres = '1' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie IN ('3', '7') AND t2.subadresstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t5.huisnummerid AND t4.aardterreinobjectcode IN ('2','5'));
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, t1.BEGINTIJD, 'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM ADRESPOSITIES t1
    INNER JOIN HUISNUMMERSTATUSSEN t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie = '2' AND t2.huisnummerstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobjectcode IN ('1','4'));
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'adrespositie', id, t1.BEGINTIJD, 'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM ADRESPOSITIES t1
    INNER JOIN SUBADRESSTATUSSEN t2 ON t1.adresid = t2.ID
    INNER JOIN SUBADRESSEN t5 ON t2.ID = t5.ID
    WHERE t1.aardadres = '1' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie = '2' AND t2.subadresstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES t3 INNER JOIN TERREINOBJECTEN t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t5.huisnummerid AND t4.aardterreinobjectcode IN ('1','4'));

COMMIT;

/*transacties*/ /*
	--FK_transactie_adreskadadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-kadadres relatie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adreskadadres' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_kadadres_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-kadadres relatie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adreskadadres' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_kadadres_id = t1.nieuweidentificator)
	--FK_transactie_adrespositie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adrespositie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adrespositie' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRESPOSITIES WHERE adrespositieid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adrespositie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adrespositie' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRESPOSITIES WHERE adrespositieid = t1.nieuweidentificator)
	--FK_transactie_adresrradres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-rradres relatie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adresrradres' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_rradres_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-rradres relatie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adresrradres' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_rradres_id = t1.nieuweidentificator)
	--FK_transactie_gebouwgeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De gebouwgeometrie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'gebouwgeometrie' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM GEBOUWGEOMETRIEN WHERE gebouwgeometrieid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De gebouwgeometrie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adresgebouwgeometrie' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM GEBOUWGEOMETRIEN WHERE gebouwgeometrieid = t1.nieuweidentificator)
	--FK_transactie_gebouwstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De gebouwstatus met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'gebouwstatus' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM GEBOUWSTATUSSEN WHERE gebouwstatusid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De gebouwstatus met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'gebouwstatus' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM GEBOUWSTATUSSEN WHERE gebouwstatusid = t1.nieuweidentificator)
	--FK_transactie_huisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het huisnummer met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'huisnummer' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het huisnummer met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'huisnummer' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM HUISNUMMERS WHERE huisnummerid = t1.nieuweidentificator)
	--FK_transactie_huisnummerstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De huisnummerstatus met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'huisnummerstatus' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM HUISNUMMERSTATUSSEN WHERE huisnummerstatusid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De huisnummerstatus met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'huisnummerstatus' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM HUISNUMMERSTATUSSEN WHERE huisnummerstatusid = t1.nieuweidentificator)
	--FK_transactie_kadadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-kadadres relatie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adreskadadres' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_kadadres_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De adres-kadadres relatie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'adreskadadres' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ADRES_RRADRES_RELATIES WHERE adres_kadadres_id = t1.nieuweidentificator)
	--FK_transactie_postkantoncode
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De postkantoncode met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'postkantoncode' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM POSTKANTONCODES WHERE huisnummer_postkanton_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De postkantoncode met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'postkantoncode' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM POSTKANTONCODES WHERE huisnummer_postkanton_id = t1.nieuweidentificator)
	--FK_transactie_rradres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het rradres met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'rradres' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM RRADRESSEN WHERE rradresid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het rradres met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'rradres' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM RRADRESSEN WHERE rradresid = t1.nieuweidentificator)
	--FK_transactie_straatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatnaam met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatnaam' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM STRAATNAMEN WHERE straatnaamid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatnaam met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatnaam' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM ID WHERE straatnaamid = t1.nieuweidentificator)
	--FK_transactie_straatnaamstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatnaamstatus met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatnaamstatus' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM STRAATNAAMSTATUSSEN WHERE straatnaamstatusid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatnaamstatus met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatnaamstatus' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM STRAATNAAMSTATUSSEN WHERE straatnaamstatusid = t1.nieuweidentificator)
	--FK_transactie_straatkant
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatkant met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatkant' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM STRAATKANTEN WHERE straatkantid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De straatkant met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'straatkant' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM STRAATKANTEN WHERE straatkantid = t1.nieuweidentificator)
	--FK_transactie_subadres
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het subadres met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'subadres' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM SUBADRESSEN WHERE subadresid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het subadres met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'subadres' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM SUBADRESSEN WHERE subadresid = t1.nieuweidentificator)
	--FK_transactie_subadresstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De subadresstatus met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'subadresstatus' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM SUBADRESSTATUSSEN WHERE subadresstatusid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De subadresstatus met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'subadresstatus' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM SUBADRESSTATUSSEN WHERE subadresstatusid = t1.nieuweidentificator)
	--FK_transactie_substraatnaamstraatnaam
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De rrstraatnaam-straatnaam relatie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'rrstraatnaamstraatnaam' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM RRSTRAATNAAM_STRAATNAAM_RELATIES WHERE substraat_straatnaam_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De rrstraatnaam-straatnaam relatie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'rrStraatnaamStraatnaam' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM RRSTRAATNAAM_STRAATNAAM_RELATIES WHERE substraat_straatnaam_id = t1.nieuweidentificator)
	--FK_transactie_terreinobjecthuisnummer
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De terreinobject-huisnummer relatie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'terreinobjecthuisnummer' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES WHERE terreinobject_huisnummer_id = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De terreinobject-huisnummer relatie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'terreinobjecthuisnummer' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECT_HUISNUMMER_RELATIES WHERE terreinobject_huisnummer_id = t1.nieuweidentificator)
	--FK_transactie_terreinobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het terreinobject met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'terreinobject' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECTEN WHERE terreinobjectid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het terreinobject met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'terreinobject' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM TERREINOBJECTEN WHERE terreinobjectid = t1.nieuweidentificator)
	--FK_transactie_wegobject
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het wegobject met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegobject' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Het wegobject met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegobject' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGOBJECTEN WHERE wegobjectid = t1.nieuweidentificator)
	--FK_transactie_wegverbindinggeometrie
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De wegverbindinggeometrie met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegverbindinggeometrie' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGVERBINDINGGEOMETRIEN WHERE wegverbindinggeometrieid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De wegverbindinggeometrie met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegverbindinggeometrie' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGVERBINDINGGEOMETRIEN WHERE wegverbindinggeometrieid = t1.nieuweidentificator)
	--FK_transactie_wegverbindingstatus
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De wegverbindingstatus met id ' + CAST(oudeidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegverbindingstatus' AND oudeidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE wegverbindingstatusid = t1.oudeidentificator)
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'De wegverbindingstatus met id ' + CAST(nieuweidentificator AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbltransactie_opl t1
    WHERE objecttype = 'wegverbindingstatus' AND nieuweidentificator IS NOT NULL AND NOT EXISTS(
    SELECT NULL FROM WEGVERBINDINGSTATUSSEN WHERE wegverbindingstatusid = t1.nieuweidentificator)
	--beperking identificatoren ifv transactietype
	INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Oude identificator kan niet voorkomen voor een transactie van het type 1 (invoer).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '1' AND oudeidentificator IS NOT NULL
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Nieuwe identificator moet voorkomen voor een transactie van het type 1 (invoer).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '1' AND nieuweidentificator IS NULL
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Oude identificator moet voorkomen voor een transactie van het type 2 (historering).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '2' AND oudeidentificator IS NULL
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Nieuwe identificator moet voorkomen voor een transactie van het type 2 (historering).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '2' AND nieuweidentificator IS NULL
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Oude identificator moet voorkomen voor een transactie van het type 3 (correctie).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '3' AND oudeidentificator IS NULL
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Nieuwe identificator moet voorkomen voor een transactie van het type 3 (correctie).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '3' AND nieuweidentificator IS NULL
    
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Oude identificator moet voorkomen voor een transactie van het type 4 (verwijdering).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '4' AND oudeidentificator IS NULL
    INSERT INTO validatiefouten (objecttype,id,BEGINTIJD,boodschap)
    SELECT 'transactie', null, null, 'Nieuwe identificator kan niet voorkomen voor een transactie van het type 4 (verwijdering).'
    FROM wdb.tbltransactie_opl t1
    WHERE transactietype = '4' AND nieuweidentificator IS NOT NULL
 */

