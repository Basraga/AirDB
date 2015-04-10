-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Apr 2015 um 14:13
-- Server Version: 5.5.32
-- PHP-Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `airdb`
--
CREATE DATABASE IF NOT EXISTS `airdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `airdb`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `model`
--

CREATE TABLE IF NOT EXISTS `model` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manufacturer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
