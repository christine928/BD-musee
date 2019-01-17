LOAD DATA INFILE *
APPEND
INTO TABLE VendTickets
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDticket,
	IDtarif,
	IDmusee,
	dateVente,
	dateVisite,	
	codePostal
)

BEGINDATA
