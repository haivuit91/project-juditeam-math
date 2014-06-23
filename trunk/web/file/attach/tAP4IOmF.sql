CREATE DATABASE  IF NOT EXISTS `db_math` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_math`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_math
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_attach`
--

DROP TABLE IF EXISTS `tbl_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attach` (
  `attachID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8_unicode_ci,
  `postID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`attachID`,`postID`),
  KEY `fk_tbl_attach_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_attach_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attach`
--

LOCK TABLES `tbl_attach` WRITE;
/*!40000 ALTER TABLE `tbl_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cat_resource`
--

DROP TABLE IF EXISTS `tbl_cat_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cat_resource` (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cat_resource`
--

LOCK TABLES `tbl_cat_resource` WRITE;
/*!40000 ALTER TABLE `tbl_cat_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cat_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Bài tập',''),(2,'Lý thuyết',''),(3,'Cấu trúc đề thi',''),(4,'Hướng dẫn ôn tập',''),(5,'Kinh nghiệm',''),(6,'Qui chế thi tốt nghiệp',''),(7,'Tài liệu tham khảo',''),(8,'Đề thi','');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `dateComment` date DEFAULT NULL,
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`commentID`,`postID`,`userID`),
  KEY `fk_tbl_comment_tbl_user1_idx` (`userID`),
  KEY `fk_tbl_comment_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_comment_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_post` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `shortTitle` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `datePost` date DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`postID`,`userID`,`categoryID`),
  KEY `fk_tbl_post_tbl_category1_idx` (`categoryID`),
  KEY `fk_tbl_post_tbl_user1_idx` (`userID`),
  CONSTRAINT `fk_tbl_post_tbl_category1` FOREIGN KEY (`categoryID`) REFERENCES `tbl_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (90,'KHẢO SÁT VÀ VẼ ĐỒ THỊ HÀM SỐ','ksvvđths','<p>\r\n	<strong><span style=\"font-size:14px;\">I. KHẢO S&Aacute;T V&Agrave; VẼ ĐỒ THỊ H&Agrave;M SỐ BẬC 3, BẬC 4</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">1. C&aacute;c bước khảo s&aacute;t</span></strong></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Tập x&aacute;c định D = R ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- T&iacute;nh đạo h&agrave;m y<sup>&#39;</sup>, giải phương tr&igrave;nh y<sup>&#39;&nbsp;</sup>= 0 v&agrave; t&igrave;m c&aacute;c điểm cực trị ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- T&iacute;nh c&aacute;c giới hạn&nbsp;<img alt=\"\" src=\"image/post/JX6SiSyO.JPG\" style=\"width: 100px; height: 28px;\" /></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Lập BBT, nhận x&eacute;t về t&iacute;nh đơn điệu v&agrave; cực trị của đồ th&igrave; h&agrave;m số ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Vẽ đồ thị</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; T&igrave;m điểm đặc biệt: Tầm đối xứng của đồ thị, giao với trục Ox, Oy...</span></p>\r\n<p>\r\n	<strong>2. C&aacute;c dạng của đồ thị</strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/wpF5w9E7.JPG\" style=\"width: 832px; height: 406px;\" /></p>\r\n<p>\r\n	<strong>3. C&aacute;c v&iacute; dụ</strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/XD2sIFnQ.JPG\" style=\"width: 833px; height: 295px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/n8QQQiYf.JPG\" style=\"width: 833px; height: 557px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">II. KHẢO S&Aacute;T V&Agrave; VẼ ĐỒ THỊ H&Agrave;M PH&Acirc;N THỨC&nbsp;<img alt=\"\" src=\"image/post/zB2DOjgX.JPG\" style=\"width: 130px; height: 35px;\" /></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/JfzLQNPF.JPG\" style=\"width: 834px; height: 477px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/NXAelBgd.JPG\" style=\"width: 834px; height: 462px;\" /></p>\r\n','Bài này nói về các bước khảo sát, các dạng của đồ thị và các ví dụ về khảo sát đồ thị','2014-06-22','',1,2,''),(91,'MỘT SỐ CÔNG THỨC TOÁN HỌC CẦN NHỚ PHẦN ĐẠI SỐ','msctthcnpđs','<p>\r\n	<strong><span style=\"font-size:14px;\">1. Tam thức bậc 2</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/fwgPgDhJ.JPG\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">2. Bất đẳng thức Cauchy(C&ocirc;-si):</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/9sLggHZw.JPG\" style=\"width: 392px; height: 92px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">3. Cấp số cộng</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\"><img alt=\"\" src=\"image/post/DfDT5E94.JPG\" style=\"width: 404px; height: 159px;\" /></span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">4. Cấp số nh&acirc;n</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/VCaAS0Nz.JPG\" style=\"width: 410px; height: 211px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>5. Phương tr&igrave;nh, bất phương tr&igrave;nh logarit</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/OCHLQs1z.JPG\" style=\"width: 402px; height: 169px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>6. Phương tr&igrave;nh, bất phương tr&igrave;nh mũ:&nbsp;</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/C3HVehWN.JPG\" style=\"width: 405px; height: 106px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>7. Lũy thừa: a, b &gt; 0</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/gHF8raM4.JPG\" style=\"width: 401px; height: 158px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>8. Logarit: 0 &lt; N<sub>1</sub>N<sub>2</sub> v&agrave; 0 &lt; a, b # 1 ta c&oacute;</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/9Vqu6MtV.JPG\" style=\"width: 404px; height: 228px;\" /></p>\r\n','Các công thức và các đẳng thức thường dùng','2014-06-22','',1,2,''),(92,'Công thức hình học','cthh','<p>\r\n	<span style=\"font-size:14px;\"><strong>I. PHƯƠNG PH&Aacute;P TỌA ĐỘ TRONG MẶT PHẲNG</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>1. Đường thẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/Ed6x2iFA.JPG\" style=\"width: 382px; height: 203px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/5k2UIa6M.JPG\" style=\"width: 346px; height: 183px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/4qVd4KKS.JPG\" style=\"width: 378px; height: 193px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>2. Đường tr&ograve;n:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/pTqB79MG.JPG\" style=\"width: 397px; height: 172px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Elip:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/qUBbnN5x.JPG\" style=\"width: 423px; height: 205px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>4. Hypebol:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/EHTCllZt.JPG\" style=\"width: 410px; height: 223px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>5. Parabol:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/HT7JPfEr.JPG\" style=\"width: 397px; height: 110px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>II. PHƯƠNG PH&Aacute;P TỌA ĐỘ TRONG KH&Ocirc;NG GIAN</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>1. T&iacute;ch c&oacute; hướng hai vecto:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/ytIJLkzh.JPG\" style=\"width: 374px; height: 200px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>2. Mặt phẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/egeMgzTb.JPG\" style=\"width: 382px; height: 326px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Đường thẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/lkrhSYhN.JPG\" style=\"width: 382px; height: 273px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/mPSMfbTj.JPG\" style=\"width: 392px; height: 272px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Mặt cầu:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/D2ulmy59.JPG\" style=\"width: 413px; height: 318px;\" /></p>\r\n','Các phương pháp trong mặt phẳng và trong không gian','2014-06-22','',1,2,''),(93,'Bài tập liên quan đến cực đại cực tiểu 1','btlqđcđct1','<p>\r\n	<span style=\"font-size:16px;\"><strong>T&igrave;m m để &nbsp;<em>f(x)&nbsp;</em>=&nbsp;<em>x<sup>3</sup> +&nbsp;</em><em>mx<sup>2</sup> + 7x + 3</em> c&oacute; đường thẳng đi qua cực đại, cực tiểu vu&ocirc;ng g&oacute;c với đường thẳng y=3x-7.</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/24tYzDbh.JPG\" style=\"width: 600px; height: 90px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/e9D7g04m.JPG\" style=\"width: 600px; height: 212px;\" /></p>\r\n',NULL,'2014-06-22','',1,1,''),(94,'Bài tập liên quan đến cực đại cực tiểu hàm số bậc 3','btlqđcđcthsb3','<p>\r\n	<span style=\"font-size:14px;\"><strong>Cho h&agrave;m số&nbsp;<em>y = x<sup>3</sup> - 3x<sup>2</sup> - mx + 2&nbsp;</em>(1) với m l&agrave; tham số thực</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>T&igrave;m m để h&agrave;m số (1) c&oacute; cực trị, đồng thời đường thẳng đi qua hai điểm cực trị của đồ thị h&agrave;m số tạo với hai trục tọa độ một tam gi&aacute;c c&acirc;n.</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/JmzbDPN5.JPG\" style=\"width: 600px; height: 444px;\" /></p>\r\n','Các ví dụ liên quan đến tìm cực đại, cực tiểu của hàm số bậc 3','2014-06-22','',1,1,''),(95,'Bài tập liên quan đến cực đại cực tiểu hàm số bậc 4','btlqđcđcthsb4','<p>\r\n	<span style=\"font-size:16px;\"><strong>T&igrave;m m để&nbsp;<em>f(x) =&nbsp;</em></strong><em>x<sup>4</sup> - 2mx<sup>2</sup> +2m + m<sup>4</sup>&nbsp;</em><strong>c&oacute; CĐ, CT lập th&agrave;nh tam gi&aacute;c đều</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong><img alt=\"\" src=\"image/post/uZygGVH7.JPG\" style=\"width: 400px; height: 393px;\" /></strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong><span style=\"font-size:16px;\">Cho h&agrave;m số&nbsp;</span></strong><span style=\"font-size:16px;\"><em>y = x<sup>4</sup> - 2mx<sup>2</sup> + 2m<sup>2</sup>&nbsp;- 4</em><strong> , m l&agrave; tham số thực. X&aacute;c định m để h&agrave;m số c&oacute; 3 cực trị tạo th&agrave;nh 1 tam gi&aacute;c đều c&oacute; diện t&iacute;ch bằng 1.</strong></span></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/ItTjDJrk.JPG\" style=\"width: 800px; height: 130px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:16px;\">Cho h&agrave;m số&nbsp;</span></strong><span style=\"font-size:16px;\"><em>y = x<sup>4</sup> - 2(1 - m<sup>2</sup>)x<sup>2</sup> + m + 1. <b>T&igrave;m m để h&agrave;m số đ&atilde; cho c&oacute; 3 điểm cực trị v&agrave; 3 điểm cực trị n&agrave;y tạo th&agrave;nh một tam gi&aacute;c c&oacute; diện t&iacute;ch lớn nhất.</b></em></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/MAtYlHQ5.JPG\" style=\"width: 750px; height: 211px;\" /></p>\r\n','Các ví dụ liên quan đến tìm cực đại, cực tiểu của hàm số bậc 4','2014-06-23','',1,1,''),(96,'ĐỀ THI TỐT NGHIỆP THPT PHẦN ĐẠI SỐ CỦA CÁC NĂM','đttntpđsccn','<p>\r\n	<span style=\"font-size:14px;\"><u><b>ĐỀ THI TN THPT NĂM 2003</b></u></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Cho h&agrave;m số &nbsp;<img alt=\"\" src=\"image/post/LQma1wYI.JPG\" style=\"width: 110px; height: 30px;\" /></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">1. Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị (C) của h&agrave;m số đ&atilde; cho</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">2. X&aacute;c định m để đồ thị h&agrave;m số&nbsp;<img alt=\"\" src=\"image/post/4kQbpxS2.JPG\" style=\"width: 170px; height: 35px;\" />&nbsp;c&oacute; c&aacute;c tiệm cận tr&ugrave;ng với c&aacute;c tiệm cận tương ứng của h&agrave;m số ở tr&ecirc;n</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><b><u>ĐỀ THI TN THPT NĂM 2009</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Cho h&agrave;m số</span>&nbsp;<img alt=\"\" src=\"image/post/Twz8ZRw5.JPG\" style=\"width: 59px; height: 35px;\" />&nbsp;,<span style=\"font-size:14px;\"> gọi đồ thị của h&agrave;m số l&agrave; (C).</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">1. Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị (C) của h&agrave;m số đ&atilde; cho</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">2. Viết chương tr&igrave;nh tiếp tuyến của đồ thị (C), biết hệ số g&oacute;c của tiếp tuyến bằng - 5</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><u>ĐỀ THI TN THPT NĂM 2010</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">Cho h&agrave;m số&nbsp;<img alt=\"\" src=\"image/post/zSH6jmNt.JPG\" style=\"width: 110px; height: 35px;\" />&nbsp;</span></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">1. Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị h&agrave;m số đ&atilde; cho</span></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">2. T&igrave;m c&aacute;c gi&aacute; trị của tham số m để phương tr&igrave;nh&nbsp;<em>x<sup>3</sup> - 6x<sup>2</sup> + m = 0&nbsp;</em>c&oacute; 3 nghiệm ph&acirc;n biệt</span></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><u>ĐỀ THI TN THPT NĂM 2011</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">Cho h&agrave;m số &nbsp;<img alt=\"\" src=\"image/post/3rdIM0u7.JPG\" style=\"height: 35px; width: 75px;\" />&nbsp;</span></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">1. Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị (C) h&agrave;m số đ&atilde; cho</span></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">2. X&aacute;c định tọa độ giao điểm của đồ thị (C) với đường thẳng&nbsp;<em>y = x + 2.</em></span></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><u>ĐỀ THI TN THPT NĂM 2013</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Cho h&agrave;m số&nbsp;<em>y = x<sup>3</sup> - 3x - 1</em></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">1. Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị (C) của h&agrave;m số đ&atilde; cho</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">2. Viết phương tr&igrave;nh tiếp tuyến của (C) biết hệ số g&oacute;c tiếp tuyến đ&oacute; bằng 9</span></p>\r\n','Đề thi tốt nghiệp phần đại số của những năm trước gồm những năm: 2003, 2009, 2010, 2011, 2013','2014-06-23','',1,8,''),(97,'ĐỀ THI TỐT NGHIỆP THPT PHẦN HÌNH HỌC CỦA CÁC NĂM','đttntphhccn','<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><u>ĐỀ THI TN THPT NĂM 2007</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><span style=\"font-size:14px;\">Cho h&igrave;nh ch&oacute;p S.ABC c&oacute; SA vu&ocirc;ng g&oacute;c với mặt phẳng đ&aacute;y, đ&aacute;y ABC l&agrave; tam gi&aacute;c vu&ocirc;ng tại B, biết SA = AB = BC = a. T&iacute;nh thể t&iacute;ch của khối ch&oacute;p S.ABC theo a</span></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><u>ĐỀ THI TN THPT NĂM 2008</u></b></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Cho h&igrave;nh ch&oacute;p tam gi&aacute;c đều S.ABC c&oacute; cạnh đ&aacute;y bằng a, cạnh b&ecirc;n bằng 2a. Gọi I l&agrave; trung điểm của cạnh BC. T&iacute;nh thể t&iacute;ch của khối ch&oacute;p S.ABI theo a.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<b style=\"font-size: 14.44444465637207px;\"><u>ĐỀ THI TN THPT NĂM 2009</u></b></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">Cho h&igrave;nh ch&oacute;p S.ABC c&oacute; SA vu&ocirc;ng g&oacute;c với mặt phẳng đ&aacute;y, mặt b&ecirc;n SBC l&agrave; tam gi&aacute;c đều cạnh bằng a, biết ABC = 120<sup>0</sup>. T&iacute;nh thể t&iacute;ch của khối ch&oacute;p S.ABC theo a</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n','Các đề thi tốt nghiệp phần hình học những năm 2007, 2008, 2009','2014-06-23','',1,8,''),(98,'KỲ THI TỐT NGHIỆP TRUNG HỌC PHỔ THÔNG NĂM 2014','kttnthptn2','<p>\r\n	<span style=\"font-size:14px;\"><strong>I. PHẦN CHUNG CHO TẤT CẢ C&Aacute;C TH&Iacute; SINH (7,0 điểm)</strong></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b><span style=\"font-size:14px;\">C&acirc;u 1 (3,0 điểm)</span>:&nbsp;</b><span style=\"font-size:14px;\">Cho h&agrave;m số&nbsp;<em>y = - x<sup>3</sup> + 3x<sup>2</sup> - 4</em></span></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</em>1) Khảo s&aacute;t sự biến thi&ecirc;n v&agrave; vẽ đồ thị (C) của h&agrave;m số đ&atilde; cho</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2) T&igrave;m tất cả c&aacute;c gi&aacute; trị của tham số m sao cho phương tr&igrave;nh&nbsp;<em style=\"font-size: 14.44444465637207px;\">- x<sup>3</sup>&nbsp;+ 3x<sup>2</sup>&nbsp;- m&nbsp;</em>= 0 c&oacute; 3 nghiệm thực ph&acirc;n biệt.</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>C&acirc;u 2 (3,0 điểm):&nbsp;</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>1) Giải bất phương tr&igrave;nh:&nbsp;<img alt=\"\" src=\"image/post/mAIGCtB2.JPG\" style=\"height: 28px; width: 210px;\" /></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2) T&iacute;nh t&iacute;ch ph&acirc;n:&nbsp;<img alt=\"\" src=\"image/post/7EZ1CVzY.JPG\" style=\"width: 145px; height: 35px;\" /></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;3) T&igrave;m tất cả c&aacute;c gi&aacute; trị của m để h&agrave;m số&nbsp;<em>y = x<sup>3&nbsp;</sup>- 2mx<sup>2</sup> + m<sup><sup>2</sup></sup>x - 2 đạt cực tiểu tại X = 1.</em></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>C&acirc;u 3 (1,0 điểm):&nbsp;</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong>Cho h&igrave;nh ch&oacute;p SABCD c&oacute; đ&aacute;y ABCD l&agrave; h&igrave;nh chữ nhật, c&aacute;c mặt b&ecirc;n (SAB) v&agrave; (SAD) vu&ocirc;ng g&oacute;c ở đ&aacute;y, SA = AB = a, g&oacute;c SDA = 30<sup>0</sup> . T&iacute;nh thể t&iacute;ch khối ch&oacute;p SABCD.</span></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">II. PHẦN RI&Ecirc;NG (3,0 điểm):</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\"><em>Th&iacute; sinh chỉ được chọn 1 trong 2 phần ( phần 1 hoặc phần 2)</em></span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\"><em>Phần 1. Theo chương tr&igrave;nh Chuẩn:</em></span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">C&acirc;u 4.a (2,0 điểm):&nbsp;</span></strong><span style=\"font-size:14px;\">Trong kh&ocirc;ng gian với hệ trục tọa đọ Oxyz cho điểm A(1;2;3), đường thẳng&nbsp;<img alt=\"\" src=\"image/post/us7wnG70.JPG\" style=\"width: 24px; height: 18px;\" />&nbsp;c&oacute; phương tr&igrave;nh&nbsp;<img alt=\"\" src=\"image/post/6Fx54UPw.JPG\" style=\"width: 83px; height: 81px;\" />&nbsp;v&agrave; mặt phẳng&nbsp;<img alt=\"\" src=\"image/post/4Y4Z0lYE.JPG\" style=\"width: 24px; height: 18px;\" />&nbsp;c&oacute; phương tr&igrave;nh 2x + 2y + z - 1 = 0.</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1) Viết phương tr&igrave;nh mặt phẳng (P) đi qua A v&agrave; vu&ocirc;ng g&oacute;c với đường thẳng&nbsp;</span><img alt=\"\" src=\"image/post/us7wnG70.JPG\" style=\"font-size: 14.44444465637207px; width: 24px; height: 18px;\" />&nbsp;.</p>\r\n','Đề thi tốt nghiệp trung học phổ thông vừa qua','2014-06-23','',1,8,''),(99,'CẤU TRÚC ĐỀ THI TỐT NGHIỆP THPT MÔN TOÁN','ctđttntmt','<p>\r\n	<span style=\"font-size:14px;\"><strong>I. PHẦN CHUNG CHO TẤT CẢ C&Aacute;C TH&Iacute; SINH (7 điểm).</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/pSllYx5g.JPG\" style=\"width: 682px; height: 273px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">II. PHẦN RI&Ecirc;NG (3,0 điểm).</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\"><em>Th&iacute; sinh chỉ được chọn một trong hai phần sau: (phần 1 hoặc phần 2)</em></span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">1). Theo chương tr&igrave;nh Chuẩn:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/W4zce82G.JPG\" style=\"width: 676px; height: 235px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">2). Theo chương tr&igrave;nh N&acirc;ng cao:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/IC9ibbWx.JPG\" style=\"width: 676px; height: 378px;\" /></p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <strong><span style=\"font-size:14px;\">--------------------------------HẾT------------------------------------</span></strong></p>\r\n','Cấu trúc thi tốt nghiệp môn toán','2014-06-23','',1,3,''),(100,'MỘT SỐ KIẾN THỨC CƠ BẢN VỀ LƯỢNG GIÁC','msktcbvlg','<p>\r\n	<span style=\"color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">I. BẢNG GI&Aacute; TRỊ LƯỢNG GI&Aacute;C CỦA MỘT SỐ CUNG ĐẶC BIỆT</span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/2ViaxjLp.JPG\" style=\"width: 749px; height: 282px;\" /></p>\r\n<p>\r\n	<span style=\"color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">II. C&Ocirc;NG THỨC LƯỢNG GI&Aacute;C</span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/nwgtkwAY.JPG\" style=\"width: 751px; height: 577px;\" /></p>\r\n<p>\r\n	<span style=\"color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">III. MỘT SỐ C&Ocirc;NG THỨC LƯỢNG GI&Aacute;C HAY D&Ugrave;NG</span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/CSTJDbf6.JPG\" style=\"width: 749px; height: 174px;\" /></p>\r\n<p>\r\n	<span style=\"color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">IV. PHƯƠNG TR&Igrave;NH LƯỢNG GI&Aacute;C CƠ BẢN</span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/P8x03J6t.JPG\" style=\"width: 748px; height: 227px;\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">\r\n	V. PHƯƠNG TR&Igrave;NH LƯỢNG GI&Aacute;C THƯỜNG GẶP</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">\r\n	1. asinx + bcosx = c</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">\r\n	<img alt=\"\" src=\"image/post/V6m2unEp.JPG\" style=\"width: 611px; height: 53px;\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">\r\n	2. Phương tr&igrave;nh asin<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;\">2</span>x + bsinxcosx + ccos<span style=\"box-sizing: border-box; margin: 0px; padding: 0px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;\">2</span>x = d</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; color: rgb(51, 51, 51); font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 15.555556297302246px; line-height: 25.396825790405273px;\">\r\n	<img alt=\"\" src=\"image/post/qvwejsLA.JPG\" style=\"width: 765px; height: 395px;\" /></p>\r\n','Bài viết nói về các giá trị lượng giác ở các cung đặc biệt, công thức lượng giác','2014-06-23','',1,2,''),(101,'Phương pháp tích phân tầng phần','pptptp','<p>\r\n	<span style=\"font-size:14px;\"><strong>1. C&ocirc;ng thức &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong><img alt=\"\" src=\"image/post/LmJ1WQMF.JPG\" style=\"width: 175px; height: 71px;\" /></strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>2. C&aacute;c b&agrave;i to&aacute;n t&iacute;ch ph&acirc;n từng phần</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/KlXXHBku.JPG\" style=\"width: 832px; height: 611px;\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n','Công thức tích phần toàn phần và một số ví dụ về tích phần tầng phần','2014-06-23','',1,2,''),(102,'Tích phân','tp','<p>\r\n	<strong><span style=\"font-size:12px;\"><span style=\"font-size:14px;\">1. Định nghĩa t&iacute;ch ph&acirc;n</span></span></strong></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><span style=\"font-size:14px;\">Cho&nbsp;<em>f(x)&nbsp;</em>l&agrave; h&agrave;m số li&ecirc;n tục tr&ecirc;n đoạn [a ; b]. Giả sử F(x) l&agrave; một nguy&ecirc;n h&agrave;m của&nbsp;<em>f(x) tr&ecirc;n đoạn [a ; b].</em></span></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><span style=\"font-size:14px;\"><em>Hiệu số F(b) - F(a) được gọi l&agrave; t&iacute;ch ph&acirc;n từ a đến b của h&agrave;m số f(x). <strong>K&iacute; hiệu: &nbsp;<img alt=\"\" src=\"image/post/gZeSbOCR.JPG\" style=\"width: 66px; height: 35px;\" /></strong></em></span></span></p>\r\n<p>\r\n	<span style=\"font-size:12px;\"><span style=\"font-size:14px;\"><em><strong>C&ocirc;ng thức: &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"image/post/8uZVpK3q.JPG\" style=\"width: 197px; height: 45px;\" /></strong></em></span></span></p>\r\n<p>\r\n	<span style=\"font-size: 14.44444465637207px;\"><b>2. C&aacute;c b&agrave;i to&aacute;n biến đổi số</b></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/tMoDoxmG.JPG\" style=\"width: 832px; height: 491px;\" /></p>\r\n','Định nghĩa và một số bài toán biến đổi số cơ bản','2014-06-23','',1,2,''),(103,'Bài tập tích phân','bttp','<p>\r\n	<strong><span style=\"font-size:14px;\">B&agrave;i 1: T&iacute;nh t&iacute;ch ph&acirc;n</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></strong><img alt=\"\" src=\"image/post/IsmvMABg.JPG\" style=\"font-size: 12px; width: 150px; height: 75px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">Giải:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/m9gBAd97.JPG\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">B&agrave;i 2: T&iacute;nh t&iacute;ch ph&acirc;n</span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"image/post/mxOWSgbp.JPG\" style=\"width: 180px; height: 55px;\" /></span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">Giải:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/N7c3vtG0.JPG\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">B&agrave;i 3: T&iacute;nh t&iacute;ch ph&acirc;n</span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt=\"\" src=\"image/post/uq6IH2LV.JPG\" /></span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">Giải:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/yFw9wEpp.JPG\" /></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">B&agrave;i 4: T&iacute;nh t&iacute;ch ph&acirc;n</span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt=\"\" src=\"image/post/Srmdyqqj.JPG\" /></span></strong></p>\r\n<p>\r\n	<strong style=\"font-size: 12px;\"><span style=\"font-size: 14px;\">Giải:</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/RnVL8fp9.JPG\" /></p>\r\n','Một số bài tập tích phân và lời giải','2014-06-23','',1,1,'');
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_resource`
--

DROP TABLE IF EXISTS `tbl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_resource` (
  `resourceID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `catID` int(11) DEFAULT NULL,
  PRIMARY KEY (`resourceID`),
  KEY `fdf_idx` (`catID`),
  CONSTRAINT `fdf` FOREIGN KEY (`catID`) REFERENCES `tbl_cat_resource` (`catID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_resource`
--

LOCK TABLES `tbl_resource` WRITE;
/*!40000 ALTER TABLE `tbl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'Giáo viên',''),(2,'Học sinh','');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`userID`,`roleID`),
  KEY `fk_tblUser_tblRole_idx` (`roleID`),
  CONSTRAINT `fk_tblUser_tblRole` FOREIGN KEY (`roleID`) REFERENCES `tbl_role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','','','2014-06-06','email','address',1,'');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-23 13:09:40
