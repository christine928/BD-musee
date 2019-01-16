--tarifs (IDtarif, cible, prix)
INSERT INTO Tarifs VALUES (1,'-26 ans',0);
INSERT INTO Tarifs VALUES (2,'groupes 20',2.50);
INSERT INTO Tarifs VALUES (3,'groupes 50',1.00);
INSERT INTO Tarifs VALUES (4,'normal',5.50);
INSERT INTO Tarifs VALUES (5,'séniors',3.50);
INSERT INTO Tarifs VALUES (6,'handicapes',1.50);
INSERT INTO Tarifs VALUES (7,'chomeurs',2.50);
INSERT INTO Tarifs VALUES (8,'enseignants',2.50);
INSERT INTO Tarifs VALUES (9,'gratuit groupes',0);
INSERT INTO Tarifs VALUES (10,'gratuit normal',0);
INSERT INTO Tarifs VALUES (11,'gratuit séniors',0);
INSERT INTO Tarifs VALUES (12,'gratuit handicapes',0);
INSERT INTO Tarifs VALUES (13,'gratuit chomeurs',0);
INSERT INTO Tarifs VALUES (14,'gratuit enseignant',0);

--musees (IDmusee, nom, adresse, telephone, transport, tempMin, tempMax, lumMax, secu)
INSERT INTO Musees VALUES (1, 'Louvre', 'Rue de Rivoli','75001','Paris','0140205050',20,1,10,130000,20);
INSERT INTO Musees VALUES (2,'Musee archeologique','Palais Rohen 2 Place du Chateau','67000','Strasbourg','0368985160',15,12,29,60000,16);
INSERT INTO Musees VALUES (3,'Musee du Tabac','Place du Feu','24100','Bergerac','0553630413',10,15,25,70000,10);
INSERT INTO Musees VALUES (4,'Musee lapidaire','Rue de la Crypte', '63208', 'Mozac',null,3,5,35,5000,5);
INSERT INTO Musees VALUES (5,'Musee de la coutellerie','23 58 Rue de la Coutellerie','63300','Thiers','0473805886',12,16,35,75000,12);
INSERT INTO Musees VALUES (6,'Musee du vin de Bourgogne','Rue d`Enfer','21200','Beaune','0380245692',15,4,23,60000,18);
INSERT INTO Musees VALUES (7,'Musee de la chemiserie et de l`elegance masculine','Rue Charles Brillaud','36200','Argenton-sur-Creuse','0254243469',14,16,30,85000,14);
INSERT INTO Musees VALUES (10000000000000000000,'Musee de la chemiserie et de l`elegance masculine','Rue Charles Brillaud','36200','Argenton-sur-Creuse','0254243469',14,16,30,85000,14);

--vendTickets (IDticket, IDtarif, IDmusee, dateVente, dateVisite, codePostal)
INSERT INTO VendTickets VALUES (1,2,1,TO_DATE('2019/01/16', 'yyyy/mm/dd'),TO_DATE('2019/01/16', 'yyyy/mm/dd'),92500);
INSERT INTO VendTickets VALUES (2,1,1,TO_DATE('2019/01/16', 'yyyy/mm/dd'),TO_DATE('2019/02/15', 'yyyy/mm/dd'),75001);

--particuliers (IDparticulier, nom, adresse, codePostal, ville, telephone)
insert into particuliers values (1, 'lfdn', 'enfers', '66666', 'Hell', '0666666666');
insert into particuliers values (2, 'calem', 'tartare', '99999', 'Hell', '0999999999');

--oeuvres (IDoeuvre, IDappartient, poids, unitePoids,largeur, longueur,	hauteur, temperatureMin, temperatureMax, luminositeMax, securite, fragilite, type, nom, source, 	artiste, dateCreation, theme, mouvement, valeur)
INSERT INTO oeuvres VALUES (1, 1, 0, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'la rose', 'lfdn', to_date('08-jan-16', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'fleur', 'contemporain', 10000);
INSERT INTO oeuvres VALUES (4, 4, 1, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'le rose', 'lfdn', to_date('08-jan-15', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'couleur', 'contemporain', 10000);
INSERT INTO oeuvres VALUES (12, 10000000000000000000, 1, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'la rose', 'lfdn', to_date('08-jan-16', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'fleur', 'contemporain', 10000);

insert into particuliers values (3, 'calem', 'tartare', '99999', 'Hell', '0999999999');
