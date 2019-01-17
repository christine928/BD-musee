LOAD DATA INFILE *
APPEND
INTO TABLE Particuliers 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDparticulier,
	nom,	
	adresse,	
	codePostal,
	ville,
	telephone
)

BEGINDATA
111111111111111;"Dupond";"8 allée des coquelicots";"91630";"Marolles-en-Hurepoix";"0677453256"
