-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 10:41 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dough_chateau`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `full_name`, `phone`, `email`) VALUES
(1, 'eborgard', 'Emma Borgard', '1-234-5678', 'eborgard@email.com'),
(2, 'sbraun', 'Sierra Braun', '1-987-6543', 'sbraun@email.com'),
(3, 'sjaegly', 'Sophia Jaegly', '1-456-2347', 'sjaegly@email.com'),
(4, 'mmerriw', 'Myah Merriweather', '1-543-2346', 'mmerriw@email.com'),
(5, 'abenfer', 'Aaron Benfer', '1-324-2564', 'abenfer@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`) VALUES
(1, 5, '2020-11-11'),
(2, 3, '2020-11-09'),
(3, 2, '2020-11-04'),
(4, 4, '2020-11-11'),
(5, 1, '2020-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `list_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `list_price`) VALUES
(1, 4, 1, '3.99'),
(2, 2, 1, '3.99'),
(3, 1, 2, '5.12'),
(4, 5, 1, '2.99'),
(5, 3, 2, '3.98');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `allergens` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `allergens`, `price`, `description`) VALUES
(1, 'Butter Croissant', 'wheat', '2.56', 'This classic croissant is made with vegan butter to create a golden, crunchy top with soft, flaky layers inside.'),
(2, 'Baklava', 'wheat, nuts', '3.99', 'Baklava is a rich, sweet dessert pastry made of layers of filo filled with chopped nuts and sweetened and held together with syrup, frosting or honey.'),
(3, 'Lemon Square', 'wheat', '1.99', 'These vegan lemon bars are the best ever. Tangy, sweet and lemony with a shortbread crust and a filling that tastes like lemon meringue pie!'),
(4, 'Coffee Cake', 'soy, wheat', '3.99', 'Our ever-popular coffee cake—with its swirled cinnamon-sugar blend and finished with a crunchy streusel topping—pairs well with your favorite beverage and a few quiet moments. We''re big fans!'),
(5, 'Blueberry Muffin', 'soy, wheat', '2.99', 'This delicious muffin is dotted throughout with sweet, juicy blueberries and a hint of lemon and dusted on top with sugar for a delightfully crunchy texture.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_items` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
