-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20230611.e6bbb848a3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2023 at 11:08 AM
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
  `b_users_id` int(11) NOT NULL,
  `b_news_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`bookmark_id`, `b_users_id`, `b_news_id`) VALUES
(104, 3, 142),
(120, 11, 140),
(121, 11, 145),
(122, 11, 160),
(123, 5, 160),
(127, 5, 144),
(129, 11, 149),
(131, 3, 158),
(133, 5, 141),
(134, 5, 140);

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
(66, 140, 6),
(67, 141, 2),
(68, 141, 5),
(69, 142, 5),
(70, 143, 2),
(71, 144, 3),
(72, 145, 3),
(73, 145, 5),
(74, 146, 3),
(75, 146, 7),
(76, 147, 4),
(77, 147, 9),
(78, 147, 5),
(79, 149, 3),
(80, 149, 9),
(81, 150, 3),
(82, 151, 5),
(83, 152, 4),
(93, 156, 2),
(94, 156, 5),
(95, 157, 3),
(96, 157, 5),
(97, 158, 2),
(98, 158, 5),
(99, 159, 4),
(100, 159, 8),
(101, 160, 3),
(102, 160, 8),
(103, 160, 5),
(104, 161, 5),
(105, 161, 8);

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
  `news_content` text DEFAULT NULL,
  `explain` text DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `time_stamp` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_type_id`, `user_id`, `topic_id`, `title`, `welding_para`, `card_picture`, `news_content`, `explain`, `start`, `end`, `time_stamp`) VALUES
(140, 1, 5, 8, 'ปิดเทอมนี้ SEDA จัดเต็ม!!', 'ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา มทส. สมรรถนะ ต่าง ๆ ถูกออกแบบผ่านกระบวนเรียนรู้และลงมือทำ', 'public\\images\\card_picture\\à¹à¸à¸´à¸à¹à¸à¸­à¸¡ (1).jpg', '<p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:var(--', NULL, NULL, NULL, NULL),
(141, 1, 5, 8, 'ปิดเทอมนี้ SEDA จัดเต็ม!! ', 'กิจกรรมที่จะช่วยเพิ่มสมรรถนะ ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา ', 'public\\images\\card_picture\\à¹à¸à¸´à¸à¹à¸à¸­à¸¡ (1).jpg', '<h1 style=\"text-align:center;\"><span style=\"color:#656565;font-family:\'Courier New\', Courier, monospace;font-size:20px;\"><span style=\"mso-ascii-theme-font:major-bidi;mso-bidi-theme-font:major-bidi;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-fo', NULL, NULL, NULL, NULL),
(142, 1, 5, 8, 'ปิดเทอมนี้ SEDA จัดเต็ม!!', 'ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา มทส. สมรรถนะ ต่าง ๆ', 'public\\images\\card_picture\\à¹à¸à¸´à¸à¹à¸à¸­à¸¡ (1).jpg', '<h5 style=\"text-align:center;\">ปิดเทอมนี้ SEDA&nbsp;จัดเต็ม!! กับกิจกรรมที่จะช่วยเพิ่มสมรรถนะ ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา มทส. สมรรถนะ ต่าง ๆ ถูกออกแบบผ่านกระบวนเรียนรู้และลงมือทำ หากเข้าร่วมกิจกรรมเหล่านี้ นัก', NULL, NULL, NULL, NULL),
(143, 2, 5, 3, 'aaa', 'aaa', 'public\\images\\card_picture\\à¹à¸à¸´à¸à¹à¸à¸­à¸¡ (1).jpg', '<p style=\"text-align:center;\">ปิดเทอมนี้ SEDA&nbsp;จัดเต็ม!! กับกิจกรรมที่จะช่วยเพิ่มสมรรถนะ ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา มทส. สมรรถนะ ต่าง ๆ ถูกออกแบบผ่านกระบวนเรียนรู้และลงมือทำ หากเข้าร่วมกิจกรรมเหล่านี้ นักศึกษาได้ฝึกการริเริ่มลงมือทำ การทำงานร่วมกับผู้อื่น การสื่อสาร การคิดวิเคราะห์อย่างมีวิจารณญาณ พัฒนาความคิดสร้างสรรค์และทำสิ่งใหม่</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">ไปดูกันดีกว่า มีกิจกรรมไหนที่น่าสนใจบ้าง สนใจกิจกรรมไหน เล็งไว้ได้เลย</p><p style=\"text-align:center;\">&nbsp;</p><figure class=\"image\"><img src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/%E0%B9%80%E0%B8%9B%E0%B8%B4%E0%B8%94%E0%B9%80%E0%B8%97%E0%B8%AD%E0%B8%A1%20(1).jpg\"></figure><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">SUT Hackathon#15 : Beautify Campus \"มทส. น่าอยู่&nbsp;You&nbsp;สร้างได้</p><p style=\"text-align:center;\">วันจัดกิจกรรม : วันที่&nbsp;24 - 25 มี.ค.&nbsp;2566</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">เปิดรับสมัคร : วันที่&nbsp;9 ก.พ.2566 ที่เพจ&nbsp;SEDA</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">SUT Startup Camp#20 :Smart Living</p><p style=\"text-align:center;\">วันจัดกิจกรรม : วันที่&nbsp;15 - 18 มี.ค.&nbsp;2566</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">เปิดรับสมัคร : วันที่&nbsp;10 ก.พ.2566 ที่เพจ&nbsp;SUT Startups</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">โครงการ From Gen Z to be CEO</p><p style=\"text-align:center;\">วันจัดกิจกรรม : วันที่&nbsp;29 มี.ค. -&nbsp;1 เม.ย.&nbsp;2566</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">ติดตามกิจกรรมที่ เพจ&nbsp;SEDA</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">SUT Global Entrepreneurship camp #3​</p><p style=\"text-align:center;\">วันจัดกิจกรรม : วันที่&nbsp;25 พ.ค. –&nbsp;3 มิ.ย.&nbsp;2566</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">เปิดรับสมัคร : เร็ว ๆ นี้ ที่เพจ&nbsp;SEDA</p><p style=\"text-align:center;\">&nbsp;</p><p style=\"text-align:center;\">SUT Hackathon#16 : Smart Living</p><p style=\"text-align:center;\">วันจัดกิจกรรม : วันที่&nbsp;25 พ.ค. –&nbsp;3 มิ.ย.&nbsp;2566</p><p>&nbsp;</p><p style=\"text-align:center;\">เปิดรับสมัคร : เร็ว ๆ นี้ ที่เพจ&nbsp;SEDA</p>', NULL, NULL, NULL, NULL),
(144, 1, 5, 4, 'แต่งแล้ว 30 ยังแจ๋ว', 'งานแต่ง', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:var(--ck-spacing-large) 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ปิดเทอมนี้ SEDA จัดเต็ม!! กับกิจกรรมที่จะช่วยเพิ่มสมรรถนะ ติดปีกความรู้ ด้านความเป็นผู้ประกอบการ (Entrepreneurship) สำหรับนักศึกษา มทส.&nbsp;สมรรถนะ ต่าง ๆ ถูกออกแบบผ่านกระบวนเรียนรู้และลงมือทำ หากเข้าร่วมกิจกรรมเหล่านี้ นักศึกษาได้ฝึกการริเริ่มลงมือทำ การทำงานร่วมกับผู้อื่น การสื่อสาร การคิดวิเคราะห์อย่างมีวิจารณญาณ พัฒนาความคิดสร้างสรรค์และทำสิ่งใหม่</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ไปดูกันดีกว่า มีกิจกรรมไหนที่น่าสนใจบ้าง สนใจกิจกรรมไหน เล็งไว้ได้เลย</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:333px;max-width:100%;vertical-align:middle;width:500px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/%E0%B9%80%E0%B8%9B%E0%B8%B4%E0%B8%94%E0%B9%80%E0%B8%97%E0%B8%AD%E0%B8%A1%20(1).jpg\" alt=\"\"></p><ul><li style=\"box-sizing:border-box;list-style:unset;\">SUT Hackathon#15 : Beautify Campus \"มทส. น่าอยู่ You สร้างได้</li></ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">วันจัดกิจกรรม : วันที่ 24 - 25 มี.ค. 2566</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">เปิดรับสมัคร : วันที่ 9 ก.พ.2566 ที่เพจ <a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://www.facebook.com/SUT.SEDA?__cft__[0]=AZVxg7iYxfFHYm2SewfLnQj8tT-OMH8KGS-X15Sqshu3aLu5P_XOlpiZzL2GlpCDYhlyFs-Hj0NWBLRGWWlwsiemLwUqB758oMo14AqGFzvOwyWvcQMLarrm95EeXMfKLQa2cufFZHgEUJN9dwtvDuPdEj0Yx2Bt1b51NmeJpbsJcklsVLyDsimlyM_lPK0R4Ys&amp;__tn__=-]K-R\" role=\"link\" tabindex=\"0\" target=\"_blank\">SEDA</a></p><ul><li style=\"box-sizing:border-box;list-style:unset;\">SUT Startup Camp#20 :Smart Living</li></ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">วันจัดกิจกรรม : วันที่ 15 - 18 มี.ค. 2566</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">เปิดรับสมัคร : วันที่ 10 ก.พ.2566 ที่เพจ <a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://www.facebook.com/sutstartups?__cft__[0]=AZVxg7iYxfFHYm2SewfLnQj8tT-OMH8KGS-X15Sqshu3aLu5P_XOlpiZzL2GlpCDYhlyFs-Hj0NWBLRGWWlwsiemLwUqB758oMo14AqGFzvOwyWvcQMLarrm95EeXMfKLQa2cufFZHgEUJN9dwtvDuPdEj0Yx2Bt1b51NmeJpbsJcklsVLyDsimlyM_lPK0R4Ys&amp;__tn__=-]K-R\" role=\"link\" tabindex=\"0\" target=\"_blank\">SUT Startups</a></p><ul><li style=\"box-sizing:border-box;list-style:unset;\">โครงการ From Gen Z to be CEO</li></ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">วันจัดกิจกรรม : วันที่ 29 มี.ค. - 1 เม.ย. 2566</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ติดตามกิจกรรมที่ เพจ SEDA</p><ul><li style=\"box-sizing:border-box;list-style:unset;\">SUT Global Entrepreneurship camp #3​</li></ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">วันจัดกิจกรรม : วันที่ 25 พ.ค. – 3 มิ.ย. 2566</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">เปิดรับสมัคร : เร็ว ๆ นี้ ที่เพจ SEDA</p><ul><li style=\"box-sizing:border-box;list-style:unset;\">SUT Hackathon#16 : Smart Living</li></ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">วันจัดกิจกรรม : วันที่ 25 พ.ค. – 3 มิ.ย. 2566</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">เปิดรับสมัคร : เร็ว ๆ นี้ ที่เพจ SEDA</p>', NULL, NULL, NULL, NULL),
(145, 1, 5, 3, 'New ! โปรแกรมการพัฒนาความเป็นผู้ประกอบการ โปรแกรม \" “Innovation playground ”', 'เพราะเราเชื่อว่า   \" Fail Faster Succeed Sooner \"   \" ยิ่งล้มเหลวเร็วแค่ไหน ยิ่งมีโอกาสให้คุณได้เรียนรู้และพัฒนาสู่ความสำเร็จเร็วแค่นั้น\"', 'public\\images\\card_picture\\2.jpg', '<p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:var(--ck-spacing-large) 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">เพราะเราเชื่อว่า &nbsp;<strong style=\"box-sizing:border-box;\"> \" Fail Faster Succeed Sooner \"</strong>&nbsp; &nbsp;\" ยิ่งล้มเหลวเร็วแค่ไหน ยิ่งมีโอกาสให้คุณได้เรียนรู้และพัฒนาสู่ความสำเร็จเร็วแค่นั้น\"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">หากคุณคือ คนที่ชอบทดลอง ลงมือทำ สร้างสรรค์สิ่งใหม่&nbsp; พร้อมเปิดรับการเรียนรู้ตลอดเวลา หรืออยากพัฒนาทักษะในด้านความเป็นผู้ประกอบการให้กับตัวเอง&nbsp; โครงการ SEDA มีพื้นที่ให้คุณได้ทดลอง ลองล้ม ลองลงมือทำ ลองเรียนรู้&nbsp; ไปกับพวกเรา ในโปรแกรม&nbsp;<strong style=\"box-sizing:border-box;\">&nbsp;“Innovation playground ”&nbsp;</strong> พื้นที่แห่งการทดลอง ลงมือทำ สร้างสรรค์นวัตกรรม ค้นหาและพัฒนาไอเดียธุรกิจ สำหรับนักศึกษามหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp;ขอชวนนักศึกษาทุกระดับชั้น ทุกสาขาวิชา ที่กำลังเรียนอยู่มหาวิทยาลัยเทคโนโลยีสุรนารี และศิษย์เก่า(สำเร็จการศึกษาไม่เกิน 5 ปี)&nbsp;&nbsp;รวมทีม มาทดลองปั้นไอเดียธุรกิจด้วยกัน ! จะเปิดรับสมัครเข้าร่วมโปรแกรมวันที่ 9 พฤศจิกายน 2564 ที่ <a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://www.facebook.com/SUT.SEDA/?ref=pages_you_manage\" target=\"_blank\">เพจ SEDA&nbsp;</a></p><ul style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin-bottom:10px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/2.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/3.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/4.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/5.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/6.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px var(--ck-spacing-large);orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">โปรแกรมนี้ภายใต้การบ่มเพาะความเป็นผู้ประกอบการ (SEDA EnCubation) ของโครงการจัดตั้งสถานพัฒนาความเป็นผู้ประกอบการสำหรับนักศึกษา (Student Entrepreneurship Development Academy : SEDA) มหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หากมีข้อสงสัยสอบถามข้อมูลเพิ่มเติมได้ที่ เพจ SEDA หรือโทร 044-223135 (คุณฟีม)&nbsp;</p>', NULL, NULL, NULL, NULL),
(146, 2, 5, 4, 'มหาวิทยาลัยขอนแก่นมีการวางแผนยุทธศาสตร์การบริหาร', 'การปรับเปลี่ยนครั้งใหญ่ (Transformation) เพื่อวิสัยทัศน์ในการเป็น “มหาวิทยาลัยวิจัยและพัฒนาชั้นนําระดับโลก” ทั้งด้านการจัดการศึกษาการวิจัยการบริการวิชาการการบริหารจัดการทรัพยากรบุคคลและด้านการบริหารจัดการองค์กรเพื่อให้มหาวิทยาลัยยังคงมีความก้าวหน้าและการพ', 'public\\images\\card_picture\\DSC02121_0-1536x1026.jpg', '<p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(255,255,255);\"><span style=\"box-sizing:border-box;\">_</span></span>มหาวิทยาลัยขอนแก่นมีการวางแผนยุทธศาสตร์การบริหาร&nbsp;&nbsp;คือการปรับเปลี่ยนครั้งใหญ่ (Transformation) เพื่อวิสัยทัศน์ในการเป็น “มหาวิทยาลัยวิจัยและพัฒนาชั้นนําระดับโลก” ทั้งด้านการจัดการศึกษาการวิจัยการบริการวิชาการการบริหารจัดการทรัพยากรบุคคลและด้านการบริหารจัดการองค์กรเพื่อให้มหาวิทยาลัยยังคงมีความก้าวหน้าและการพัฒนามหาวิทยาลัยอย่างยั่งยืน</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(255,255,255);\"><span style=\"box-sizing:border-box;\">________</span></span>สำหรับด้านระบบนิเวศของมหาวิทยาลัย&nbsp;(Ecological)&nbsp;&nbsp;ซึ่งอยู่ภายใต้การรับผิดชอบของฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม มหาวิทยาลัยขอนแก่น นั้น &nbsp;<b style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">ผศ.อาวุธ ยิ้มแต้&nbsp; รองอธิการบดีฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม</strong></b>&nbsp;&nbsp;เผยว่า การสร้างมหาวิทยาลัยขอนแก่นให้เป็นที่น่าทํางาน&nbsp;(Best place to work)&nbsp;ให้เป็นที่ทํางานที่สนุกและท้าทายทําให้คณาจารย์และบุคลากรอยากทํางานด้วยมากที่สุด&nbsp;&nbsp;โดยจะมีการสร้างมหาวิทยาลัยให้เป็นที่น่าอยู่&nbsp;( Great place to live)&nbsp;เพื่อให้เป็นสถานที่ที่มีความเหมาะสมในการใช้ชีวิตมีสิ่งแวดล้อมที่ดีเป็นมหาวิทยาลัยสีเขียวมีห้องเรียนด้านพฤกษศาสตร์และมีความหลากหลายของสิ่งมีชีวิต&nbsp;(Biodiversity)</p><figure class=\"wp-caption aligncenter\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;clear:both;color:rgb(41, 39, 39);display:block;font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px auto 1.5em;max-width:100%;orphans:2;outline:0px;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;width:2560px;word-spacing:0px;\" id=\"attachment_152688\" aria-describedby=\"caption-attachment-152688\"><figure class=\"image\"><img class=\"wp-image-152688 size-full\" style=\"border-radius:0px;border-style:none;box-shadow:none;box-sizing:border-box;display:block;height:auto;margin-left:auto;margin-right:auto;max-width:100%;vertical-align:middle;\" src=\"https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-scaled.jpg\" alt=\"\" srcset=\"https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-scaled.jpg 2560w, https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-500x334.jpg 500w, https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-1200x801.jpg 1200w, https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-768x513.jpg 768w, https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-1536x1026.jpg 1536w, https://th.kku.ac.th/wp-content/uploads/2023/08/DSC02121_0-2048x1368.jpg 2048w\" sizes=\"(max-width: 2560px) 100vw, 2560px\" width=\"2560\" decoding=\"async\" fetchpriority=\"high\" height=\"1710\"></figure><figcaption class=\"wp-caption-text\" style=\"box-sizing:border-box;margin:0.8075em 0px;text-align:center;\" id=\"caption-attachment-152688\"><em style=\"box-sizing:border-box;\"><i><strong style=\"box-sizing:border-box;\">ผศ.อาวุธ ยิ้มแต้ รองอธิการบดีฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม</strong></i></em></figcaption></figure><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(255,255,255);\"><b style=\"box-sizing:border-box;\"><span style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">________</strong></span></b></span><b style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">ผศ.อาวุธ ยิ้มแต้&nbsp; </strong></b>กล่าวว่า &nbsp;“โครงการที่เป็นเรือธงในการพัฒนามหาวิทยาลัยขอนแก่น (Flag ship projects) ของฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม คือ การเพิ่มจำนวนที่พักบุคลากรที่พักนักศึกษาและบุคลากรให้มีจำนวนมากขึ้น&nbsp;&nbsp;นำพื้นที่สนามซอฟท์บอล หลังหอ 26 สร้างเป็นหอพักนักศึกษา &nbsp;โดยจะจัดหาพื้นที่ใหม่สำหรับสร้างสนามซอฟท์บอลทดแทน&nbsp;&nbsp;และพื้นที่อยู่ด้านหลังปั๊มน้ำมัน ปตท. รวมสองพื้นที่นี้จะรองรับนักศึกษาได้ประมาณ 4,000 คน ส่วนที่พักบุคลากรนั้นจะอยู่บริเวณฝั่งบึงสีฐาน เป็นพื้นที่ใกล้ๆ กันกับพิพิธภัณฑ์วิทยาศาสตร์&nbsp;&nbsp;การดำเนินการเป็น 2 เฟส คาดว่าจะรองรับบุคลากรได้ประมาณ 2,000 คน&nbsp;&nbsp;ขณะนี้มีความก้าวหน้าอยู่ในช่วงทำร่างขอบเขตงาน (Term of Reference)หรือ TOR &nbsp;เสร็จแล้ว &nbsp;จากนั้นจะเข้าสู่ขั้นตอนหาผู้ร่วมลงทุนมาดำเนินการก่อสร้างต่อไป”</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(255,255,255);\"><span style=\"box-sizing:border-box;\">________</span></span>“อีกส่วนหนึ่งที่เกี่ยวข้องกับงานพลิกโฉมที่ฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม&nbsp;รับผิดชอบก็คือ&nbsp;เรื่องของการปรับปรุงศูนย์อาหารและบริการ&nbsp;หรือ คอมเพล็กซ์&nbsp;นั้น&nbsp;&nbsp;เป็นการปรับปรุงใหญ่ซึ่งท่านอธิการให้ความสำคัญเนื่องจาก Complex เป็นพื้นที่ที่บุคลากรส่วนใหญ่ทั้งมหาวิทยาลัยมาใช้งานในพื้นที่นี้ร่วมกัน&nbsp;ขณะนี้อยู่ในช่วงของการออกแบบพื้นที่”</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(255,255,255);\"><span style=\"box-sizing:border-box;\">________</span></span>“นอกจากนี้ยังมีระบบประปา&nbsp;ที่มหาวิทยาลัยลงทุนขุดลอกบ่อเก็บน้ำดิบ&nbsp;เพื่อเก็บกักน้ำที่ผลิตได้ให้มากขึ้น&nbsp;ป้องกันการขาดแคลนน้ำในฤดูแล้ง&nbsp;ลดความเสี่ยงการขาดน้ำของมหาวิทยาลัยขอนแก่น&nbsp;&nbsp;&nbsp;&nbsp;ซึ่งได้มีการดำเนินการเกือบสมบูรณ์แล้ว&nbsp;&nbsp;สำหรับการสำรองน้ำที่ผลิตเป็นน้ำประปานั้น&nbsp;&nbsp;มีแผนจะนำเอาถังเก็บน้ำที่เลิกใช้เอากลับมาบูรณะใหม่&nbsp;&nbsp;เพื่อจะเพิ่มปริมาตรการเก็บกักน้ำที่ผลิตเป็นน้ำประปาให้มีน้ำใช้ได้ตลอดปี&nbsp;&nbsp;ส่วนน้ำที่ใช้ในด้านการเกษตร&nbsp;เช่น คณะเกษตรศาสตร์ได้มีการวางท่อจ่ายน้ำที่ผ่านระบบบำบัดน้ำเสีย&nbsp;และสูบน้ำดิบที่ได้มาตามธรรมชาติ สุ่มจ่ายไปหลายจุดนำไปใช้รดต้นไม้&nbsp;&nbsp;ซึ่งในอนาคตจะมีการพัฒนาบึงต่างๆ&nbsp;ในมหาวิทยาลัยขอนแก่น เช่น&nbsp;การขุดลอกหนองหัวช้างซึ่งเป็นสระเก็บน้ำเก่าแก่ของมหาวิทยาลัยที่ปัจจุบันมีความตื้นเขินเพื่อจัดเก็บน้ำเพื่อใช้ในการเกษตร&nbsp;ทั้งยังสร้างระบบนิเวศให้น่าอยู่ ร่มรื่น&nbsp;เพิ่มความผาสุขการทำงานบุคลากรต่อไป”&nbsp; <b style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">ผศ.อาวุธ ยิ้มแต้&nbsp; รองอธิการบดีฝ่ายโครงสร้างพื้นฐานและสิ่งแวดล้อม&nbsp; </strong></b>กล่าวในที่สุด</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\">ข่าว&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;วัชรา &nbsp;น้อยชมภู<br>ภาพ &nbsp;:&nbsp; &nbsp;ชายชาญ&nbsp; &nbsp;หล้าดา</p><h3 class=\"elementor-heading-title elementor-size-default\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;clear:both;color:var(--ast-global-color-2);font-family:Kanit, sans-serif;font-size:1.5625rem;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1;margin:0px;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\">KKU expedites reengineering of dormitory complexes for safety and pleasant living</h3><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><a style=\"background-color:transparent;box-shadow:none;box-sizing:border-box;color:rgb(167, 59, 36);text-decoration:none;transition:all 0.2s linear 0s;\" href=\"https://www.kku.ac.th/16755\">https://www.kku.ac.th/16755</a></p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\"><iframe style=\"border-style:none;box-sizing:border-box;font-size:18px;font-style:inherit;font-weight:inherit;line-height:1;margin:0px;max-width:100%;outline:0px;padding:0px;vertical-align:baseline;width:987.188px;\" src=\"https://www.youtube.com/embed/46QVGvcrRAc\" width=\"1280\" height=\"718\" allowfullscreen=\"allowfullscreen\"></iframe></p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;color:rgb(41, 39, 39);font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 1.75em;orphans:2;outline:0px;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</p><figure class=\"wp-caption aligncenter\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;clear:both;color:rgb(41, 39, 39);display:block;font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px auto 1.5em;max-width:100%;orphans:2;outline:0px;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;width:650px;word-spacing:0px;\" id=\"attachment_152702\" aria-describedby=\"caption-attachment-152702\"><figure class=\"image\"><img class=\"size-full wp-image-152702\" style=\"border-radius:0px;border-style:none;box-shadow:none;box-sizing:border-box;display:block;height:auto;margin-left:auto;margin-right:auto;max-width:100%;vertical-align:middle;\" src=\"https://th.kku.ac.th/wp-content/uploads/2023/08/%E0%B8%AD%E0%B9%88%E0%B8%B2%E0%B8%87%E0%B9%80%E0%B8%81%E0%B9%87%E0%B8%9A%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%87%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B9%80%E0%B8%A0%E0%B8%AA%E0%B8%B1%E0%B8%8A%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C_0.jpg\" alt=\"\" srcset=\"https://th.kku.ac.th/wp-content/uploads/2023/08/อ่างเก็บน้ำหลังคณะเภสัชศาสตร์_0.jpg 650w, https://th.kku.ac.th/wp-content/uploads/2023/08/อ่างเก็บน้ำหลังคณะเภสัชศาสตร์_0-500x282.jpg 500w\" sizes=\"(max-width: 650px) 100vw, 650px\" width=\"650\" decoding=\"async\" height=\"366\"></figure><figcaption class=\"wp-caption-text\" style=\"box-sizing:border-box;margin:0.8075em 0px;text-align:center;\" id=\"caption-attachment-152702\">พื้นที่โรงผลิตน้ำประปา</figcaption></figure><figure class=\"wp-caption aligncenter\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-width:0px;box-sizing:border-box;clear:both;color:rgb(41, 39, 39);display:block;font-family:Sarabun, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px auto 1.5em;max-width:100%;orphans:2;outline:0px;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;vertical-align:baseline;white-space:normal;widows:2;width:650px;word-spacing:0px;\" id=\"attachment_152701\" aria-describedby=\"caption-attachment-152701\"><figure class=\"image\"><img class=\"size-full wp-image-152701\" style=\"border-radius:0px;border-style:none;box-shadow:none;box-sizing:border-box;display:block;height:auto;margin-left:auto;margin-right:auto;max-width:100%;vertical-align:middle;\" src=\"https://th.kku.ac.th/wp-content/uploads/2023/08/%E0%B8%AD%E0%B9%88%E0%B8%B2%E0%B8%87%E0%B9%80%E0%B8%81%E0%B9%87%E0%B8%9A%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%AD%E0%B8%87%E0%B9%84%E0%B8%9C%E0%B9%88-%E0%B8%84%E0%B8%93%E0%B8%B0%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%95%E0%B8%A3%E0%B8%A8%E0%B8%B2%E0%B8%AA%E0%B8%95%E0%B8%A3%E0%B9%8C_0.jpg\" alt=\"\" srcset=\"https://th.kku.ac.th/wp-content/uploads/2023/08/อ่างเก็บน้ำหนองไผ่-คณะเกษตรศาสตร์_0.jpg 650w, https://th.kku.ac.th/wp-content/uploads/2023/08/อ่างเก็บน้ำหนองไผ่-คณะเกษตรศาสตร์_0-500x282.jpg 500w\" sizes=\"(max-width: 650px) 100vw, 650px\" width=\"650\" decoding=\"async\" loading=\"lazy\" height=\"366\"></figure><figcaption class=\"wp-caption-text\" style=\"box-sizing:border-box;margin:0.8075em 0px;text-align:center;\" id=\"caption-attachment-152701\">อ่างเก็บน้ำหนองไผ่คณะเกษตรศาสตร์</figcaption></figure>', NULL, NULL, NULL, NULL),
(147, 1, 5, 4, 'ฟาร์มมหาวิทยาลัย ร่วมกับสำนักวิชาเทคโนโลยีการเกษตร มทส. จัดงาน มาตุ้ม มาโฮม ครั้งที่ 2 สีสันแห่งฟาร์มสุข วันที่ 8 – 10 สิงหาคม นี้', 'ฟาร์มมหาวิทยาลัย ร่วมกับสำนักวิชาเทคโนโลยีการเกษตร มทส. จัดงาน มาตุ้ม มาโฮม ครั้งที่ 2 สีสันแห่งฟาร์มสุข วันที่ 8 – 10 สิงหาคม นี้', 'public\\images\\card_picture\\news.jpg', '<h1 style=\"color:rgb(192, 156, 98);margin:10px 0px 0px;padding:0px;text-align:center;\">ฟาร์มมหาวิทยาลัย ร่วมกับสำนักวิชาเทคโนโลยีการเกษตร มทส. จัดงาน มาตุ้ม มาโฮม ครั้งที่ 2 สีสันแห่งฟาร์มสุข วันที่ 8 – 10 สิงหาคม นี้</h1><p><img class=\"image_resized cont-img\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-style:none;color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:auto;letter-spacing:normal;margin:0px 0px 20px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:690px;word-spacing:0px;\" src=\"http://www.sut.ac.th/2012/images/upload/news/2218/2218/news.jpg\" alt=\"\"></p><div class=\"xdj266r x11i5rnm xat24cr x1mh8g0r x1vvkbs x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(5, 5, 5);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">เกษตร มทส. จัดงาน “มาตุ้ม มาโฮม ครั้งที่ 2”</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">สีสันแห่งฟาร์มสุข วันที่ 8 – 10 สิงหาคม นี้</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">&nbsp;</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">เมื่อวันที่ 8 สิงหาคม 2566 กิจกรรม </span></span><strong style=\"font-family:inherit;margin:0px;padding:0px;\">“เกษตรมาตุ้ม มาโฮม ครั้งที่ 2”</strong><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\"> สีสันแห่งฟาร์มสุข จัดโดยฟาร์มมหาวิทยาลัย ร่วมกับสำนักวิชาเทคโนโลยีการเกษตร มทส. เพื่อเป็นกิจกรรมต้อนรับนักศึกษาใหม่ ปีการศึกษา 2566 อีกทั้ง เพื่อสนับสนุนเป็นการเรียนการสอน ฝึกทักษะผู้ประกอบการแก่นักศึกษา และสนับสนุนงานวิจัย กิจกรรมประกอบด้วย นิทรรศการผลงานด้านการเรียนการสอนงานวิจัย ร้านจำหน่ายสินค้าผลิตภัณฑ์ฟาร์ม กิจกรรมป้อนนมแพะ แกะ ขี่ม้า สาธิตการคล้องโค การออกร้านจำหน่ายสินค้าของนักศึกษา สถานประกอบการ และกิจกรรมแสดงบนเวที จัดขึ้นระหว่างวันที่ 8 – 9 สิงหาคม 2566 เวลา 15.00 – 22.00 น. ณ บริเวณลานด้านหน้าสำนักงานฟาร์ม มทส.</span></span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(5, 5, 5);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\"><img class=\"image_resized\" style=\"border-style:none;height:413px;margin:0px;padding:0px;width:620px;\" src=\"http://www.sut.ac.th/2012/images/upload/editor/images/202308/04/01.jpg\" alt=\"\"></div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">&nbsp;</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\"><img class=\"image_resized\" style=\"border-style:none;height:413px;margin:0px;padding:0px;width:620px;\" src=\"http://www.sut.ac.th/2012/images/upload/editor/images/202308/04/05.jpg\" alt=\"\"></div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">&nbsp;</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\"><img class=\"image_resized\" style=\"border-style:none;height:413px;margin:0px;padding:0px;width:620px;\" src=\"http://www.sut.ac.th/2012/images/upload/editor/images/202308/04/04.jpg\" alt=\"\"></div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\">&nbsp;</div><div style=\"font-family:inherit;margin:0px;padding:0px;\" dir=\"auto\"><img class=\"image_resized\" style=\"border-style:none;height:413px;margin:0px;padding:0px;width:620px;\" src=\"http://www.sut.ac.th/2012/images/upload/editor/images/202308/04/08.jpg\" alt=\"\"></div></div>', NULL, NULL, NULL, NULL);
INSERT INTO `news` (`news_id`, `news_type_id`, `user_id`, `topic_id`, `title`, `welding_para`, `card_picture`, `news_content`, `explain`, `start`, `end`, `time_stamp`) VALUES
(149, 1, 5, 3, 'Pride Month คืออะไร ทำความเข้าใจกันง่ายๆ', 'Pride Month หรือเดือนเเห่งความภาคภูมิใจของกลุ่มคนหลากหลายทางเพศ (LGBTQ+)  ที่เต็มไปด้วยสีสันแห่งสายรุ้งเเต่คุณรู้หรือไม่ว่าที่มาเเละเบื้องหลังของความภาคภูมิใจ ต้องเเลกมาด้วยอะไรบ้าง ทั้งเรื่องการเลือกปฏิบัติต่อกลุ่ม LGBTQ  ในยุค 70 หรือการจลาจลที่สร้างเเร', 'public\\images\\card_picture\\Pride Month-Post.jpg', '<p><b style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:20px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong>Pride Month คืออะไร ทำความเข้าใจกันง่ายๆ</strong></b></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:var(--ck-spacing-large) 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/Pride%20Month-Post.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">Pride Month หรือเดือนเเห่งความภาคภูมิใจของกลุ่มคนหลากหลายทางเพศ (LGBTQ+)</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ที่เต็มไปด้วยสีสันแห่งสายรุ้งเเต่คุณรู้หรือไม่ว่าที่มาเเละเบื้องหลังของความภาคภูมิใจ ต้องเเลกมาด้วยอะไรบ้าง ทั้งเรื่องการเลือกปฏิบัติต่อกลุ่ม LGBTQ</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ในยุค 70 หรือการจลาจลที่สร้างเเรงกระเพื่อมไปสู่หน้าประวัติศาสตร์ร่วมสมัยโลก&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">.</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ย้อนไปดูที่มาที่ไปของเดือนแห่งความภาคภูมิใจ&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">.</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เริ่มต้นที่ช่วงปีทศวรรษที่ 1960 ช่วงเวลานั้น เป็นช่วงเวลาแห่งการเรียกร้องในสหรัฐอเมริกาเพราะว่าเป็นช่วงที่คนตื่นรู้ทางการเมือง</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เริ่มรู้สึกว่าจริง ๆ เเล้วฉันก็มีสิทธิ์ต่าง ๆ ที่เคยบอกว่าต้องไม่ได้สิทธิ์จริง ๆ เเล้วก็มีนะ&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ดังนั้น คนก็เลยลุกขึ้นมาเรียกร้องสิทธิเเละเสรีภาพรวมถึงแก้ไขสิ่งที่รู้สึกว่าผิดกันเยอะ&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ไม่ว่าจะเป็นสิทธิของผู้พิการ ความเท่าเทียมของสีผิว รวมไปถึงการเท่าเทียมทางเพศ&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">.</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ในช่วงของยุคสหรัฐอเมริกาเป็นช่วงเวลาที่แย่มากของกลุ่มคนที่มีความหลากหลายทางเพศโดนเหยียด&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">บางคนที่บ้านก็ขับไล่ออกจากบ้าน ช่วงเวลานั้นที่ไม่ดีเลยของความเท่าเทียมทางเพศ&nbsp;&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เเล้วถามว่ากลุ่มคนที่มีความหลากหลายทางเพศ จะไปมีตัวตนที่ไหน ในเมื่อยุคนั้นไม่มีใครยอมรับ</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">สถานที่ปลอดภัยของพวกเขานั้นก็คือสิ่งที่เรียกว่า “บาร์เกย์นั่นเอง” พวกเขาจะไปรวมตัวกันไปสังสรรค์กัน</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">บางคนหนักกว่านั้นที่บ้านโดนขับไล่ก็ไปนอนที่บาร์เกย์ ด้วยการเหยียดเพศนี้เลยทำให้บาร์เกย์ ในยุคเเรก ๆ</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ยังไม่ได้รับการยอมรับทางกฏหมาย พอจะไปจดทะเบียนเป็นบาร์เขาไม่ให้จด เพราะว่าเป็นเกย์</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ดังนั้นกลุ่มคนเหล่านี้มักจะเปิดบาร์เกย์เถื่อน ทีนี้ปัญหาตามมา คือจะต้องส่งส่วยให้มาเฟีย ต้องส่งส่วยให้ตำรวจ เเละเเล้วเหตุการณ์ในครั้งนี้ก็เปลี่ยนแปลงไป</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เริ่มในคืนวันที่ 27 - 28&nbsp; มิถุนายน ปี 1969 ที่ผับแห่งหนึ่ง มีชื่อว่า สโตนวอลล์อินน์ เป็นแหล่งรวมตัวของผู้มีความหลากหลายทางเพศ</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ไม่ว่าจะเป็นทรานส์ เกย์&nbsp; แดร็กควีน เรียกได้ว่ามีความหลากหลาย เเละวันหนึ่งตำรวจเข้าบุกจับคนเหล่านั้น เเละพวกเขาไม่ยอมสุดท้ายเหตุการณ์บานปลายขึ้น</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เริ่มมีกลุ่มคนลงมาที่ถนน กลายเป็นพาเหรด กลายเป็นเพื่อเรียกร้อง เรื่องที่จะมาจับเหมือนพวกเขาเหมือนเป็นอาชญากรไม่ได้</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เราเเค่เป็นผู้มีความหลากหลายทางเพศ เราเเค่อยากเลือกเพศของเรามันไม่มีอะไรผิด&nbsp;</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">.</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เเละเหตุการณ์นี้เริ่มมีคนออกมาเเสดงตัวตนกันอย่างมากเป็นเหตุการณ์ครั้งเเรกของกลุ่มผู้มีความหลากหลายทางเพศที่ออกมาเเสดงตัวตนจริงจัง</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เเละออกสื่อครั้งแรกเเละเป็นจุดเริ่มต้นเล็ก ๆ ทำให้เกิดความเรียกร้องความเท่าเทียมทางเพศ จะเห็นเหตุการณ์การเดินขบวน ในถนนคริสโตเฟอร์ หรือเหตุการณ์วันมือม่วง</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">เเละเหตุการณ์ครั้งนี้ก็กระจายไปทั่วโลก มีการระลึกถึงหลังจากเรียกร้องวันเดียว มันก็มีการขยายใหญ่ขึ้นเรื่อย ๆ จนกระทั้งสุดท้าย</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><span style=\"font-size:14px;\"><span style=\"box-sizing:border-box;\">ก็กลายเป็นการเรียกร้องเเบบทั้งเดือนยาวต่อเนื่อง เพื่อเเสดงตัวตนของกลุ่มผู้มีความหลากหลายทางเพศ</span></span></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><strong style=\"box-sizing:border-box;\">Reference:&nbsp;</strong></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://thestandard.co/pride-month/\" target=\"_blank\"><strong style=\"box-sizing:border-box;\">https://thestandard.co/pride-month/</strong></a></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px var(--ck-spacing-large);orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://www.youtube.com/watch?v=0AaaZZgBjK4\" target=\"_blank\"><strong style=\"box-sizing:border-box;\">Pride Month มาจากไหน? ทำไมเดือนนี้ต้องสีรุ้ง? | Point of View</strong></a></p>', NULL, NULL, NULL, NULL),
(150, 1, 5, 4, 'aa', 'aa', 'public\\images\\card_picture\\2.jpg', '<p>asdfasdfasfdasfdsfads</p>', NULL, NULL, NULL, NULL),
(151, 1, 5, 3, 'แต่งแล้ว 30 ยังแจ๋ว', 'ฟฟฟฟ', 'public\\images\\card_picture\\2.jpg', '<p>ฟหกดฟหกดฟหดกฟกห</p>', NULL, NULL, NULL, '2023-08-13 09:00:43.021000'),
(152, 1, 5, 4, 'แต่งแล้ว 30 ยังแจ๋ว', 'งานแต่ง', 'public\\images\\card_picture\\2.jpg', '<p>หำเำเำพั้พ้</p>', NULL, NULL, NULL, '2023-08-13 09:20:57.749000'),
(156, 1, 5, 2, 'asdf', 'asdf', 'public\\images\\card_picture\\289831206_10221473101876505_5511253184576468268_n.jpg', '<p>asdfasdfasdfasf</p>', '<p>asdfasdfasdfsadfsadf</p>', '2023-08-14', '2023-08-15', '2023-08-14 07:32:01.413000'),
(157, 1, 5, 2, '123', '123', 'public\\images\\card_picture\\289380382_10221473102076510_4286584416277604365_n.jpg', '<p>asdfasfdsadf</p>', '<p>asdfasdfasdf</p>', '2023-08-14', '2023-08-16', '2023-08-14 08:40:43.901000'),
(158, 2, 5, 4, '1111111111111', 'งานแต่ง', 'public\\images\\card_picture\\205551038_516695639758007_8769628568148858641_n.jpg', '<p>12121</p>', '<p>12121</p>', '2023-08-14', '2023-08-16', '2023-08-14 09:32:13.387000'),
(159, 1, 5, 2, 'แฟ้มน้อย', 'การปรับเปลี่ยนครั้งใหญ่ (Transformation) เพื่อวิสัยทัศน์ในการเป็น “มหาวิทยาลัยวิจัยและพัฒนาชั้นนําระดับโลก” ทั้งด้านการจัดการศึกษาการวิจัยการบริการวิชาการการบริหารจัดการทรัพยากรบุคคลและด้านการบริหารจัดการองค์กรเพื่อให้มหาวิทยาลัยยังคงมีความก้าวหน้าและการพ', 'public\\images\\card_picture\\2.jpg', '<p>asdfasdfasfddsafsad</p>', '<p>asdfasdfsafsdaf</p>', '2023-08-24', '2023-08-25', '2023-08-15 13:51:08.868000'),
(160, 1, 11, 8, 'New ! โปรแกรมการพัฒนาความเป็นผู้ประกอบการ โปรแกรม \" “Innovation playground ”', 'เพราะเราเชื่อว่า   \" Fail Faster Succeed Sooner \"   \" ยิ่งล้มเหลวเร็วแค่ไหน ยิ่งมีโอกาสให้คุณได้เรียนรู้และพัฒนาสู่ความสำเร็จเร็วแค่นั้น\"', 'public\\images\\card_picture\\2.jpg', '<p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:var(--ck-spacing-large) 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">เพราะเราเชื่อว่า &nbsp;<strong style=\"box-sizing:border-box;\"> \" Fail Faster Succeed Sooner \"</strong>&nbsp; &nbsp;\" ยิ่งล้มเหลวเร็วแค่ไหน ยิ่งมีโอกาสให้คุณได้เรียนรู้และพัฒนาสู่ความสำเร็จเร็วแค่นั้น\"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">หากคุณคือ คนที่ชอบทดลอง ลงมือทำ สร้างสรรค์สิ่งใหม่&nbsp; พร้อมเปิดรับการเรียนรู้ตลอดเวลา หรืออยากพัฒนาทักษะในด้านความเป็นผู้ประกอบการให้กับตัวเอง&nbsp; โครงการ SEDA มีพื้นที่ให้คุณได้ทดลอง ลองล้ม ลองลงมือทำ ลองเรียนรู้&nbsp; ไปกับพวกเรา ในโปรแกรม&nbsp;<strong style=\"box-sizing:border-box;\">&nbsp;“Innovation playground ”&nbsp;</strong> พื้นที่แห่งการทดลอง ลงมือทำ สร้างสรรค์นวัตกรรม ค้นหาและพัฒนาไอเดียธุรกิจ สำหรับนักศึกษามหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp;ขอชวนนักศึกษาทุกระดับชั้น ทุกสาขาวิชา ที่กำลังเรียนอยู่มหาวิทยาลัยเทคโนโลยีสุรนารี และศิษย์เก่า(สำเร็จการศึกษาไม่เกิน 5 ปี)&nbsp;&nbsp;รวมทีม มาทดลองปั้นไอเดียธุรกิจด้วยกัน ! จะเปิดรับสมัครเข้าร่วมโปรแกรมวันที่ 9 พฤศจิกายน 2564 ที่ <a style=\"box-sizing:border-box;color:rgb(66, 139, 202);text-decoration:none;\" href=\"https://www.facebook.com/SUT.SEDA/?ref=pages_you_manage\" target=\"_blank\">เพจ SEDA&nbsp;</a></p><ul style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin-bottom:10px;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</ul><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/2.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/3.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/4.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/5.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized img-responsive\" style=\"border-width:0px;box-sizing:border-box;display:unset !important;height:960px;max-width:100%;vertical-align:middle;width:960px;\" src=\"https://seda.sut.ac.th/ckfinder/userfiles/files/6.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px 10px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">&nbsp;</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(101, 101, 101);font-family:Mitr, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;margin:0px 0px var(--ck-spacing-large);orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" dir=\"ltr\">โปรแกรมนี้ภายใต้การบ่มเพาะความเป็นผู้ประกอบการ (SEDA EnCubation) ของโครงการจัดตั้งสถานพัฒนาความเป็นผู้ประกอบการสำหรับนักศึกษา (Student Entrepreneurship Development Academy : SEDA) มหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หากมีข้อสงสัยสอบถามข้อมูลเพิ่มเติมได้ที่ เพจ SEDA หรือโทร 044-223135 (คุณฟีม)&nbsp;</p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(101,101,101);font-family:Mitr, sans-serif;font-size:16px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:300;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">โปรแกรมนี้ภายใต้การบ่มเพาะความเป็นผู้ประกอบการ (SEDA EnCubation) ของโครงการจัดตั้งสถานพัฒนาความเป็นผู้ประกอบการสำหรับนักศึกษา (Student Entrepreneurship Development Academy : SEDA) มหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; หากมีข้อสงสัยสอบถามข้อมูลเพิ่มเติมได้ที่ เพจ SEDA หรือโทร 044-223135 (คุณฟีม</span></span></p>', '2023-08-22', '2023-08-30', '2023-08-22 16:12:56.444000'),
(161, 1, 5, 4, 'ประชุมวิชาการ เรื่องการใช้ยาบำบัดรักษาโรคหัวใจและหลอดเลือด', 'คณะเภสัชศาสตร์ จุฬาฯ ขอเชิญเภสัชกร บุคลากรทางการแพทย์ และผู้สนใจร่วมการประชุมวิชาการในหัวข้อ Pharmacotherapy in Cardiometabolic Diseases ครั้งที่ 14', 'public\\images\\card_picture\\24082023-1024x536.jpg', '<p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(51, 51, 51);font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1.5rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">คณะเภสัชศาสตร์&nbsp;จุฬาฯ ขอเชิญเภสัชกร บุคลากรทางการแพทย์ และผู้สนใจร่วม<strong style=\"box-sizing:border-box;\">การประชุมวิชาการในหัวข้อ Pharmacotherapy in Cardiometabolic Diseases</strong> <strong style=\"box-sizing:border-box;\">ครั้งที่ 14</strong> ระหว่างวันที่ 27 – 29 กันยายน 2566 เวลา 08.30 – 16.30 น. ณ โรงแรมเอเชีย กรุงเทพ เพื่อเพิ่มพูนความรู้ที่ทันสมัยเกี่ยวกับการใช้ยาบำบัดรักษาโรคหัวใจและหลอดเลือด และแลกเปลี่ยนความคิดเห็นและประสบการณ์&nbsp;ระหว่างบุคลากรทางการแพทย์ สามารถนำความรู้ที่ได้ไปประยุกต์ใช้ในการดูแลรักษาผู้ป่วยโรคหัวใจและหลอดเลือดได้</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(51, 51, 51);font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1.5rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ผู้สนใจสามารถลงทะเบียนได้ที่ QR Code ในโปสเตอร์ประชาสัมพันธ์</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(51, 51, 51);font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1.5rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">สอบถามข้อมูลเพิ่มเติมได้ที่ หน่วยการศึกษาต่อเนื่อง คณะเภสัชศาสตร์ จุฬาฯ โทร. 0-2218-8283&nbsp; และภาควิชาเภสัชกรรมปฏิบัติ คณะเภสัชศาสตร์ จุฬาฯ โทร. 0-2218-8403</p><p style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(51, 51, 51);font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin-bottom:1.5rem;margin-top:0px;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">E-mail:&nbsp;<a style=\"box-sizing:border-box;color:rgb(222, 92, 142);outline:0px !important;text-decoration:none;\" href=\"mailto:ce@pharm.chula.ac.th\">ce@pharm.chula.ac.th</a></p><p><img class=\"wp-image-130536 entered lazyloaded\" style=\"box-sizing:border-box;height:auto;max-width:100%;vertical-align:middle;\" src=\"https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-1024x1024.png\" alt=\"\" srcset=\"https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-1024x1024.png 1024w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-720x720.png 720w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-150x150.png 150w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-768x768.png 768w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0.png 1080w\" sizes=\"(max-width: 1024px) 100vw, 1024px\" width=\"1024\" decoding=\"async\" height=\"1024\" data-lazy-srcset=\"https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-1024x1024.png 1024w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-720x720.png 720w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-150x150.png 150w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-768x768.png 768w, https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0.png 1080w\" data-lazy-sizes=\"(max-width: 1024px) 100vw, 1024px\" data-lazy-src=\"https://www.chula.ac.th/wp-content/uploads/2023/08/14th-Cardiometabolic-Diseases-ver.3.0-1024x1024.png\" data-ll-status=\"loaded\"></p><div class=\"mt-content list-tags\" style=\"-webkit-text-stroke-width:0px;box-sizing:border-box;color:rgb(51, 51, 51);display:flex;flex-wrap:wrap;font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;list-style-type:none;margin:0px;orphans:2;padding:0px;position:relative;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div>', '<p><span style=\"color:rgb(51,51,51);font-family:Inter, Helvetica, Arial, sans-serif;font-size:18px;\"><span style=\"-webkit-text-stroke-width:0px;display:inline !important;float:none;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">สอบถามข้อมูลเพิ่มเติมได้ที่ หน่วยการศึกษาต่อเนื่อง คณะเภสัชศาสตร์ จุฬาฯ โทร. 0-2218-8283&nbsp; และภาควิชาเภสัชกรรมปฏิบัติ คณะเภสัชศาสตร์ จุฬาฯ โทร. 0-2218-8403</span></span></p><p>&nbsp;</p>', '2023-08-27', '2023-08-31', '2023-08-24 18:53:59.358000');

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
(9, 'ทุนการศึกษา'),
(10, 'กยศ.'),
(11, 'จิตอาสา');

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
(5, 'OFFICIAL USER', 'P\'Cream Sudarat', 'Cream', 'c@gmail.com', 'female', '$2b$12$d5G7emhWbrTzJtpbBTdtVOqEZ1IaQez1FgxCqwCWHchUizaFsBqy6', 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'),
(6, 'USER', 'P\'Aa', 'AAAAAAA', 'aa@gmail.com', 'female', '$2b$12$4Fc2k2fSAxVOmzrCFdgGdOK5qh7X65E3tPDN8NlHt9d2xa5oSkdVO', NULL),
(11, 'ADMIN', 'P\'Fam', 'Fam1', 'fam1@gmail.com', 'female', '$2b$12$cCc3T1GgRJbXPFR0179HHuWtGIUu9O7lhAvJfNf9pFgYw0jJnoIsW', 'public\\images\\users_picture\\ded402ca0fe9be3cbcda56570eb425ad.jpg'),
(12, 'GUEST', '', 'PLEASE LOGIN', '', '', '', NULL),
(13, 'OFFICIAL USER', 'PaoPao', 'ร้านเปาหมูกระทะ', 'pao@gmail.com', '', '$2b$12$OkjodQpaZo8FcwSJFgnWaeiY4av2PpscjXEp5/6FQed/wTPvtHUeC', NULL),
(14, 'USER', 'ARMZA_007', 'P\'ARM', 'arm@gmail.com', 'female', '$2b$12$3KxpGOQ6x.VjhRD9aIr3SO4s9gdba.E1oolV7iM7E6DgHfQs1x9/C', NULL),
(15, 'USER', 'asdf', 'a', 'a@gmail.com', 'no gender', '$2b$12$n1gV9TPc83Jh9d4mBcQmpOlJ49MW0ZrGUIIVqxwDq/Q5gFsi4S2vu', NULL);

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
(20, 5, '0988888888', '123456', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'approve'),
(23, 15, '0960600676', '17', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'waiting for approval');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD KEY `news_id` (`b_news_id`),
  ADD KEY `users_id` (`b_users_id`);

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
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `group_section`
--
ALTER TABLE `group_section`
  MODIFY `group_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `user_request_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `bookmark_ibfk_1` FOREIGN KEY (`b_news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `bookmark_ibfk_2` FOREIGN KEY (`b_users_id`) REFERENCES `users` (`id`);

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
