-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 13. Jan 2024 um 13:48
-- Server-Version: 5.7.39
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `GC`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `altersfreigabe`
--

CREATE TABLE `altersfreigabe` (
  `id` int(11) NOT NULL,
  `alter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `altersfreigabe`
--

INSERT INTO `altersfreigabe` (`id`, `alter`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entwickler`
--

CREATE TABLE `entwickler` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entwickler`
--

INSERT INTO `entwickler` (`id`, `name`) VALUES
(1, 'Entwickler 1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `konsole`
--

CREATE TABLE `konsole` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `konsole`
--

INSERT INTO `konsole` (`id`, `name`) VALUES
(1, 'Playstation 1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`id`, `name`) VALUES
(1, 'Publisher 1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `spiele`
--

CREATE TABLE `spiele` (
  `id` int(11) NOT NULL,
  `cover` text,
  `name` varchar(255) DEFAULT NULL,
  `konsole` int(11) DEFAULT NULL,
  `kopien` int(11) DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `entwickler` int(11) DEFAULT NULL,
  `sprache` int(11) DEFAULT NULL,
  `altersfreigabe` int(11) DEFAULT NULL,
  `produktcode` varchar(255) DEFAULT NULL,
  `eanbarcode` varchar(255) DEFAULT NULL,
  `erscheinungsjahr` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `spiele`
--

INSERT INTO `spiele` (`id`, `cover`, `name`, `konsole`, `kopien`, `publisher`, `entwickler`, `sprache`, `altersfreigabe`, `produktcode`, `eanbarcode`, `erscheinungsjahr`) VALUES
(1, '', 'Test Spiel', 1, 1, 1, 1, 1, 1, '0', '0', 1999),
(3, NULL, 'Beispiel', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(4, NULL, 'Beispiel', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(5, NULL, 'Beispiel', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(6, NULL, 'Beispiel', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sprache`
--

CREATE TABLE `sprache` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sprache`
--

INSERT INTO `sprache` (`id`, `name`) VALUES
(1, 'DE');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `altersfreigabe`
--
ALTER TABLE `altersfreigabe`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `entwickler`
--
ALTER TABLE `entwickler`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `konsole`
--
ALTER TABLE `konsole`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `spiele`
--
ALTER TABLE `spiele`
  ADD PRIMARY KEY (`id`),
  ADD KEY `konsole` (`konsole`),
  ADD KEY `publisher` (`publisher`),
  ADD KEY `entwickler` (`entwickler`),
  ADD KEY `sprache` (`sprache`),
  ADD KEY `altersfreigabe` (`altersfreigabe`);

--
-- Indizes für die Tabelle `sprache`
--
ALTER TABLE `sprache`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `spiele`
--
ALTER TABLE `spiele`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `spiele`
--
ALTER TABLE `spiele`
  ADD CONSTRAINT `spiele_ibfk_1` FOREIGN KEY (`konsole`) REFERENCES `konsole` (`id`),
  ADD CONSTRAINT `spiele_ibfk_2` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `spiele_ibfk_3` FOREIGN KEY (`entwickler`) REFERENCES `entwickler` (`id`),
  ADD CONSTRAINT `spiele_ibfk_4` FOREIGN KEY (`sprache`) REFERENCES `sprache` (`id`),
  ADD CONSTRAINT `spiele_ibfk_5` FOREIGN KEY (`altersfreigabe`) REFERENCES `altersfreigabe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
