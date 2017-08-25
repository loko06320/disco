USE `essentialmode`;

INSERT INTO `jobs` (name, label) VALUES
  ('disco','Disco')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('disco',0,'barman','Barman',20,'{}','{}'),
  ('disco',1,'videur','Videur',30,'{}','{}'),
  ('disco',2,'dj','DJ',
40,'{}','{}'),
  ('disco',3,'gerant','Gerant',50,'{}','{}'),
  ('disco',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (name, label) VALUES
	('menthe', 'Menthe'),
	('pommedeterre', 'Pomme de terre'),
	('raisin', 'Raisin'),
	('mojito', 'Mojito'),
	('vodka', 'Vodka'),
	('champagne', 'Champagne')
;