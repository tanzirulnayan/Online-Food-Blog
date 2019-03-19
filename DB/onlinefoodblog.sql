-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2019 at 04:12 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

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

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`F_ID`, `F_TITLE`, `F_DESCRIPTION`, `F_IMAGE`, `R_ID`) VALUES
(1, 'Caprese Pasta Salad', 'Hurry, make this one before the good tomatoes are gone! It’s a super simple burst cherry tomato pasta dish with little mozzarella balls, fresh basil and a splash of white balsamic vinegar. It packs well for lunch the next day, too.', '/pictures/image_1552990479254.jpg', 1),
(2, 'Spaghetti Squash Burrito Bowls', 'Hearty burrito bowls made with a base of spaghetti squash. These are such a fun dinner option.', '/pictures/image_1552990683826.jpg', 1),
(3, 'Vegetarian Tortilla Soup', 'Finally! Homemade tortilla soup that’s even better than the restaurant versions I enjoyed before giving up chicken. Posole might be a better name for this soup, but whatever you want to call it, it’s light but filling, spicy and delicious.', '/pictures/image_1552990720818.jpg', 1),
(4, 'Extra Vegetable Fried Rice', '“With more mouths to feed than usual over the holidays, I made this twice in the last 10 days! Both times, I followed the recipe exactly, and it was a huge hit! I used snow peas and red pepper for the 2 cups of extra veggies. Everyone gobbled it up and asked for seconds. Thanks, Kate!” – Emily', '/pictures/image_1552990759590.jpg', 1),
(8, 'BIG KING', 'Our BIG KING™ Burger features two delicious flame-grilled beef patties, topped with melted cheese, freshly cut iceberg lettuce, crisp onions,  crunchy pickles, and secret Big King sauce, all on a warm, toasted, sesame seed tower bun.', '/pictures/image_1552997803494.png', 3),
(9, 'WHOPPER®', 'Our WHOPPER® Sandwich is a ¼ lb* of savory flame-grilled beef topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun. Served with a medium side of piping hot, thick cut French Fries or golden Onion Rings and a small fountain drink of your choice to make it a meal.', '/pictures/image_1552997881437.png', 3),
(10, 'DOUBLE WHOPPER®', 'Our DOUBLE WHOPPER® Sandwich is a pairing of two ¼ lb* savory flame-grilled beef patties topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun.', '/pictures/image_1552997912604.png', 3),
(11, 'DOUBLE CHEESEBURGER', 'Make room for our Double Cheeseburger, two signature flame-grilled beef patties topped with a simple layer of melted American cheese, crinkle cut pickles, yellow mustard, and ketchup on a toasted sesame seed bun.', '/pictures/image_1552997941415.png', 3),
(12, 'THE BIG PHILLY CHEESE STEAK', 'Huge pie cut into 8 extra-large slices topped with tender Philly Steak, mushrooms, red onion and capsicum on a tasty American style cheddar sauce base.', '/pictures/image_1552998719279.png', 4),
(13, 'HALF \'N\' HALF', 'Your choice. Combine any 2 of our delicious pizzas in 1', '/pictures/image_1552998779822.png', 4),
(14, 'THE BIG HAM & PINEAPPLE', 'Huge pie cut into 8 extra-large slices. Authentic soft and foldable New York style dough topped with ham, pineapple and mozzarella', '/pictures/image_1552998817408.png', 4),
(15, 'THE BIG PEPPERONI, SAUSAGE & MUSHROOM', 'Huge pie cut into 8 extra-large slices. Authentic soft and foldable New York style dough topped with pepperoni, pork & fennel sausage, mushrooms and mozzarella', '/pictures/image_1552998854932.png', 4);

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
('jaowat', 'Jaowat Raihan', 'Basundhara', 'jaowat@yahoo.com', '/pictures/image_1553002321267.png');

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
(1, 'Veggie', 'Veggie is a restaurant that serves primarily, or exclusively, health foods, which may include vegetarian, vegan, raw, macrobiotic, organic, and low-fat menu options.', 'Vegan', 'Gulshan', 'VALID', '/pictures/image_1552974714005.jpg'),
(3, 'Burger King', 'Burger King is an American global chain of hamburger fast food restaurants. Headquartered in the unincorporated area of Miami-Dade County, Florida, the company was founded in 1953 as Insta-Burger King, a Jacksonville, Florida–based restaurant chain.', 'Fast Food', 'Basundhara', 'VALID', '/pictures/image_1552997724678.png'),
(4, 'Domino\'s Pizza', 'Domino\'s Pizza, Inc., branded as Domino\'s, is an American pizza restaurant chain founded in 1960. The corporation is headquartered at the Domino\'s Farms Office Park in Ann Arbor, Michigan, and incorporated in Delaware. In February 2018, the chain became the largest pizza seller worldwide in terms of sales.', 'Pizza', 'Dhanmondi', 'VALID', '/pictures/image_1552998522824.jpg');

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
  MODIFY `F_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `food_review`
--
ALTER TABLE `food_review`
  MODIFY `FR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_review`
--
ALTER TABLE `restaurant_review`
  MODIFY `RR_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
