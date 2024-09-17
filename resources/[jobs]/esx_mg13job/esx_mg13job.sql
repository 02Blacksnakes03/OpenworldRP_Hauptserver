USE `paradise_hauptserver`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mg13', 'MG13', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mg13', 'MG13', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mg13', 'MG13', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mg13','MG13')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mg13',0,'recruit','Novato',3000,'{}','{}'),
	('mg13',1,'officer','Miembro',3000,'{}','{}'),
	('mg13',2,'sergeant','Sicario',3000,'{}','{}'),
	('mg13',3,'boss','La Mano Derecha',3000,'{}','{}'),
	('mg13',4,'boss','El Cabeza',3000,'{}','{}'),
	('mg13',4,'boss','Patron',3000,'{}','{}')
;

