CREATE TABLE `pets` (
	`identifier` VARCHAR(40) NOT NULL,
	`pet_handler` INT NULL DEFAULT 0,
	`pet` VARCHAR(26) NULL DEFAULT NULL,
	`pet_name` VARCHAR(16) NULL DEFAULT NULL,
	`pet_age` INT NULL DEFAULT 0,
	`pet_hunger` INT NULL DEFAULT 0,

   `in_vehicle` VARCHAR(16) NULL DEFAULT 'false',
	`following` VARCHAR(16) NULL DEFAULT 'false',
	`attacking` VARCHAR(16) NULL DEFAULT 'false',
	`ped_attacked` VARCHAR(16) NULL DEFAULT NULL,

	PRIMARY KEY (`identifier`)
);

ALTER TABLE `users`
	ADD COLUMN `is_riding` VARCHAR(16) NULL DEFAULT NULL
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('sausage', 'Sausage', 1),
	('croquettes', 'Croquettes', 1)
;