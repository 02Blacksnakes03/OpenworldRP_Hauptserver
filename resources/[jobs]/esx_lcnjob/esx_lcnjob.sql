USE `paradise_hauptserver`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lcn', 'Lcn', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lcn', 'Lcn', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lcn', 'Lcn', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('lcn','Lcn')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lcn',0,'recruit','Corridore',2000,'{}','{}'),
	('lcn',1,'officer','Ucello',2300,'{}','{}'),
	('lcn',2,'sergeant','Uomo della strada',2500,'{}','{}'),
	('lcn',3,'sergeant','Aspirante',2500,'{}','{}')
	('lcn',4,'lieutenant','Mafiosi',2800,'{}','{}'),
	('lcn',5,'lieutenant','Uomo d affari',2800,'{}','{}'),
	('lcn',6,'lieutenant','insegnante',2800,'{}','{}')
	('lcn',7,'lieutenant','Capo',2800,'{}','{}'),
	('lcn',8,'lieutenant','Confidente',2800,'{}','{}'),
	('lcn',9,'lieutenant','Maniaco',2800,'{}','{}'),
	('lcn',10,'lieutenant','Consiglieri',2800,'{}','{}'),
	('lcn',11,'boss','Don',3500,'{}','{}')
;
