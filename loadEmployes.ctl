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
0;1;;"Conservateur";11000;"Arzal";"5 rue d Uzes";"75002";"Paris"
0;1;1;"Chef departement egypte";7500;"Malzac";"21 rue Violet";"75015";"Paris"
0;1;1;"Chef departement romain";7500;"Cosnier";"9 rue Saint Charles";"75015";"Paris"
0;1;1;"Charge de logistique";4000;"Goeury";"7 rue Moliere";"94200";"Ivry sur Seine"
0;1;1;"Manager";3500;"Rizon";"17 rue Vivianne";"91160";"Antony"
0;1;5;"Agent d'acceuil";800;"Tizon";"2 rue Velpeau";"91160";"Antony"
0;1;5;"Agent securite";900;"Goby";"4 rue des bretons";"94700";"Maison Alford"
0;2;;"Conservateur";9000;"Auriaud";"11 avenue Leon Dacheux";"67100";"Strasbourg"
0;2;8;"Chef departement outil";5500;"Callec";"8 rue des acacias";"67540";"Ostwald"
0;2;8;"Manager";3300;"Klein";"15 chemin Oberweg";"67450";"Lamperthein"
0;2;9;"Guide";1750;"Kesler";"3 rue Frolen";"67118";"Geispolsheim" 
0;3;;"Conservateur";7000;"Juhel";"5 rue Jacques Prévert";"24130";"Prigonrieux"
0;5;;"Conservateur";7000;"Brisset";"6 allee Grand Pre";"63190";"Saint Jean d Heurs"
0;6;;"Conservateur";8000;"Ruel";"6 rue des Bidaudese";"21190";"Nantoux"
0;7;;"Conservateur";8000;"Soulie";"12 Rue de la République";"36170";"Vigoux"
0;8;;"Conservateur";8100;"Faye";"1 chemin Saint Gratien";"06360";"Eze"
0;9;;"Conservateur";8100;"Ledru";"7 route de Lainsecq";"89520";"Thury" 
