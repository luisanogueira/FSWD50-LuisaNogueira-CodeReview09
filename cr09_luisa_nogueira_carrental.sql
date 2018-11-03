-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2018 às 11:20
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_luisa_nogueira_carrental`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `additional`
--

CREATE TABLE `additional` (
  `additional_id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `additional`
--

INSERT INTO `additional` (`additional_id`, `type`, `price`, `fk_car_id`) VALUES
(100, 'GPS', 5, 444),
(101, 'insurance', 18, 555);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_price_day` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cars`
--

INSERT INTO `cars` (`car_id`, `car_price_day`, `fk_location_id`) VALUES
(444, 20, 90),
(555, 35, 10),
(666, 20, 80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `car_info`
--

CREATE TABLE `car_info` (
  `car_info_id` int(11) NOT NULL,
  `color` varchar(55) NOT NULL,
  `model` varchar(55) NOT NULL,
  `d_purchase` date NOT NULL,
  `horsepower` int(11) NOT NULL,
  `description` varchar(55) NOT NULL,
  `fk_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `car_info`
--

INSERT INTO `car_info` (`car_info_id`, `color`, `model`, `d_purchase`, `horsepower`, `description`, `fk_car_id`) VALUES
(9990, 'green', 'Honda Clarity', '2017-06-14', 200, '', 444),
(9991, 'yellow', 'Volkswagen Tiguan', '2018-08-24', 180, '', 666);

-- --------------------------------------------------------

--
-- Estrutura da tabela `car_manufacturer`
--

CREATE TABLE `car_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `m_name` varchar(55) NOT NULL,
  `fk_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `car_manufacturer`
--

INSERT INTO `car_manufacturer` (`manufacturer_id`, `m_name`, `fk_employee_id`) VALUES
(1010, 'Volkswagen', 465),
(2020, 'Audi', 987);

-- --------------------------------------------------------

--
-- Estrutura da tabela `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `customer_email` varchar(55) NOT NULL,
  `customer_phone` int(11) NOT NULL,
  `driver_license` int(11) NOT NULL,
  `customer_country` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_phone`, `driver_license`, `customer_country`) VALUES
(123, 'Martin Goff', 'martin@gmail.com', 2147483647, 56767444, 'United Kingdom'),
(456, 'Leandra Frank', 'lfrank@gmail.com', 6022556, 24432432, 'Italy'),
(789, 'Hedda Moon', 'heddam@gmail.com', 8316585, 454565665, 'Spain');

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `emp_name` varchar(55) NOT NULL,
  `position` varchar(55) NOT NULL,
  `fk_company_id` int(11) NOT NULL,
  `fk_manufacturer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `employee`
--

INSERT INTO `employee` (`employee_id`, `emp_name`, `position`, `fk_company_id`, `fk_manufacturer_id`) VALUES
(233, 'Julia Robert', 'manager', 600, 1010),
(344, 'Peter Brown', 'salesman', 600, 2020),
(465, 'Rhonda Jones', 'mechanic', 600, 1010),
(987, 'Keith Seln', 'salesman', 600, 2020);

-- --------------------------------------------------------

--
-- Estrutura da tabela `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `extra_costs` int(11) NOT NULL,
  `card_num` bigint(20) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `fk_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `extra_costs`, `card_num`, `invoice_date`, `fk_reservation_id`) VALUES
(404, 18, 898920001222, '2018-11-02 08:34:42', 200),
(405, 0, 122200034445, '2018-10-24 17:12:05', 300);

-- --------------------------------------------------------

--
-- Estrutura da tabela `location_info`
--

CREATE TABLE `location_info` (
  `ZIP_code` int(11) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) NOT NULL,
  `country` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `location_info`
--

INSERT INTO `location_info` (`ZIP_code`, `city`, `state`, `country`) VALUES
(1000222, 'Barcelona', 'Barcelona', 'Spain'),
(1200900, 'Paris', 'Île-de-France', 'France');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rental_company`
--

CREATE TABLE `rental_company` (
  `company_id` int(11) NOT NULL,
  `com_name` varchar(55) NOT NULL,
  `com_website` varchar(55) NOT NULL,
  `fk_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rental_company`
--

INSERT INTO `rental_company` (`company_id`, `com_name`, `com_website`, `fk_employee_id`) VALUES
(600, 'Rental Holiday', 'rentforholiday.com', 233);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rental_location`
--

CREATE TABLE `rental_location` (
  `location_id` int(11) NOT NULL,
  `loc_address` varchar(55) NOT NULL,
  `loc_phone` int(11) NOT NULL,
  `loc_email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rental_location`
--

INSERT INTO `rental_location` (`location_id`, `loc_address`, `loc_phone`, `loc_email`) VALUES
(10, 'West Glenlake Lane 22', 909888333, 'barcelona@carrent.com'),
(14, 'Villa Park 784', 909888333, 'paris@carrent.com'),
(80, 'Griffin Street 10', 909888000, 'london@carrent.com'),
(90, 'Greenrose Dr.  Wantagh 8905', 909888455, 'dublin@carrent.com'),
(92, 'San Juan Ave. Fresh Meadows 741', 909888455, 'madrid@carrent.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `price_€` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `fk_location_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `price_€`, `discount`, `fk_location_id`, `fk_customer_id`, `fk_car_id`) VALUES
(200, 250, 5, 14, 123, 555),
(300, 280, 10, 80, 456, 666);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservation_info`
--

CREATE TABLE `reservation_info` (
  `r_info_id` int(11) NOT NULL,
  `d_pickup` date NOT NULL,
  `time_pickup` time NOT NULL,
  `d_return` date NOT NULL,
  `time_return` time NOT NULL,
  `fk_reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reservation_info`
--

INSERT INTO `reservation_info` (`r_info_id`, `d_pickup`, `time_pickup`, `d_return`, `time_return`, `fk_reservation_id`) VALUES
(201, '2018-10-18', '09:00:00', '2018-10-30', '09:30:00', 200),
(302, '2018-11-14', '10:00:00', '2018-11-21', '10:00:00', 300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional`
--
ALTER TABLE `additional`
  ADD PRIMARY KEY (`additional_id`),
  ADD KEY `fk_car_id2` (`fk_car_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_location_id2` (`fk_location_id`);

--
-- Indexes for table `car_info`
--
ALTER TABLE `car_info`
  ADD PRIMARY KEY (`car_info_id`),
  ADD KEY `fk_car_id3` (`fk_car_id`);

--
-- Indexes for table `car_manufacturer`
--
ALTER TABLE `car_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_manufacturer_id` (`fk_manufacturer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id0` (`fk_reservation_id`);

--
-- Indexes for table `rental_company`
--
ALTER TABLE `rental_company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_employee_id2` (`fk_employee_id`);

--
-- Indexes for table `rental_location`
--
ALTER TABLE `rental_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `reservation_info`
--
ALTER TABLE `reservation_info`
  ADD PRIMARY KEY (`r_info_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `additional`
--
ALTER TABLE `additional`
  ADD CONSTRAINT `fk_car_id2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Limitadores para a tabela `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `fk_location_id2` FOREIGN KEY (`fk_location_id`) REFERENCES `rental_location` (`location_id`);

--
-- Limitadores para a tabela `car_info`
--
ALTER TABLE `car_info`
  ADD CONSTRAINT `fk_car_id3` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Limitadores para a tabela `car_manufacturer`
--
ALTER TABLE `car_manufacturer`
  ADD CONSTRAINT `fk_employee_id` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Limitadores para a tabela `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_company_id` FOREIGN KEY (`fk_company_id`) REFERENCES `rental_company` (`company_id`),
  ADD CONSTRAINT `fk_manufacturer_id` FOREIGN KEY (`fk_manufacturer_id`) REFERENCES `car_manufacturer` (`manufacturer_id`);

--
-- Limitadores para a tabela `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_reservation_id0` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Limitadores para a tabela `rental_company`
--
ALTER TABLE `rental_company`
  ADD CONSTRAINT `fk_employee_id2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Limitadores para a tabela `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_car_id` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_location_id` FOREIGN KEY (`fk_location_id`) REFERENCES `rental_location` (`location_id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `reservation_info`
--
ALTER TABLE `reservation_info`
  ADD CONSTRAINT `fk_reservation_id` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
