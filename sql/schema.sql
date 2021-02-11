DROP DATABASE IF EXISTS demo;

CREATE DATABASE demo;

USE demo;

CREATE TABLE `supers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT '',
  `rescues` int(11) NOT NULL,
  `mentor` int(11) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  PERIOD FOR `date_period` (`startDate`, `endDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supersteams` (
  `superid` int(11) unsigned NOT NULL,
  `teamid` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `teams` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;