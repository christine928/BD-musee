--tarifs (IDtarif, cible, prix)
INSERT INTO Tarifs VALUES (1,'-26 ans',0);
INSERT INTO Tarifs VALUES (2,'groupes 20',2.50);
INSERT INTO Tarifs VALUES (3,'groupes 50',1.00);
INSERT INTO Tarifs VALUES (4,'normal',5.50);
INSERT INTO Tarifs VALUES (5,'séniors',3.50);
INSERT INTO Tarifs VALUES (6,'handicapes',1.50);
INSERT INTO Tarifs VALUES (7,'chomeurs',2.50);
INSERT INTO Tarifs VALUES (8,'enseignants',2.50);
INSERT INTO Tarifs VALUES (9,'etudiants',2.00);
INSERT INTO Tarifs VALUES (10,'enfants',1.50);
INSERT INTO Tarifs VALUES (11,'normal',7.50);
INSERT INTO Tarifs VALUES (12,'seniors',4.50);
INSERT INTO Tarifs VALUES (13,'groupes',4.00);
INSERT INTO Tarifs VALUES (14,'normal',10.50);
INSERT INTO Tarifs VALUES (15,'gratuit groupes',0);
INSERT INTO Tarifs VALUES (16,'gratuit normal',0);
INSERT INTO Tarifs VALUES (17,'gratuit séniors',0);
INSERT INTO Tarifs VALUES (18,'gratuit handicapes',0);
INSERT INTO Tarifs VALUES (19,'gratuit chomeurs',0);
INSERT INTO Tarifs VALUES (20,'gratuit enseignant',0);


--musees (IDmusee, nom, adresse, telephone, transport, tempMin, tempMax, lumMax, secu)
INSERT INTO Musees VALUES (1, 'Louvre', 'Rue de Rivoli','75001','Paris','0140205050',20,1,10,130000,20);
INSERT INTO Musees VALUES (2,'Musee archeologique','Palais Rohen 2 Place du Chateau','67000','Strasbourg','0368985160',15,12,29,60000,16);
INSERT INTO Musees VALUES (3,'Musee du Tabac','Place du Feu','24100','Bergerac','0553630413',10,15,25,70000,10);
INSERT INTO Musees VALUES (4,'Musee lapidaire','Rue de la Crypte', '63208', 'Mozac',null,3,5,35,5000,5);
INSERT INTO Musees VALUES (5,'Musee de la coutellerie','23 58 Rue de la Coutellerie','63300','Thiers','0473805886',12,16,35,75000,12);
INSERT INTO Musees VALUES (6,'Musee du vin de Bourgogne','Rue d`Enfer','21200','Beaune','0380245692',15,4,23,60000,18);
INSERT INTO Musees VALUES (7,'Musee de la chemiserie et de l`elegance masculine','Rue Charles Brillaud','36200','Argenton-sur-Creuse','0254243469',14,16,30,85000,14);
INSERT INTO Musees VALUES (8,'Musee d`art naif Anatole Jakovsky','Chateau Ste-Helene avenue de Fabron','06364','Nice','0493717833',10,14,31,80000,14);
INSERT INTO Musees VALUES (9,'Musee Colette','Rue du chateau','89520','St-Sauveur-n-Puisaye','0386456195',8,6,41,87000,11);
INSERT INTO Musees VALUES (10,'Port-Musee','Place de l`Enfer','29100','Douarnenez','0298926520',15,4,25,75000,15);
INSERT INTO Musees VALUES (11,'Musee bigouden','Square de l`Europe','29120','Pont-l`Abbe','0298660903',11,2,50,99000,13);
INSERT INTO Musees VALUES (12,'Musee ornitologique','Rue des Noyers','85310','La-Chaize-le-Vicomte','0251057021',17,21,27,85000,17);
INSERT INTO Musees VALUES (13,'Musee du campagnonnage','1 square Prosper Merimee','37000','Tours','02472116220',10,10,35,105000,11);
INSERT INTO Musees VALUES (14,'Maison de la magie','1 Pace du Chateau','41000','Blois','0254903333',15,12,30,89000,15);
INSERT INTO Musees VALUES (15,'Musee de la coutellerie','17 avenue du General de Gaulle','52800','Nogent','0325876767',12,16,35,75000,12);
INSERT INTO Musees VALUES (16,'Musee de l`homme','17 place du Trocadero','75116','Paris','0144057272',12,16,35,75000,12);
INSERT INTO Musees VALUES (17,'Musee de la vie romantique','16 rue Chaptal','75009','Paris','0155319567',9,13,32,95000,10);
INSERT INTO Musees VALUES (18,'Musee des arts et metiers','60 rue Reaumur','75003','Paris','0153018200',15,16,29,81000,16);
INSERT INTO Musees VALUES (19,'Musee de la poste','34 Boulevard de Vaugirard','75015','Paris','',10,15,35,95000,10);
INSERT INTO Musees VALUES (20,'Petit Palais','avenue de Wiston Churchill','75008','Paris','0153434000',16,16,34,87000,17);
INSERT INTO Musees VALUES (21,'Musee des arts ludiques','2 rue Montalembert','75007','Paris','0145700949',15,15,37,85000,15);
INSERT INTO Musees VALUES (22,'Musee d`Orsay','1 rue de la Legion d`Honneur','75007','Paris','0140494814',16,14,37,95000,17);

--vendTickets (IDticket, IDtarif, IDmusee, dateVente, dateVisite, codePostal)
INSERT INTO VendTickets VALUES (1,2,1,TO_DATE('26-jan-19', 'DD-MON-YY'),TO_DATE('6-fev-19', 'DD-MON-YY'),92500);
INSERT INTO VendTickets VALUES (2,1,1,TO_DATE('26-fev-19', 'DD-MON-YY'),TO_DATE('16-fev-19', 'DD-MON-YY'),75001);
INSERT INTO VendTickets VALUES (2,1,1,TO_DATE('01-avr-19', 'DD-MON-YY'),TO_DATE('08-avr-19', 'DD-MON-YY'),92130);


--particuliers (IDparticulier, nom, adresse, codePostal, ville, telephone)
insert into particuliers values (1, 'lfdn', 'enfers', '66666', 'Hell', '0666666666');
insert into particuliers values (2, 'calem', 'tartare', '99999', 'Hell', '0999999999');
insert into particuliers values (3, 'flamant', 'purgatoire', '75757', 'Hell', '0757575757');

--oeuvres (IDoeuvre, IDappartient, poids, unitePoids,largeur, longueur,	hauteur, temperatureMin, temperatureMax, luminositeMax, securite, fragilite, type, nom, source, 	artiste, dateCreation, theme, mouvement, valeur)
INSERT INTO oeuvres VALUES (1, 1, 0, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'la rose', 'lfdn', to_date('08-jan-16', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'fleur', 'contemporain', 10000);
INSERT INTO oeuvres VALUES (4, 4, 1, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'le rose', 'lfdn', to_date('08-jan-15', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'couleur', 'contemporain', 10000);
INSERT INTO oeuvres VALUES (12, 10, 1, 50, 't', 10, 10, 10, 2, 20, 150, 4, 4, 'peinture', 'la rose', 'lfdn', to_date('08-jan-16', 'DD-MON-YY'), to_date('08-jan-17', 'DD-MON-YY'), 'fleur', 'contemporain', 10000);

--emprunte (IDoeuvre, IDmusee, dateEmprunt, dateRetour, prix)
--INSERT INTO emprunte VALUES (4,1,TO_DATE('26-jan-19', 'DD-MON-YY'),TO_DATE('2019/02/16','yyyy/mm/dd'),500);
