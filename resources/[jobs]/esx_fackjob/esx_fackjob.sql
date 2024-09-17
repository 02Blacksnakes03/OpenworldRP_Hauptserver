USE `nextlvl_3`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_fackag', 'fackag', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_fackag', 'fackag', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_fackag', 'fackag', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('fackag','Fack AG')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('fackag',0,'recruit','Recruit',0,'{}','{}'),
	('fackag',1,'officer','Promoter',0,'{}','{}'),
	('fackag',2,'sergeant','Employee',0,'{}','{}'),
	('fackag',3,'lieutenant','Head of Department',0,'{}','{}'),
	('fackag',4,'boss','CEO/CFO',0,'{}','{}')
;

