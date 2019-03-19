-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2019 at 09:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefoodblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `A_ID` varchar(20) NOT NULL,
  `A_NAME` varchar(50) NOT NULL,
  `A_ADDRESS` varchar(50) NOT NULL,
  `A_EMAIL` varchar(50) NOT NULL,
  `A_IMAGE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`A_ID`, `A_NAME`, `A_ADDRESS`, `A_EMAIL`, `A_IMAGE`) VALUES
('nayan', 'Tanzirul Haque Nayan', 'Basundhara', 'nayan@gmail.com', '/pictures/image_1552914959471.png');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `F_ID` int(11) NOT NULL,
  `F_TITLE` varchar(100) NOT NULL,
  `F_DESCRIPTION` text,
  `F_IMAGE` text NOT NULL,
  `R_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `food_review`
--

CREATE TABLE `food_review` (
  `FR_ID` int(11) NOT NULL,
  `FR_TEXT` text NOT NULL,
  `FR_TIME` date NOT NULL,
  `F_ID` int(11) NOT NULL,
  `M_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `M_ID` varchar(20) NOT NULL,
  `M_NAME` varchar(50) NOT NULL,
  `M_ADDRESS` varchar(50) NOT NULL,
  `M_EMAIL` varchar(50) NOT NULL,
  `M_IMAGE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`M_ID`, `M_NAME`, `M_ADDRESS`, `M_EMAIL`, `M_IMAGE`) VALUES
('jaowat', 'Jaowat Raihan', 'Nikunja', 'jaowat@yahoo.com', '/pictures/image_1552915164439.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `R_ID` int(11) NOT NULL,
  `R_NAME` varchar(50) NOT NULL,
  `R_DESCRIPTION` text NOT NULL,
  `R_TYPE` varchar(15) NOT NULL,
  `R_LOCATION` varchar(50) NOT NULL,
  `R_STATUS` varchar(10) NOT NULL,
  `R_IMAGE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`R_ID`, `R_NAME`, `R_DESCRIPTION`, `R_TYPE`, `R_LOCATION`, `R_STATUS`, `R_IMAGE`) VALUES
(1, 'Veggie', 'Veggie is a restaurant that serves primarily, or exclusively, health foods, which may include vegetarian, vegan, raw, macrobiotic, organic, and low-fat menu options.', 'Vegan', 'Banani', 'VALID', '/pictures/image_1552974714005.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_review`
--

CREATE TABLE `restaurant_review` (
  `RR_ID` int(11) NOT NULL,
  `RR_TEXT` text NOT NULL,
  `RR_TIME` date NOT NULL,
  `R_ID` int(11) NOT NULL,
  `U_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `U_ID` varchar(20) NOT NULL,
  `U_PASSWORD` varchar(25) NOT NULL,
  `U_TYPE` varchar(7) NOT NULL,
  `U_STATUS` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`U_ID`, `U_PASSWORD`, `U_TYPE`, `U_STATUS`) VALUES
('jaowat', 'jaowat', 'MEMBER', 'VALID'),
('nayan', 'nayan', 'ADMIN', 'VALID');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`F_ID`);

--
-- Indexes for table `food_review`
--
ALTER TABLE `food_review`
  ADD PRIMARY KEY (`FR_ID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `restaurant_review`
--
ALTER TABLE `restaurant_review`
  ADD PRIMARY KEY (`RR_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`U_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `F_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_review`
--
ALTER TABLE `food_review`
  MODIFY `FR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurant_review`
--
ALTER TABLE `restaurant_review`
  MODIFY `RR_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
