SELECT  validatieid, "objecttype", "id", "BEGINTIJD", "boodschap", COUNT (*)
FROM "validatiefouten"
GROUP BY boodschap 