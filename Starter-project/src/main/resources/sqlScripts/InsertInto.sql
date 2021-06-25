--OBRAZOVANJE PODACI

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (nextval('obrazovanje_seq'), 'Osnovno obrazovanje', 1, 'Osnovno obrazovanje odraslih');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (nextval('obrazovanje_seq'), 'Strucno obrazovanje', 2, 'Strucno obrazovanje odraslih u trajanju od najvise 2 godine');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (nextval('obrazovanje_seq'), 'Osnovne akademske studije', 3, 'Osnovne akademske studije koje traju 4 godine i nose 240 ESPB poena');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (nextval('obrazovanje_seq'), 'Master studije', 4, 'Mater studije koje traju godinu dana i nose 60 ESPB poena');
INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (nextval('obrazovanje_seq'), 'Doktorske studije', 5, 'Doktorske studije koje traju tri godine i nose 180 ESPB poena');

INSERT INTO "obrazovanje"("id", "naziv", "stepen_strucne_spreme", "opis")
VALUES (-100, 'TestNaz', 'TestSt', 'TestOpis');

--PREDUZECE PODACI

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES(nextval('preduzece_seq'), 'Bambi', 212, 'Pozarevac', 'Babmi je kompanija koja se bavi proizvodnjom konditorskih i prehrambenih proizvoda');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES(nextval('preduzece_seq'), 'Stark', 228, 'Novi Sad', 'Stark je prehrambeno preduzece poznato po proizvodnji slatkisa, keksa i cokolade');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES(nextval('preduzece_seq'), 'Milka', 645, 'Beograd', 'Milka je poznata kompanija koja se bavi proizvodnjom cokolade');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES(nextval('preduzece_seq'), 'Coca Cola', 993, 'Beograd', 'Coca Cola je kompanija koja se bavi bezalkoholnog gaziranog pica');
INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES(nextval('preduzece_seq'), 'Red Bull', 745, 'Beograd', 'Red Bull je preduzece koje se bavi proizvodnjom istoimenog energetskog napitka');

INSERT INTO "preduzece"("id", "naziv", "pib", "sediste", "opis")
VALUES (-100, 'TestNaz', 100, 'TestSed','TestOpis');

--SEKTOR PODACI

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES(nextval('sektor_seq'), 'Racunovodstvo', 'RA',1 );
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES(nextval('sektor_seq'), 'Nabavka', 'NA',2);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES(nextval('sektor_seq'), 'Prodaja', 'PR',3);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES(nextval('sektor_seq'), 'Marketing', 'MA',4);
INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES(nextval('sektor_seq'), 'Proizvodnja', 'PRO',5);

INSERT INTO "sektor"("id", "naziv", "oznaka", "preduzece")
VALUES (-100, 'TestNaz', 'TestOz', 2);

--RADNIK PODACI

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES(nextval('radnik_seq'), 'Dusan', 'Vukic', 008526485, 3, 3);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES(nextval('radnik_seq'), 'Andjela', 'Milojkovic', 089124532, 4, 4);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES(nextval('radnik_seq'), 'Mila', 'Vladisavljevic', 009745632, 2, 2);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES(nextval('radnik_seq'), 'Stevan', 'Cosic', 05499865, 5, 1);
INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES(nextval('radnik_seq'), 'Aleksandar', 'Stankovic', 002355786, 1, 5);

INSERT INTO "radnik"("id", "ime", "prezime", "broj_lk", "obrazovanje", "sektor")
VALUES (-100, 'TestIme', 'TestPrz', 11111111, 2, 3);