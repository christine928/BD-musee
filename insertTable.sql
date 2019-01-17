--tarifs (IDtarif, cible, prix
			
INSERT INTO Tarifs VALUES (0,'groupes 20',2.50);
INSERT INTO Tarifs VALUES (0,'groupes 50',1.00);
INSERT INTO Tarifs VALUES (0,'normal',5.50);
INSERT INTO Tarifs VALUES (0,'séniors',3.50);
INSERT INTO Tarifs VALUES (0,'handicapes',1.50);
INSERT INTO Tarifs VALUES (0,'chomeurs',2.50);
INSERT INTO Tarifs VALUES (0,'enseignants',2.50);
INSERT INTO Tarifs VALUES (0,'etudiants',2.00);
INSERT INTO Tarifs VALUES (0,'enfants',1.50);
INSERT INTO Tarifs VALUES (0,'normal',7.50);
INSERT INTO Tarifs VALUES (0,'seniors',4.50);
INSERT INTO Tarifs VALUES (0,'groupes',4.00);
INSERT INTO Tarifs VALUES (0,'normal',10.50);
INSERT INTO Tarifs VALUES (0,'gratuit groupes',0);
INSERT INTO Tarifs VALUES (0,'gratuit normal',0);
INSERT INTO Tarifs VALUES (0,'gratuit séniors',0);
INSERT INTO Tarifs VALUES (0,'gratuit handicapes',0);
INSERT INTO Tarifs VALUES (0,'gratuit chomeurs',0);
INSERT INTO Tarifs VALUES (0,'gratuit enseignant',0);


--musees (IDmusee, nom, adresse, telephone, transport, tempMin, tempMax, lumMax, secu)
INSERT INTO Musees VALUES (0, 'Louvre', 'Rue de Rivoli','75001','Paris','0140205050',20,1,10,130000,20);
INSERT INTO Musees VALUES (0,'Musee archeologique','Palais Rohen 2 Place du Chateau','67000','Strasbourg','0368985160',15,12,29,60000,16);
INSERT INTO Musees VALUES (0,'Musee du Tabac','Place du Feu','24100','Bergerac','0553630413',10,15,25,70000,10);
INSERT INTO Musees VALUES (0,'Musee lapidaire','Rue de la Crypte', '63208', 'Mozac',null,3,5,35,5000,5);
INSERT INTO Musees VALUES (0,'Musee de la coutellerie','23 58 Rue de la Coutellerie','63300','Thiers','0473805886',12,16,35,75000,12);
INSERT INTO Musees VALUES (0,'Musee du vin de Bourgogne','Rue d`Enfer','21200','Beaune','0380245692',15,4,23,60000,18);
INSERT INTO Musees VALUES (0,'Musee de la chemiserie et de l`elegance masculine','Rue Charles Brillaud','36200','Argenton-sur-Creuse','0254243469',14,16,30,85000,14);
INSERT INTO Musees VALUES (0,'Musee d`art naif Anatole Jakovsky','Chateau Ste-Helene avenue de Fabron','06364','Nice','0493717833',10,14,31,80000,14);
INSERT INTO Musees VALUES (0,'Musee Colette','Rue du chateau','89520','St-Sauveur-n-Puisaye','0386456195',8,6,41,87000,11);
INSERT INTO Musees VALUES (0,'Port-Musee','Place de l`Enfer','29100','Douarnenez','0298926520',15,4,25,75000,15);
INSERT INTO Musees VALUES (0,'Musee bigouden','Square de l`Europe','29120','Pont-l`Abbe','0298660903',11,2,50,99000,13);
INSERT INTO Musees VALUES (0,'Musee ornitologique','Rue des Noyers','85310','La-Chaize-le-Vicomte','0251057021',17,21,27,85000,17);
INSERT INTO Musees VALUES (0,'Musee du campagnonnage','1 square Prosper Merimee','37000','Tours','02472116220',10,10,35,105000,11);
INSERT INTO Musees VALUES (0,'Maison de la magie','1 Pace du Chateau','41000','Blois','0254903333',15,12,30,89000,15);
INSERT INTO Musees VALUES (0,'Musee de la coutellerie','17 avenue du General de Gaulle','52800','Nogent','0325876767',12,16,35,75000,12);
INSERT INTO Musees VALUES (0,'Musee de l`homme','17 place du Trocadero','75116','Paris','0144057272',12,16,35,75000,12);
INSERT INTO Musees VALUES (0,'Musee de la vie romantique','16 rue Chaptal','75009','Paris','0155319567',9,13,32,95000,10);
INSERT INTO Musees VALUES (0,'Musee des arts et metiers','60 rue Reaumur','75003','Paris','0153018200',15,16,29,81000,16);
INSERT INTO Musees VALUES (0,'Musee de la poste','34 Boulevard de Vaugirard','75015','Paris','',10,15,35,95000,10);
INSERT INTO Musees VALUES (0,'Petit Palais','avenue de Wiston Churchill','75008','Paris','0153434000',16,16,34,87000,17);
INSERT INTO Musees VALUES (0,'Musee des arts ludiques','2 rue Montalembert','75007','Paris','0145700949',15,15,37,85000,15);
INSERT INTO Musees VALUES (0,'Musee d`Orsay','1 rue de la Legion d`Honneur','75007','Paris','0140494814',16,14,37,95000,17);

--vendTickets (IDticket, IDtarif, IDmusee, dateVente, dateVisite, codePostal)
INSERT INTO VendTickets VALUES (1,2,1,TO_DATE('26-jan-19', 'DD-MON-YY'),TO_DATE('6-feb-19', 'DD-MON-YY'),92500);
INSERT INTO VendTickets VALUES (2,1,1,TO_DATE('26-feb-19', 'DD-MON-YY'),TO_DATE('16-feb-19', 'DD-MON-YY'),75001);
INSERT INTO VendTickets VALUES (2,1,1,TO_DATE('01-apr-19', 'DD-MON-YY'),TO_DATE('08-apr-19', 'DD-MON-YY'),92130);


--oeuvres (IDoeuvre, IDappartient,source, poids, unitePoids,largeur, longueur,	hauteur, temperatureMin, temperatureMax, luminositeMax, securite, fragilite, type, nom, 	artiste, dateCreation, theme, mouvement, valeur)
INSERT INTO oeuvres VALUES (0, 1, 1, 15, 'kg', 0.53, 0.03 , 0,77, 17, 21, 150, 15, 13, 'peinture', 'La Joconde', 'Leonard de Vinci', to_date('01-01-1503', 'DD-MM-YYYY'), to_date('31-12-1519', 'DD-MM-YY'), 'Portrait', 'Haute Renaissance', -1);


--emprunte (IDoeuvre, IDmusee, dateEmprunt, dateRetour, prix)
--INSERT INTO emprunte VALUES (4,1,TO_DATE('26-jan-19', 'DD-MON-YY'),TO_DATE('2019/02/16','yyyy/mm/dd'),500);
