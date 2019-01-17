LOAD DATA INFILE *
APPEND
INTO TABLE Musees 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDmusee,
	nom,	
	adresse,	
	codePostal,
	ville,
	telephone, 
	transport,
	temperatureMin,
	temperatureMAx
	luminositeMax,
	securite
)

BEGINDATA
1;"Louvre";"Rue de Rivoli";"75001";"Paris";"0140205050";20;1;10;130000;20
