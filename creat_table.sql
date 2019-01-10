CREATE TABLE Particuliers( IDparticulier number(15) CONSTRAINT pk_particuliers PRIMARY KEY, nom varchar(25), adresse varchar(50), telephone varchar(12) );

ALTER TABLE Particuliers ADD CONSTRAINT constPartiTel CHECK (length(telephone)=10 OR length(telephone)=12);


CREATE OR REPLACE TRIGGER trigPartiTel 
	BEFORE INSERT ON Particuliers
	FOR EACH ROW
DECLARE
	len number(2);
	chaine varchar(12);
BEGIN
	len:=length(:new.telephone);
	IF( (len = 10) AND ( 
	(substr(:new.telephone,1,1) <> '0') OR 
	(substr(:new.telephone,2,1) = '8') OR 
	(substr(:new.telephone,2,1) = '0') ) ) THEN
		RAISE_APPLICATION_ERROR(-20010,'numero telephone incorrect');
	ELSIF( (len = 12) AND (
	(substr(:new.telephone,1,3) <> '+33') OR 
	(substr(:new.telephone,4,1) = '8') OR 
	(substr(:new.telephone,4,1) = '0')) ) THEN
		RAISE_APPLICATION_ERROR(-20010,'numero telephone incorrect');
	END IF;
	
	IF (len = 12) THEN
		chaine:=substr(:new.telephone,4);
		dbms_output.put_line(chaine);
		chaine:=lpad(chaine,10,0);
		:new.telephone:=chaine;
	END IF;
	
	FOR i IN 1..len LOOP
		IF( (substr(:new.telephone,i,1) <> '0') OR
		    (substr(:new.telephone,i,1) <> '2') OR
		    (substr(:new.telephone,i,1) <> '3') OR
		    (substr(:new.telephone,i,1) <> '4') OR
		    (substr(:new.telephone,i,1) <> '5') OR
		    (substr(:new.telephone,i,1) <> '6') OR
		    (substr(:new.telephone,i,1) <> '7') OR 
		    (substr(:new.telephone,i,1) <> '8') OR
		    (substr(:new.telephone,i,1) <> '') ) THEN
		RAISE_APPLICATION_ERROR(-20011,'Presence de lettre');
		END IF;

	END LOOP;

	
	
END;
/


/*Télephone : Nous avons accepter que l'utilisateur puisse utiliser les deux forme les plus courante pour les numéros de télephone à savoir 0 ou +33  suivi d'un chiffre qui n'est pas 0 ou 8 suivi de 8 chiffre. Nous avons aussi décider que dans la table tous les numéros de téléphone seraient de la forme 0185479631.
Ils faut donc utiliser le type varchar de taille 10 ou 12 (ALTER TABLE). Pour le reste des constraintes on va utiliser un trigger. Il faut vérifier que le numéro commence soit pas +33 ou par 0 puis qu'il n'est pas suivi de 0 ou 8 et enfin qu'il n'y ait pas de lettre parmi les 10 digits.*/


	
