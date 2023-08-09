-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20230611.e6bbb848a3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 04:57 PM
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
-- Database: `sut_news`
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
(2, 3, 1),
(3, 3, 1),
(4, 3, 1),
(5, 3, 1),
(6, 3, 1);

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
-- Table structure for table `group_section`
--

CREATE TABLE `group_section` (
  `group_id` int(16) NOT NULL,
  `news_id` int(16) DEFAULT NULL,
  `section_id` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `group_section`
--

INSERT INTO `group_section` (`group_id`, `news_id`, `section_id`) VALUES
(36, 125, 2),
(37, 125, 5),
(38, 126, 3),
(39, 126, 1),
(40, 127, 8),
(41, 127, 6),
(42, 127, 2),
(43, 127, 4),
(44, 127, 9),
(45, 128, 2),
(46, 128, 4),
(47, 128, 6),
(48, 129, 3),
(49, 129, 6),
(50, 130, 4),
(51, 130, 7),
(52, 131, 4),
(53, 131, 8),
(54, 132, 3),
(55, 132, 7),
(56, 134, 7),
(57, 134, 2),
(58, 135, 8),
(59, 135, 3);

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
  `welding_para` varchar(255) DEFAULT NULL,
  `card_picture` varchar(255) DEFAULT NULL,
  `news_content` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `time_stamp` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_type_id`, `user_id`, `topic_id`, `title`, `welding_para`, `card_picture`, `news_content`, `start`, `end`, `time_stamp`) VALUES
(1, 2, 3, 11, '✨ วัยรุ่นหอนอก What’s up!! ✨', '', NULL, NULL, NULL, NULL, NULL),
(2, 2, 3, 11, '✨ วัยรุ่นหอนอก What’s up!! ✨', '', NULL, NULL, NULL, NULL, NULL),
(125, 1, 5, 2, '', '', NULL, NULL, NULL, NULL, NULL),
(126, 1, 5, 9, 'ห่อพักใหม่ sut#27', 'เริ่มเปิดให้้จองเร็วๆนี้', NULL, NULL, NULL, NULL, NULL),
(127, 1, 5, 2, 'ประกาศสำหรับ นักศึกษาใหม่ชั้นปีที่ 1(รหัสนักศึกษา B66) และนักศึกษาชั้นปีอื่นๆที่ประสงค์ขอกู้ครั้งแรกที่ มทส.', 'ประกาศสำหรับ นักศึกษาใหม่ชั้นปีที่ 1(รหัสนักศึกษา B66) และนักศึกษาชั้นปีอื่นๆที่ประสงค์ขอกู้ครั้งแรกที่ มทส.', NULL, NULL, NULL, NULL, NULL),
(128, 1, 5, 3, '', '📝คำถามที่พบบ่อย เกี่ยวกับทุนเฉลิมพระเกียรติ 84 พรรษา และ ทุน มทส.ศักยบัณฑิต สำหรับนักศึกษาผู้รับทุนชั้นปีที่ 1 รหัส B66', NULL, NULL, NULL, NULL, NULL),
(129, 1, 5, 2, 'aaaaaaaa', 'ggggggg📝คำถามที่พบบ่อย เกี่ยวกับทุนเฉลิมพระเกียรติ 84 พรรษา และ ทุน มทส.ศักยบัณฑิต สำหรับนักศึกษาผู้รับทุนชั้นปีที่ 1 รหัส B66', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', NULL, NULL, NULL, NULL),
(130, 2, 5, 2, 'seda', 'seda', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:20px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300', NULL, NULL, NULL),
(131, 1, 5, 2, 'ใหม่', 'ใหม่', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<p>ฟหกดฟหกด<strong>ฟหดกหฟดหฟกด</strong></p><figure class=\"image\"><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIbGNtcwIQAABtbnRyUkdCIFhZWiAH4gADABQACQAOAB1hY3NwTVNGVAAAAABzYXdzY3RybAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTL', NULL, NULL, NULL),
(132, 1, 5, 3, 'แต่งแล้ว 30 ยังแจ๋ว', 'งานแต่ง', 'public\\images\\card_picture\\331940925_1746568365738384_6504698399746293895_n.png', '<h3 style=\"-webkit-text-stroke-width:0px;border-width:0px;box-sizing:border-box;color:rgb(26, 26, 26);font-family:&quot;Source Sans Pro&quot;, system-ui, Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;font-feature-settings:inherit;font-k', NULL, NULL, NULL),
(133, 1, 5, 4, 'แต่งแล้ว 30 ยังแจ๋ว', 'งานแต่ง', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<p style=\"text-align:center;\">จิตอาสากิจกรรมวันชาวหอ&nbsp;&nbsp;&nbsp;&nbsp;คปว.&nbsp;&nbsp;&nbsp;&nbsp;คณะทำงาน&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;<br>กิจกรรมแสดงความยินดีพี่บัณฑิตสาขาวิศวกรรมคอมพิวเตอร์ งานพระราชทานปริญญาบัตร ประจำปีการศึกษ', NULL, NULL, NULL),
(134, 1, 5, 5, 'แต่งแล้ว 30 ยังแจ๋ว', 'งานแต่ง', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<figure class=\"image\"><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gHYSUNDX1BST0ZJTEUAAQEAAAHIbGNtcwIQAABtbnRyUkdCIFhZWiAH4gADABQACQAOAB1hY3NwTVNGVAAAAABzYXdzY3RybAAAAAAAAAAAAAAAAAAA9tYAAQAAAADTLWhhbmSdkQA9QICwPUB0LIGepSKOAAAAAAAAAAAAAAAA', NULL, NULL, NULL),
(135, 1, 5, 2, 'สวัสดีครับผมแจ๊กแป๊ปโฮ', 'มีควยไร', 'public\\images\\card_picture\\ded402ca0fe9be3cbcda56570eb425ad.jpg', '<h1 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:inherit;color:rgb(64, 64, 64);font-family:Roboto, sans-serif;font-size:30px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;le', NULL, NULL, NULL);

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
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `name`) VALUES
(1, 'หอพักว่าง'),
(2, 'หอพักชาย'),
(3, 'ที่ว่าง#10'),
(4, 'วิ่งเกียร์#10'),
(5, 'SUT#25'),
(6, 'SUT#25'),
(7, 'กีฬามหาลัย'),
(8, 'มหาลัยวิทยาลัยเทคโนโลยีสุระนารี'),
(9, 'ทุนการศึกษา');

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
  `user_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `user_name`, `name`, `email`, `gender`, `password`, `profile_image`) VALUES
(1, 'ADMIN', 'P\'Fam', 'Puttipong', '1@gmail.com', 'male', '$2b$12$qIbDPYejPZY/2yMY.SmAPOLMAP5jD6IhR6UGoyjaZ4m6.KzcKwZKy', NULL),
(2, 'USER', 'P\'Nara', 'Narawhit', '2@gmail.com', 'male', '$2b$12$WuOdcE/AFpSUjeN8gHkVkekmUUIjPpjze/uK0bwkWbDqYhm2uhnIi', NULL),
(3, 'USER', 'P\'am', 'fammm', 'f@gmail.com', 'male', '$2b$12$g1IQEicNwikcRI33lExu3eJKONSvvhR01wvQ6VTSPZiH2x256md92', NULL),
(5, 'OFFICIAL USER', 'P\'Cream', 'Cream', 'c@gmail.com', 'female', '$2b$12$d5G7emhWbrTzJtpbBTdtVOqEZ1IaQez1FgxCqwCWHchUizaFsBqy6', 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'),
(6, 'USER', 'P\'Aa', 'AAAAAAA', 'aa@gmail.com', 'female', '$2b$12$4Fc2k2fSAxVOmzrCFdgGdOK5qh7X65E3tPDN8NlHt9d2xa5oSkdVO', NULL),
(11, 'ADMIN', 'P\'Fam', 'Fam1', 'fam1@gmail.com', 'female', '$2b$12$cCc3T1GgRJbXPFR0179HHuWtGIUu9O7lhAvJfNf9pFgYw0jJnoIsW', 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'),
(12, 'GUEST', '', 'PLEASE LOGIN', '', '', '', NULL),
(13, 'OFFICIAL USER', 'PaoPao', 'ร้านเปาหมูกระทะ', 'pao@gmail.com', '', '$2b$12$OkjodQpaZo8FcwSJFgnWaeiY4av2PpscjXEp5/6FQed/wTPvtHUeC', NULL),
(14, 'USER', 'ARMZA_007', 'P\'ARM', 'arm@gmail.com', 'female', '$2b$12$3KxpGOQ6x.VjhRD9aIr3SO4s9gdba.E1oolV7iM7E6DgHfQs1x9/C', NULL);

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
(18, 13, '0988888888', '123456', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'approve'),
(19, 5, '0988888888', '123456', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'approve'),
(20, 5, '0988888888', '123456', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'approve');

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
-- Indexes for table `group_section`
--
ALTER TABLE `group_section`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_type_id` (`news_type_id`),
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
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

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
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `group_section`
--
ALTER TABLE `group_section`
  MODIFY `group_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `user_request_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Constraints for table `group_section`
--
ALTER TABLE `group_section`
  ADD CONSTRAINT `group_section_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `group_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`news_type_id`) REFERENCES `news_type` (`news_type_id`),
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
