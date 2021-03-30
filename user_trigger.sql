-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2021 at 08:56 AM
-- Server version: 8.0.23
-- PHP Version: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_trigger`
--

-- --------------------------------------------------------

--
-- Table structure for table `changed_password`
--

CREATE TABLE `changed_password` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `old_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `new_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `changed_password`
--

INSERT INTO `changed_password` (`id`, `user_id`, `old_password`, `new_password`, `date`) VALUES
(5, 4, '77963b7a931377ad4ab5ad6a9cd718aa', '9df62e693988eb4e1e1444ece0578579', '2021-03-25 15:03:48'),
(6, 9, '36347412c7d30ae6fde3742bbc4f21b9', '900150983cd24fb0d6963f7d28e17f72', '2021-03-25 15:04:15');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_users`
--

CREATE TABLE `deleted_users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deleted_users`
--

INSERT INTO `deleted_users` (`id`, `user_id`, `password`, `create_date`) VALUES
(1, 8, '47bce5c74f589f4867dbd57e9ca9f808', '2021-03-08');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `create_date`, `status`) VALUES
(1, 'a', '47bce5c74f589f4867dbd57e9ca9f808', '2021-03-01', '0'),
(2, 'b', '08f8e0260c64418510cefb2b06eee5cd', '2021-03-02', '0'),
(3, 'c', '9df62e693988eb4e1e1444ece0578579', '2021-03-03', '1'),
(4, 'd', '9df62e693988eb4e1e1444ece0578579', '2021-03-04', '1'),
(5, 'e', 'd2f2297d6e829cd3493aa7de4416a18f', '2021-03-05', '0'),
(6, 'f', '343d9040a671c45832ee5381860e2996', '2021-03-06', '1'),
(7, 'g', 'ba248c985ace94863880921d8900c53f', '2021-03-07', '1'),
(9, 'i', '900150983cd24fb0d6963f7d28e17f72', '2021-03-09', '0'),
(10, 'j', '2af54305f183778d87de0c70c591fae4', '2021-03-10', '1');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `after_password_change` AFTER UPDATE ON `user` FOR EACH ROW INSERT INTO changed_password VALUES(NULL, OLD.id, OLD.password, NEW.password, NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleted_users` AFTER DELETE ON `user` FOR EACH ROW INSERT INTO deleted_users VALUES(NULL, OLD.id, OLD.password, OLD.create_date)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `changed_password`
--
ALTER TABLE `changed_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_users`
--
ALTER TABLE `deleted_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `changed_password`
--
ALTER TABLE `changed_password`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deleted_users`
--
ALTER TABLE `deleted_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
