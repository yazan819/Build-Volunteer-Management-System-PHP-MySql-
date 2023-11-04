-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2023 at 06:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test333`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `type` varchar(10) NOT NULL,
  `ID` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`type`, `ID`) VALUES
('enviroment', 1),
('social', 2),
('health', 3);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comments_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comments_id`, `comment`, `user_id`, `status`, `created_at`, `event_id`) VALUES
(3, 'This is a sample comment', 1, 1, '2023-11-10 08:00:00', 1),
(4, 'HELLOO', 1, 1, '2023-11-04 12:59:38', 1),
(5, 'lppp', 1, 1, '2023-11-04 12:59:49', 1),
(14, 'aaa', 5, 1, '2023-11-04 13:18:44', 1),
(22, 'jkv', 6, 1, '2023-11-04 15:30:53', 1),
(23, 'nnnn', 6, 1, '2023-11-04 17:22:53', 4);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `events_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date DEFAULT NULL,
  `category` int(1) NOT NULL,
  `participant` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`events_id`, `title`, `description`, `status`, `created_at`, `category`, `participant`) VALUES
(1, 'helping elder', 'help them in many asbect like', 1, '2023-11-10', 2, 4),
(2, ' trees', 'help enviroment improve ', 1, '2023-11-22', 2, 10),
(4, 'plant trees2', 'help enviroment improve ', 1, '2023-11-24', 1, 5),
(5, 'm children', 'teach children new things', 1, '2023-12-14', 1, 6),
(6, 'help homeless', 'help homeless people', 1, '2023-12-25', 2, 5),
(7, 'clean beach', 'help clean the beach', 1, '2023-12-03', 1, 15),
(8, 'Knit Hats', 'If you\'re good with needles, knit or crochet hats for infants in the local hospitals', 1, '2023-11-03', 2, 4),
(9, 'Bake Cookies', 'Bake cookies for the local soup kitchen', 1, '2023-11-04', 2, 5),
(10, 'Volunteer at a Food Bank', 'Help sort and distribute food at a local food bank', 1, '2023-11-05', 2, 6),
(11, 'Volunteer at an Animal Shelter', 'Walk dogs, clean cages, and socialize animals at a local animal shelter', 1, '2023-11-06', 1, 7),
(13, 'Clean Up a Park', 'Pick up trash and debris in a local park', 1, '2023-11-08', 1, 9),
(14, 'Tutor a Child', 'Tutor a child in a subject that they need help with', 1, '2023-11-09', 2, 10),
(15, 'Visit a Nursing Home', 'Visit a nursing home and spend time with the residents', 1, '2023-11-10', 3, 11),
(24, 'tt', 'sdvcas', 1, '2023-11-15', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(4) NOT NULL,
  `events_id` int(4) NOT NULL,
  `delet` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `events_id`, `delet`) VALUES
(1, 2, 7),
(3, 2, 12),
(6, 4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT 'user',
  `events_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `events_id`) VALUES
(1, 'reem', 'Reem.abdalla98@gmail.com', '1234', 'user', NULL),
(3, 'yaman', 'n@gmail.com', '123', 'admin', NULL),
(5, 'Omama', 'omama.akour201@gmail.com', 'Abod1234', 'user', NULL),
(6, 'yazm', 'yy@gmail.com', '222', 'user', NULL),
(7, 'dscas', 'ybb@gmail.com', '123', 'user', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comments_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`events_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`delet`),
  ADD KEY `id` (`id`),
  ADD KEY `events_id` (`events_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `events_id` (`events_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comments_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `events_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `delet` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`events_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`events_id`) REFERENCES `events` (`events_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`events_id`) REFERENCES `events` (`events_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
