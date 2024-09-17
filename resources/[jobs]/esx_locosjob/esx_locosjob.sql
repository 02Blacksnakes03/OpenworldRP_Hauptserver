USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_locos', 'Locos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_locos', 'Locos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_locos', 'Locos', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('locos','Locos')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
('locos', 0, 'recruit', 'Novato', 5000, '{}', '{}'),
('locos', 1, 'officer', 'Miembro', 5000, '{}', '{}'),
('locos', 2, 'officer', 'Sicario', 5000, '{}', '{}'),
('locos', 3, 'boss', 'La Mano Derecha', 5000, '{}', '{}')
;

