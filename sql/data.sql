USE demo;

/* Add supers */
INSERT INTO `supers` (`name`, `type`, `rescues`, `mentor`, `startDate`, `endDate`)
VALUES
	('Batman','H',192,6,'1997-01-01 00:00:00','2021-02-17 00:00:00'),
	('Superman','H',257,NULL,'1998-01-01 00:00:00','2021-02-17 00:00:00'),
	('Wonder Woman','H',212,NULL,'1985-01-01 00:00:00','2021-02-17 00:00:00'),
	('Robin/Nightwing','H',127,1,'2008-01-01 00:00:00','2021-02-17 00:00:00'),
	('Gar Logan','H',59,NULL,'2017-01-01 00:00:00','2021-02-17 00:00:00'),
	("Ra's Ah Ghul",'V',3,NULL,'1990-06-01 00:00:00','2021-02-17 00:00:00'),
	('The Punisher','V',37,NULL,'2003-01-01 00:00:00','2021-02-17 00:00:00'),
    ('The Flash','H',297,NULL,'2001-01-01 00:00:00','2021-02-17 00:00:00'),
    ('Kid Flash','H',61,NULL,'2018-01-01 00:00:00','2021-02-17 00:00:00'),
	('Catwoman','V',43,NULL,'1998-01-01 00:00:00','2021-02-17 00:00:00');

/* Add teams */
INSERT INTO `teams` (`name`)
VALUES
    ('Justice Society of America'),
	('Justice League of America'),
	('Teen Titans');

/* Add supers to teams */
INSERT INTO `supersteams` (`superid`, `teamid`)
VALUES
	(1,2),
	(2,2),
	(3,2),
	(4,2),
	(4,3),
	(5,3),
    (8,1),
    (8,2),
    (9,3);


/* mariadb --host transactions-1.mdb0001390.db.skysql.net --port 5002 --user DB00003108 -p'E30W9,614oI6/8s1pn7Vl8' --ssl-ca ~/Downloads/skysql_chain.pem < schema.sql */