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
0;1;NULL;"Conservateur";11000;"Arzal";"5 rue d Uzes";"75002";"Paris"
0;1;1;"Chef departement egypte";7500;"Malzac";"21 rue Violet";"75015";"Paris"
0;1;1;"Chef departement romain";7500;"Cosnier";"9 rue Saint Charles";"75015";"Paris"
0;1;1;"Charge de logistique";'4000;"Goeury";"7 rue Moliere";"94200";"Ivry sur Seine"
0;1;1;"Manager";3500;"Rizon";"17 rue Vivianne";"91160";"Antony"
0;1;5;"Agent d'acceuil";800;"Tizon";"2 rue Velpeau";"91160";"Antony"
0;1;5;"Agent securite";900;"Goby";"4 rue des bretons";"94700";"Maison Alford"
0;2;NULL;"Conservateur";9000;"Auriaud";"11 avenue Leon Dacheux";"67100";"Strasbourg"
0;2;8;"Chef departement outil";5500;"Callec";"8 rue des acacias";"67540";"Ostwald"
0;2;8;"


 
