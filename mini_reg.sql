-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 18, 2017 at 10:02 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_reg`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `no` varchar(6) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `no`, `title`) VALUES
(1, '261342', 'FUND OF DATABASE SYSTEMS'),
(3, '261343', 'DATABASE SYSTEM LABORATORY');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `first_name`, `last_name`) VALUES
(1, 'Preston', 'Sugg'),
(2, 'Frieda', 'Uy');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `lecture_no` varchar(3) DEFAULT NULL,
  `laboratory_no` varchar(3) DEFAULT NULL,
  `courses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `lecture_no`, `laboratory_no`, `courses_id`) VALUES
(1, '001', '000', 1),
(2, '000', '001', 3);

-- --------------------------------------------------------

--
-- Table structure for table `section_enrollments`
--

CREATE TABLE `section_enrollments` (
  `sections_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_enrollments`
--

INSERT INTO `section_enrollments` (`sections_id`, `students_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`) VALUES
(1, 'Ernest', 'Garth'),
(2, 'Mildred', 'Herron'),
(3, 'Brandon', 'Fields'),
(4, 'Carmen', 'Hamilton');

-- --------------------------------------------------------

--
-- Table structure for table `student_cards`
--

CREATE TABLE `student_cards` (
  `id` int(11) NOT NULL,
  `card_no` varchar(45) DEFAULT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_cards`
--

INSERT INTO `student_cards` (`id`, `card_no`, `students_id`) VALUES
(1, '11111', 1),
(2, '22222', 2),
(3, '33333', 3),
(4, '44444', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`,`courses_id`),
  ADD KEY `fk_sections_courses1_idx` (`courses_id`);

--
-- Indexes for table `section_enrollments`
--
ALTER TABLE `section_enrollments`
  ADD PRIMARY KEY (`sections_id`,`students_id`),
  ADD KEY `fk_sections_has_students_students1_idx` (`students_id`),
  ADD KEY `fk_sections_has_students_sections1_idx` (`sections_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_cards`
--
ALTER TABLE `student_cards`
  ADD PRIMARY KEY (`id`,`students_id`),
  ADD KEY `fk_cards_students1_idx` (`students_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_sections_courses1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `section_enrollments`
--
ALTER TABLE `section_enrollments`
  ADD CONSTRAINT `fk_sections_has_students_sections1` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sections_has_students_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_cards`
--
ALTER TABLE `student_cards`
  ADD CONSTRAINT `fk_cards_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
