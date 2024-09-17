USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lacamorra', 'Lacamorra', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lacamorra', 'Lacamorra', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lacamorra', 'Lacamorra', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('lacamorra','Lacamorra')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lacamorra',0,'recruit','Parenti',1,'{}','{}'),
	('lacamorra',1,'officer','Soldiers',1,'{}','{}'),
	('lacamorra',2,'sergeant','Camporegime',1,'{}','{}'),
	('lacamorra',3,'lieutenant','Unterboss',1,'{}','{}'),
	('lacamorra',4,'boss','Consigliere',1,'{}','{}'),
	('lacamorra',5,'boss','Boss',1,'{}','{}')
; 

