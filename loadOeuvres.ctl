LOAD DATA INFILE *
APPEND
INTO TABLE Oeuvres 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDoeuvre,	
	IDappartient,
	source,
	poids,
	unitePoids,
	largeur,	
	longueur,
	hauteur,
	temperatureMin,
	temperatureMAx
	luminositeMax,
	securite,
	fragilite,
	type,
	nom,	
	aritste,
	dateCreationDebut,
	dateCreationFin,
	theme,
	mouvement,
	valeur
)

BEGIN DATA
