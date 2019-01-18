LOAD DATA INFILE *
APPEND
INTO TABLE Oeuvres 
FIELDS TERMINATED BY ";" OPTIONALLY ENCLOSED BY '"'
(  	
	IDoeuvre,	
	IDappartient,
	source,
	poids,
	unitePoids,
	largeur,	
	longueur,
	hauteur,
	temperatureMin,
	temperatureMAx,
	luminositeMax,
	securite,
	fragilite,
	type,
	nom,	
	artiste,
	dateCreationDebut DATE 'DD-MM-YYYY',
	dateCreationFin DATE 'DD-MM-YYYY',
	theme,
	mouvement,
	valeur
)

BEGINDATA
0;2;1;150;"kg";1.50;2.25;4;5;30;130000;5;15;"sculpture;mausolee familial pour les valerius rufus";;01-01-0001;01-01-0101;"tombe";;300
0;3;1;10;"g";0.03;0.10;0.05;10;27;110000;3;12;"autres";"pipe";;22-07-1923;22-07-1923;;;100
0;4;1;500;"kg";0.4;0.4;3;0;30;100000;2;2;"sculpture";"colonne romane";;01-01-1118;01-01-1125;"floral";"roman";200
0;5;1;50;"g";0.01;0.1;0.2;0;30;100000;9;7;"autres";;;01-01-1900;01-01-2000;;;40
0;6;1;10;"g";0.07;0.03;0.01;0;30;130000;1;1;"autres";"tire-bouchon enroule";;01-01-2000;01-01-2000;;"vin";10
0;7;1;5;"g";0.001;0.03;0.03;10;30;130000;1;4;"autres";"monocle";;01-01-1800;01-01-1900;"lunettes";;50
0;8;1;2;"kg";0.03;25.9;35.8;15;25;50000;14;10;"peinture";"portrait d andre breton";"fredinand desnos";01-01-1954;31-12-1954;"portrait";"art naif";-1
0;10;1;75;"kg";0.4;4;3;0;30;120000;7;15;"maquette";"maquette du voilier X23-86";;01-01-2005;01-05-2009;"maquette bateaux";;600
0;11;1;3;"g";0.01;0.015;0.013;0;35;130000;3;5;"bijoux";"bague sertie grenat";;01-01-1800;01-01-1900;;;100
0;12;1;750;"g";0.2;0.6;0.8;10;20;20000;1;10;"autres";"aigle royal empaille";;01-01-2005;01-01-2006;"animal oiseau empaille";;30
0;13;1;3;"kg";0.5;0.5;0.7;10;20;75000;5;18;"sculpture";"escalier a dessous coulissant";"Agricol Perdiguier";01-01-1825;01-01-1826;"escaliers bois";;1300
0;14;1;750;"kg";3;20;15;0;35;130000;5;13;"autres";"dragon d or aux 6 tetes;Michell et Jean-Pierre Hartmann";01-01-1998;01-01-1998;"magie dragon";;-1
0;15;1;150;"g";0.03;0.3;0.15;0;30;120000;2;3;"autres";"trousse de barbier";;01-01-1801;01-01-1901;"trousse barbier";;35
0;18;1;200;"g";0.03;0.8;0.05;15;25;100000;2;15;"maquette";"maquette de train";;01-01-1990;01-01-2010;"train";;50
0;19;1;0.5;"mg";0.001;0.02;0.04;0;35;75000;1;1;"autres";"timbre pays";;01-01-1990;01-01-1990;"timbre";;3
0;20;1;35;"kg";0.35;0.35;1;0;35;130000;5;5;"sculpture";"La Danseuse Sacha-Lyo";"Serge Yourievitch";01-01-1933;01-01-1933;"danse";;50000
0;22;1;5;"kg";0.05;1.65;2.35;0;35;75000;14;13;"peinture";"La meule";"Edouard Vuillard";01-01-1907;02-01-1933;"danse";;10000
0;269054958815780;0;4;"kg";0.0009;0.6;1;15;25;50000;12;14;"peinture";"le phoenix blanc";"kamisaka sekka";01-01-1500;03-01-1933;"phoenix japon";;25000
0;154678908764332;0;50;"g";0.0009;0.5;0.5;5;30;85000;1;2;"peinture";"einstein";"dadao";01-01-1933;04-01-1933;"einstein";"pop art";300
0;144667907346789;0;4;"kg";0.02;0.92;0.74;17;23;50000;17;13;"peinture";"la nuit etoilee";"van gogh";01-06-1889;05-01-1933;"nuit etoile";;500000
0;256753534554765;0;50;"g";0.001;0.24;0.33;5;30;85000;16;12;"peinture";"la persistance de la memoire";"salvador dali";01-01-1932;06-01-1933;"montre temps";"surrealiste";300000
