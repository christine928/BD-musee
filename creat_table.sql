CREATE TABLE Particuliers( 
	IDparticulier number(15) CONSTRAINT pkParticuliers PRIMARY KEY,
	nom varchar(25) not null,
	adresse varchar(30),
	codePostal varchar(5),
	ville varchar(25),
	telephone varchar(12),
CONSTRAINT checkPartiTel CHECK (length(telephone)=10 OR length(telephone)=12)
);

CREATE TABLE Musees(
	IDmusee integer CONSTRAINT pkMusee PRIMARY KEY,
	nom varchar(50) not null,
	adresse varchar(30) not null,
	codePostal varchar(5) not null,
	ville varchar(25) not null,
	telephone varchar(12),
	transport number(2),
	temperatureMin number(3),
	temperatureMax number(3),
	luminositeMax number(6),
	securite number (2),
CONSTRAINT checkMuseeTel CHECK (length(telephone)=10 OR length(telephone)=12),
CONSTRAINT checkMuseeTransport CHECK (transport BETWEEN 0 AND 20),--note sur 20 en fonctin de critères (...)
CONSTRAINT checkMuseeTempMin CHECK ((temperatureMin < temperatureMax) AND (temperatureMin > 0)),
CONSTRAINT checkMuseeTempMax CHECK ((temperatureMax > temperatureMin) AND (temperatureMin > 40)),
CONSTRAINT checkMuseeLuminosite CHECK (luminositeMax BETWEEN 150 AND 130000), --150lux est la limite de luminosité pour lire et 130 000 lux correspond à la luminosité d'une journée ensoleillée d'été
CONSTRAINT checkSecurite CHECK (securite BETWEEN 0 AND 20)
);

--vérification ne contient que des lettres
CREATE OR REPLACE PROCEDURE verifLettre(mot varchar)IS
	len number(2);
BEGIN	
	len:=length(mot);
	FOR i IN 1..len LOOP
		IF(substr(mot,i,1) IN ('0','1','2','3','4','5','6','7','8','9'))THEN
			RAISE_APPLICATION_ERROR(-20012,'Presence de chiffre');
		END IF;
	END LOOP;
END;
/

--vérification ne contient que des chiffres
CREATE OR REPLACE PROCEDURE verifChiffre(nombre varchar)IS
	len number(2);
BEGIN	
	len:=length(nombre);
	FOR i IN 1..len LOOP
		IF(substr(nombre,i,1) NOT IN ('0','1','2','3','4','5','6','7','8','9'))THEN
			RAISE_APPLICATION_ERROR(-20011,'Presence de lettre');
		END IF;
	END LOOP;
END;
/

--contrainte sur le téléphone
CREATE OR REPLACE FUNCTION fctTel(telephone varchar)
RETURN varchar IS
	tel varchar(12);
	len number(2);
	chaine varchar(12);
BEGIN
	len:=length(telephone);
	tel:=telephone;
	IF( (len = 10) AND ( 
	(substr(telephone,1,1) <> '0')OR --garde la partie de chaîne de la position 1 sur une longueur de 1
	(substr(telephone,2,1) IN ('0','8'))))THEN
		RAISE_APPLICATION_ERROR(-20010,'numero telephone incorrect');
	ELSIF( (len = 12) AND (
	(substr(telephone,1,3) <> '+33')OR 
	(substr(telephone,4,1) IN ('0','8'))))THEN
		RAISE_APPLICATION_ERROR(-20010,'numero telephone incorrect');
	END IF;
	
	IF (len = 12) THEN
		chaine:=substr(telephone,4);
		chaine:=lpad(chaine,10,0); --ajoute 0 au début de la chaîne qui fera alors 10 caractères
		tel:=chaine;
	END IF;
	
	verifChiffre(tel);

	RETURN tel;
END;
/

CREATE OR REPLACE TRIGGER trigPartiTel 
	BEFORE INSERT OR UPDATE ON Particuliers 
	FOR EACH ROW
BEGIN
	:new.telephone := fctTel(:new.telephone);
END;
/

CREATE OR REPLACE TRIGGER trigMuseeTel 
	BEFORE INSERT OR UPDATE ON Musees 
	FOR EACH ROW
BEGIN
	:new.telephone := fctTel(:new.telephone);
END;
/

--Télephone : Nous avons accepter que l'utilisateur puisse utiliser les deux forme les plus courante pour les numéros de télephone à savoir 0 ou +33  suivi d'un chiffre qui n'est pas 0 ou 8 suivi de 8 chiffre. Nous avons aussi décider que dans la table tous les numéros de téléphone seraient de la forme 0185479631.
--Ils faut donc utiliser le type varchar de taille 10 ou 12 (ALTER TABLE). Pour le reste des constraintes on va utiliser un trigger. Il faut vérifier que le numéro commence soit pas +33 ou par 0 puis qu'il n'est pas suivi de 0 ou 8 et enfin qu'il n'y ait pas de lettre parmi les 10 digits.

	
-- contrainte sur le nom
CREATE OR REPLACE TRIGGER trigMuseeNom 
	BEFORE INSERT OR UPDATE ON Musees 
	FOR EACH ROW
BEGIN
	verifLettre(:new.nom);
END;
/
