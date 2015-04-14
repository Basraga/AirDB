-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 14. April 2015 um 09:35
-- Server Version: 5.1.41
-- PHP-Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `airdb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Daten für Tabelle `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`) VALUES
(1, 'manufacturer1'),
(2, 'manufacturer2'),
(3, 'manufacturer3'),
(4, 'manufacturer4'),
(5, 'manufacturer5');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `crew_count` int(11) NOT NULL,
  `seat-count` int(11) NOT NULL,
  `length` double NOT NULL,
  `height` double NOT NULL,
  `wingspan` double NOT NULL,
  `cruisingspeed` double NOT NULL,
  `maxspeed` double NOT NULL,
  `maxrange` int(11) NOT NULL,
  `engines` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Daten für Tabelle `models`
--

INSERT INTO `models` (`id`, `name`, `type`, `crew_count`, `seat-count`, `length`, `height`, `wingspan`, `cruisingspeed`, `maxspeed`, `maxrange`, `engines`) VALUES
(1, 'model1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'engine1'),
(2, 'model2', 1, 2, 2, 2, 2, 2, 2, 2, 2, 'engine2'),
(3, 'model3', 2, 3, 3, 3, 3, 3, 3, 3, 3, 'engine3'),
(4, 'model4', 2, 4, 4, 4, 4, 4, 4, 4, 4, 'engine4'),
(5, 'model5', 3, 5, 5, 5, 5, 5, 5, 5, 5, 'engine5'),
(6, 'model6', 3, 6, 6, 6, 6, 6, 6, 6, 6, 'engine6'),
(7, 'model7', 4, 7, 7, 7, 7, 7, 7, 7, 7, 'engine7'),
(8, 'model8', 4, 8, 8, 8, 8, 8, 8, 8, 8, 'engine8'),
(9, 'model9', 5, 9, 9, 9, 9, 9, 9, 9, 9, 'engine9'),
(10, 'model10', 5, 10, 10, 10, 10, 10, 10, 10, 10, 'engine10'),
(11, 'model11', 6, 11, 11, 11, 11, 11, 11, 11, 11, 'engine11'),
(12, 'model12', 6, 12, 12, 12, 12, 12, 12, 12, 12, 'engine12'),
(13, 'model13', 7, 13, 13, 13, 13, 13, 13, 13, 13, 'engine13'),
(14, 'model14', 7, 14, 14, 14, 14, 14, 14, 14, 14, 'engine14'),
(15, 'model15', 8, 15, 15, 15, 15, 15, 15, 15, 15, 'engine15'),
(16, 'model16', 8, 16, 16, 16, 16, 16, 16, 16, 16, 'engine16'),
(17, 'model17', 9, 17, 17, 17, 17, 17, 17, 17, 17, 'engine17'),
(18, 'model18', 9, 18, 18, 18, 18, 18, 18, 18, 18, 'engine18'),
(19, 'model19', 10, 19, 19, 19, 19, 19, 19, 19, 19, 'engine19'),
(20, 'model20', 10, 20, 20, 20, 20, 20, 20, 20, 20, 'engine20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `manufacturer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Daten für Tabelle `types`
--

INSERT INTO `types` (`id`, `name`, `manufacturer`) VALUES
(1, 'type1', 1),
(2, 'type2', 1),
(3, 'type3', 2),
(4, 'type4', 2),
(5, 'type5', 3),
(6, 'type6', 3),
(7, 'type7', 4),
(8, 'type8', 4),
(9, 'type9', 5),
(10, 'type10', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
