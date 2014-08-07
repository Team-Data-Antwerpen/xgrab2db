USE [CRAB]
GO

/****** Object:  StoredProcedure [xgrab].[validate]    Script Date: 07/16/2014 14:35:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--DROP PROCEDURE xgrab.validate
--go

CREATE PROCEDURE [xgrab].[validate]
AS 
    SET NOCOUNT ON ;
/*Tijdelijke tabel*/
    DECLARE @validatiefouten TABLE
        (
          validatieid INT IDENTITY(1,1),
          objecttype VARCHAR(50),
          id INT,
          begintijd DATETIME,
          boodschap VARCHAR(MAX)
        ) ;
	
/*Begindatum is minimaal 1 januari 1830*/
    DECLARE @minBegindatum DATETIME = '1830-01-01'
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaam',straatnaamid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblstraatnaam_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaamstatus',straatnaamstatusid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblstraatnaamstatus_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummer',huisnummerid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblhuisnummer_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummerstatus',huisnummerstatusid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblhuisnummerstatus_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadres',subadresid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblsubadres_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadresstatus',subadresstatusid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblsubadresstatus_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'postkantoncode',huisnummer_postkanton_id,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblhuisnummer_postkanton_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrStraatnaamStraatnaam',substraat_straatnaam_id,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblsubstraat_straatnaam_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatkant',straatkantid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblstraatkant_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegobject',wegobjectid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblwegobject_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindingstatus',wegverbindingstatusid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblwegverbindingstatus_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindinggeometrie',wegverbindinggeometrieid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblwegverbindinggeometrie_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobjectHuisnummer',terreinobject_huisnummer_id,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblterreinobject_huisnummer_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobject',terreinobjectid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblterreinobject_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwstatus',gebouwstatusid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblgebouwstatus_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwgeometrie',gebouwgeometrieid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblgebouwgeometrie_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrAdres',rradresid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblrradres_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresRrAdres',adres_rradres_id,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tbladres_rradres_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'kadAdres',kadadresid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tblkadadres_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresKadAdres',adres_kadadres_id,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tbladres_kadadres_opl
    WHERE   begindatum < @minBegindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adrespositie',adrespositieid,begintijd,'Begindatum moet groter of gelijk zijn aan 1830-01-01.'
    FROM    wdb.tbladrespositie_opl
    WHERE   begindatum < @minBegindatum
    
/*Einddatum is leeg of is kleiner dan begindatum*/
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaam',straatnaamid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblstraatnaam_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaamstatus',straatnaamstatusid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblstraatnaamstatus_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummer',huisnummerid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblhuisnummer_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummerstatus',huisnummerstatusid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblhuisnummerstatus_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadres',subadresid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblsubadres_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadresstatus',subadresstatusid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblsubadresstatus_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'postkantoncode',huisnummer_postkanton_id,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblhuisnummer_postkanton_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrStraatnaamStraatnaam',substraat_straatnaam_id,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblsubstraat_straatnaam_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatkant',straatkantid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblstraatkant_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegobject',wegobjectid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblwegobject_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindingstatus',wegverbindingstatusid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblwegverbindingstatus_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindinggeometrie',wegverbindinggeometrieid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblwegverbindinggeometrie_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobjectHuisnummer',terreinobject_huisnummer_id,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblterreinobject_huisnummer_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobject',terreinobjectid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblterreinobject_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwstatus',gebouwstatusid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblgebouwstatus_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwgeometrie',gebouwgeometrieid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblgebouwgeometrie_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrAdres',rradresid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblrradres_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresRrAdres',adres_rradres_id,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tbladres_rradres_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'kadAdres',kadadresid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tblkadadres_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresKadAdres',adres_kadadres_id,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tbladres_kadadres_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adrespositie',adrespositieid,begintijd,'Einddatum moet recenter zijn dan begindatum.'
    FROM    wdb.tbladrespositie_opl
    WHERE   einddatum IS NOT NULL AND einddatum <= begindatum
    
/*Eindtijd is leeg of is kleiner dan begintijd*/
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaam',straatnaamid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblstraatnaam_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatnaamstatus',straatnaamstatusid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblstraatnaamstatus_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummer',huisnummerid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblhuisnummer_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'huisnummerstatus',huisnummerstatusid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblhuisnummerstatus_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadres',subadresid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblsubadres_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'subadresstatus',subadresstatusid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblsubadresstatus_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'postkantoncode',huisnummer_postkanton_id,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblhuisnummer_postkanton_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrStraatnaamStraatnaam',substraat_straatnaam_id,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblsubstraat_straatnaam_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'straatkant',straatkantid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblstraatkant_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegobject',wegobjectid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblwegobject_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindingstatus',wegverbindingstatusid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblwegverbindingstatus_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'wegverbindinggeometrie',wegverbindinggeometrieid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblwegverbindinggeometrie_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobjectHuisnummer',terreinobject_huisnummer_id,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblterreinobject_huisnummer_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'terreinobject',terreinobjectid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblterreinobject_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwstatus',gebouwstatusid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblgebouwstatus_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'gebouwgeometrie',gebouwgeometrieid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblgebouwgeometrie_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'rrAdres',rradresid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblrradres_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresRrAdres',adres_rradres_id,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tbladres_rradres_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'kadAdres',kadadresid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tblkadadres_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adresKadAdres',adres_kadadres_id,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tbladres_kadadres_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    INSERT  INTO @validatiefouten(objecttype,id,begintijd,boodschap)
    SELECT  'adrespositie',adrespositieid,begintijd,'Eindtijd moet recenter zijn dan begintijd.'
    FROM    wdb.tbladrespositie_opl
    WHERE   eindtijd IS NOT NULL AND eindtijd < begintijd
    
/*straatnamen*/
    --PK_straatnaam_act
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De betekenisloze sleutel van de actuele straatnaam is niet uniek.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatnaamid FROM wdb.tblstraatnaam_opl t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid GROUP BY straatnaamid HAVING COUNT(*) > 1 )
    --UK_straatnaam_act
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De combinatie van identificerende velden van de actuele straatnaam is niet uniek.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT gemeenteid, straatnaam, begindatum FROM wdb.tblstraatnaam_opl t2 WHERE eindtijd IS NULL AND t1.gemeenteid = t2.gemeenteid AND t1.straatnaam = t2.straatnaam AND t1.begindatum = t2.begindatum GROUP BY gemeenteid, straatnaam, begindatum HAVING COUNT(*) > 1 )
    --verplicht voorkomen straatnaamstatus
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De straatnaamstatus voor de straatnaam met id ' + CAST(straatnaamid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblstraatnaamstatus_opl WHERE straatnaamid = t1.straatnaamid)
    --interne temporele integriteit
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De geldigheidsperiode van de straatnaam overlapt met de geldigheidsperiode van een andere straatnaam met dezelfde identificerende kenmerken.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid <> t1.straatnaamid 
    AND gemeenteid = t1.gemeenteid AND straatnaam = t1.straatnaam 
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
    --beperking organisatiecode
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De beginorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaam', straatnaamid, begintijd, 'De eindorganisatie van de straatnaam moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatnaam_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
/*straatnaamstatussen*/
	--PK_straatnaamstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'De betekenisloze sleutel van de actuele straatnaamstatus is niet uniek.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatnaamstatusid FROM wdb.tblstraatnaamstatus_opl t2 WHERE eindtijd IS NULL AND t1.straatnaamstatusid = t2.straatnaamstatusid GROUP BY straatnaamstatusid HAVING COUNT(*) > 1 )
    --UK_straatnaamstatus_act
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'De combinatie van identificerende velden van de actuele straatnaamstatus is niet uniek.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatnaamid, begindatum FROM wdb.tblstraatnaamstatus_opl t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid AND t1.begindatum = t2.begindatum GROUP BY straatnaamid, begindatum HAVING COUNT(*) > 1 )
    --FK_straatnaamstatus_straatnaam
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblstraatnaam_opl WHERE straatnaamid = t1.straatnaamid)
    --interne temporele integriteit
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'De geldigheidsperiode van de straatnaamstatus overlapt met de geldigheidsperiode van een andere straatnaamstatus met dezelfde identificerende kenmerken.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblstraatnaamstatus_opl WHERE eindtijd IS NULL AND straatnaamstatusid <> t1.straatnaamstatusid 
    AND straatnaamid = t1.straatnaamid 
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
    --externe temporele integriteit
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'Begindatum van de straatnaamstatus moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'Einddatum van de straatnaamstatus moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    --beperking organisatiecode
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamid, begintijd, 'De beginorganisatie van de straatnaamstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatnaamstatus', straatnaamstatusid, begintijd, 'De eindorganisatie van de straatnaamstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatnaamstatus_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
/*huisnummers*/
	--PK_huisnummer_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De betekenisloze sleutel van het actuele huisnummer is niet uniek.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummerid FROM wdb.tblhuisnummer_opl t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid GROUP BY huisnummerid HAVING COUNT(*) > 1 )
    --UK_huisnummer_act
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De combinatie van identificerende velden van het actuele huisnummer is niet uniek.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatnaamid, huisnummer, begindatum FROM wdb.tblhuisnummer_opl t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid AND t1.huisnummer = t2.huisnummer AND t1.begindatum = t2.begindatum GROUP BY straatnaamid, huisnummer, begindatum HAVING COUNT(*) > 1 )
    --FK_huisnummer_straatnaam
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblstraatnaam_opl WHERE straatnaamid = t1.straatnaamid)
    --verplicht voorkomen huisnummerstatus
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De huisnummerstatus voor het huisnummer met id ' + CAST(huisnummerid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblhuisnummerstatus_opl WHERE huisnummerid = t1.huisnummerid)
    --interne temporele integriteit
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De geldigheidsperiode van het huisnummer overlapt met de geldigheidsperiode van een ander huisnummer met dezelfde identificerende kenmerken.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid <> t1.huisnummerid 
    AND straatnaamid = t1.straatnaamid 
    AND huisnummer = t1.huisnummer
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
    --externe temporele integriteit
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'Begindatum van het huisnummer moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'Einddatum van het huisnummer moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    --beperking organisatiecode
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De beginorganisatie van het huisnummer moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummer', huisnummerid, begintijd, 'De eindorganisatie van het huisnummer moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummer_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
/*huisnummerstatussen*/
	--PK_huisnummerstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'De betekenisloze sleutel van de actuele huisnummerstatus is niet uniek.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummerstatusid FROM wdb.tblhuisnummerstatus_opl t2 WHERE eindtijd IS NULL AND t1.huisnummerstatusid = t2.huisnummerstatusid GROUP BY huisnummerstatusid HAVING COUNT(*) > 1 )
	--UK_huisnummerstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'De combinatie van identificerende velden van de actuele huisnummerstatus is niet uniek.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummerid, begindatum FROM wdb.tblhuisnummerstatus_opl t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 )
	--FK_huisnummerstatus_huisnummer
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.huisnummerid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'De geldigheidsperiode van de huisnummerstatus overlapt met de geldigheidsperiode van een andere huisnummerstatus met dezelfde identificerende kenmerken.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblhuisnummerstatus_opl WHERE eindtijd IS NULL AND huisnummerstatusid <> t1.huisnummerstatusid 
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'Begindatum van de huisnummerstatus moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'Einddatum van de huisnummerstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'De beginorganisatie van de huisnummerstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'huisnummerstatus', huisnummerstatusid, begintijd, 'De eindorganisatie van de huisnummerstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummerstatus_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')

/*subadressen*/
	--PK_subadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De betekenisloze sleutel van het actuele subadres is niet uniek.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT subadresid FROM wdb.tblsubadres_opl t2 WHERE eindtijd IS NULL AND t1.subadresid = t2.subadresid GROUP BY subadresid HAVING COUNT(*) > 1 )
	--UK_subadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De combinatie van identificerende velden van het actuele subadres is niet uniek.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummerid, subadres, aardsubadrescode, begindatum FROM wdb.tblsubadres_opl t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.subadres = t2.subadres AND t1.aardsubadrescode = t2.aardsubadrescode AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, subadres, aardsubadrescode, begindatum HAVING COUNT(*) > 1 )
	--FK_subadres_huisnummer
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblsubadres_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.huisnummerid)
	--verplicht voorkomen subadresstatus
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De subadresstatus voor het subadres met id ' + CAST(subadresid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblsubadres_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblsubadresstatus_opl WHERE subadresid = t1.subadresid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De geldigheidsperiode van het subadres overlapt met de geldigheidsperiode van een ander subadres met dezelfde identificerende kenmerken.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid <> t1.subadresid 
    AND huisnummerid = t1.huisnummerid
    AND subadres = t1.subadres
    AND aardsubadrescode = t1.aardsubadrescode
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'Begindatum van het subadres moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'Einddatum van het subadres moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De beginorganisatie van het subadres moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubadres_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadres', subadresid, begintijd, 'De eindorganisatie van het subadres moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubadres_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
/*Subadresstatussen*/
	--PK_subadresstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'De betekenisloze sleutel van de actuele subadresstatus is niet uniek.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT subadresstatusid FROM wdb.tblsubadresstatus_opl t2 WHERE eindtijd IS NULL AND t1.subadresstatusid = t2.subadresstatusid GROUP BY subadresstatusid HAVING COUNT(*) > 1 )
	--UK_subadresstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'De combinatie van identificerende velden van de actuele subadresstatus is niet uniek.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT subadresid, begindatum FROM wdb.tblsubadres_opl t2 WHERE eindtijd IS NULL AND t1.subadresid = t2.subadresid AND t1.begindatum = t2.begindatum GROUP BY subadresid, begindatum HAVING COUNT(*) > 1 )
	--FK_subadresstatus_subadres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'Subadresid ' + CAST(subadresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblsubadres_opl WHERE subadresid = t1.subadresid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'De geldigheidsperiode van de subadresstatus overlapt met de geldigheidsperiode van een andere subadresstatus met dezelfde identificerende kenmerken.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblsubadresstatus_opl WHERE eindtijd IS NULL AND subadresstatusid <> t1.subadresstatusid 
    AND subadresid = t1.subadresid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'Begindatum van de subadresstatus moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.subadresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'Einddatum van de subadresstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.subadresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'De beginorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'subadresstatus', subadresstatusid, begintijd, 'De eindorganisatie van de subadresstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubadresstatus_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')

/*Postkantoncodes*/
	--PK_postkantoncode_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'De betekenisloze sleutel van de actuele postkantoncode is niet uniek.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummer_postkanton_id FROM wdb.tblhuisnummer_postkanton_opl t2 WHERE eindtijd IS NULL AND t1.huisnummer_postkanton_id = t2.huisnummer_postkanton_id GROUP BY huisnummer_postkanton_id HAVING COUNT(*) > 1 )
	--UK_postkantoncode_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'De combinatie van identificerende velden van de actuele postkantoncode is niet uniek.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT huisnummerid, begindatum FROM wdb.tblhuisnummer_postkanton_opl t2 WHERE eindtijd IS NULL AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY huisnummerid, begindatum HAVING COUNT(*) > 1 )
	--FK_postkantoncode_huisnummer
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.huisnummerid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'De geldigheidsperiode van de postkantoncode overlapt met de geldigheidsperiode van een andere postkantoncode met dezelfde identificerende kenmerken.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblhuisnummer_postkanton_opl WHERE eindtijd IS NULL AND huisnummer_postkanton_id <> t1.huisnummer_postkanton_id 
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'Begindatum van de postkantoncode moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'Einddatum van de postkantoncode moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'De beginorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'postkantoncode', huisnummer_postkanton_id, begintijd, 'De eindorganisatie van de postkantoncode moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblhuisnummer_postkanton_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
/*rrstraatnaam-straatnaam relaties*/
	--PK_rrstraatnaam_straatnaam_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'De betekenisloze sleutel van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT substraat_straatnaam_id FROM wdb.tblsubstraat_straatnaam_opl t2 WHERE eindtijd IS NULL AND t1.substraat_straatnaam_id = t2.substraat_straatnaam_id GROUP BY substraat_straatnaam_id HAVING COUNT(*) > 1 )
	--UK_rrstraatnaam_straatnaam_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'De combinatie van identificerende velden van de actuele rrstraatnaam-straatnaam relatie is niet uniek.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT substraatid, begindatum FROM wdb.tblsubstraat_straatnaam_opl t2 WHERE eindtijd IS NULL AND t1.substraatid = t2.substraatid AND t1.begindatum = t2.begindatum GROUP BY substraatid, begindatum HAVING COUNT(*) > 1 )
	--FK_rrstraatnaamstraatnaam_straatnaam
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE straatnaamid = t1.straatnaamid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'De geldigheidsperiode van de rrstraatnaam-straatnaam relatie overlapt met de geldigheidsperiode van een andere rrstraatnaam-straatnaam relatie met dezelfde identificerende kenmerken.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblsubstraat_straatnaam_opl WHERE eindtijd IS NULL AND substraat_straatnaam_id <> t1.substraat_straatnaam_id 
    AND substraatid = t1.substraatid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'Begindatum van de rrstraatnaam-straatnaam relatie moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'Einddatum van de rrstraatnaam-straatnaam relatie moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'De beginorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE beginorganisatie NOT IN ('1','5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rrStraatnaamStraatnaam', substraat_straatnaam_id, begintijd, 'De eindorganisatie van de rrstraatnaam-straatnaam relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblsubstraat_straatnaam_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1','5', '99')
    
/*straatkanten*/
	--PK_straatkant_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'De betekenisloze sleutel van de actuele straatkant is niet uniek.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatkantid FROM wdb.tblstraatkant_opl t2 WHERE eindtijd IS NULL AND t1.straatkantid = t2.straatkantid GROUP BY straatkantid HAVING COUNT(*) > 1 )
	--UK_straatkant_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'De combinatie van identificerende velden van de actuele straatkant is niet uniek.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT straatnaamid, wegobjectid, kantcode, begindatum FROM wdb.tblstraatkant_opl t2 WHERE eindtijd IS NULL AND t1.straatnaamid = t2.straatnaamid AND t1.wegobjectid = t2.wegobjectid AND t1.kantcode = t2.kantcode AND t1.begindatum = t2.begindatum GROUP BY straatnaamid, wegobjectid, kantcode, begindatum HAVING COUNT(*) > 1 )
	--FK_straatkant_straatnaam
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Straatnaamid ' + CAST(straatnaamid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblstraatkant_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE straatnaamid = t1.straatnaamid)
	--FK_straatkant_wegobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Wegobjectid ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblstraatkant_opl t1
    WHERE NOT EXISTS (SELECT NULL FROM wdb.tblwegobject_opl WHERE wegobjectid = t1.wegobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'De geldigheidsperiode van de straatkant overlapt met de geldigheidsperiode van een andere straatkant met dezelfde identificerende kenmerken.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblstraatkant_opl WHERE eindtijd IS NULL AND straatkantid <> t1.straatkantid 
    AND straatnaamid = t1.straatnaamid
    AND wegobjectid = t1.wegobjectid
    AND kantcode = t1.kantcode
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van de gerelateerde straatnaam.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van de gerelateerde straatnaam.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblstraatnaam_opl WHERE eindtijd IS NULL AND straatnaamid = t1.straatnaamid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Begindatum van de straatkant moet groter of gelijk zijn aan begindatum van het gerelateerde wegobject.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'Einddatum van de straatkant moet kleiner of gelijk zijn aan einddatum van het gerelateerde wegobject.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'De beginorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, begintijd, 'De eindorganisatie van de straatkant moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '1' AND t1.beginorganisatie NOT IN ('4', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '4' AND t1.beginorganisatie NOT IN ('8', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De beginorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'straatkant', straatkantid, t1.begintijd, 'De eindorganisatie van de straatkant gekoppeld aan een wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tblstraatkant_opl t1
    INNER JOIN wdb.tblwegobject_opl t2 ON t1.wegobjectid = t2.wegobjectid
    WHERE t2.aardwegobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99')
	
/*wegobjecten*/
	--PK_wegobject_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De betekenisloze sleutel van het actuele wegobject is niet uniek.'
    FROM wdb.tblwegobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT wegobjectid FROM wdb.tblwegobject_opl t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid GROUP BY wegobjectid HAVING COUNT(*) > 1 )
	--UK_wegobject_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De combinatie van identificerende velden van het actuele wegobject is niet uniek.'
    FROM wdb.tblwegobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT identificatorwegobject, aardwegobjectcode, begindatum FROM wdb.tblwegobject_opl t2 WHERE eindtijd IS NULL AND t1.identificatorwegobject = t2.identificatorwegobject AND t1.aardwegobjectcode = t2.aardwegobjectcode AND t1.begindatum = t2.begindatum GROUP BY identificatorwegobject, aardwegobjectcode, begindatum HAVING COUNT(*) > 1 )
	--wegverbinding heeft aardwegobjectcode '5'
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'Aardwegobjectcode ' + aardwegobjectcode +  ' is niet toegestaan voor entiteit wegverbinding.'
    FROM wdb.tblwegobject_opl t1
    WHERE (aardverharding IS NOT NULL OR morfologischewegklasse IS NOT NULL) AND aardwegobjectcode <> '5'
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'Wegobject met aard ''5'' moet subtype wegverbinding zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '5' AND (aardverharding IS NULL OR morfologischewegklasse IS NULL)
	--verplicht voorkomen wegverbindingstatus
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De wegverbindingstatus voor de wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM wdb.tblwegverbindingstatus_opl WHERE wegobjectid = t1.wegobjectid)
	--verplicht voorkomen wegverbindinggeometrie
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De wegverbindinggeometrie voor de wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM wdb.tblwegverbindinggeometrie_opl WHERE wegobjectid = t1.wegobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De geldigheidsperiode van het wegobject overlapt met de geldigheidsperiode van een ander wegobject met dezelfde identificerende kenmerken.'
    FROM wdb.tblwegobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid <> t1.wegobjectid 
    AND identificatorwegobject = t1.identificatorwegobject
    AND aardwegobjectcode = t1.aardwegobjectcode
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De beginorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE beginorganisatie NOT IN ('1', '4', '5', '8', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De eindorganisatie van het wegobject moet ofwel 1 (gemeente) ofwel 4 (TeleAtlas) ofwel 5 (AGIV) ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '4', '5', '8', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De beginorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '1' AND beginorganisatie NOT IN ('4', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De eindorganisatie van het wegobject met aard 1 (TeleAtlas TaTel) moet ofwel 4 (TeleAtlas) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '1' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('4', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De beginorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode IN('2', '3') AND t1.beginorganisatie NOT IN ('5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De eindorganisatie van het wegobject met aard 2 (GRB wegverbinding) of aard 3 (GRB wegknoop) moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode IN ('2','3') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De beginorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '4' AND t1.beginorganisatie NOT IN ('8', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De eindorganisatie van het wegobject met aard 4 (NavTeq ntLink) moet ofwel 8 (NavTeq) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '4' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('8', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De beginorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegobject', wegobjectid, begintijd, 'De eindorganisatie van het wegobject met aard 5 (wegverbinding volgens de gemeente) moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegobject_opl t1
    WHERE aardwegobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '99')
	
/*wegverbindingstatussen*/
	--PK_wegverbindingstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'De betekenisloze sleutel van de actuele wegverbindingstatus is niet uniek.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT wegverbindingstatusid FROM wdb.tblwegverbindingstatus_opl t2 WHERE eindtijd IS NULL AND t1.wegverbindingstatusid = t2.wegverbindingstatusid GROUP BY wegverbindingstatusid HAVING COUNT(*) > 1 )
	--UK_wegverbindingstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'De combinatie van identificerende velden van de actuele wegverbindingstatus is niet uniek.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT wegobjectid, begindatum FROM wdb.tblwegverbindingstatus_opl t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 )
	--FK_wegverbindingstatus_wegobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'Wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblwegobject_opl WHERE wegobjectid = t1.wegobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'De geldigheidsperiode van de wegverbindingstatus overlapt met de geldigheidsperiode van een andere wegverbindingstatus met dezelfde identificerende kenmerken.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblwegverbindingstatus_opl WHERE eindtijd IS NULL AND wegverbindingstatusid <> t1.wegverbindingstatusid 
    AND wegobjectid = t1.wegobjectid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'Begindatum van de wegverbindingstatus moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'Einddatum van de wegverbindingstatus moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--berperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'De beginorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindingstatus', wegverbindingstatusid, begintijd, 'De eindorganisatie van de wegverbindingstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegverbindingstatus_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
	
/*wegverbindinggeometrien*/
	--PK_wegverbindinggeometrie_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'De betekenisloze sleutel van de actuele wegverbindinggeometrie is niet uniek.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT wegverbindinggeometrieid FROM wdb.tblwegverbindinggeometrie_opl t2 WHERE eindtijd IS NULL AND t1.wegverbindinggeometrieid = t2.wegverbindinggeometrieid GROUP BY wegverbindinggeometrieid HAVING COUNT(*) > 1 )
	--UK_wegverbindinggeometrie_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'De combinatie van identificerende velden van de actuele wegverbindinggeometrie is niet uniek.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT wegobjectid, begindatum FROM wdb.tblwegverbindinggeometrie_opl t2 WHERE eindtijd IS NULL AND t1.wegobjectid = t2.wegobjectid AND t1.begindatum = t2.begindatum GROUP BY wegobjectid, begindatum HAVING COUNT(*) > 1 )
	--FK_wegverbindinggeometrie_wegobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'Wegverbinding met id ' + CAST(wegobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblwegobject_opl WHERE wegobjectid = t1.wegobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'De geldigheidsperiode van de wegverbindinggeometrie overlapt met de geldigheidsperiode van een andere wegverbindinggeometrie met dezelfde identificerende kenmerken.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblwegverbindinggeometrie_opl WHERE eindtijd IS NULL AND wegverbindinggeometrieid <> t1.wegverbindinggeometrieid 
    AND wegobjectid = t1.wegobjectid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'Begindatum van de wegverbindinggeometrie moet groter of gelijk zijn aan begindatum van de gerelateerde wegverbinding.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'Einddatum van de wegverbindinggeometrie moet kleiner of gelijk zijn aan einddatum van de gerelateerde wegverbinding.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblwegobject_opl WHERE eindtijd IS NULL AND wegobjectid = t1.wegobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'De beginorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'wegverbindinggeometrie', wegverbindinggeometrieid, begintijd, 'De eindorganisatie van de wegverbindinggeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblwegverbindinggeometrie_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
	
/*terreinobject-huisnummer relaties*/
	--PK_terreinobject_huisnummer_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'De betekenisloze sleutel van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT terreinobject_huisnummer_id FROM wdb.tblterreinobject_huisnummer_opl t2 WHERE eindtijd IS NULL AND t1.terreinobject_huisnummer_id = t2.terreinobject_huisnummer_id GROUP BY terreinobject_huisnummer_id HAVING COUNT(*) > 1 )
	--UK_terreinobject_huisnummer_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'De combinatie van identificerende velden van de actuele terreinobject-huisnummer relatie is niet uniek.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT terreinobjectid, huisnummerid, begindatum FROM wdb.tblterreinobject_huisnummer_opl t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.huisnummerid = t2.huisnummerid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, huisnummerid, begindatum HAVING COUNT(*) > 1 )
	--FK_terreinobjecthuisnummer_huisnummer
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Huisnummerid ' + CAST(huisnummerid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.huisnummerid)
	--FK_terreinobjecthuisnummer_terreinobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Terreinobjectid ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblterreinobject_opl WHERE terreinobjectid = t1.terreinobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'De geldigheidsperiode van de terreinobject-huisnummer relatie overlapt met de geldigheidsperiode van een andere terreinobject-huisnummer relatie met dezelfde identificerende kenmerken.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblterreinobject_huisnummer_opl WHERE eindtijd IS NULL AND terreinobject_huisnummer_id <> t1.terreinobject_huisnummer_id 
    AND terreinobjectid = t1.terreinobjectid
    AND huisnummerid = t1.huisnummerid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.huisnummerid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Begindatum van de terreinobject-huisnummer relatie moet groter of gelijk zijn aan begindatum van het gerelateerde terreinobject.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'Einddatum van de terreinobject-huisnummer relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde terreinobject.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'De beginorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, begintijd, 'De eindorganisatie van de terreinobject-huisnummer relatie moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.begintijd, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    INNER JOIN wdb.tblterreinobject_opl t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode IN ('2', '3', '4') AND t1.beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.begintijd, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    INNER JOIN wdb.tblterreinobject_opl t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode IN ('2', '3', '4') AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.begintijd, 'De beginorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    INNER JOIN wdb.tblterreinobject_opl t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode = '5' AND t1.beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobjectHuisnummer', terreinobject_huisnummer_id, t1.begintijd, 'De eindorganisatie van de terreinobject-huisnummer relatie gekoppeld aan een terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_huisnummer_opl t1
    INNER JOIN wdb.tblterreinobject_opl t2 ON t1.terreinobjectid = t2.terreinobjectid
    WHERE t2.aardterreinobjectcode = '5' AND t1.eindorganisatie IS NOT NULL and t1.eindorganisatie NOT IN ('1', '5', '99')
	
/*terreinobjecten*/
	--PK_terreinobject_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De betekenisloze sleutel van het actuele terreinobject is niet uniek.'
    FROM wdb.tblterreinobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT terreinobjectid FROM wdb.tblterreinobject_opl t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid GROUP BY terreinobjectid HAVING COUNT(*) > 1 )
	--UK_terreinobject_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De combinatie van identificerende velden van het actuele terreinobject is niet uniek.'
    FROM wdb.tblterreinobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT identificatorterreinobject, aardterreinobjectcode, begindatum FROM wdb.tblterreinobject_opl t2 WHERE eindtijd IS NULL AND t1.identificatorterreinobject = t2.identificatorterreinobject AND t1.aardterreinobjectcode = t2.aardterreinobjectcode AND t1.begindatum = t2.begindatum GROUP BY identificatorterreinobject, aardterreinobjectcode, begindatum HAVING COUNT(*) > 1 )
	--gebouw heeft aardterreinobjectcode '5'
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'Aardterreinobjectcode ' + aardterreinobjectcode +  ' is niet toegestaan voor entiteit gebouw.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardgebouw IS NOT NULL AND aardterreinobjectcode <> '5'
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'Terreinobject met aard ''5'' moet subtype gebouw zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '5' AND aardgebouw IS NULL
	--verplicht voorkomen gebouwstatus
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De gebouwstatus voor het gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM wdb.tblgebouwstatus_opl WHERE terreinobjectid = t1.terreinobjectid)
    --verplicht voorkomen gebouwgeometrie
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De gebouwgeometrie voor het gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' ontbreekt.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '5' AND NOT EXISTS(SELECT NULL FROM wdb.tblgebouwgeometrie_opl WHERE terreinobjectid = t1.terreinobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De geldigheidsperiode van het terreinobject overlapt met de geldigheidsperiode van een ander terreinobject met dezelfde identificerende kenmerken.'
    FROM wdb.tblterreinobject_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid <> t1.terreinobjectid 
    AND identificatorterreinobject = t1.identificatorterreinobject
    AND aardterreinobjectcode = t1.aardterreinobjectcode
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De beginorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE beginorganisatie NOT IN ('1', '3', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De eindorganisatie van het terreinobject moet ofwel 1 (gemeente) ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '3', '5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De beginorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '1' AND beginorganisatie NOT IN ('3', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De eindorganisatie van het terreinobject met aard 1 (kadastraal perceel) moet ofwel 3 (AAPD) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '1' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('3', '5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De beginorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode IN ('2', '3', '4') AND beginorganisatie NOT IN ('5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De eindorganisatie van het terreinobject met aard 2 (GRB gebouw) of aard 3 (GRB kunstwerk) of aard 4 (GRB administratief perceel) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode IN ('2', '3', '4') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De beginorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '5' AND beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'terreinobject', terreinobjectid, begintijd, 'De eindorganisatie van het terreinobject met aard 5 (gebouw volgens de gemeente) moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblterreinobject_opl t1
    WHERE aardterreinobjectcode = '5' AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
	
/*gebouwstatussen*/
	--PK_gebouwstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'De betekenisloze sleutel van de actuele gebouwstatus is niet uniek.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT gebouwstatusid FROM wdb.tblgebouwstatus_opl t2 WHERE eindtijd IS NULL AND t1.gebouwstatusid = t2.gebouwstatusid GROUP BY gebouwstatusid HAVING COUNT(*) > 1 )
	--UK_gebouwstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'De combinatie van identificerende velden van de actuele gebouwstatus is niet uniek.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT terreinobjectid, begindatum FROM wdb.tblgebouwstatus_opl t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 )
	--FK_gebouwstatus_terreinobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'Gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblterreinobject_opl WHERE terreinobjectid = t1.terreinobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'De geldigheidsperiode van de gebouwstatus overlapt met de geldigheidsperiode van een andere gebouwstatus met dezelfde identificerende kenmerken.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblgebouwstatus_opl WHERE eindtijd IS NULL AND gebouwstatusid <> t1.gebouwstatusid 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'Begindatum van de gebouwstatus moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'Einddatum van de gebouwstatus moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'De beginorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwstatus', gebouwstatusid, begintijd, 'De eindorganisatie van de gebouwstatus moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblgebouwstatus_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')

/*gebouwgeometrien*/
	--PK_gebouwstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'De betekenisloze sleutel van de actuele gebouwgeometrie is niet uniek.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT gebouwgeometrieid FROM wdb.tblgebouwgeometrie_opl t2 WHERE eindtijd IS NULL AND t1.gebouwgeometrieid = t2.gebouwgeometrieid GROUP BY gebouwgeometrieid HAVING COUNT(*) > 1 )
	--UK_gebouwstatus_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'De combinatie van identificerende velden van de actuele gebouwgeometrie is niet uniek.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT terreinobjectid, begindatum FROM wdb.tblgebouwgeometrie_opl t2 WHERE eindtijd IS NULL AND t1.terreinobjectid = t2.terreinobjectid AND t1.begindatum = t2.begindatum GROUP BY terreinobjectid, begindatum HAVING COUNT(*) > 1 )
	--FK_gebouwstatus_terreinobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'Gebouw met id ' + CAST(terreinobjectid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblterreinobject_opl WHERE terreinobjectid = t1.terreinobjectid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'De geldigheidsperiode van de gebouwgeometrie overlapt met de geldigheidsperiode van een andere gebouwgeometrie met dezelfde identificerende kenmerken.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblgebouwgeometrie_opl WHERE eindtijd IS NULL AND gebouwgeometrieid <> t1.gebouwgeometrieid 
    AND terreinobjectid = t1.terreinobjectid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'Begindatum van de gebouwgeometrie moet groter of gelijk zijn aan begindatum van het gerelateerde gebouw.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'Einddatum van de gebouwgeometrie moet kleiner of gelijk zijn aan einddatum van het gerelateerde gebouw.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblterreinobject_opl WHERE eindtijd IS NULL AND terreinobjectid = t1.terreinobjectid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'De beginorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'gebouwgeometrie', gebouwgeometrieid, begintijd, 'De eindorganisatie van de gebouwgeometrie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tblgebouwgeometrie_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')

/*rradresssen*/
	--PK_rradres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rradres', rradresid, begintijd, 'De betekenisloze sleutel van het actuele rradres is niet uniek.'
    FROM wdb.tblrradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT rradresid FROM wdb.tblrradres_opl t2 WHERE eindtijd IS NULL AND t1.rradresid = t2.rradresid GROUP BY rradresid HAVING COUNT(*) > 1 )
	--UK_rradres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rradres', rradresid, begintijd, 'De combinatie van identificerende velden van het actuele rradres is niet uniek.'
    FROM wdb.tblrradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT rrhuisnummer, rrindex, substraatid, begindatum FROM wdb.tblrradres_opl t2 WHERE eindtijd IS NULL AND t1.rrhuisnummer = t2.rrhuisnummer AND t1.rrindex = t2.rrindex AND t1.substraatid = t2.substraatid AND t1.begindatum = t2.begindatum GROUP BY rrhuisnummer, rrindex, substraatid, begindatum HAVING COUNT(*) > 1 )
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rradres', rradresid, begintijd, 'De geldigheidsperiode van het rradres overlapt met de geldigheidsperiode van een ander rradres met dezelfde identificerende kenmerken.'
    FROM wdb.tblrradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblrradres_opl WHERE eindtijd IS NULL AND rradresid <> t1.rradresid 
    AND rrhuisnummer = t1.rrhuisnummer
    AND ISNULL(rrindex,'') = ISNULL(t1.rrindex,'')
    AND substraatid = t1.substraatid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rradres', rradresid, begintijd, 'De beginorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
    FROM wdb.tblrradres_opl t1
    WHERE beginorganisatie NOT IN ('1', '2', '9', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'rradres', rradresid, begintijd, 'De eindorganisatie van het rradres moet ofwel 1 (gemeente) ofwel 2 (rijksregister) ofwel 9 (VKBO) ofwel 99 (andere) zijn.'
    FROM wdb.tblrradres_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '2', '9', '99')

/*adres-rradres relaties*/
	--PK_adres_rradres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'De betekenisloze sleutel van de actuele adres-rradres relatie is niet uniek.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT adres_rradres_id FROM wdb.tbladres_rradres_opl t2 WHERE eindtijd IS NULL AND t1.adres_rradres_id = t2.adres_rradres_id GROUP BY adres_rradres_id HAVING COUNT(*) > 1 )
	--UK_adres_rradres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'De combinatie van identificerende velden van de actuele adres-rradres relatie is niet uniek.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT rradresid, adresid, aardadres, begindatum FROM wdb.tbladres_rradres_opl t2 WHERE eindtijd IS NULL AND t1.rradresid = t2.rradresid AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY rradresid, adresid, aardadres, begindatum HAVING COUNT(*) > 1 )
	--FK_adresrradres_rradres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Rijksregisteradresid ' + CAST(rradresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblrradres_opl WHERE rradresid = t1.rradresid)
	--FK_adresrradres_crabadres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM wdb.tblsubadres_opl WHERE subadresid = t1.adresid)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.adresid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'De geldigheidsperiode van de adres-rradres relatie overlapt met de geldigheidsperiode van een andere adres-rradres relatie met dezelfde identificerende kenmerken.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tbladres_rradres_opl WHERE eindtijd IS NULL AND adres_rradres_id <> t1.adres_rradres_id 
    AND rradresid = t1.rradresid
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde rradres.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblrradres_opl WHERE eindtijd IS NULL AND rradresid = t1.rradresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde rradres.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblrradres_opl WHERE eindtijd IS NULL AND rradresid = t1.rradresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Begindatum van de adres-rradres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'Einddatum van de adres-rradres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'De beginorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresRrAdres', adres_rradres_id, begintijd, 'De eindorganisatie van de adres-rradres relatie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladres_rradres_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
	
/*kadadressen*/
	--PK_kadadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'kadadres', kadadresid, begintijd, 'De betekenisloze sleutel van het actuele kadadres is niet uniek.'
    FROM wdb.tblkadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT kadadresid FROM wdb.tblkadadres_opl t2 WHERE eindtijd IS NULL AND t1.kadadresid = t2.kadadresid GROUP BY kadadresid HAVING COUNT(*) > 1 )
	--UK_kadadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'kadadres', kadadresid, begintijd, 'De combinatie van identificerende velden van het actuele kadadres is niet uniek.'
    FROM wdb.tblkadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT kadhuisnummer, kadstraatnaamcodeid, begindatum FROM wdb.tblkadadres_opl t2 WHERE eindtijd IS NULL AND t1.kadhuisnummer = t2.kadhuisnummer AND t1.kadstraatnaamcodeid = t2.kadstraatnaamcodeid AND t1.begindatum = t2.begindatum GROUP BY kadhuisnummer, kadstraatnaamcodeid, begindatum HAVING COUNT(*) > 1 )
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'kadadres', kadadresid, begintijd, 'De geldigheidsperiode van het kadadres overlapt met de geldigheidsperiode van een ander kadadres met dezelfde identificerende kenmerken.'
    FROM wdb.tblkadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tblkadadres_opl WHERE eindtijd IS NULL AND kadadresid <> t1.kadadresid 
    AND kadhuisnummer = t1.kadhuisnummer
    AND kadstraatnaamcodeid = t1.kadstraatnaamcodeid
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'kadadres', kadadresid, begintijd, 'De beginorganisatie van het kadadres moet ofwel 3 (AAPD) ofwel 99 (andere) zijn.'
    FROM wdb.tblkadadres_opl t1
    WHERE beginorganisatie NOT IN ('3', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'kadadres', kadadresid, begintijd, 'De eindorganisatie van het kadadres moet ofwel 3 (AAPD) ofwel 99 (andere) zijn.'
    FROM wdb.tblkadadres_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('3', '99')
    
/*adres-kadadres relaties*/
	--PK_adres_kadadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'De betekenisloze sleutel van de actuele adres-kadadres relatie is niet uniek.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT adres_kadadres_id FROM wdb.tbladres_kadadres_opl t2 WHERE eindtijd IS NULL AND t1.adres_kadadres_id = t2.adres_kadadres_id GROUP BY adres_kadadres_id HAVING COUNT(*) > 1 )
	--UK_adres_kadadres_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'De combinatie van identificerende velden van de actuele adres-kadadres relatie is niet uniek.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT kadadresid, adresid, aardadres, begindatum FROM wdb.tbladres_kadadres_opl t2 WHERE eindtijd IS NULL AND t1.kadadresid = t2.kadadresid AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY kadadresid, adresid, aardadres, begindatum HAVING COUNT(*) > 1 )
	--FK_adreskadadres_kadadres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Kadadresid ' + CAST(kadadresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE NOT EXISTS(SELECT NULL FROM wdb.tblkadadres_opl WHERE kadadresid = t1.kadadresid)
	--FK_adreskadadres_crabadres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM wdb.tblsubadres_opl WHERE subadresid = t1.adresid)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.adresid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'De geldigheidsperiode van de adres-kadadres relatie overlapt met de geldigheidsperiode van een andere adres-kadadres relatie met dezelfde identificerende kenmerken.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tbladres_kadadres_opl WHERE eindtijd IS NULL AND adres_kadadres_id <> t1.adres_kadadres_id 
    AND kadadresid = t1.kadadresid
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde kadadres.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblkadadres_opl WHERE eindtijd IS NULL AND kadadresid = t1.kadadresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde kadadres.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT NULL FROM wdb.tblkadadres_opl WHERE eindtijd IS NULL AND kadadresid = t1.kadadresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Begindatum van de adres-kadadres relatie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'Einddatum van de adres-kadadres relatie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'De beginorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE beginorganisatie NOT IN ('5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adresKadAdres', adres_kadadres_id, begintijd, 'De eindorganisatie van de adres-kadadres relatie moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladres_kadadres_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99')
    
/*adresposities*/
	--PK_adrespositie_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De betekenisloze sleutel van de actuele adrespositie is niet uniek.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT adrespositieid FROM wdb.tbladrespositie_opl t2 WHERE eindtijd IS NULL AND t1.adrespositieid = t2.adrespositieid GROUP BY adrespositieid HAVING COUNT(*) > 1 )
	--UK_adrespositie_act
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De combinatie van identificerende velden van de actuele adrespositie is niet uniek.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND EXISTS
    (SELECT herkomstadrespositie, adresid, aardadres, begindatum FROM wdb.tbladrespositie_opl t2 WHERE eindtijd IS NULL AND t1.herkomstadrespositie = t2.herkomstadrespositie AND t1.adresid = t2.adresid AND t1.aardadres = t2.aardadres AND t1.begindatum = t2.begindatum GROUP BY herkomstadrespositie, adresid, aardadres, begindatum HAVING COUNT(*) > 1 )
	--FK_adrespositie_crabadres
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Subadresid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladrespositie_opl t1
    WHERE aardadres = '1' AND NOT EXISTS(SELECT NULL FROM wdb.tblsubadres_opl WHERE subadresid = t1.adresid)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Huisnummerid ' + CAST(adresid AS VARCHAR) + ' bestaat niet.'
    FROM wdb.tbladrespositie_opl t1
    WHERE aardadres = '2' AND NOT EXISTS(SELECT NULL FROM wdb.tblhuisnummer_opl WHERE huisnummerid = t1.adresid)
	--interne temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De geldigheidsperiode van de adrespositie overlapt met de geldigheidsperiode van een andere adrespositie met dezelfde identificerende kenmerken.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND EXISTS(SELECT NULL FROM wdb.tbladrespositie_opl WHERE eindtijd IS NULL AND adrespositieid <> t1.adrespositieid 
    AND herkomstadrespositie = t1.herkomstadrespositie
    AND adresid = t1.adresid
    AND aardadres = t1.aardadres
    AND begindatum <= ISNULL(t1.einddatum, '99990101') AND ISNULL(einddatum, '99990101') >= t1.begindatum)
	--externe temporele integriteit
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde subadres.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde subadres.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND aardadres = '1' AND EXISTS
    (SELECT NULL FROM wdb.tblsubadres_opl WHERE eindtijd IS NULL AND subadresid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Begindatum van de adrespositie moet groter of gelijk zijn aan begindatum van het gerelateerde huisnummer.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND begindatum > t1.begindatum)
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'Einddatum van de adrespositie moet kleiner of gelijk zijn aan einddatum van het gerelateerde huisnummer.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindtijd IS NULL AND aardadres = '2' AND EXISTS
    (SELECT NULL FROM wdb.tblhuisnummer_opl WHERE eindtijd IS NULL AND huisnummerid = t1.adresid AND ISNULL(einddatum, '99990101') < ISNULL(t1.einddatum, '99990101'))
	--beperking organisatiecode
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De beginorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE beginorganisatie NOT IN ('1', '5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De eindorganisatie van de adrespositie moet ofwel 1 (gemeente) ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '5', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De beginorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND beginorganisatie NOT IN ('1', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De eindorganisatie van de adrespositie met manuele aanduiding moet ofwel 1 (gemeente) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE herkomstadrespositie IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('1', '99')
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De beginorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') AND beginorganisatie NOT IN ('5', '99')
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, begintijd, 'De eindorganisatie van de adrespositie met herkomst andere dan manuele aanduiding moet ofwel 5 (AGIV) ofwel 99 (andere) zijn.'
    FROM wdb.tbladrespositie_opl t1
    WHERE herkomstadrespositie IN ('10', '11', '12', '13', '14', '15', '16', '17', '18') AND eindorganisatie IS NOT NULL and eindorganisatie NOT IN ('5', '99')
	--beperking voorkomen ifv koppeling aan terreinobject
	INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, t1.begintijd, 'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM wdb.tbladrespositie_opl t1
    INNER JOIN wdb.tblhuisnummerstatus_opl t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie IN ('3', '7') AND t2.huisnummerstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM wdb.tblterreinobject_huisnummer_opl t3 INNER JOIN wdb.tblterreinobject_opl t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobjectcode IN ('2','5'))
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, t1.begintijd, 'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 3 (manuele aanduiding van gebouw) of 7 (manuele aanduiding van ingang van gebouw) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 2 (GRB gebouw) of aard 5 (gebouw volgens de gemeente).'
    FROM wdb.tbladrespositie_opl t1
    INNER JOIN wdb.tblsubadresstatus_opl t2 ON t1.adresid = t2.subadresid
    INNER JOIN wdb.tblsubadres_opl t5 ON t2.subadresid = t5.subadresid
    WHERE t1.aardadres = '1' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie IN ('3', '7') AND t2.subadresstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM wdb.tblterreinobject_huisnummer_opl t3 INNER JOIN wdb.tblterreinobject_opl t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t5.huisnummerid AND t4.aardterreinobjectcode IN ('2','5'))
    
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, t1.begintijd, 'Een huisnummer met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM wdb.tbladrespositie_opl t1
    INNER JOIN wdb.tblhuisnummerstatus_opl t2 ON t1.adresid = t2.huisnummerid
    WHERE t1.aardadres = '2' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie = '2' AND t2.huisnummerstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM wdb.tblterreinobject_huisnummer_opl t3 INNER JOIN wdb.tblterreinobject_opl t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t1.adresid AND t4.aardterreinobjectcode IN ('1','4'))
    INSERT INTO @validatiefouten (objecttype,id,begintijd,boodschap)
    SELECT 'adrespositie', adrespositieid, t1.begintijd, 'Een subadres met status 3 (in gebruik) kan enkel dan een relatie hebben met een adrespositie met herkomst 2 (manuele aanduiding van perceel) indien het gerelateerde huisnummer eveneens een relatie heeft met een terreinobject met aard 1 (kadastraal perceel) of aard 4 (GRB administratief perceel).'
    FROM wdb.tbladrespositie_opl t1
    INNER JOIN wdb.tblsubadresstatus_opl t2 ON t1.adresid = t2.subadresid
    INNER JOIN wdb.tblsubadres_opl t5 ON t2.subadresid = t5.subadresid
    WHERE t1.aardadres = '1' AND t1.eindtijd IS NULL AND t1.herkomstadrespositie = '2' AND t2.subadresstatus = '3' AND NOT EXISTS(
    SELECT NULL FROM wdb.tblterreinobject_huisnummer_opl t3 INNER JOIN wdb.tblterreinobject_opl t4 ON t3.terreinobjectid = t4.terreinobjectid WHERE t3.huisnummerid = t5.huisnummerid AND t4.aardterreinobjectcode IN ('1','4'))

GO


