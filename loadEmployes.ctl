LOAD DATA INFILE *
APPEND
INTO TABLE Employes 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDemploye,
	IDmusee,
	IDchef,
	fonction,
	salaire,
	nom,	
	adresse,	
	codePostal,
	ville
)

BEGINDATA
