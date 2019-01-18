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

0;2;1;150;"kg";1.50;2.25;4;5;30;130000;5;15;"sculpture";"mausolee familial pour les valerius rufus";;to_date('01-01-01','DD-MM-YYYY');to_date('01-01-101','DD-MM-YYYY');"tombe";;300
0;3;1;10;"g";0.03;0.10;0.05;10;27;110000;3;12;"autres";"pipe";;to_date('22-07-1923','DD-MM-YYYY');to_date('22-07-1923','DD-MM-YYYY');;;100
0;4;1;500;"kg";0.4;0.4;3;0;30;100000;2;2;"sculpture";"colonne romane";;to_date('01-01-1118','DD-MM-YY');to_date('01-01-1125','DD-MM-YYYY');"floral";"roman";200
0;5;1;50;"g";0.01;0.2;0.02;0;30;100000;to_date('01-01-1900','DD-MM-YYYY');to_date('01-01-2000','DD-MM-YYYY');;;40
0;6;1;10;"g";0.07:0.1;0.03;0;30;130000;1;1;"autres";"tire-bouchon enroule";;to_date('01-01-1900','DD-MM-YYYY');to_date('01-01-2000','DD-MM-YYYY');"vin";;10
0;7;1;5;"g";0.001;0.03;0.03;10;30;130000;1;4;"autres";"monocle";;to_date('01-01-1800','DD-MM-YYYY');to_date('01-01-1900','DD-MM-YYYY');"lunettes";;50
0;8;1;2;"kg";0.03;25.9;35.8;15;25;50000;14;10;"peinture";"portrait d andre breton";"fredinand desnos";to_date('01-01-1954','DD-MM-YYYY');to_date('31-12-1954', 'DD-MM-YYYY');"portrait";"art naif";-1
0;10;1;75;"kg";0.4;4;3;0;30;120000;7;15;"maquette";"maquette du voilier X23-86";;to_date('01-01-2005','DD-MM-YYYY');to_date('01-05-2009','DD-MM-YYYY');"maquette bateaux";;600
0;11;1;3;"g";0.01;0.015;0.013;0;35;130000;3;5;"bijoux";"bague sertie grenat";;to_date('01-01-1800','DD-MM-YYYY');to_date('01-01-1900','DD-MM-YYYY');;;100
0;12;1;750;"g";0.2;0.6;0.8;10;20;20000;1;10;"autres";"aigle royal empaille";;to_date('01-01-2005','DD-MM-YYYY');to_date('01-01-2006','DD-MM-YYYY');"animal oiseau empaille";;30
0;13;1;3;"kg";0.5;0.5;0.7;10;20;75000;5;18;"sculpture";"escalier a dessous coulissant";"Agricol Perdiguier";to_date('01-01-1825','DD-MM-YYYY');to_date('01-01-1826','DD-MM-YYYY');"escaliers bois";;1300
0;14;1;750;"kg";3;20;15;0;35;130000;5;13;"autres";"dragon d or aux 6 tetes";"Michell et Jean-Pierre Hartmann";to_date('01-01-1998','DD-MM-YYYY');to_date('01-01-1998','DD-MM-YYYY');"magie dragon";;-1
0;15;1;150;"g";0.03;0.3;0.15;0;30;120000;2;3;"autres";"trousse de barbier";;to_date('01-01-1801','DD-MM-YYYY');to_date('01-01-1901','DD-MM-YYYY');"trousse barbier";;35
0;18;1;200;"g";0.03;0.8;0.05;15;25;100000;2;15;"maquette";"maquette de train";;to_date('01-01-1990','DD-MM-YYYY');to_date('01-01-2010','DD-MM-YYYY');"train";;50
0;19;1;0.5;"mg";0.0001;0.02;0.04;0;35;75000;1;1;"autres";"timbre pays";;to_date('01-01-1990','DD-MM-YYYY');to_date('01-01-1990','DD-MM-YYYY');"timbre";;3
0;20;1;35;"kg";0.35;0.35;1;0;35;130000;5;5;"sculpture";"La Danseuse Sacha-Lyo";"Serge Yourievitch";to_date('01-01-1933','DD-MM-YYYY');to_date('01-01-1933','DD-MM-YYYY');"danse";;5000
0;22;1;5;"kg";0.05;1.65;2.35;75000;14;13;"peinture";"La meule";"Edouard Vuillard";to_date('01-01-1907','DD-MM-YYYY');to_date('01-01-1908','DD-MM-YYYY');"champs";;10000

0;269054958815780;0;4;"kg";0.0009;0.6;1;15;25;50000;12;14;"peinture";"le phoenix blanc";"kamisaka sekka";to_date('01-01-1500','DD-MM-YYYY');to_date('01-01-1600','DD-MM-YYYY');"phoenix japon";;25000
0;154678908764332;0;50;"g";0.0009;0.5;0.5;5;30;85000;1;2;"peinture";"einstein";"dadao";to_date('01-01-2000','DD-MM-YYYY');to_date('01-01-2001','DD-MM-YYYY');"einstein";"pop art";300
0;144667907346789;0;4;"kg";0.02;0.92;0.74;17;23;50000;17;13;"peinture";"la nuit etoilee";"van gogh";to_date('01-06-1889','DD-MM-YYYY');to_date('30-06-1889','DD-MM-YYYY');"nuit etoile";;500000
0;256753534554765;0;50;"g";0.001;0.24;0.33;5;30;85000;16;12;"peinture";"la persistance de la memoire";"salvador dali";to_date('01-01-1932','DD-MM-YYYY');to_date('01-01-1933','DD-MM-YYYY');"montre temps";"surrealiste";300000




