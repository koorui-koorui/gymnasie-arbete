-- phpMyAdmin SQL Dump
-- version 5.2.3deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 13, 2026 at 02:10 PM
-- Server version: 8.4.11-0ubuntu0.26.04.1
-- PHP Version: 8.5.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restauranghost`
--

-- --------------------------------------------------------

--
-- Table structure for table `bokning`
--

CREATE TABLE `bokning` (
  `bokningsid` int NOT NULL,
  `kundid` int NOT NULL,
  `datum` date NOT NULL,
  `tid` time NOT NULL,
  `gäster` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `bordid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bord`
--

CREATE TABLE `bord` (
  `bordid` int NOT NULL,
  `restaurangid` int NOT NULL,
  `säten` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kund`
--

CREATE TABLE `kund` (
  `kundid` int NOT NULL,
  `namn` text,
  `epost` varchar(255) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurang`
--

CREATE TABLE `restaurang` (
  `restaurangid` int NOT NULL,
  `namn` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `restaurang`
--

INSERT INTO `restaurang` (`restaurangid`, `namn`, `adress`, `phone`) VALUES
(1, 'bella pizza', 'Storgatan 10, Södertälje', '081234567'),
(2, 'kevins pizza', 'Storgatan 10, Södertälje', '081234567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bokning`
--
ALTER TABLE `bokning`
  ADD PRIMARY KEY (`bokningsid`),
  ADD KEY `fk_bokning_1_idx` (`kundid`),
  ADD KEY `fk_bokning_2_idx` (`bordid`);

--
-- Indexes for table `bord`
--
ALTER TABLE `bord`
  ADD PRIMARY KEY (`bordid`),
  ADD KEY `index2` (`restaurangid`);

--
-- Indexes for table `kund`
--
ALTER TABLE `kund`
  ADD PRIMARY KEY (`kundid`),
  ADD UNIQUE KEY `epost_UNIQUE` (`epost`);

--
-- Indexes for table `restaurang`
--
ALTER TABLE `restaurang`
  ADD PRIMARY KEY (`restaurangid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bokning`
--
ALTER TABLE `bokning`
  MODIFY `bokningsid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bord`
--
ALTER TABLE `bord`
  MODIFY `bordid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kund`
--
ALTER TABLE `kund`
  MODIFY `kundid` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurang`
--
ALTER TABLE `restaurang`
  MODIFY `restaurangid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bokning`
--
ALTER TABLE `bokning`
  ADD CONSTRAINT `fk_bokning_1` FOREIGN KEY (`kundid`) REFERENCES `kund` (`kundid`),
  ADD CONSTRAINT `fk_bokning_2` FOREIGN KEY (`bordid`) REFERENCES `bord` (`bordid`);

--
-- Constraints for table `bord`
--
ALTER TABLE `bord`
  ADD CONSTRAINT `fk_bord` FOREIGN KEY (`restaurangid`) REFERENCES `restaurang` (`restaurangid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
