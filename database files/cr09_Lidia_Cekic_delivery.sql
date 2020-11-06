-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 06. Nov 2020 um 17:50
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_Lidia_Cekic_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_Lidia_Cekic_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_Lidia_Cekic_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `address`
--

CREATE TABLE `address` (
  `address_id` smallint(5) NOT NULL,
  `country` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `house_nr` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `address`
--

INSERT INTO `address` (`address_id`, `country`, `city`, `street`, `house_nr`) VALUES
(1, 'Austria', 'Vienna', 'musterdrop', 21),
(2, 'Austria', 'Vienna', 'musterdrop', 21),
(3, 'Austria', 'Graz', 'musterpick', 32),
(4, 'Austria', 'Graz', 'musterpick', 32),
(5, 'Austria', 'Vienna', 'musterCustom', 42),
(6, 'Austria', 'Graz', 'musterCustom', 5),
(7, 'Austria', 'Vienna', 'musterCustom', 42),
(8, 'Austria', 'Graz', 'musterCustom', 5),
(9, 'Austria', 'Vienna', 'musterrecipient', 3),
(10, 'Austria', 'Graz', 'musterrecipient', 6),
(11, 'Austria', 'Vienna', 'musterrecipient', 3),
(12, 'Austria', 'Graz', 'musterrecipient', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` smallint(5) NOT NULL,
  `fk_customer_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `company`
--

INSERT INTO `company` (`company_id`, `fk_customer_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` smallint(5) NOT NULL,
  `fk_name_id` smallint(5) NOT NULL,
  `fk_address_id` smallint(5) NOT NULL,
  `fk_drop_pick_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_name_id`, `fk_address_id`, `fk_drop_pick_id`) VALUES
(1, 1, 8, 4),
(2, 2, 7, 1),
(3, 3, 6, 2),
(4, 4, 5, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drop_pick`
--

CREATE TABLE `drop_pick` (
  `drop_pick_id` smallint(5) NOT NULL,
  `pick_or_drop` enum('pick up','drop off') NOT NULL,
  `fk_address_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `drop_pick`
--

INSERT INTO `drop_pick` (`drop_pick_id`, `pick_or_drop`, `fk_address_id`) VALUES
(1, 'drop off', 1),
(2, 'pick up', 2),
(3, 'pick up', 3),
(4, 'pick up', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` smallint(5) NOT NULL,
  `fk_name_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_name_id`) VALUES
(1, 5),
(2, 6),
(3, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name`
--

CREATE TABLE `name` (
  `name_id` smallint(5) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `name`
--

INSERT INTO `name` (`name_id`, `firstname`, `lastname`) VALUES
(1, 'Lisa', 'Gruber'),
(2, 'Jenny', 'Penny'),
(3, 'Ginger', 'Binger'),
(4, 'Kim', 'Kimas'),
(5, 'paul', 'lauson'),
(6, 'mario', 'mitter'),
(7, 'marion', 'bubi'),
(8, 'jenny', 'geisa'),
(9, 'Manuela', 'Dauer'),
(10, 'Phillip', 'Schantl'),
(11, 'Julian', 'Lechner'),
(12, 'Lisa', 'Gruber');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` smallint(5) NOT NULL,
  `weight` int(11) NOT NULL,
  `category` enum('A','B','C') DEFAULT NULL,
  `date_of_deposit` date NOT NULL,
  `time_of_deposit` time DEFAULT NULL,
  `fk_customer_id` smallint(5) NOT NULL,
  `fk_employee_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `weight`, `category`, `date_of_deposit`, `time_of_deposit`, `fk_customer_id`, `fk_employee_id`) VALUES
(1, 132, 'A', '2020-11-02', '19:02:53', 1, 1),
(2, 522, 'A', '2020-10-14', '22:02:53', 2, 2),
(3, 42, 'B', '2020-09-07', '10:04:13', 3, 3),
(4, 20, 'C', '2020-10-20', '09:04:13', 4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing`
--

CREATE TABLE `processing` (
  `processing_id` smallint(5) NOT NULL,
  `fk_package_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `processing`
--

INSERT INTO `processing` (`processing_id`, `fk_package_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` smallint(5) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `time_of_delivery` time DEFAULT NULL,
  `fk_address_id` smallint(5) NOT NULL,
  `fk_name_id` smallint(5) NOT NULL,
  `fk_package_id` smallint(5) NOT NULL,
  `fk_processing_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `date_of_delivery`, `time_of_delivery`, `fk_address_id`, `fk_name_id`, `fk_package_id`, `fk_processing_id`) VALUES
(1, '2020-11-04', '14:33:33', 11, 11, 3, 3),
(2, '2020-11-04', '10:44:24', 12, 12, 4, 4),
(3, '2020-11-21', '12:46:40', 10, 10, 2, 2),
(4, '2020-11-10', '08:46:40', 9, 9, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_name_id` (`fk_name_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_drop_pick_id` (`fk_drop_pick_id`);

--
-- Indizes für die Tabelle `drop_pick`
--
ALTER TABLE `drop_pick`
  ADD PRIMARY KEY (`drop_pick_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_name_id` (`fk_name_id`);

--
-- Indizes für die Tabelle `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`name_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`processing_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_name_id` (`fk_name_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_processing_id` (`fk_processing_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `address`
--
ALTER TABLE `address`
  MODIFY `address_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `company`
--
ALTER TABLE `company`
  MODIFY `company_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `drop_pick`
--
ALTER TABLE `drop_pick`
  MODIFY `drop_pick_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `name`
--
ALTER TABLE `name`
  MODIFY `name_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `processing`
--
ALTER TABLE `processing`
  MODIFY `processing_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `recipient_id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_name_id`) REFERENCES `name` (`name_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_drop_pick_id`) REFERENCES `drop_pick` (`drop_pick_id`);

--
-- Constraints der Tabelle `drop_pick`
--
ALTER TABLE `drop_pick`
  ADD CONSTRAINT `drop_pick_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_name_id`) REFERENCES `name` (`name_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_name_id`) REFERENCES `name` (`name_id`),
  ADD CONSTRAINT `recipient_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `recipient_ibfk_4` FOREIGN KEY (`fk_processing_id`) REFERENCES `processing` (`processing_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
