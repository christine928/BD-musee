CREATE TABLE Particuliers( 
	IDparticulier number(15) CONSTRAINT pkParticuliers PRIMARY KEY,
	nom varchar(25),
	adresse varchar(50),
	telephone varchar(12),
CHECK (length(telephone)=10 OR length(telephone)=12)
);

CREATE TABLE Musees(
	IDmusee integer CONSTRAINT pkMusee PRIMARY KEY,
	nom varchar(50) not null,
	adresse varchar(50) not null,
	telephone varchar(12),
	transport number(2),
	temperatureMin number(3),
	temperatureMax number(3),
	luminositeMax number(6),
	securite number (2),
CONSTRAINT checkTel CHECK (length(telephone)=10 OR length(telephone)=12)
);

--contrainte sur le téléphone
CREATE OR REPLACE FUNCTION fctTel(telephone varchar)
RETURN varchar IS
--DECLARE
	tel varchar(10);
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
	
	FOR i IN 1..len LOOP
		IF(substr(telephone,i,1) NOT IN ('0','1','2','3','4','5','6','7','8','9'))THEN
		RAISE_APPLICATION_ERROR(-20011,'Presence de lettre');
		END IF;
	END LOOP;
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
