-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20230611.e6bbb848a3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2023 at 11:41 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_sutnews`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmark_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`bookmark_id`, `users_id`, `news_id`) VALUES
(1, 2, 1),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `from`
--

CREATE TABLE `from` (
  `from_id` int(50) NOT NULL,
  `from_comment` varchar(255) NOT NULL,
  `users_id` int(50) NOT NULL,
  `satisfaction_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `from`
--

INSERT INTO `from` (`from_id`, `from_comment`, `users_id`, `satisfaction_id`) VALUES
(1, 'ดีเกิ้นนนนนนนนนนนน', 3, 1),
(2, 'ดดดดดดดดดดดด', 11, 3),
(3, 'เจ๊...งงงงงงงงงงงงงงงงงง', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(16) NOT NULL,
  `news_type_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL,
  `topic_id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `intro_para` varchar(255) NOT NULL,
  `welding_para` varchar(255) DEFAULT NULL,
  `main_para` varchar(255) NOT NULL,
  `end_para` varchar(255) DEFAULT NULL,
  `section1_id` int(16) DEFAULT NULL,
  `section2_id` int(16) DEFAULT NULL,
  `section3_id` int(16) DEFAULT NULL,
  `section4_id` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_type_id`, `user_id`, `topic_id`, `title`, `intro_para`, `welding_para`, `main_para`, `end_para`, `section1_id`, `section2_id`, `section3_id`, `section4_id`) VALUES
(1, 2, 3, 11, '✨ วัยรุ่นหอนอก What’s up!! ✨', 'เชิญชวนนักศึกษา SUT#31 ที่อยู่หอนอกเข้ากลุ่มไลน์ได้แล้วนะคะตอนนี้ เพื่อการติดต่อประสานงานและรับข้อมูลข่าวสาร กิจกรรมต่างๆภายในมหาวิทยาลัย By SUSUT อมทส. ', '', '📍ลิงก์: คุณได้รับคำเชิญให้เข้าร่วม \"วัยรุ่นหอนอก #31 Community\" โปรดแตะลิงก์ด้านล่างเพื่อเข้าร่วมโอเพนแชทนี้\r\nhttps://line.me/.../JkIKOhiN7NEJOvgf...', '', 6, 2, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `news_type`
--

CREATE TABLE `news_type` (
  `news_type_id` int(16) NOT NULL,
  `news_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news_type`
--

INSERT INTO `news_type` (`news_type_id`, `news_type_name`) VALUES
(1, 'ข่าวในมหาลัย'),
(2, 'ข่าวนอกมหาลัย');

-- --------------------------------------------------------

--
-- Table structure for table `satisfaction`
--

CREATE TABLE `satisfaction` (
  `laundry_id` int(11) NOT NULL,
  `laundry_Branch` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satisfaction`
--

INSERT INTO `satisfaction` (`laundry_id`, `laundry_Branch`) VALUES
(1, 'พึงพอใจระดับมากที่สุด'),
(2, 'พึงพอใจระดับมาก'),
(3, 'พึงพอใจระดับปานกลาง'),
(4, 'พึงพอใจระดับน้อย'),
(5, 'พึงพอใจระดับน้อยที่สุด\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `section1`
--

CREATE TABLE `section1` (
  `section_id1` int(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section1`
--

INSERT INTO `section1` (`section_id1`, `name`) VALUES
(1, 'หอพักว่าง'),
(2, 'หอพักชาย'),
(3, 'ที่ว่าง#10'),
(4, 'วิ่งเกียร์#10'),
(5, 'SUT#25'),
(6, 'SUT#25'),
(7, 'กีฬามหาลัย'),
(8, 'มหาลัยวิทยาลัยเทคโนโลยีสุระนารี');

-- --------------------------------------------------------

--
-- Table structure for table `section2`
--

CREATE TABLE `section2` (
  `section_id2` int(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section2`
--

INSERT INTO `section2` (`section_id2`, `name`) VALUES
(1, 'องค์การบริหารองค์การนักศึกษา'),
(2, ' อมทส '),
(3, 'dek66'),
(4, 'มสท.'),
(5, 'ร็อกทุกสถาบัน '),
(6, 'เรียนมทสไม่มีขาดทุน'),
(7, 'ชมรมดนตรีและนาฏศิลป์ไทย'),
(8, 'ปีบทองบันเทิงศิลป์');

-- --------------------------------------------------------

--
-- Table structure for table `section3`
--

CREATE TABLE `section3` (
  `section_id3` int(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section3`
--

INSERT INTO `section3` (`section_id3`, `name`) VALUES
(1, 'ทีมพี่ด๊อม'),
(2, 'SUSUT65 '),
(3, 'สาดน้ำมทส'),
(4, 'สงกรานต์มทส'),
(5, 'UstoreSUT'),
(6, 'นักศึกษาผ่อนได้'),
(7, 'บ้ายบายเทอมสาม'),
(8, 'บ้ายบายเทอมสอง');

-- --------------------------------------------------------

--
-- Table structure for table `section4`
--

CREATE TABLE `section4` (
  `section_id4` int(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section4`
--

INSERT INTO `section4` (`section_id4`, `name`) VALUES
(1, 'JACKETSUT28'),
(2, 'freshy'),
(3, 'พาแลงพาใจ'),
(4, 'ผู้นำเชียร์มทส'),
(5, 'ใจแลกใช้ได้กับผู้นำเชียร์'),
(6, 'หน้าที่แห่งเกียรติภูมิสู่ความภาคภูมิแห่งสถาบัน'),
(7, 'ทานที่ดีคือทานฟรี'),
(8, 'อร่อยจุกสุขทั้งโต๊ะ');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topic_id` int(50) NOT NULL,
  `topic_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`topic_id`, `topic_name`) VALUES
(1, 'กีฬา'),
(2, 'ทุนการศึกษา'),
(3, 'ชมรม'),
(4, 'องค์การนักศึกษา'),
(5, 'กิจกรรมจิตอาสา'),
(6, 'วิชาที่เปิดสอน'),
(7, 'เปลี่ยนแปลงรหัสวิชา'),
(8, 'SEDA'),
(9, 'หอพักใน'),
(10, 'งานแนะแนว'),
(11, 'หอพักนอก'),
(12, 'ร้านอาหาร'),
(13, 'จ้างงาน'),
(14, 'กิจกรรมต่างๆ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(16) NOT NULL,
  `role` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_request` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_name`, `name`, `email`, `gender`, `password`, `user_request`) VALUES
(1, 'ADMIN', 'P\'Fam', 'Puttipong', '1@gmail.com', 'male', '$2b$12$qIbDPYejPZY/2yMY.SmAPOLMAP5jD6IhR6UGoyjaZ4m6.KzcKwZKy', 'not request'),
(2, 'USER', 'P\'Nara', 'Narawhit', '2@gmail.com', 'male', '$2b$12$WuOdcE/AFpSUjeN8gHkVkekmUUIjPpjze/uK0bwkWbDqYhm2uhnIi', 'not request'),
(3, 'OFICIAL USER', 'P\'am', 'fammm', 'f122@gmail.com', 'male', '$2b$12$g1IQEicNwikcRI33lExu3eJKONSvvhR01wvQ6VTSPZiH2x256md92', 'not request'),
(5, 'USER', 'P\'Cream', 'Cream', 'c@gmail.com', 'female', '$2b$12$d5G7emhWbrTzJtpbBTdtVOqEZ1IaQez1FgxCqwCWHchUizaFsBqy6', 'not request'),
(6, 'OFICIAL USER', 'P\'Aa', 'AAAAAAA', 'aa@gmail.com', 'female', '$2b$12$4Fc2k2fSAxVOmzrCFdgGdOK5qh7X65E3tPDN8NlHt9d2xa5oSkdVO', 'not request'),
(11, 'ADMIN', 'P\'Fam1', 'Fam1', 'fam1@gmail.com', 'female', '$2b$12$cCc3T1GgRJbXPFR0179HHuWtGIUu9O7lhAvJfNf9pFgYw0jJnoIsW', 'not request'),
(12, 'GUEST', '', 'PLEASE LOGIN', '', '', '', 'not request'),
(13, 'OFFICIAL USER', 'PaoPao', 'ร้านเปาหมูกระทะ', 'pao@gmail.com', '', '$2b$12$OkjodQpaZo8FcwSJFgnWaeiY4av2PpscjXEp5/6FQed/wTPvtHUeC', 'not request');

-- --------------------------------------------------------

--
-- Table structure for table `user_request`
--

CREATE TABLE `user_request` (
  `user_request_id` int(16) NOT NULL,
  `user_id` int(16) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `request_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_request`
--

INSERT INTO `user_request` (`user_request_id`, `user_id`, `phone`, `address`, `description`, `request_status`) VALUES
(1, 5, '0900000000', '330 ถ.เชียงใหม่-ลำปาง ต.ป่าตัน อ.เมืองรหัสไปรษณีย์ 50300', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ (ชั้นพิเศษ)', 'waiting for approval'),
(2, 6, '0911111111', '178 หมู่ 10 ถ.ฮอด-วังลุง ต.หางดง อ.ฮอดรหัสไปรษณีย์ 50240', 'การประปาส่วนภูมิภาค สาขาฮอด', 'waiting for approval');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `from`
--
ALTER TABLE `from`
  ADD PRIMARY KEY (`from_id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `satisfaction_id` (`satisfaction_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_type_id` (`news_type_id`),
  ADD KEY `section1_id` (`section1_id`),
  ADD KEY `section2_id` (`section2_id`),
  ADD KEY `section3_id` (`section3_id`),
  ADD KEY `section4_id` (`section4_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `news_type`
--
ALTER TABLE `news_type`
  ADD PRIMARY KEY (`news_type_id`);

--
-- Indexes for table `satisfaction`
--
ALTER TABLE `satisfaction`
  ADD PRIMARY KEY (`laundry_id`);

--
-- Indexes for table `section1`
--
ALTER TABLE `section1`
  ADD PRIMARY KEY (`section_id1`);

--
-- Indexes for table `section2`
--
ALTER TABLE `section2`
  ADD PRIMARY KEY (`section_id2`);

--
-- Indexes for table `section3`
--
ALTER TABLE `section3`
  ADD PRIMARY KEY (`section_id3`);

--
-- Indexes for table `section4`
--
ALTER TABLE `section4`
  ADD PRIMARY KEY (`section_id4`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request`
--
ALTER TABLE `user_request`
  ADD PRIMARY KEY (`user_request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `user_request_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `bookmark_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `bookmark_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `from`
--
ALTER TABLE `from`
  ADD CONSTRAINT `from_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `from_ibfk_2` FOREIGN KEY (`satisfaction_id`) REFERENCES `satisfaction` (`laundry_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`news_type_id`) REFERENCES `news_type` (`news_type_id`),
  ADD CONSTRAINT `news_ibfk_3` FOREIGN KEY (`section1_id`) REFERENCES `section1` (`section_id1`),
  ADD CONSTRAINT `news_ibfk_4` FOREIGN KEY (`section2_id`) REFERENCES `section2` (`section_id2`),
  ADD CONSTRAINT `news_ibfk_5` FOREIGN KEY (`section3_id`) REFERENCES `section3` (`section_id3`),
  ADD CONSTRAINT `news_ibfk_6` FOREIGN KEY (`section4_id`) REFERENCES `section4` (`section_id4`),
  ADD CONSTRAINT `news_ibfk_7` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`);

--
-- Constraints for table `user_request`
--
ALTER TABLE `user_request`
  ADD CONSTRAINT `user_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
