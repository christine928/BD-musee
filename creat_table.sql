CREATE TABLE Particuliers( 
	IDparticulier number(15) CONSTRAINT pkParticuliers PRIMARY KEY,
	nom varchar(25) not null,
	adresse varchar(50) not null,
	codePostal varchar(5) not null,
	ville varchar(25),
	telephone varchar(12),
CONSTRAINT checkPartiTel CHECK (length(telephone)=10 OR length(telephone)=12 OR telephone is null),
CONSTRAINT checkPartiCodePostal CHECK (length(codePostal)=5)
);

CREATE TABLE Tarifs( 
	IDtarif integer CONSTRAINT pkTarifs PRIMARY KEY,
	cible varchar(25) not null,
	prix number(5,2) not null
CONSTRAINT checkPrix CHECK (prix >= 0)
);

CREATE TABLE Musees(
	IDmusee integer CONSTRAINT pkMusee PRIMARY KEY,
	nom varchar(50) not null,
	adresse varchar(50) not null,
	codePostal varchar(5) not null,
	ville varchar(25) not null,
	telephone varchar(12),
	transport number(2),
	temperatureMin number(3),
	temperatureMax number(3),
	luminositeMax number(6),
	securite number (2),
CONSTRAINT checkMuseeTel CHECK (length(telephone)=10 OR length(telephone)=12 OR telephone is null),
CONSTRAINT checkMuseeCodePostal CHECK (length(codePostal)=5),
CONSTRAINT checkMuseeTransport CHECK (transport BETWEEN 0 AND 20),--note sur 20 en fonctin de critères (...)
CONSTRAINT checkMuseeTempMin CHECK ((temperatureMin < temperatureMax) AND (temperatureMin > 0)),
CONSTRAINT checkMuseeTempMax CHECK ((temperatureMax > temperatureMin) AND (temperatureMax < 40)),
CONSTRAINT checkMuseeLuminosite CHECK (luminositeMax BETWEEN 150 AND 130000), --150lux est la limite de luminosité pour lire et 130 000 lux correspond à la luminosité d'une journée ensoleillée d'été
CONSTRAINT checkSecurite CHECK (securite BETWEEN 0 AND 20)
);

CREATE TABLE VendTickets( 
	IDticket integer CONSTRAINT pkVendTickets PRIMARY KEY,
	IDtarif integer CONSTRAINT fkTarifs REFERENCES Tarifs(IDtarif),
	IDmusee integer CONSTRAINT fkMusees REFERENCES Musees(IDmusee),
 	dateVente date not null,
	dateVisite date not null,
	codePostal varchar(5) not null,
CONSTRAINT dateVisite CHECK (dateVisite >= dateVente),
CONSTRAINT codePostal CHECK (length(codePostal)=5)
);

CREATE TABLE Employes (
	IDemploye integer CONSTRAINT pkEmployes PRIMARY KEY, 
	IDmusee integer CONSTRAINT fkMusees2 REFERENCES Musees(IDmusee) not null, 
	IDchef integer CONSTRAINT fkEmployes REFERENCES Employes(IDemploye),
	fonction varchar(20) not null,
	salaire float not null,
	nom varchar(25),
	adresse varchar(50) not null,
	codePostal varchar(5) not null,
	ville varchar(25),
CONSTRAINT checkEmployesSalaire CHECK (salaire >= 0),
CONSTRAINT checkEmplyesCodePostal CHECK (length(codePostal)=5) );

CREATE TABLE Oeuvres (
	IDoeuvre integer CONSTRAINT pkOeuvre PRIMARY KEY not null,
	IDappartient integer not null,
	source number(1) CONSTRAINT constOeuvreBoolean CHECK (source in (0, 1)) not null, -- 0 pour les particuliers et 1 pour les musées
	poids number(5,2) CONSTRAINT constOeuvrePoids CHECK (poids >=0)not null, 
	unitePoids varchar(2) CONSTRAINT constOeuvreUnitePoids CHECK (unitePoids in ('t', 'kg', 'g', 'mg'))not null,
	largeur number(5,2) CONSTRAINT constOeuvrelarg CHECK (largeur>0)not null,
	longueur number(5,2) CONSTRAINT constOeuvrelong CHECK (longueur>0)not null, 
	hauteur number(5,2) CONSTRAINT constOeuvrehaut CHECK (hauteur>0) not null, 
	temperatureMin number(3) CONSTRAINT constOeuvreTempMin CHECK (temperatureMin>0)not null,
	temperatureMax number(3) CONSTRAINT constOeuvreTempMax CHECK (temperatureMax<40) not null,
	luminositeMax number(6) CONSTRAINT constOeuvreLum CHECK (luminositeMax BETWEEN 150 AND 130000)not null,
	securite number(2) not null,
	fragilite number(3) not null,
	type char(15) CONSTRAINT constOeuvreType CHECK (type IN ('peinture', 'sculpture', 'manuscrit', 'outils', 'autres')),
	nom varchar(50),
	artiste varchar(25),
	dateCreationDebut date,
	dateCreationFin date,
	theme varchar(20),
	mouvement varchar(20),
	valeur float CONSTRAINT constOeuvrePrix CHECK (valeur=-1 OR valeur>0) not null,-- vaut -1 si inestimable
CONSTRAINT constOeuvretempMaxSuppMin CHECK (temperatureMax>temperatureMin),
CONSTRAINT constOeuvreDate CHECK(dateCreationDebut<=dateCreationFin)
);

CREATE TABLE Emprunte(
	IDoeuvre integer REFERENCES Oeuvres(IDoeuvre) not null,
	IDmusee integer REFERENCES Musees(IDmusee) not null,
	dateEmprunt date not null,
	dateRetour date not null,
	prix number(14, 2) CONSTRAINT constEmpruntePrix CHECK (prix>=0),
	CONSTRAINT constEmprunteDate CHECK (DateRetour>DateEmprunt),
	CONSTRAINT pkemprunte PRIMARY KEY (IDoeuvre, IDmusee, dateEmprunt)
);

--vérification ne contient que des lettres

CREATE OR REPLACE FUNCTION verifLettre(mot varchar)
RETURN number IS
	len number(2);
BEGIN	
	len:=length(mot);
	FOR i IN 1..len LOOP
		IF(substr(mot,i,1) IN ('0','1','2','3','4','5','6','7','8','9'))THEN
			RETURN 1;
		END IF;
	END LOOP;
	RETURN 0;
END;
/

--vérification ne contient que des chiffres
CREATE OR REPLACE FUNCTION verifChiffre(nombre varchar)
RETURN number IS
	len number(2);
BEGIN	
	len:=length(nombre);		
	FOR i IN 1..len LOOP
		IF(substr(nombre,i,1) NOT IN ('0','1','2','3','4','5','6','7','8','9'))THEN
			RETURN 1;
		END IF;
	END LOOP;
	RETURN 0;
END;
/

--vérifie si la date entrée est la date du jour
CREATE OR REPLACE FUNCTION verifDate(newDate date)
RETURN number IS
BEGIN	
	IF(newDate = TO_DATE(SYSDATE, 'yyyy/mm/dd'))THEN --sysdate prend aussi en compte l'heure exacte ce que nous ne voulons pas alors on compare sur la journée entière
		RETURN 1;

  	END IF;
	RETURN 0;
END;
/

--contrainte sur le téléphone
CREATE  OR REPLACE FUNCTION fctTel(telephone varchar)
RETURN number IS
	len number(2);
BEGIN
	
	len:=length(telephone);
	IF( (len = 10) AND ( 
	(substr(telephone,1,1) <> '0')OR --garde la partie de chaîne de la position 1 sur une longueur de 1
	(substr(telephone,2,1) IN ('0','8'))))THEN
		RETURN 1;
	ELSIF( (len = 12) AND (
	(substr(telephone,1,3) <> '+33')OR 
	(substr(telephone,4,1) IN ('0','8'))))THEN
		RETURN 1;
	END IF;

	IF (telephone is not null) THEN
		RETURN verifChiffre(telephone);
	END IF;

	RETURN 0;
END;
/

--verifie si le musee est actif
CREATE OR REPLACE FUNCTION fctMuseeActif (idmuseeAVerif integer)
return number IS
	tel varchar(12);
BEGIN
	select telephone INTO tel
		from musees
		where idmusee=idmuseeAVerif;
	IF (tel is null) THEN
		RETURN 1;
	END IF;
	RETURN 0;
END;
/

CREATE OR REPLACE TRIGGER trigEmprunteMuseeActif 
	BEFORE INSERT OR UPDATE ON Emprunte
	FOR EACH ROW
BEGIN
	IF (fctMuseeActif(:new.IDmusee)=1) THEN
		RAISE_APPLICATION_ERROR(-20007, 'ce musee n est pas actif');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigEmprunteUneOeuvre 
	BEFORE INSERT OR UPDATE ON Emprunte
	FOR EACH ROW
DECLARE
	nbre integer;
	IDmuseeAppartient integer;
	sourceAppartient number(1);
	valeurOeuvre float;
BEGIN

	SELECT Oeuvres.valeur INTO valeurOeuvre
		FROM Oeuvres WHERE Oeuvres.idoeuvre=:new.idOeuvre;

	--verification que l oeuvre est empruntable (donc pas inestimable)
	IF(valeurOeuvre=-1) THEN ---1 correspond a une oeuvre inestimable
		RAISE_APPLICATION_ERROR(-20021, 'cette oeuvre n est pas empruntable');
	END IF;
	
	--verification que le prix d emprunt et inferieur a la valeur de l oeuvre
	IF(valeurOeuvre<=:new.prix) THEN
		RAISE_APPLICATION_ERROR(-20013, 'tu ne peux pas emprunter une oeuvre pour un prix superieur ou egal a sa valeur.');
	END IF;

	--verification que l emprunt commence aujourd hui, ca se fera avec la fonction de lea;) des qu elle sera ok
	IF (:new.dateEmprunt != to_date(sysdate, 'DD-MON-YY')) THEN
		RAISE_APPLICATION_ERROR(-60009, 'Tu ne peux pas prevoir d emprunter une oeuvre. Il faut donc mettre la date d aujourd hui comme date d emprunt');
	END IF;
	
	--verification que le musee ne s emprunte pas a lui meme
	SELECT IDappartient, source INTO IDmuseeAppartient, sourceAppartient
		FROM Oeuvres WHERE :new.IDOeuvre=Oeuvres.IDOeuvre;

	IF ((sourceAppartient=1) AND (IDmuseeAppartient=:new.IDmusee)) THEN
		RAISE_APPLICATION_ERROR(-20020, 'tu ne peux pas t emprunter a toi meme');
	END IF;

	--verification que l'oeuvre n est pas deja empruntee
	SELECT count(*)  INTO nbre FROM emprunte 
		WHERE :new.IDoeuvre=emprunte.IDOeuvre AND dateretour>:new.dateEmprunt;

	IF(nbre>1) THEN
		RAISE_APPLICATION_ERROR(-20011, 'Il y a plus de 1 date de retour prevue pour une oeuvre, ce qui est theoriquement impossible');
	ELSIF (nbre=1) THEN
		RAISE_APPLICATION_ERROR(-20012, 'Cette oeuvre est encore en cours d emprunt, et ne peut donc etre empruntee.');
	END IF;

END;
/

CREATE OR REPLACE TRIGGER trigVenteDate
	BEFORE INSERT OR UPDATE ON VendTickets
	FOR EACH ROW
BEGIN
	IF (verifDate(:new.dateVente)=1) then
		RAISE_APPLICATION_ERROR( -20010,'la date ne vaut pas la date actuelle :current date - value = ' || 
          to_char( SYSDATE, 'YYYY-MM-DD' ));
	END IF;
END;
/

-- verification des numéros de telephone
CREATE OR REPLACE TRIGGER trigPartiTel 
	BEFORE INSERT OR UPDATE ON Particuliers 
	FOR EACH ROW

BEGIN
	IF (fctTel(:new.telephone)=1) THEN
		RAISE_APPLICATION_ERROR(-20009,'numero telephone incorrect');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigMuseeTel 
	BEFORE INSERT OR UPDATE ON Musees 
	FOR EACH ROW
BEGIN
	IF (fctTel(:new.telephone)=1) THEN
		RAISE_APPLICATION_ERROR(-20009,'numero telephone incorrect');
	END IF;
END;
/

--Télephone : Nous avons accepter que l'utilisateur puisse utiliser les deux forme les plus courante pour les numéros de télephone à savoir 0 ou +33  suivi d'un chiffre qui n'est pas 0 ou 8 suivi de 8 chiffre. Nous avons aussi décider que dans la table tous les numéros de téléphone seraient de la forme 0185479631.
--Ils faut donc utiliser le type varchar de taille 10 ou 12 (ALTER TABLE). Pour le reste des constraintes on va utiliser un trigger. Il faut vérifier que le numéro commence soit pas +33 ou par 0 puis qu'il n'est pas suivi de 0 ou 8 et enfin qu'il n'y ait pas de lettre parmi les 10 digits.

	
-- contrainte sur le nom
CREATE OR REPLACE TRIGGER trigPartiNom 
	BEFORE INSERT OR UPDATE ON Particuliers 
	FOR EACH ROW

BEGIN
	IF(verifLettre(:new.nom)=1) THEN 
		RAISE_APPLICATION_ERROR(-20017,'presence chiffre dans nom');
	END IF;
	IF(:new.ville is not null) then
		IF (verifLettre(:new.ville)=1) THEN
			RAISE_APPLICATION_ERROR(-20018,'presence chiffre dans ville');
		END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigMuseeNom 
	BEFORE INSERT OR UPDATE ON Musees 
	FOR EACH ROW
BEGIN
	IF(verifLettre(:new.nom)=1) THEN 
		RAISE_APPLICATION_ERROR(-20017,'presence chiffre dans nom');
	END IF;
	IF (verifLettre(:new.ville)=1) THEN
		RAISE_APPLICATION_ERROR(-20018,'presence chiffre dans ville');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigEmployeNom 
	BEFORE INSERT OR UPDATE ON Employes 
	FOR EACH ROW
BEGIN
	IF(:new.nom is not null) THEN 
		IF(verifLettre(:new.nom)=1) THEN 
			RAISE_APPLICATION_ERROR(-20017,'presence chiffre dans nom');
		END IF;
		IF (verifLettre(:new.ville)=1) THEN
			RAISE_APPLICATION_ERROR(-20018,'presence chiffre dans ville');
		 END IF;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigOeuvreNom 
	BEFORE INSERT OR UPDATE ON Oeuvres 
	FOR EACH ROW
BEGIN
	IF(:new.nom is not null) THEN
		IF (verifLettre(:new.nom)=1) THEN
			RAISE_APPLICATION_ERROR(-20018,'presence chiffre dans ville');
		END IF;
	END IF;
END;
/

-- contrainte sur le code postal
CREATE OR REPLACE TRIGGER trigPartiCodePostal 
	BEFORE INSERT OR UPDATE ON Particuliers 
	FOR EACH ROW
BEGIN
	IF (verifChiffre(:new.codePostal)=1) THEN
		RAISE_APPLICATION_ERROR(-20019, 'presence lettre dans code postal');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigMuseeCodePostal 
	BEFORE INSERT OR UPDATE ON Musees 
	FOR EACH ROW
BEGIN
	IF (verifChiffre(:new.codePostal)=1) THEN
		RAISE_APPLICATION_ERROR(-20019, 'presence lettre dans code postal');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigVenteCodePostal 
	BEFORE INSERT OR UPDATE ON VendTickets 
	FOR EACH ROW
BEGIN
	IF (verifChiffre(:new.codePostal)=1) THEN
		RAISE_APPLICATION_ERROR(-20019, 'presence lettre dans code postal');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER trigEmployeCodePostal 
	BEFORE INSERT OR UPDATE ON Employes 
	FOR EACH ROW
BEGIN
	IF (verifChiffre(:new.codePostal)=1) THEN
		RAISE_APPLICATION_ERROR(-20019, 'presence lettre dans code postal');
	END IF;
END;
/

-- contrainte sur le transport d'une oeuvre vers un musee
CREATE OR REPLACE TRIGGER trigTransport 
	BEFORE INSERT OR UPDATE ON Emprunte 
	FOR EACH ROW
DECLARE
	ok integer := 0;
BEGIN
	SELECT count(*) INTO ok
		FROM Musees, Oeuvres
		WHERE Musees.IDmusee = :new.IDmusee
			AND Oeuvres.IDoeuvre = :new.IDoeuvre
			AND Oeuvres.luminositeMax <= Musees.luminositeMax
			AND Oeuvres.securite <= Musees.securite
			AND Oeuvres.temperatureMin BETWEEN Musees.temperatureMin AND Musees.temperatureMax
			OR Oeuvres.temperatureMin BETWEEN Musees.temperatureMin AND Musees.temperatureMax;
	IF (ok = 0) THEN
		RAISE_APPLICATION_ERROR(-20004, 'les conditions de stockage ou de transport de l oeuvre pour ce musee ne sont pas compatibles');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER  trigOeuvreAppartient BEFORE INSERT OR UPDATE ON oeuvres
FOR EACH ROW
DECLARE
	ok number(1):=0; --vaut 1 si on doit lever une exception due au musee, 2 pour une exception due au particulier, 0 sinon
	nbreParticulier integer:=0;
	nbreMusee integer:=0;
BEGIN
	SELECT count(*) INTO nbreParticulier
		FROM Particuliers
		WHERE :new.IDappartient = Particuliers.IDparticulier;
	
	SELECT count(*) INTO nbreMusee
		FROM Musees
		WHERE IdMusee = :new.Idappartient;
		
	IF((:new.source=0) AND (nbreParticulier=0)) THEN
		ok:=2;
	ELSIF((:new.source=1) AND (nbreMusee=0)) THEN
		ok:=1;
	END IF;

	IF(ok=1) THEN
		RAISE_APPLICATION_ERROR(-20005, 'cet identifiant de musee n existe pas');
	ELSIF(ok=2) THEN 
		RAISE_APPLICATION_ERROR(-20006, 'cet identifiant de particulier n existe pas');
	END IF;
END;
/ 

CREATE OR REPLACE TRIGGER trigOeuvreDate BEFORE INSERT OR UPDATE ON Oeuvres
FOR EACH ROW
BEGIN
	IF(:new.dateCreationFin>sysdate) THEN
		RAISE_APPLICATION_ERROR(-20007, 'la date de creation ne peut etre superieure a aujourd hui');
	END IF;
END;
/






