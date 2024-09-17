USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_blackwater', 'Blackwater', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_blackwater', 'Blackwater', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_blackwater', 'Blackwater', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('blackwater','Blackwater')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
('blackwater', 0, 'recruit', 'Soldat', 1, '{}', '{}'),
('blackwater', 1, 'officer', 'Kampfsoldat', 1, '{}', '{}'),
('blackwater', 2, 'officer', 'Killer', 1, '{}', '{}'),
('blackwater', 3, 'officer', 'Elite Killer', 1, '{}', '{}'),
('blackwater', 4, 'officer', 'Jäger', 1, '{}', '{}'),
('blackwater', 5, 'officer', 'Truppenführer', 1, '{}', '{}'),
('blackwater', 6, 'officer', 'Rechte Hand', 1, '{}', '{}'),
('blackwater', 7, 'boss', 'Boss', 1, '{}', '{}')
;

