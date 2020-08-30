-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2020 at 11:50 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `svetovidprequel`
--

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `name`, `link`) VALUES
(1, 'Splosno', 'default.svg'),
(2, 'Adrenalin', 'adrenaline.svg'),
(3, 'Atrakcija', 'attraction.svg'),
(4, 'Plaza', 'beach.svg'),
(5, 'Most', 'bridge.svg'),
(6, 'Bar', 'caffee.svg'),
(7, 'Grad', 'castle.svg'),
(8, 'Jama', 'cave.svg'),
(9, 'Cerkev', 'church.svg'),
(10, 'Restavracija', 'food.svg'),
(11, 'Utrdba', 'fortification.svg'),
(12, 'Hrib', 'hill.svg'),
(13, 'Sladoled', 'icecream.svg'),
(14, 'Pomembna zgradba', 'important_building.svg'),
(15, 'Jezero', 'lake.svg'),
(16, 'Naravna Znamenitost', 'landscape.svg'),
(17, 'Spomenik', 'monument.svg'),
(18, 'Gora', 'mountain.svg'),
(19, 'Muzej', 'museum.svg'),
(20, 'Stara stavba', 'old_building.svg'),
(21, 'Park', 'park.svg'),
(22, 'Reka', 'river.svg'),
(23, 'Razvaline', 'ruins.svg'),
(24, 'Vojna', 'war.svg'),
(25, 'Slap', 'waterfall.svg'),
(26, 'Vodnjak', 'fountain.svg'),
(27, 'Gorska Koca', 'mountain_hut.svg');

-- --------------------------------------------------------

--
-- Table structure for table `imgs`
--

CREATE TABLE `imgs` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `id_location` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `imgs`
--

INSERT INTO `imgs` (`id`, `name`, `link`, `id_location`) VALUES
(6, 'Otok s cerkvico', 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bled_island_from_above.jpg', 1),
(7, 'neka raca', 'https://kraji.eu/PICTURES/gorenjska/bled_z_okolico/bled/blejski_otok/IMG_5766_bled_blejski_otok_racka_big.jpg', 1),
(8, 'coln', 'https://fastly.4sqi.net/img/general/width960/LhRA1BBv3pFd7wJ6DB1Q8E-2n-6Qjf8rFp6QGoRZAqw.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc_s` varchar(50) NOT NULL,
  `desc_l` text NOT NULL,
  `rating` int(2) NOT NULL,
  `tts` int(4) NOT NULL COMMENT 'time to spend',
  `coord` varchar(50) NOT NULL,
  `mtld` int(2) NOT NULL COMMENT 'Max To Location Difficulty',
  `contact` varchar(100) NOT NULL,
  `timetable` text NOT NULL,
  `fee` int(1) NOT NULL COMMENT 'no, yes, depends',
  `child` int(1) NOT NULL COMMENT 'no, yes, depends',
  `season` int(1) NOT NULL COMMENT 'no, yes',
  `icon` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `desc_s`, `desc_l`, `rating`, `tts`, `coord`, `mtld`, `contact`, `timetable`, `fee`, `child`, `season`, `icon`) VALUES
(1, 'Koper', 'Malo mesto', 'Veliko Mesto', 0, 23, '45.9424489,14.0757889', 6, 'Andrej', 'od 12 - 13', 0, 0, 1, 26),
(2, 'fgh', 'fgh', 'fgh', 0, 1, '46.0545416,14.4414767', 0, 'fbvg', 'fgh', 0, 0, 1, 7),
(4, 'fgh', 'fgh', 'fgh', 2, 1, '45.6537072,13.9263309', 4, 'gjk', 'cgkj', 0, 2, 0, 21),
(5, 'fgh', 'fgh', 'fgh', 2, 1, '45.6537072,13.9263309', 4, 'gjk', 'cgkj', 0, 2, 0, 15),
(6, 'gji', 'fghujf', 'hgj', 2, 45, '46.2101788,13.9667693', 0, 'ghj', 'ghj', 0, 0, 0, 1),
(7, 'sdxfggsdfgc', 'dsfgsfg', 'sfgsdfg', 0, 2, '45.9421494,13.766093', 0, 'sfg', 'dscfg', 0, 0, 0, 24);

-- --------------------------------------------------------

--
-- Table structure for table `loc_tag`
--

CREATE TABLE `loc_tag` (
  `id` int(3) NOT NULL,
  `id_loc` int(4) NOT NULL,
  `id_tag` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loc_tag`
--

INSERT INTO `loc_tag` (`id`, `id_loc`, `id_tag`) VALUES
(12, 1, 8),
(14, 1, 9),
(15, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `mtags`
--

CREATE TABLE `mtags` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mtags`
--

INSERT INTO `mtags` (`id`, `name`) VALUES
(4, 'sfdhgdsf'),
(5, 'dsfg'),
(6, 'hjo');

-- --------------------------------------------------------

--
-- Table structure for table `myths`
--

CREATE TABLE `myths` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc_s` varchar(100) NOT NULL,
  `desc_l` text NOT NULL,
  `coord` varchar(50) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myths`
--

INSERT INTO `myths` (`id`, `name`, `desc_s`, `desc_l`, `coord`, `info`) VALUES
(3, 'Zlatorog', 'mali zlatorog', 'veliki zlatorog', 'dsfg', 'dfg'),
(4, 'fhj', 'fhj', 'fhj', '45.6537072,13.9263309', 'fgh'),
(5, 'dfgd', 'dfg', 'dfg', 'dfg', 'dgf');

-- --------------------------------------------------------

--
-- Table structure for table `myth_mtag`
--

CREATE TABLE `myth_mtag` (
  `id` int(4) NOT NULL,
  `id_myth` int(4) NOT NULL,
  `id_mtag` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myth_mtag`
--

INSERT INTO `myth_mtag` (`id`, `id_myth`, `id_mtag`) VALUES
(4, 3, 4),
(5, 5, 5),
(6, 3, 6),
(7, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `parkings`
--

CREATE TABLE `parkings` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cost` int(1) NOT NULL,
  `coord` varchar(50) NOT NULL,
  `id_location` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parkings`
--

INSERT INTO `parkings` (`id`, `name`, `cost`, `coord`, `id_location`) VALUES
(14, 'sdfg', 0, '14.0757889,45.9434489', 1),
(18, 'sdfg', 2, '45.9424489,14.0758889', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(8, 'zzz'),
(9, 'krneki'),
(10, 'cj');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(192) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `status`, `created_date`) VALUES
(1, 'bb', 'b', 'andrej.zubin@email.com', 'pbkdf2:sha256:150000$TlMA8JAJ$3f4934eab7629ed926a73b8aed0def6c001a6d7f97cb1fc1c8bed1350222fe61', 1, '2020-06-21 09:31:10'),
(4, 'm', 'm', 'andrej.zubin@edmail.com', 'pbkdf2:sha256:150000$wHwBTkhk$e7e8513789f29db3f7ff26cf044883492fd506c87e9711ee8f7e5d79f110be37', 1, '2020-06-21 14:23:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imgs`
--
ALTER TABLE `imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loc_tag`
--
ALTER TABLE `loc_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location` (`id_loc`),
  ADD KEY `id_cat` (`id_tag`);

--
-- Indexes for table `mtags`
--
ALTER TABLE `mtags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myths`
--
ALTER TABLE `myths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myth_mtag`
--
ALTER TABLE `myth_mtag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myth_restriction` (`id_myth`),
  ADD KEY `mtag_restriction` (`id_mtag`);

--
-- Indexes for table `parkings`
--
ALTER TABLE `parkings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location_restric` (`id_location`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `imgs`
--
ALTER TABLE `imgs`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loc_tag`
--
ALTER TABLE `loc_tag`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `mtags`
--
ALTER TABLE `mtags`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `myths`
--
ALTER TABLE `myths`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myth_mtag`
--
ALTER TABLE `myth_mtag`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parkings`
--
ALTER TABLE `parkings`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `loc_tag`
--
ALTER TABLE `loc_tag`
  ADD CONSTRAINT `id_location` FOREIGN KEY (`id_loc`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `myth_mtag`
--
ALTER TABLE `myth_mtag`
  ADD CONSTRAINT `mtag_restriction` FOREIGN KEY (`id_mtag`) REFERENCES `mtags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `myth_restriction` FOREIGN KEY (`id_myth`) REFERENCES `myths` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parkings`
--
ALTER TABLE `parkings`
  ADD CONSTRAINT `id_location_restric` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
