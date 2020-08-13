-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2020 at 08:18 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opticadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id_address` int(3) NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `pis` varchar(20) NOT NULL,
  `porta` varchar(4) NOT NULL,
  `ciutat` varchar(100) NOT NULL,
  `codi_postal` int(5) NOT NULL,
  `pais` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id_address`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`) VALUES
(1, 'Av. Paral·lel', '93', '2n', '1B', 'Barcelona', 8004, 'Espanya'),
(2, 'C. Aragó', '15', '3', 'A', 'Barcelona', 8015, 'Espanya'),
(3, 'c. Mallorca', '105', '1', '1', 'Barcelona', 8029, 'Espanya');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(3) NOT NULL,
  `marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id_brand`, `marca`) VALUES
(1, 'Ray-Ban'),
(2, 'Vogue'),
(3, 'Andy Wolfe');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adr_postal` varchar(100) NOT NULL,
  `telefon` int(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` date NOT NULL,
  `recomanat_per` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `adr_postal`, `telefon`, `email`, `data_registre`, `recomanat_per`) VALUES
(1, 'Yago Godoy', '08760 Martorell, Barcelona', 936585754, 'yago@mail.com', '0000-00-00', NULL),
(2, 'Clemente Caro', '08038 Barcelona, Barcelona', 936212728, 'clemente@mail.com', '0000-00-00', '1'),
(3, 'Gloria Lozano', '08018 Barcelona, Barcelona', 963494340, 'gloria@mail.com', '2020-08-03', 'NULL'),
(4, 'Lidia Linares', '08213 Polinyà, Barcelona', 963848387, 'lidia@mail.com', '2020-06-11', '2');

-- --------------------------------------------------------

--
-- Table structure for table `client_nou`
--

CREATE TABLE `client_nou` (
  `id_client` int(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adr_postal` varchar(100) NOT NULL,
  `telefon` int(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` date NOT NULL,
  `recomanat_per` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_nou`
--

INSERT INTO `client_nou` (`id_client`, `nom`, `adr_postal`, `telefon`, `email`, `data_registre`, `recomanat_per`) VALUES
(1, 'Yago Godoy', '08760 Martorell, Barcelona', 936585754, 'yago@mail.com', '0000-00-00', NULL),
(2, 'Clemente Caro', '08038 Barcelona, Barcelona', 936212728, 'clemente@mail.com', '0000-00-00', '1'),
(3, 'Gloria Lozano', '08018 Barcelona, Barcelona', 963494340, 'gloria@mail.com', '2020-08-03', 'NULL'),
(4, 'Lidia Linares', '08213 Polinyà, Barcelona', 963848387, 'lidia@mail.com', '2020-06-11', '2');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(3) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id_employee`, `nom`) VALUES
(1, 'Chloe Hinojosa'),
(2, 'Marcel Canto'),
(3, 'Alexis Llamas');

-- --------------------------------------------------------

--
-- Table structure for table `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(3) NOT NULL,
  `id_brand` int(3) NOT NULL,
  `id_supplier` int(3) NOT NULL,
  `vidre_grad_dret` varchar(4) NOT NULL,
  `vidre_grad_esq` varchar(4) NOT NULL,
  `muntura` set('flotant','pasta','metàl·lica','') NOT NULL,
  `muntura_color` varchar(50) NOT NULL,
  `vidre_color_dret` varchar(50) NOT NULL,
  `vidre_color_esqu` varchar(50) NOT NULL,
  `preu` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `id_brand`, `id_supplier`, `vidre_grad_dret`, `vidre_grad_esq`, `muntura`, `muntura_color`, `vidre_color_dret`, `vidre_color_esqu`, `preu`) VALUES
(1, 3, 1, '-0,5', '-0,2', 'pasta', 'Verd', 'Marró', 'Marró', '50.00'),
(2, 2, 2, '2', '1,5', 'metàl·lica', 'Blava', 'Negre', 'Negre', '82.00'),
(3, 3, 3, '3,5', '3', 'flotant', 'Negra', 'Gris', 'Gris', '75.00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id_client` int(3) NOT NULL,
  `id_glasses` int(3) NOT NULL,
  `id_employee` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id_client`, `id_glasses`, `id_employee`) VALUES
(1, 2, 1),
(4, 2, 1),
(3, 1, 2),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `id_address` int(3) NOT NULL,
  `telefon` int(10) NOT NULL,
  `fax` int(20) NOT NULL,
  `NIF` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nom`, `id_address`, `telefon`, `fax`, `NIF`) VALUES
(1, 'RayB', 1, 935874133, 998455879, '17110526K'),
(2, 'Vog', 2, 936550024, 2057914721, '09219041C'),
(3, 'Wolf', 3, 936023941, 1939586289, '85720107G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id_address`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `recomanat_per` (`recomanat_per`);

--
-- Indexes for table `client_nou`
--
ALTER TABLE `client_nou`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `recomanat_per` (`recomanat_per`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `id_brand` (`id_brand`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id_client`,`id_glasses`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_glasses` (`id_glasses`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_address` (`id_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id_address` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_nou`
--
ALTER TABLE `client_nou`
  MODIFY `id_client` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_nou`
--
ALTER TABLE `client_nou`
  ADD CONSTRAINT `client_nou_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_nou_ibfk_2` FOREIGN KEY (`recomanat_per`) REFERENCES `client` (`recomanat_per`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id_brand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`id_glasses`) REFERENCES `glasses` (`id_glasses`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_address`) REFERENCES `address` (`id_address`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
