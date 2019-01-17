LOAD DATA INFILE *
APPEND
INTO TABLE Emprunte 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	IDoeuvre,
	IDmusee,
	dateEmprunt,,
	dateRetour,
	prix,	
)

BEGINDATA
