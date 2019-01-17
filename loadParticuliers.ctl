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
269054958815780;"Durand";"2 rue de la Biscuiterie";"44000";"Nantes";"0228236598"
134646799578535;"Dumont";"Le Gouffre";"46500";"Padirac";"0553068723"
158901256742346;"Chambrier";"4 rue de la Cure";"49170";"Savennières";"0224368996"
246639052136908;"Brunet";"2 rue de la mairie";"88150";"Oncourt";"0374368976"
153465787647883;"Feraud";"72 Faubourg Staint Martin";"75010";"Paris";"0154396523"
156753680854322;"Lejoindre";"1 place Jule Joffrin";"75018";;"Paris";"0135675356"
255646586809084;"Tribout";"1 place de Beauvoir";"60120";"Beauvoir";"0376235437"
264345678964347;"Cabanes";" 8 rue lacan";"15150";"Arnac";"0542456598"
163689523453565;"Deschamps"; "5 place de la mairie";"33210";"Sauternes";"0536894322"
144667907346789;"Danony";"3 place du bourg";"19170";"Lacelle";"062574690"
256753534554765;"Carriere";"7 place de la mairie";"09120";"Cazaux";"0556788836"
154678908764332;"Commandre";"10 rue des Apiès";"48150";"Meyrueis";"0475368945"
214353656757697;"Soulier";"Place du vilage";"48120";"Lajo";"0785938592"*
267889656546345;"1 place Francois Mitterrand";"58140";"Lormes";"0395940464"
143543654768687;"Place de l Eglise";"69220";"Cercie";"0464735647"




