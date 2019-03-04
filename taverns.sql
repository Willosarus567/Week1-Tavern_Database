-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2019 at 05:19 AM
-- Server version: 5.7.21-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taverns`
--

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `building_id` int(11) NOT NULL,
  `building_name` varchar(40) NOT NULL,
  `floors` int(11) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `rat_id` int(11) DEFAULT NULL,
  `street_address` varchar(30) DEFAULT NULL,
  `state_initials` varchar(2) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `expenses` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`building_id`, `building_name`, `floors`, `employees`, `supervisor_id`, `rat_id`, `street_address`, `state_initials`, `supplier_id`, `expenses`) VALUES
(1, 'Crafty Time Eatery', 2, 6, 2, 1, '1210 Chestnut St. 19019', 'PA', 1, '600000'),
(2, 'NightOwl Brewpub', 3, 4, 3, 2, '671 Crestmont Ave. 19019', 'PA', 2, '610000'),
(3, 'Naughty Jester Bar & Grill', 3, 1, NULL, 3, '123 Sansom St. 19019', 'PA', 3, '611320'),
(4, 'Intoxicant Emporium', 4, 0, NULL, 4, '2500 Chaddwick St. 19019', 'PA', 4, '500000'),
(5, 'Velvet Lantern', 3, 0, NULL, 5, '200 Church St. 19019', 'PA', 5, '450000'),
(6, 'Wandering Anchor Drinkery', 2, 0, NULL, 6, '26 13th St. 19019', 'PA', 6, '480000');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `decription` varchar(40) DEFAULT NULL,
  `income` decimal(10,0) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `birth_date`, `gender`, `role`, `decription`, `income`, `building_id`, `owner_id`, `supervisor_id`) VALUES
(1, 'John', 'Hughes', '1992-03-10', 'Male', 'bartender', 'serves drinks & takes orders', '35000', 1, NULL, NULL),
(2, 'Bob', 'Johnson', '1983-10-29', 'Male', 'supervisor', 'manages the employees on site', '48000', 1, NULL, 2),
(3, 'Liz', 'Barry', '1993-05-27', 'Female', 'bartender', 'serves drinks & takes orders', '35001', 1, NULL, NULL),
(4, 'Anna', 'Krevansky', '1990-08-27', 'Female', 'bartender', 'serves drinks & takes orders', '37000', 1, NULL, NULL),
(5, 'Jon', 'Taffer', '1973-09-30', 'Male', 'owner', 'manages all properties', '300000', 3, 1, NULL),
(6, 'Phillip', 'DeFranco', '1989-02-28', 'Male', 'line cook', 'prepares and cooks food', '45000', 1, NULL, NULL),
(7, 'Frank', 'Horrigan', '1990-04-15', 'Male', 'line cook', 'prepares and cooks food', '42000', 1, NULL, NULL),
(8, 'Jess', 'DelVecchi', '1993-03-18', 'Female', 'bartender', 'serves drinks & takes order', '35000', 2, NULL, NULL),
(9, 'Nicole', 'OHara', '1991-12-13', 'Female', 'bartender', 'servers drinks & takes orders', '33090', 2, NULL, NULL),
(10, 'Samantha', 'Maxwell', '1991-10-29', 'Female', 'line cook', 'prepares and cooks food', '36000', 2, NULL, NULL),
(11, 'Vick', 'Dandy', '1988-11-12', 'Male', 'supervisor', 'manages the employees on site', '48000', 2, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `building_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `first_name`, `last_name`, `building_name`) VALUES
(1, 'Jon', 'Taffer', '3');

-- --------------------------------------------------------

--
-- Table structure for table `rats`
--

CREATE TABLE `rats` (
  `rat_id` int(11) NOT NULL,
  `rat_name` varchar(20) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rats`
--

INSERT INTO `rats` (`rat_id`, `rat_name`, `building_id`) VALUES
(1, 'Pinky', 1),
(2, 'The Brain', 2),
(3, 'Franklin', 3),
(4, 'Gargantulous', 4),
(5, 'GigaBites', 5),
(6, 'Jubille', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `service_name` varchar(60) DEFAULT NULL,
  `service_status` varchar(10) DEFAULT NULL,
  `building_name` varchar(60) DEFAULT NULL,
  `amount_recieved` decimal(10,0) DEFAULT NULL,
  `customer_occupancy` int(11) DEFAULT NULL,
  `date_recieved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `service_name`, `service_status`, `building_name`, `amount_recieved`, `customer_occupancy`, `date_recieved`) VALUES
(1, 'beverage industry consultation', 'active', 'Naughty Jester Bar & Grill', '300', 33, '2019-07-11'),
(2, 'yeast cultivation & culturing', 'active', 'Intoxicant Emporium', '150', 0, '2019-01-04'),
(3, 'rockbottom life advice', 'active', 'Crafty Time Eatery', '0', 40, '2019-08-10'),
(4, 'catering', 'active', 'NightOwl Brewpub', '210', 82, '2019-12-24'),
(5, 'room rentals', 'active', 'NightOwl Brewpub', '120', 82, '2019-12-24'),
(6, 'Beverage sale: double stack honey mead', 'active', 'Crafty Time Eatery', '14', 40, '2019-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(40) DEFAULT NULL,
  `service_price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_price`) VALUES
(1, 'yeast cultivation & culturing', '75'),
(2, 'beverage industry consultation', '50'),
(3, 'room rentals', '40'),
(4, 'catering', '70'),
(5, 'Rockbottom life advice', '0'),
(6, 'Beverage sale', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(40) DEFAULT NULL,
  `brewing_supplies` varchar(40) DEFAULT NULL,
  `utility_supplies` varchar(40) DEFAULT NULL,
  `date_purchased` date DEFAULT NULL,
  `brewing_supplies_expense` decimal(10,0) DEFAULT NULL,
  `utility_supplies_expense` decimal(10,0) DEFAULT NULL,
  `building_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`supplier_id`, `supplier_name`, `brewing_supplies`, `utility_supplies`, `date_purchased`, `brewing_supplies_expense`, `utility_supplies_expense`, `building_id`) VALUES
(1, 'HBC 342', 'hops', NULL, '2019-03-03', '100000', '0', 4),
(2, 'Northern Brewery', 'tank fermenter', 'Industrial cleaners', '2019-03-03', '8000', '300', 4),
(3, 'Master Brewer', 'distilling coils', 'paper products', '2019-02-17', '5000', '1000', 4),
(4, 'Kegerator', 'stainless steel doors', 'paint & rust remover', '2019-01-12', '3000', '1500', 4),
(5, 'Rapids Inc.', 'faucet rack with handles', NULL, '2019-01-03', '5800', '0', 4),
(6, 'Brewtech LLC.', 'distilling circutry boards', 'condensed air cans', '2019-02-23', '17000', '60', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`,`building_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `rats`
--
ALTER TABLE `rats`
  ADD PRIMARY KEY (`rat_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`supplier_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
