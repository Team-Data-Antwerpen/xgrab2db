SELECT validatiefouten.objecttype, validatiefouten.boodschap, RRSTRAATCODE
FROM validatiefouten
LEFT JOIN RRADRESSEN 
ON validatiefouten.id = RRADRESSEN.ID
WHERE validatiefouten.objecttype = "rradres" 