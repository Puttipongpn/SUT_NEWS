-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20230611.e6bbb848a3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2023 at 08:07 PM
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
-- Table structure for table `approve_news`
--

CREATE TABLE `approve_news` (
  `approve_id` int(16) NOT NULL,
  `news_id` int(16) NOT NULL,
  `status_id` int(16) NOT NULL,
  `response` text DEFAULT NULL,
  `location_post_id` int(16) DEFAULT NULL,
  `admin_id` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approve_news`
--

INSERT INTO `approve_news` (`approve_id`, `news_id`, `status_id`, `response`, `location_post_id`, `admin_id`) VALUES
(34, 179, 2, NULL, 1, 11),
(35, 180, 1, NULL, NULL, 11),
(36, 181, 2, NULL, 1, 11),
(37, 182, 2, NULL, NULL, 11),
(38, 183, 1, NULL, NULL, NULL);

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
(122, 11, 160),
(129, 11, 149),
(137, 3, 141),
(139, 3, 147),
(140, 3, 145),
(141, 3, 140),
(142, 3, 161),
(151, 5, 179),
(152, 11, 181),
(153, 5, 181);

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
(141, 179, 8),
(142, 180, 8),
(143, 181, 8),
(144, 182, 7),
(145, 182, 5),
(146, 183, 5),
(147, 183, 8);

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `like_id` int(16) NOT NULL,
  `like_news_id` int(16) NOT NULL,
  `like_user_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `location_post`
--

CREATE TABLE `location_post` (
  `location_post_id` int(16) NOT NULL,
  `location_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location_post`
--

INSERT INTO `location_post` (`location_post_id`, `location_name`) VALUES
(1, 'ปกข่าวหน้าหลัก'),
(2, 'ข่าวด่วน');

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
(179, 1, 5, 14, 'การรับสมัครนักศึกษา ระดับบัณฑิตศึกษา ', 'ประจำภาคการศึกษา 2/2566', 'public\\images\\card_picture\\news (1).jpg', '<h1 style=\"color:rgb(192, 156, 98);margin:10px 0px 0px;padding:0px;\">ผลการประกวดออกแบบ ลวดลายภาพผนังห้องควบคุมระบบกักเก็บพลังงานจากแบตเตอรี่ (BESS)</h1><p><img class=\"image_resized cont-img\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-style:none;color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:auto;letter-spacing:normal;margin:0px 0px 20px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:690px;word-spacing:0px;\" src=\"https://www.sut.ac.th/images/upload/news/2215/2215/news.jpg\" alt=\"\"></p><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ประกาศมหาวิทยาลัยเทคโนโลยีสุรนารี</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">เรื่อง ผลการประกวดออกแบบ “ลวดลายภาพผนังห้องควบคุมระบบกักเก็บพลังงานจากแบตเตอรี่ (BESS)”</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ตามที่ มหาวิทยาลัยเทคโนโลยีสุรนารี (มทส.) ได้มีประกาศ เรื่อง การประกวด <strong style=\"margin:0px;padding:0px;\">“ลวดลายภาพผนังห้องควบคุมระบบกักเก็บพลังงานจากแบตเตอรี่ (BESS)” </strong>ลงวันที่ 31 พฤษภาคม 2566 นั้น</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">บัดนี้ ได้พิจารณาตัดสินผลการประกวดเสร็จเรียบร้อยแล้ว ฉะนั้น อาศัยอํานาจตามความในมาตรา ๒๑ และมาตรา 24 แห่งพระราชบัญญัติมหาวิทยาลัยเทคโนโลยีสุรนารี พ.ศ. 2533&nbsp; ประกอบกับประกาศสํานักนายกรัฐมนตรี เรื่อง แต่งตั้งอธิการบดีมหาวิทยาลัยเทคโนโลยีสุรนารี&nbsp; ลงวันที่ 14 กันยายน 2564&nbsp; จึงประกาศผลการประกวดออกแบบ ประกวด “ลวดลายภาพผนังห้องควบคุมระบบกักเก็บพลังงานจากแบตเตอรี่ (BESS)” ดังนี้<br>&nbsp;</div><ul><li style=\"list-style:none;margin:0px;padding:0px;\"><strong style=\"margin:0px;padding:0px;\">รางวัลชนะเลิศ</strong> เงินรางวัล 10,000&nbsp; บาท และเกียรติบัตร ได้แก่<br>นายเกศดา แจ่มใส รหัส B6509521 สาขาวิชาวิศวกรรมปิโตรเลียมและเทคโนโลยีธรณี</li></ul><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><ul><li style=\"list-style:none;margin:0px;padding:0px;\"><strong style=\"margin:0px;padding:0px;\">รางวัลชมเชย</strong> เงินรางวัล 2,000 บาท และเกียรติบัตร ได้แก่<br>นางสาวกวิสรา โนนดอน รหัส B6108618 สาขาวิชาวิศวกรรมเกษตรและอาหาร<br>นางสาวรัมภ์รดา เพ็ชรเจริญสุข รหัส B6304744 สาขาวิชาวิศวกรรมเกษตรและอาหาร<br>นางสาวชนกนันท์ หน้านวล รหัส B6302665 สาขาวิชาเทคโนโลยีและนวัตกรรมทางสัตว์&nbsp; &nbsp;</li></ul><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">จึงประกาศให้ทราบโดยทั่วกัน</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">ประกาศ ณ วันที่&nbsp; 3 สิงหาคม พ.ศ. 2566</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized\" style=\"border-style:none;height:820px;margin:0px;padding:0px;width:580px;\" src=\"https://www.sut.ac.th/2012/images/upload/editor/images/202308/02/2023-08-04%2014_23_27-%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B8%9C%E0%B8%A5%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%A7%E0%B8%94%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%81%E0%B8%9A%E0%B8%9A%20BESS_pdf_pdf%20-%20Foxit%20PDF%20Editor.jpg\" alt=\"\"></div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><img class=\"image_resized\" style=\"border-style:none;height:820px;margin:0px;padding:0px;width:580px;\" src=\"https://www.sut.ac.th/2012/images/upload/editor/images/202308/02/2023-08-04%2014_23_46-%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B8%9C%E0%B8%A5%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%A7%E0%B8%94%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%81%E0%B8%9A%E0%B8%9A%20BESS_pdf_pdf%20-%20Foxit%20PDF%20Editor.jpg\" alt=\"\"></div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><br>----------------------<br>&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><a style=\"display:block;margin:0px;padding:0px;text-decoration:none;\" href=\"https://sutoffice365-my.sharepoint.com/:b:/g/personal/253024_office365_sut_ac_th/EfTFB0zSrmxCsfhzSp7McaEBkx-XYjRgJrQm0LvdpvGI-g?e=ZlOhOM\">ผลการประกวดออกแบบ ประกวด “ลวดลายภาพผนังห้องควบคุมระบบกักเก็บพลังงานจากแบตเตอรี่ (BESS)”</a>&nbsp;(PDF)</div><p><br>&nbsp;</p>', NULL, '2023-09-27', '2023-09-29', '2023-09-22 16:56:37.322000'),
(180, 1, 5, 14, 'ผลการคัดเลือกผู้ประกอบการให้บริการจำหน่ายอาหารทุกประเภท และเครื่องดื่ม ณ โรงอาหารส่วนกิจการนักศึกษา (หลังเก่า)', 'ประกาศมหาวิทยาลัยเทคโนโลยีสุรนารี เรื่อง ผลการคัดเลือกผู้ประกอบการให้บริการจำหน่ายอาหารทุกประเภท และเครื่องดื่ม ณ โรงอาหารส่วนกิจการนักศึกษา (หลังเก่า) มหาวิทยาลัยเทคโนโลยีสุรนารี', 'public\\images\\card_picture\\news (2).jpg', '<h1 style=\"color:rgb(192, 156, 98);margin:10px 0px 0px;padding:0px;\">ผลการคัดเลือกผู้ประกอบการให้บริการจำหน่ายอาหารทุกประเภท และเครื่องดื่ม ณ โรงอาหารส่วนกิจการนักศึกษา (หลังเก่า)</h1><p><img class=\"image_resized cont-img\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-style:none;color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:auto;letter-spacing:normal;margin:0px 0px 20px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:690px;word-spacing:0px;\" src=\"https://www.sut.ac.th/images/upload/news/2111/2111/news.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(90, 90, 90);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:10px 0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><span style=\"color:rgb(33,33,33);font-family:wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, EmojiFont;font-size:15px;\"><span style=\"margin:0px;padding:0px;\">ประกาศมหาวิทยาลัยเทคโนโลยีสุรนารี เรื่อง ผลการคัดเลือกผู้ประกอบการให้บริการจำหน่ายอาหารทุกประเภท และเครื่องดื่ม ณ โรงอาหารส่วนกิจการนักศึกษา (หลังเก่า) มหาวิทยาลัยเทคโนโลยีสุรนารี</span></span><br><br><span style=\"color:rgb(33,33,33);font-family:wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, EmojiFont;font-size:15px;\"><span style=\"margin:0px;padding:0px;\">ตามที่มหาวิทยาลัยเทคโนโลยีสุรนารีได้ดำเนินการคัดเลือกผู้ประกอบการในการให้บริการจำหน่ายอาหารทุกประเภท และเครื่องดื่ม ณ โรงอาหารส่วนกิจการนักศึกษา (หลังเก่า) มหาวิทยาลัยเทคโนโลยีสุรนารี นั้น จากการดำเนินการคัดเลือก ปรากฏผลดังนี้</span></span><br><br><span style=\"color:rgb(33,33,33);font-family:wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, EmojiFont;font-size:15px;\"><span style=\"margin:0px;padding:0px;\"><strong style=\"margin:0px;padding:0px;\">1. ผู้ได้รับการคัดเลือกเป็นผู้ประกอบการ คือ นางสาวบุณยวีร์ แก้วมณี</strong></span></span><br><br><span style=\"color:rgb(33,33,33);font-family:wf_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif, serif, EmojiFont;font-size:15px;\"><span style=\"margin:0px;padding:0px;\">2. ผู้ได้รับการขึ้นบัญชีสำรอง ได้แก่ นายปณิธาน จิตตวีระ &nbsp;ขึ้นบัญชีสำรองลำดับที่ 1</span></span></p><p><br>&nbsp;</p>', NULL, '2023-09-21', '2023-09-22', '2023-09-21 08:44:11.406000'),
(181, 1, 5, 4, 'การขับเคลื่อนสู่มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน [EP.04] : หมุดหมายการเป็น มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน กับธงที่วางไว้ในอนาคต', 'การขับเคลื่อนสู่มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน [EP.04] : หมุดหมายการเป็น “มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน” กับธงที่วางไว้ในอนาคต', 'public\\images\\card_picture\\news (3).jpg', '<h1 style=\"color:rgb(192, 156, 98);margin:10px 0px 0px;padding:0px;\">การขับเคลื่อนสู่มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน [EP.04] : หมุดหมายการเป็น มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน กับธงที่วางไว้ในอนาคต</h1><p><img class=\"image_resized cont-img\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-style:none;color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:auto;letter-spacing:normal;margin:0px 0px 20px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;width:690px;word-spacing:0px;\" src=\"https://www.sut.ac.th/images/upload/news/2202/2202/news.jpg\" alt=\"\"></p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(90, 90, 90);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:10px 0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">การขับเคลื่อนสู่มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน [EP.04]<br>: หมุดหมายการเป็น “มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน” กับธงที่วางไว้ในอนาคต</p><p style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(90, 90, 90);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:10px 0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\">33 ปี มหาวิทยาลัยเทคโนโลยีสุรนารี ภายใต้การนำของ รศ. ดร.อนันต์ ทองระอา อธิการบดี ในการขับเคลื่อนสู่มหาวิทยาลัยแห่งนวัตกรรมและความยั่งยืน ซึ่งครบ 33 ปี แห่งการสถาปนามหาวิทยาลัย ในวันที่ 27 กรกฎาคม พ.ศ. 2566 กับเส้นทางความท้าทายในการเปลี่ยนผ่านจากมหาวิทยาลัยแห่งการวิจัย (Research University) เป็นมหาวิทยาลัยแห่งการประกอบการ (Entrepreneurial University) ที่มีความเป็นเลิศทั้งในด้านวิชาการ ด้านการวิจัย และด้านการประกอบการ โดยบริบทการสร้างคน สร้างความรู้ สร้างนวัตกรรม เพื่อต่อยอดการใช้วิทยาศาสตร์ เทคโนโลยีและนวัตกรรม ขับเคลื่อนการพัฒนาอย่างยั่งยืน มุ่งไปสู่หมุดหมายของการเป็นที่พึ่งของสังคม</p><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" color:=\"\" dir=\"auto\" font-size:=\"\" segoe=\"\" ui=\"\" white-space-collapse:=\"\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" color:=\"\" dir=\"auto\" font-size:=\"\" segoe=\"\" ui=\"\" white-space-collapse:=\"\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/%E0%B8%A1%E0%B8%97%E0%B8%AA?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#มทส</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/sut?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#SUT</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A7%E0%B8%B4%E0%B8%97%E0%B8%A2%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2%E0%B9%80%E0%B8%97%E0%B8%84%E0%B9%82%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%A2%E0%B8%B5%E0%B8%AA%E0%B8%B8%E0%B8%A3%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B8%B5?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#มหาวิทยาลัยเทคโนโลยีสุรนารี</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/33rdsut?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#33rdSUT</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/sutpride?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#SUTPRIDE</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/sutspirit?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#SUTSPIRIT</span></span></a>&nbsp;<a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://www.facebook.com/hashtag/%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B9%83%E0%B8%88%E0%B9%83%E0%B8%99%E0%B8%A1%E0%B8%97%E0%B8%AA?__eep__=6&amp;__cft__[0]=AZWLHdJkSln-3tFlMqyAS9RyiN4AfoqWyp94HwMyYyDV757KdpMW-bHRyf0JtutCaGb2zVh1ChfYEUd7mDVGE8fGHQrKjx9A2pg0lPWM7tyE-oryt9O63tjp__PKswYTeWgxyN8279JIriwevDHd1uicwbPcAdVCyEWCHhaJXYgYmE7VSJL9bf4s-8YB2g30k7A&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\"><span style=\"font-family:inherit;\"><span style=\"margin:0px;padding:0px;\">#ความภูมิใจในมทส</span></span></a>.</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:start;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" color:=\"\" dir=\"auto\" font-size:=\"\" segoe=\"\" ui=\"\" white-space-collapse:=\"\">&nbsp;</div><div style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);color:rgb(0, 0, 0);font-family:Tahoma, Geneva, sans-serif;font-size:13px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;padding:0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" color:=\"\" dir=\"auto\" font-size:=\"\" segoe=\"\" ui=\"\" white-space-collapse:=\"\"><iframe style=\"margin:0px;padding:0px;\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.youtube.com/embed/6Y1BO4HFeY4\" title=\"YouTube video player\" width=\"660\"></iframe></div><p><br>&nbsp;</p>', NULL, '2023-09-23', '2023-09-25', '2023-09-22 06:20:31.133000'),
(182, 1, 3, 1, 'รับสมัครทีมเข้าแข่งขันเพื่อมหาวิทยาลัยเทคโนโลยีสุรนารี', 'การจัดการแข่งขันกีฬา “อีสปอร์ต”กีฬามหาวิทยาลัยแห่งประเทศไทย ครั้งที่ 49 ณ มหาวิทยาลัยเกษตรศาสตร์  เปิดรับสมัคร ตั้งแต่วันนี้', 'public\\images\\card_picture\\381092748_800347678761013_2100214829312315492_n.jpg', '<div class=\"xdj266r x11i5rnm xat24cr x1mh8g0r x1vvkbs x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ประกาศ</span><span style=\"background-color:hsl(0, 0%, 0%);font-family:inherit;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"display:inline-flex;font-style:normal;font-weight:normal;height:16px;margin:0px 1px;vertical-align:middle;width:16px;\"><img style=\"border-width:0px;\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tba/1/16/1f4e3.png\" alt=\"📣\" height=\"16\" width=\"16\" referrerpolicy=\"origin-when-cross-origin\"></span></span><span style=\"background-color:hsl(0, 0%, 0%);\"> ด่วนที่สุด</span><span style=\"background-color:hsl(0, 0%, 0%);font-family:inherit;\"><span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"display:inline-flex;font-style:normal;font-weight:normal;height:16px;margin:0px 1px;vertical-align:middle;width:16px;\"><img style=\"border-width:0px;\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t77/1/16/203c.png\" alt=\"‼️\" height=\"16\" width=\"16\" referrerpolicy=\"origin-when-cross-origin\"></span></span><span style=\"background-color:hsl(0, 0%, 0%);\"> รับสมัครทีมเข้าแข่งขันเพื่อมหาวิทยาลัยเทคโนโลยีสุรนารี การจัดการแข่งขันกีฬา “อีสปอร์ต”กีฬามหาวิทยาลัยแห่งประเทศไทย ครั้งที่ 49 ณ มหาวิทยาลัยเกษตรศาสตร์</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เปิดรับสมัคร ตั้งแต่วันนี้ จนถึง</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">วันที่21 กันยายน 2566 ภายในเวลา 16:00น(ปิดฟอร์มการรับสมัครพร้อมกันทั้งหมด)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">===========================================</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">อ่านรายระเอียดเพิ่มเติม :</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">กำหนดการแข่งขัน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">คำชี้แจง :</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">จะมีทีมงานของชมรมดูแลอยู่ในห้องของนักแข่งทั้งสองทีม และคอยสรุปผลการแข่งขัน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เป็นการจัดแข่งขันเป็นรูปแบบออนไลน์ ไม่มีการไลฟ์สตรีมหรือการถ่ายทอดสด</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">โดยจัดการแข่งขันในรอบคัดเลือก</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">รูปแบบการแข่งขัน(ประเภททีมชาย)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">- รอบแรก – รอบรองชนะเลิศ (Quarter-Finals – Semi-Finals)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">แข่งขันแบบ Single Elimination (แพ้คัดออก) : Best of 3 (ชนะ 2 ใน 3)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">- รอบชิงชนะเลิศ (Grand-Final)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">แข่งขันแบบ Single Elimination (แพ้คัดออก) : Best of 5 (ชนะ 3 ใน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">แข่งขันในโหมด Caldavar Valley : Tournament ด้วยระบบ Global Ban</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">Pick (ไม่สามารถใช้ตัวละครซ้ำจากเกมที่ผ่านมาได้)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ทีมที่อยู่ทางด้านบนของสายการแข่งขันจะได้อยู่ฝ่ายสีน้ำาเงินในเกมแรก และ</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ในเกมถัดไปผู้ที่แพ้ในเกมก่อนหน้าจะได้สิทธิ์ในการเลือกฝั่ง</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ผู้เข้าแข่งขันต้องใช้ “บัญชีผู้ใช้” ที่ตนเองทำการสมัครเท่านั้นและไม่อนุญาต</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ให้เปลี่ยนแปลง ID ตลอดการแข่งขัน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ผู้เข้าแข่งขันต้องมีตัวละครอย่างน้อย 18 ตัวสำหรับการแข่งขันใน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">“Tournament Mode\"</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">หากผู้เข้าแข่งขันเกิดปัญหาทางเทคนิคหรือมีเหตุให้จ าเป็นต้องเริ่มเกมใหม่</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ขณะเริ่มเกม ยังไม่มี Score Kill ให้ทำการเริ่มเกมใหม่ได้ 1 ครั้งด้วยตัวละครเดิมที่เลือกไว้ก่อนหน้า</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ในกรณีที่ผู้เล่นหลุดออกจากเกมและไม่สามารถเชื่อมต่อกลับมาแข่งขันและ</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">มีการนับ Score Kill แล้วทีมที่หลุดต้องดำเนินการแข่งขันต่อให้จบหรือขอย้อมแพ้เพื่อเริ่มการแข่งขันใหม่</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">=======================================================================</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">รูปแบบการคัดเลือก(ประเภททีมหญิง)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">จะทำการการสัมภาษณ์ ผู้เข้าสมัครโดย สัมภาษณ์ กันในdiscord</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">กำหนดการและเวลาในการแข่งขัน :</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">วันที่ 20 กันยายน พ.ศ. 2566</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เปิดรับสมัครทีมที่เข้าแข่งขันเพื่อคัดเลือกตัวแทนมหาวิทยาลัย</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">วันที่ 21 กันยายน พ.ศ. 2566</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เวลา 18.00 – 18.30 น. จับสายการแข่งขัน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เวลา 19.00 – 00.00 น. เริ่มแข่งขัน จนจบการแข่งขัน</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">เวลา 21.00 น ทำการสัมภาษณ์นักกีฬาประเภทหญิง</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">วันที่ 22 กันยายน พ.ศ. 2566</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">ส่งรายชื่อผู้ที่ได้เป็นตัวแทนมหาวิทยาลัยเทคโนโลยีสุรนารี</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">===========================================</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">แบบฟอร์มการสมัคร(ประเภททีมหญิง)</span></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;color:var(--blue-link);cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://docs.google.com/forms/d/e/1FAIpQLScJ6v9jtLkFkoMpaYpRMZeChZ3RjNPyOsplIPNIM7N-QRBNXQ/viewform?fbclid=IwAR3Hp30h3_GYtwJHuGOQN9ldfePG8yhFuII3qvW_R1diqgCLUs2PK9vjyG4\" rel=\"nofollow\" role=\"link\" tabindex=\"0\" target=\"_blank\"><span style=\"background-color:hsl(0, 0%, 0%);font-family:inherit;\">https://docs.google.com/.../1FAIpQLScJ6v9jtLkFko.../viewform</span></a></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">แบบฟอร์มการสมัคร(ประเภททีมชาย)</span></div><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1fey0fg\" style=\"-webkit-tap-highlight-color:transparent;background-color:transparent;border-color:initial;border-width:0px;box-sizing:border-box;color:var(--blue-link);cursor:pointer;display:inline;font-family:inherit;list-style:none;margin:0px;outline:none;padding:0px;text-align:inherit;text-decoration:none;touch-action:manipulation;\" href=\"https://docs.google.com/forms/d/e/1FAIpQLScYG8GevFhNEPsVFYUjEV3bgPXH3O6_ev8oj3cb62WXMTNrKw/viewform?fbclid=IwAR3YBKxWw14-l4qKypI3VZ97V-m189MQN88ltjqalpxT1HxjpNmCaU8yH4E\" rel=\"nofollow\" role=\"link\" tabindex=\"0\" target=\"_blank\"><span style=\"background-color:hsl(0, 0%, 0%);font-family:inherit;\">https://docs.google.com/.../1FAIpQLScYG8GevFhNEP.../viewform</span></a></div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(36, 37, 38);color:rgb(228, 230, 235);font-family:&quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif;font-size:15px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0.5em 0px 0px;orphans:2;overflow-wrap:break-word;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:pre-wrap;widows:2;word-spacing:0px;\"><div style=\"font-family:inherit;text-align:start;\" dir=\"auto\"><span style=\"background-color:hsl(0, 0%, 0%);\">===========================================</span></div></div>', '', '2023-09-21', '2023-09-30', '2023-09-21 15:57:21.626000');
INSERT INTO `news` (`news_id`, `news_type_id`, `user_id`, `topic_id`, `title`, `welding_para`, `card_picture`, `news_content`, `explain`, `start`, `end`, `time_stamp`) VALUES
(183, 1, 5, 4, 'การประชุมขับเคลื่อนการพัฒนาระเบียงเศรษฐกิจพิเศษภาคตะวันออกเฉียงเหนือ', 'โอกาสและความท้าทายในการพัฒนาเศรษฐกิจ ลดปัญหาความเหลื่อมล้ำ และยกระดับคุณภาพชีวิตของประชาชนในพื้นที่” เพื่อบูรณาการความร่วมมือ วิเคราะห์และสังเคราะห์ข้อมูลองค์ความรู้ รวมถึงผลักดันนโยบายและขับเคลื่อนการพัฒนายุทธศาสตร์ ตลอดจนระดมความคิดเห็นของผู้มีส่วนได้ส่', 'public\\images\\card_picture\\banner (1).jpg', '<div class=\"wp-block-gutentor-e1 alignwide section-g5ab66a gutentor-element gutentor-element-advanced-text text-align-center-desktop text-align-center-tablet text-align-center-mobile\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(102, 102, 102);font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" id=\"section-g5ab66a\"><div class=\"gutentor-text-wrap\" style=\"box-sizing:border-box;width:1140px;\"><p class=\"gutentor-text\" style=\"box-sizing:border-box;margin:0px 0px 20px;word-break:break-word;\"><mark class=\"has-inline-color has-vivid-red-color\" style=\"background-color:rgba(0, 0, 0, 0);box-sizing:border-box;color:var(--wp--preset--color--vivid-red) !important;padding:0.2em;\">เพื่อให้ผู้สมัครสามารถดูรายละเอียดการสมัครเข้าศึกษา และสามารถใช้งานระบบได้อย่างมีประสิทธิภาพสูงสุด</mark><br><mark class=\"has-inline-color has-vivid-red-color\" style=\"background-color:rgba(0, 0, 0, 0);box-sizing:border-box;color:var(--wp--preset--color--vivid-red) !important;padding:0.2em;\">แนะนำให้ผู้สมัครใช้งานเว็บไซต์ผ่านอุปกรณ์คอมพิวเตอร์</mark></p></div></div><figure class=\"wp-block-pullquote alignwide is-style-default\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-bottom-style:solid;border-bottom-width:4px;border-top-style:solid;border-top-width:4px;box-sizing:border-box;color:rgb(102, 102, 102);display:block;font-family:Poppins, sans-serif;font-size:1.5em;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;line-height:1.6;margin:0px 0px 1.75em;orphans:2;overflow-wrap:break-word;padding:3em 0px;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><blockquote style=\"border-left:5px solid rgb(238, 238, 238);box-sizing:border-box;color:inherit;font-size:17.5px;margin:0px 0px 20px;padding:10px 20px;quotes:&quot;&quot; &quot;&quot;;\"><p style=\"box-sizing:border-box;color:inherit;margin:0px 0px 10px;\">ผลการสอบวัดความรู้ภาษาอังกฤษ</p><p><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">ผู้สมัครระดับบัณฑิตศึกษา หากไม่มีผลสอบความรู้ภาษาอังกฤษมาแสดง</cite><br><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">เมื่อแรกเข้าศึกษา หรือคะแนนต่ำกว่าเกณฑ์รับเข้าศึกษา ต้องลงทะเบียนเรียน</cite><br><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">รายวิชาภาษาอังกฤษสำหรับบัณฑิตศึกษา 3 รายวิชา ตามที่สาขาวิชาภาษาต่างประเทศ</cite><br><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">กำหนด ภายใน 3 ภาคการศึกษา หรือขณะที่กำลังศึกษารายวิชาภาษาอังกฤษ</cite><br><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">สามารถยื่นคะแนนที่สูงกว่าหรือเท่ากับเกณฑ์รับเข้าได้ทุกภาคการศึกษา เพื่อขอยกเว้น</cite><br><cite style=\"box-sizing:border-box;color:currentcolor;font-size:0.8125em;font-style:normal;position:relative;text-transform:uppercase;\">การเรียนรายวิชาภาษาอังกฤษที่เหลือ</cite></p></blockquote></figure><div class=\"wp-block-gutentor-e2 alignwide section-g1b2bf9 gutentor-element gutentor-element-button button-align-center-desktop\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(102, 102, 102);font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:center;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" id=\"section-g1b2bf9\"><a class=\"gutentor-button gutentor-block-button gutentor-icon-hide\" style=\"align-items:center;background-color:rgb(6, 147, 227);border-radius:3px;box-sizing:border-box;color:rgb(255, 255, 255);display:inline-flex;font-size:16px;line-height:normal;margin-top:30px;padding:12px 25px;text-decoration:none;transition:all 0.5s ease-in-out 0s;\" href=\"http://web.sut.ac.th/ces/2018/ces/rules/announce/25.pdf\" target=\"_blank\" rel=\"noopener noreferrer\"><span class=\"gutentor-button-wrap\" style=\"box-sizing:border-box;\">ประกาศเกณฑ์มาตรฐานความรู้ภาษาอังกฤษสำหรับนักศึกษาระดับบัณฑิตศึกษา</span></a><br><a class=\"gutentor-button gutentor-block-button gutentor-icon-hide\" style=\"align-items:center;background-color:rgb(6, 147, 227);border-radius:3px;box-sizing:border-box;color:rgb(255, 255, 255);display:inline-flex;font-size:16px;line-height:normal;margin-top:30px;padding:12px 25px;text-decoration:none;transition:all 0.5s ease-in-out 0s;\" href=\"http://web.sut.ac.th/ces/2018/ces/rules/announce/25.pdf\" target=\"_blank\" rel=\"noopener noreferrer\"><span class=\"gutentor-button-wrap\" style=\"box-sizing:border-box;\">มหาวิทยาลัยเทคโนโลยีสุรนารี พ.ศ. 2565</span></a><br><a class=\"gutentor-button gutentor-block-button gutentor-icon-hide\" style=\"align-items:center;background-color:rgb(6, 147, 227);border-radius:3px;box-sizing:border-box;color:rgb(255, 255, 255);display:inline-flex;font-size:16px;line-height:normal;margin-top:30px;padding:12px 25px;text-decoration:none;transition:all 0.5s ease-in-out 0s;\" href=\"http://web.sut.ac.th/ces/2018/ces/rules/announce/25.pdf\" target=\"_blank\" rel=\"noopener noreferrer\"><span class=\"gutentor-button-wrap\" style=\"box-sizing:border-box;\">(ใช้กับบัณฑิตศึกษาที่เข้าตั้งแต่ ปีการศึกษา 2562 เป็นต้นไป)</span></a></div><div class=\"wp-block-spacer\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;clear:both;color:rgb(102, 102, 102);font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:32px;letter-spacing:normal;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" aria-hidden=\"true\">&nbsp;</div><p style=\"margin-left:0px;text-align:center;\"><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\"><u style=\"box-sizing:border-box;\">ยกเว้น</u></strong> ระดับปริญญาโททุกหลักสูตรของสำนักวิศวกรรมศาสตร์</span></span><br><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">ไม่ต้องเรียนรายวิชาภาษาอังกฤษ</span></span></p><section class=\"wp-block-gutentor-notification gutentor-section gutentor-notification\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(102, 102, 102);display:block;font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;padding:0px;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" id=\"section-86ab8318-aa6a-43e0-b145-c967f7300642\"><div class=\"grid-container\" style=\"box-sizing:border-box;margin-left:auto;margin-right:auto;max-width:1140px;padding-left:15px;padding-right:15px;width:1140px;\"><div class=\"gutentor-grid-item-wrap gutentor-notification-wrap gutentor-notification-error\" style=\"box-sizing:border-box;position:relative;z-index:3;\"><div class=\"gutentor-single-item\" style=\"background-color:rgb(248, 215, 218);box-sizing:border-box;padding:20px;transition:all 0.5s ease-in-out 0s;\"><div class=\"gutentor-single-item-content\" style=\"box-sizing:border-box;\"><h3 class=\"gutentor-single-item-title\" style=\"box-sizing:border-box;color:rgb(114, 28, 36);font-family:inherit;font-size:16px;font-weight:500;line-height:normal;margin-bottom:10px;margin-top:0px;padding:0px;\"><strong style=\"box-sizing:border-box;\">กรณีชำระเงินผ่าน Application ของธนาคารกรุงไทย (Krungthai NEXT)</strong></h3><p class=\"gutentor-single-item-desc\" style=\"box-sizing:border-box;color:rgb(114, 28, 36);font-size:14px;margin:0px;\"><mark class=\"has-inline-color has-vivid-red-color\" style=\"background-color:rgba(0, 0, 0, 0);box-sizing:border-box;color:var(--wp--preset--color--vivid-red) !important;padding:0.2em;\">มหาวิทยาลัยจะไม่สามารถตรวจสอบยอดการชำระเงินค่าสมัคร หรือค่ายืนยันสิทธิ์เข้าศึกษาได้</mark> หากมีข้อสงสัยกรุณาติดต่อคุณอรุณี ชิตสุข ส่วนการเงินและบัญชี โทร. 044-224910</p></div></div></div></div></section><div class=\"wp-block-spacer\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;clear:both;color:rgb(102, 102, 102);font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;height:30px;letter-spacing:normal;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" aria-hidden=\"true\">&nbsp;</div><section class=\"section-e80165 gutentor-module gutentor-module-tabs gutentor-tabs-layout-horizontal gutentor-tabs-pos-top\" style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(102, 102, 102);display:block;font-family:Poppins, sans-serif;font-size:16px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\" id=\"e80165\"><div class=\"grid-container\" style=\"box-sizing:border-box;margin-left:auto;margin-right:auto;max-width:1140px;padding-left:15px;padding-right:15px;width:1140px;\"><div class=\"gutentor-module-tabs-wrap gutentor-tabs-style-fill\" style=\"box-sizing:border-box;display:flex;flex-direction:column;\" data-id=\"e80165\"><div class=\"gutentor-module-tabs-nav text-align-left-desktop\" style=\"box-sizing:border-box;text-align:left;\"><span style=\"background-color:rgb(25,73,212);color:rgb(255,255,255);\"><span class=\"gutentor-module-tabs-item gm-tt-e80165 gutentor-tabs-nav-active gutentor-module-tabs-title\" style=\"background-image:none;box-sizing:border-box;cursor:pointer;display:inline-block;margin-right:10px;padding:10px;\" tabindex=\"0\">ขั้นตอนการสมัครเข้าศึกษา</span></span><span style=\"background-color:rgb(6,147,227);color:rgb(255,255,255);\"><span class=\"gutentor-module-tabs-item gm-tt-e80165 gutentor-module-tabs-title\" style=\"background-image:none;box-sizing:border-box;cursor:pointer;display:inline-block;margin-right:10px;padding:10px;\" tabindex=\"0\">แบบฟอร์มต่าง ๆการศึกษาระดับบัณฑิตศึกษากำหนดการรับสมัคร – ประกาศผล</span></span></div><div class=\"gutentor-module-tabs-body\" style=\"box-sizing:border-box;\"><div class=\"wp-block-gutentor-m7-tab gutentor-module-tabs-content gm-tc-e80165 gutentor-tabs-content-active\" style=\"border:1px solid rgb(39, 92, 246);box-sizing:border-box;display:block;padding:20px;\"><ol><li style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">อ่านประกาศรับสมัคร&nbsp;</strong><br>1.1&nbsp;<a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://sutgateway.sut.ac.th/admissions2021/pr/2566/graduate/addMD266.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">ประกาศรับสมัคร</a><br>1.2 รายละเอียดการสมัคร ตามที่แต่ละสาขาวิชากำหนด<br><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://sutgateway.sut.ac.th/admissions2021/%e0%b8%ab%e0%b8%a5%e0%b8%b1%e0%b8%81%e0%b8%aa%e0%b8%b9%e0%b8%95%e0%b8%a3-%e0%b8%a3%e0%b8%b0%e0%b8%94%e0%b8%b1%e0%b8%9a%e0%b8%9b%e0%b8%a3%e0%b8%b4%e0%b8%8d%e0%b8%8d%e0%b8%b2%e0%b9%82%e0%b8%97/\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;– ปริญญาโท</a><br><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://sutgateway.sut.ac.th/admissions2021/%e0%b8%ab%e0%b8%a5%e0%b8%b1%e0%b8%81%e0%b8%aa%e0%b8%b9%e0%b8%95%e0%b8%a3-%e0%b8%a3%e0%b8%b0%e0%b8%94%e0%b8%b1%e0%b8%9a%e0%b8%9b%e0%b8%a3%e0%b8%b4%e0%b8%8d%e0%b8%8d%e0%b8%b2%e0%b9%80%e0%b8%ad%e0%b8%81/\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;– ปริญญาเอก</a></li></ol><div class=\"wp-block-spacer\" style=\"box-sizing:border-box;clear:both;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg6.sut.ac.th/registrar/ApplicantB/mainpage.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">บันทึกข้อมูลการสมัคร Online&nbsp;</strong></a> <span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">(ระหว่างวันที่ 22 ส.ค. – 1 ต.ค. 66)</span></span><br>&nbsp;</li></ol><div class=\"wp-block-spacer\" style=\"box-sizing:border-box;clear:both;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg6.sut.ac.th/registrar/ApplicantB/PrintPay/mainpage.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">พิมพ์ใบแจ้งยอดการชำระเงินค่าสมัคร</strong></a><strong style=\"box-sizing:border-box;\"> </strong><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">(ระหว่างวันที่ 22 ส.ค. – 1 ต.ค. 66)</span></span><br>&nbsp;</li></ol><div class=\"wp-block-spacer\" style=\"box-sizing:border-box;clear:both;\" aria-hidden=\"true\">&nbsp;</div><p style=\"box-sizing:border-box;margin:0px 0px 10px;\">นำไปชำระเงินที่เคาน์เตอร์เซอร์วิส (7-Eleven), ธนาคารตามใบแจ้งยอดชำระเงิน หรือชำระผ่านทาง Application ของธนาคาร <span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">ยกเว้น Application ของธนาคารกรุงไทย (Krungthai NEXT) และไม่รับชำระเงินด้วย TrueMoney Wallet</strong></span></span> โดยสแกนบาร์โค้ดมุมล่างด้านซ้ายในใบแจ้งยอดการชำระเงิน</p><p style=\"box-sizing:border-box;margin:0px 0px 10px;\"><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">***หากไม่สามารถ Download ใบแจ้งยอดชำระเงินค่าสมัคร เนื่องจากโปรแกรม Internet Download Manager (IDM) =&gt;</span></span>&nbsp;<a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);\" href=\"http://sutgateway.sut.ac.th/admissions2021/pr/Chk_IDM.pdf\" target=\"_blank\" rel=\"noopener noreferrer\"><u>[อ่านวิธีแก้ไข]</u></a></p><div class=\"wp-block-spacer\" style=\"box-sizing:border-box;clear:both;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg6.sut.ac.th/registrar/ApplicantB/Form/mainpage.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">พิมพ์ใบสมัคร</strong></a></li></ol><div style=\"box-sizing:border-box;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg6.sut.ac.th/registrar/ApplicantB/PrintPay/mainpage.asp\" target=\"_blank\" rel=\"noopener\"><strong style=\"box-sizing:border-box;\">ตรวจสอบรหัสผู้สมัคร</strong></a>&nbsp;(โปรดตรวจสอบรหัสผู้สมัครก่อนดำเนินการขั้นตอนที่ 6 และ 7)</li></ol><div style=\"box-sizing:border-box;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg7.sut.ac.th/fileupload/fileuploadlist.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">Upload ไฟล์เอกสารประกอบการสมัคร</strong></a><strong style=\"box-sizing:border-box;\"> </strong><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">(ระหว่างวันที่ 22 ส.ค. – 1 ต.ค. 66)</span></span><br>&nbsp;</li></ol><div style=\"box-sizing:border-box;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg7.sut.ac.th/fileupload/fileuploadlist.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">ตรวจสอบการ Upload ไฟล์เอกสารประกอบการสมัคร</strong></a><br>หากเจ้าหน้าที่ตรวจสอบแล้วพบว่าไฟล์เอกสารไม่ถูกต้อง หรือต้องการให้ส่งเอกสารเพิ่มเติม จะแจ้งข้อความไว้ในหน้าเว็บ Upload ไฟล์เอกสาร โดยผู้สมัคร <span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\">ต้องดำเนินการแก้ไขให้แล้วเสร็จภายในวันที่ 1 ต.ค. 66</span></span><br>&nbsp;</li></ol><div style=\"box-sizing:border-box;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(252, 185, 0);text-decoration:none;\" href=\"http://reg6.sut.ac.th/registrar/ApplicantB/PrintPay/mainpage.asp\" target=\"_blank\" rel=\"noopener noreferrer\"><strong style=\"box-sizing:border-box;\">ตรวจสอบข้อมูลการชำระเงิน</strong></a>&nbsp;(สามารถตรวจสอบได้หลังจากชำระเงินแล้ว 2 วันทำการ)</li></ol><div style=\"box-sizing:border-box;\" aria-hidden=\"true\">&nbsp;</div><ol><li style=\"box-sizing:border-box;\"><a style=\"background-color:transparent;box-sizing:border-box;color:rgb(255, 0, 0);text-decoration:none;\" href=\"https://bit.ly/2VaOoxJ\" target=\"_blank\" rel=\"noopener\"><span style=\"color:rgb(255,0,0);\"><span style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">ตอบแบบสอบถามความพึงพอใจเกี่ยวกับการรับสมัครนักศึกษา ระดับบัณฑิตศึกษา</strong></span></span></a></li></ol></div></div></div></div></section>', '<h3 style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);box-sizing:border-box;color:rgb(58, 58, 58);font-family:Poppins, sans-serif;font-size:20px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:500;letter-spacing:normal;line-height:1.1;margin-bottom:10px;margin-top:20px;orphans:2;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><strong style=\"box-sizing:border-box;\">ติดต่อสอบถาม</strong></h3><blockquote style=\"-webkit-text-stroke-width:0px;background-color:rgb(255, 255, 255);border-left:5px solid rgb(238, 238, 238);box-sizing:border-box;color:rgb(102, 102, 102);font-family:Poppins, sans-serif;font-size:17.5px;font-style:normal;font-variant-caps:normal;font-variant-ligatures:normal;font-weight:400;letter-spacing:normal;margin:0px 0px 20px;orphans:2;padding:10px 20px;quotes:&quot;&quot; &quot;&quot;;text-align:left;text-decoration-color:initial;text-decoration-style:initial;text-decoration-thickness:initial;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;\"><ul><li style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">รายละเอียดข้อมูลการรับสมัคร</strong><br>ฝ่ายรับนักศึกษา โทร. 044-223-026 หรือ 044-223-014<br>โทรสาร 044-223-010</li><li style=\"box-sizing:border-box;\"><strong style=\"box-sizing:border-box;\">มีปัญหาเข้าระบบรับสมัคร/กรอกข้อมูลไม่ได้</strong><br>ฝ่ายวิเคราะห์และพัฒนาระบบ โทร. 044-223-020</li></ul></blockquote>', '2023-09-22', '2023-09-22', '2023-09-22 16:55:11.736000');

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
  `section_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_name`) VALUES
(1, 'หอพักว่าง'),
(2, 'หอพักชาย'),
(3, 'ที่ว่าง#10'),
(4, 'วิ่งเกียร์#10'),
(5, 'SUT#25'),
(7, 'กีฬามหาลัย'),
(8, 'มหาลัยวิทยาลัยเทคโนโลยีสุระนารี'),
(9, 'ทุนการศึกษา'),
(10, 'กยศ.');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(16) NOT NULL,
  `status_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'รอพิจารณา'),
(2, 'อนุญาต'),
(3, 'แก้ไข'),
(4, 'ไม่อนุญาต');

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `subscribe_id` int(16) NOT NULL,
  `sub_user_id` int(16) NOT NULL,
  `user_id` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(3, 'OFFICIAL USER', 'P\'ama', 'fammm', 'f@gmail.com', 'male', '$2b$12$g1IQEicNwikcRI33lExu3eJKONSvvhR01wvQ6VTSPZiH2x256md92', 'public\\images\\users_picture\\ded402ca0fe9be3cbcda56570eb425ad.jpg'),
(5, 'OFFICIAL USER', 'P\'Cream Sudarat', 'Cream', 'c@gmail.com', 'female', '$2b$12$d5G7emhWbrTzJtpbBTdtVOqEZ1IaQez1FgxCqwCWHchUizaFsBqy6', 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'),
(6, 'USER', 'P\'Aa', 'AAAAAAA', 'aa@gmail.com', 'female', '$2b$12$4Fc2k2fSAxVOmzrCFdgGdOK5qh7X65E3tPDN8NlHt9d2xa5oSkdVO', NULL),
(11, 'ADMIN', 'P\'Fam', 'Fam1', 'fam1@gmail.com', 'female', '$2b$12$cCc3T1GgRJbXPFR0179HHuWtGIUu9O7lhAvJfNf9pFgYw0jJnoIsW', 'public\\images\\users_picture\\images.jpg'),
(12, 'GUEST', '', 'PLEASE LOGIN', '', '', '', NULL),
(13, 'OFFICIAL USER', 'PaoPao', 'ร้านเปาหมูกระทะ', 'pao@gmail.com', '', '$2b$12$OkjodQpaZo8FcwSJFgnWaeiY4av2PpscjXEp5/6FQed/wTPvtHUeC', NULL),
(14, 'USER', 'ARMZA_007', 'P\'ARM', 'arm@gmail.com', 'female', '$2b$12$3KxpGOQ6x.VjhRD9aIr3SO4s9gdba.E1oolV7iM7E6DgHfQs1x9/C', NULL),
(15, 'OFFICIAL USER', 'asdf', 'a', 'a@gmail.com', 'no gender', '$2b$12$n1gV9TPc83Jh9d4mBcQmpOlJ49MW0ZrGUIIVqxwDq/Q5gFsi4S2vu', NULL);

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
(23, 15, '0960600676', '17', 'การประปาส่วนภูมิภาค สาขาเชียงใหม่ ', 'approve'),
(24, 3, '+66960600676', 'กกกก', 'กกกก', 'approve');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approve_news`
--
ALTER TABLE `approve_news`
  ADD PRIMARY KEY (`approve_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `location_post_id` (`location_post_id`);

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
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `like_news_id` (`like_news_id`),
  ADD KEY `like_user_id` (`like_user_id`);

--
-- Indexes for table `location_post`
--
ALTER TABLE `location_post`
  ADD PRIMARY KEY (`location_post_id`);

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
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`subscribe_id`),
  ADD KEY `sub_user_id` (`sub_user_id`);

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
-- AUTO_INCREMENT for table `approve_news`
--
ALTER TABLE `approve_news`
  MODIFY `approve_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `group_section`
--
ALTER TABLE `group_section`
  MODIFY `group_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `like_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_post`
--
ALTER TABLE `location_post`
  MODIFY `location_post_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribe_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_request`
--
ALTER TABLE `user_request`
  MODIFY `user_request_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approve_news`
--
ALTER TABLE `approve_news`
  ADD CONSTRAINT `approve_news_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `approve_news_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  ADD CONSTRAINT `approve_news_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `approve_news_ibfk_4` FOREIGN KEY (`location_post_id`) REFERENCES `location_post` (`location_post_id`);

--
-- Constraints for table `bookmark`
--
ALTER TABLE `bookmark`
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
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`like_news_id`) REFERENCES `news` (`news_id`),
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`like_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`news_type_id`) REFERENCES `news_type` (`news_type_id`),
  ADD CONSTRAINT `news_ibfk_7` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`);

--
-- Constraints for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`sub_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_request`
--
ALTER TABLE `user_request`
  ADD CONSTRAINT `user_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
