USE `paradise_hauptserver`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_nightshadow', 'Nightshadow', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_nightshadow', 'Nightshadow', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_nightshadow', 'Nightshadow', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('nightshadow','Nightshadow')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('nightshadow',0,'recruit','Driver',1,'{}','{}'),
	('nightshadow',1,'officer','Racer',1,'{}','{}'),
	('nightshadow',2,'sergeant','Hero',1,'{}','{}'),
	('nightshadow',3,'lieutenant','Champion',1,'{}','{}'),
	('nightshadow',4,'boss','Legend',1,'{}','{}')
; 
