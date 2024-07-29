-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 12:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothingshopcag2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `userid` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`userid`, `name`, `mobile`, `email`) VALUES
(1, 'Luke Fong', '90733462', 'lukefong2006@gmail.com'),
(2, 'Marvell', '999', 'marvell@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productid` int(11) NOT NULL,
  `productname` varchar(60) NOT NULL,
  `productprice` varchar(60) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `productname`, `productprice`, `image`) VALUES
(1, 'Black Hoodie', '200', 'https://seventhstores.com/cdn/shop/products/FlatLay_Black_Hoodie_3_2410dbe3-7fad-421b-b053-4368aa0d192d.png?v=1706185978&width=1944'),
(2, 'Cobalt Blue Hoodie', '200', 'https://seventhstores.com/cdn/shop/products/CHEMICALBLUEHOODIEFLATLAYcopy_9e3214b0-a282-4c06-8161-1b29db0a9e4b_3.png?v=1706185831&width=1944'),
(3, 'Dark Blue Hoodie', '200', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433321_1.png?v=1708953090&width=640'),
(4, 'Grey Hoodie', '200', '//seventhstores.com/cdn/shop/products/Seventh_13_03_202317881.png?v=1706203328&width=640'),
(5, 'Black Leather Jacket', '600', 'https://seventhstores.com/cdn/shop/files/SEVENTH_18_10_FLATLAY_5918_a858b5fa-e48e-4f7b-a131-6ed756bc460a.png?v=1698231527&width=640'),
(6, 'Oversized White Tee', '150 ', '//seventhstores.com/cdn/shop/files/FLAT_LAY_SaltHeavyweightTee.png?v=1685042666&width=640'),
(7, 'Oversized Black Tee', '150', '//seventhstores.com/cdn/shop/files/FLAT_LAY_NightPureCottonTee.png?v=1685042525&width=640'),
(8, 'Oversized Beige Jeans', '300', '//seventhstores.com/cdn/shop/files/SEVENTH_18_10_FLATLAY_6118.png?v=1712068476&width=640'),
(9, 'Oversized Black Jeans', '320', 'https://seventhstores.com/cdn/shop/files/SEVENTH_18_10_FLATLAY_5949.png?v=1699995017&width=640'),
(10, 'Oversized Dark Blue Sweats', '195', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433361.png?v=1709041735&width=640'),
(11, 'Oversized Black Sweats ', '195', '//seventhstores.com/cdn/shop/files/Seventh_25_11_20229222_Black_1_1.png?v=1706288072&width=640'),
(12, 'Oversized Grey Sweats ', '195', '//seventhstores.com/cdn/shop/files/Seventh_13_03_202317895_1_1.png?v=1706287961&width=640'),
(13, 'Black Oversized Shorts', '200', '//seventhstores.com/cdn/shop/files/Seventh_Flatlay_29_043493copy.png?v=1719924471&width=640'),
(14, 'Azure Blue Worker Shirt', '230', '//seventhstores.com/cdn/shop/files/Seventh_Flatlay_29_043436.png?v=1716295844&width=640'),
(15, 'Beige Bermuda Shorts', '240', '//seventhstores.com/cdn/shop/files/Seventh_07_05_20241607copy.png?v=1716400645&width=640'),
(16, 'Bloom Worker Shirt', '230', '//seventhstores.com/cdn/shop/files/Seventh_Flatlay_29_043503-PINKcopy.png?v=1719922386&width=640'),
(17, 'Ecru Oxford Shirt', '280', '//seventhstores.com/cdn/shop/files/Seventh_Flatlay_29_043458-colorcopy_be0f3721-3d4d-4373-95fc-ba561743df66.png?v=1716399741&width=640'),
(18, 'Black Oxford Shirt', '280', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433032.png?v=1711459087&width=640'),
(19, 'Desert Oxford Shirt ', '280', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433031.png?v=1711459798&width=640'),
(20, 'Grey Zipped Hoodie', '265', '//seventhstores.com/cdn/shop/products/Seventh_13_03_202317891.png?v=1706203258&width=640'),
(21, 'Cactus Green Zipped Hoodie', '265', '//seventhstores.com/cdn/shop/files/Seventh_08_09_20234227.png?v=1695320289&width=640'),
(22, 'Dark Blue Zipped Hoodie', '265', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433321.png?v=1708954642&width=640'),
(23, 'Black Zipped Hoodie', '265', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433322.png?v=1706186186&width=640'),
(24, 'Coffee Brown Zipped Hoodie', '265', '//seventhstores.com/cdn/shop/files/Seventh_Flats_10_01_202433131.png?v=1706106614&width=640'),
(25, 'Cactus Green Hoodie', '200', '//seventhstores.com/cdn/shop/files/Seventh_08_09_20234232_02092bda-4012-4212-bb77-f3e5a33d4277.png?v=1695320398&width=640'),
(26, 'Diesel Grey Hoodie', '200', '//seventhstores.com/cdn/shop/products/FlatLay_DieselHOODIEFLATLAY_3.png?v=1685117814&width=640');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
