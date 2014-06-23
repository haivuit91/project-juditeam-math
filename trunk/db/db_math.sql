CREATE DATABASE  IF NOT EXISTS `db_math` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_math`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_math
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `tb_res_attach`
--

DROP TABLE IF EXISTS `tb_res_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_res_attach` (
  `resAttachID` int(11) NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `resourceID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`resAttachID`,`resourceID`),
  KEY `fk_tb_res_attach_tlb_resource1_idx` (`resourceID`),
  CONSTRAINT `fk_tb_res_attach_tlb_resource1` FOREIGN KEY (`resourceID`) REFERENCES `tlb_resource` (`resourceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_res_attach`
--

LOCK TABLES `tb_res_attach` WRITE;
/*!40000 ALTER TABLE `tb_res_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_res_attach` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attach`
--

LOCK TABLES `tbl_attach` WRITE;
/*!40000 ALTER TABLE `tbl_attach` DISABLE KEYS */;
INSERT INTO `tbl_attach` VALUES (14,'gggggg','',89,''),(15,'tập tim','file\\attach\\dIifkgCR.png',96,'');
/*!40000 ALTER TABLE `tbl_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cat_resource`
--

DROP TABLE IF EXISTS `tbl_cat_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cat_resource` (
  `catResourceID` int(11) NOT NULL AUTO_INCREMENT,
  `catResourceName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`catResourceID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Bài tập',''),(2,'Lý thuyết','');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,'lÃ m bÃ i nháº¡c thÆ° giÃ£n\r\nhttps://www.youtube.com/watch?v=RN6Tbh-1mow','2014-06-23',89,1,''),(2,'lÃ m bÃ i nháº¡c thÆ° giÃ£n\r\nhttps://www.youtube.com/watch?v=RN6Tbh-1mow','2014-06-23',89,1,''),(3,'fdfd','2014-06-23',89,1,''),(4,'ooo','2014-06-23',89,1,''),(5,'tuáº¥','2014-06-23',89,1,''),(6,'tê','2014-06-23',85,1,''),(7,'têrere','2014-06-23',85,1,''),(8,'rêrere','2014-06-23',85,1,''),(9,'rêrererrrrerererrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','2014-06-23',85,1,''),(10,'aloop','2014-06-23',95,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (85,'test anh','ta','<ol>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			<img alt=\"\" src=\"image/post/D6obr9Rg.jpg\" style=\"width: 150px; height: 189px; float: left;\" />dsdsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsdsdsdsd</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n</ol>\r\n',NULL,'2014-06-22','',1,1,''),(86,'bài biết đầu tiên','bbđt','<p>\r\n	<img alt=\"\" src=\"image/post/Yadt95Hs.jpg\" style=\"height: 126px; width: 100px;\" />dsdsdsdsdsdsds</p>\r\n<h3 style=\"color:red;\">\r\n	dsdsdsdsdsdsd</h3>\r\n',NULL,'2014-06-22','',1,1,''),(87,'vnexpress.nt','v','<div class=\"short_intro txt_666\" style=\"margin: 0px; padding: 0px 0px 10px; color: rgb(68, 68, 68); font-weight: 700; font-size: 14px; line-height: 18px; font-family: arial; width: 480.015625px; float: left;\">\r\n	Trung Quốc cho rằng c&aacute;c tranh chấp h&agrave;ng hải trong khu vực chỉ n&ecirc;n được giải quyết th&ocirc;ng qua đ&agrave;m ph&aacute;n trực tiếp với c&aacute;c nước li&ecirc;n quan v&agrave; b&aacute;c bỏ sự can thiệp của một b&ecirc;n thứ ba.&nbsp;</div>\r\n<div class=\"relative_new\" style=\"margin: 0px; padding: 0px 0px 5px; width: 480.015625px; float: left; color: rgb(0, 0, 0); font-family: arial;\">\r\n	<ul class=\"list_news_dot_3x3_300\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; width: 480.015625px; float: left; border: none; color: rgb(102, 102, 102);\">\r\n		<li style=\"margin: 0px; padding: 0px 0px 5px 10px; list-style-type: none; background: url(http://st.f3.vnecdn.net/responsive/c/v37/images/graphics/bg_dot_gray_3x3.gif) 0px 6px no-repeat;\">\r\n			<a href=\"http://vnexpress.net/tin-tuc/thoi-su/hoc-gia-nuoc-ngoai-phe-phan-hanh-dong-cua-trung-quoc-3007402.html\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; outline: none; font-weight: 700; line-height: 16px;\">Học giả nước ngo&agrave;i ph&ecirc; ph&aacute;n h&agrave;nh động của Trung Quốc</a>&nbsp; / &nbsp;<a href=\"http://vnexpress.net/tin-tuc/the-gioi/trung-quoc-dung-nhieu-gian-khoan-de-lan-nhung-buoc-dai-3007237.html\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; outline: none; font-weight: 700; line-height: 16px;\">Trung Quốc d&ugrave;ng nhiều gi&agrave;n khoan để lấn những bước d&agrave;i</a></li>\r\n	</ul>\r\n</div>\r\n<div id=\"left_calculator\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: arial;\">\r\n	<div class=\"fck_detail width_common\" style=\"margin: 0px; padding: 0px 0px 10px; width: 480.015625px; float: left; overflow: hidden; font-size: 14px; color: rgb(51, 51, 51);\">\r\n		<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"margin: 0px auto 10px; padding: 0px; max-width: 100%; width: 480px;\">\r\n			<tbody style=\"margin: 0px; padding: 0px;\">\r\n				<tr style=\"margin: 0px; padding: 0px;\">\r\n					<td style=\"margin: 0px; padding: 0px; line-height: 0;\">\r\n						<img alt=\"Tàu kiểm ngư 767 bị tàu hải cảnh Trung Quốc áp sát mạn, phun vòi rồng.&nbsp;\" data-natural-=\"\" data-pwidth=\"480\" data-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2014/06/22/bien-dong1-5024-1403413788.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 480px;\" /></td>\r\n				</tr>\r\n				<tr style=\"margin: 0px; padding: 0px;\">\r\n					<td style=\"margin: 0px; padding: 0px; line-height: 0;\">\r\n						<p class=\"Image\" style=\"margin: 0px; padding: 10px; line-height: normal; font-size: 12px; background: rgb(245, 245, 245);\">\r\n							T&agrave;u kiểm ngư Việt Nam&nbsp;bị t&agrave;u hải cảnh Trung Quốc &aacute;p s&aacute;t mạn, phun v&ograve;i rồng tại v&ugrave;ng biển gần nơi hạ đặt tr&aacute;i ph&eacute;p&nbsp;gi&agrave;n khoan Hải Dương 981. Ảnh:<em style=\"margin: 0px; padding: 0px;\">&nbsp;Nguyễn Đ&ocirc;ng</em></p>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p class=\"Normal\" style=\"margin: 0px 0px 1em; padding: 0px; line-height: 18px;\">\r\n			<span style=\"margin: 0px; padding: 0px;\">Ph&aacute;t biểu tại Diễn đ&agrave;n H&ograve;a b&igrave;nh Thế giới ở Bắc Kinh cuối tuần qua, Ủy vi&ecirc;n Quốc vụ viện Trung ',NULL,'2014-06-22','',1,1,''),(89,'MỘT SỐ KIẾN THỨC CƠ BẢN VỀ LƯỢNG GIÁC','msktcbvlg','<p>\r\n	I. BẢNG GI&Aacute; TRỊ LƯỢNG GI&Aacute;C CỦA MỘT SỐ CUNG ĐẶC BIỆT</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/GXahH578.JPG\" style=\"width: 832px; height: 312px;\" /></p>\r\n<p>\r\n	II. C&Ocirc;NG THỨC LƯỢNG GI&Aacute;C</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/wvrgQy1W.JPG\" style=\"width: 833px; height: 638px;\" /></p>\r\n<p>\r\n	III. MỘT SỐ C&Ocirc;NG THỨC LƯỢNG GI&Aacute;C HAY D&Ugrave;NG</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/1DPnLSHz.JPG\" style=\"width: 832px; height: 194px;\" /></p>\r\n<p>\r\n	IV. PHƯƠNG TR&Igrave;NH LƯỢNG GI&Aacute;C CƠ BẢN</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/0yXcHGMs.JPG\" style=\"width: 833px; height: 252px;\" /></p>\r\n<p>\r\n	V. PHƯƠNG TR&Igrave;NH LƯỢNG GI&Aacute;C THƯỜNG GẶP</p>\r\n<p>\r\n	1. asinx + bcosx = c</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/GJGJeD0s.JPG\" style=\"width: 675px; height: 50px;\" /></p>\r\n<p>\r\n	2. Phương tr&igrave;nh asin<sup>2</sup>x + bsinxcosx + ccos<sup>2</sup>x = d</p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/6uSokRGv.JPG\" style=\"width: 851px; height: 432px;\" /></p>\r\n',NULL,'2014-06-22','',1,1,''),(90,'KHẢO SÁT VÀ VẼ ĐỒ THỊ HÀM SỐ','ksvvđths','<p>\r\n	<strong><span style=\"font-size:14px;\">I. KHẢO S&Aacute;T V&Agrave; VẼ ĐỒ THỊ H&Agrave;M SỐ BẬC 3, BẬC 4</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">1. C&aacute;c bước khảo s&aacute;t</span></strong></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Tập x&aacute;c định D = R ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- T&iacute;nh đạo h&agrave;m y<sup>&#39;</sup>, giải phương tr&igrave;nh y<sup>&#39;&nbsp;</sup>= 0 v&agrave; t&igrave;m c&aacute;c điểm cực trị ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- T&iacute;nh c&aacute;c giới hạn&nbsp;<img alt=\"\" src=\"image/post/JX6SiSyO.JPG\" style=\"width: 100px; height: 28px;\" /></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Lập BBT, nhận x&eacute;t về t&iacute;nh đơn điệu v&agrave; cực trị của đồ th&igrave; h&agrave;m số ;</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">- Vẽ đồ thị</span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp; &nbsp; &nbsp; T&igrave;m điểm đặc biệt: Tầm đối xứng của đồ thị, giao với trục Ox, Oy...</span></p>\r\n<p>\r\n	<strong>2. C&aacute;c dạng của đồ thị</strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/wpF5w9E7.JPG\" style=\"width: 832px; height: 406px;\" /></p>\r\n<p>\r\n	<strong>3. C&aacute;c v&iacute; dụ</strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/XD2sIFnQ.JPG\" style=\"width: 833px; height: 295px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/n8QQQiYf.JPG\" style=\"width: 833px; height: 557px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\">II. KHẢO S&Aacute;T V&Agrave; VẼ ĐỒ THỊ H&Agrave;M PH&Acirc;N THỨC&nbsp;<img alt=\"\" src=\"image/post/zB2DOjgX.JPG\" style=\"width: 130px; height: 35px;\" /></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/JfzLQNPF.JPG\" style=\"width: 834px; height: 477px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/NXAelBgd.JPG\" style=\"width: 834px; height: 462px;\" /></p>\r\n',NULL,'2014-06-22','',1,1,''),(91,'MỘT SỐ CÔNG THỨC TOÁN HỌC CẦN NHỚ PHẦN ĐẠI SỐ','msctthcnpđs','<p>\r\n	<strong><span style=\"font-size:14px;\">1. Tam thức bậc 2</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/fwgPgDhJ.JPG\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">2. Bất đẳng thức Cauchy(C&ocirc;-si):</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/9sLggHZw.JPG\" style=\"width: 392px; height: 92px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">3. Cấp số cộng</span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\"><img alt=\"\" src=\"image/post/DfDT5E94.JPG\" style=\"width: 404px; height: 159px;\" /></span></strong></p>\r\n<p>\r\n	<strong><span style=\"font-size:14px;\">4. Cấp số nh&acirc;n</span></strong></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/VCaAS0Nz.JPG\" style=\"width: 410px; height: 211px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>5. Phương tr&igrave;nh, bất phương tr&igrave;nh logarit</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/OCHLQs1z.JPG\" style=\"width: 402px; height: 169px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>6. Phương tr&igrave;nh, bất phương tr&igrave;nh mũ:&nbsp;</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/C3HVehWN.JPG\" style=\"width: 405px; height: 106px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>7. Lũy thừa: a, b &gt; 0</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/gHF8raM4.JPG\" style=\"width: 401px; height: 158px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>8. Logarit: 0 &lt; N<sub>1</sub>N<sub>2</sub> v&agrave; 0 &lt; a, b # 1 ta c&oacute;</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/9Vqu6MtV.JPG\" style=\"width: 404px; height: 228px;\" /></p>\r\n',NULL,'2014-06-22','',1,2,''),(92,'Công thức hình học','cthh','<p>\r\n	<span style=\"font-size:14px;\"><strong>I. PHƯƠNG PH&Aacute;P TỌA ĐỘ TRONG MẶT PHẲNG</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>1. Đường thẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/Ed6x2iFA.JPG\" style=\"width: 382px; height: 203px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/5k2UIa6M.JPG\" style=\"width: 346px; height: 183px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/4qVd4KKS.JPG\" style=\"width: 378px; height: 193px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>2. Đường tr&ograve;n:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/pTqB79MG.JPG\" style=\"width: 397px; height: 172px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Elip:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/qUBbnN5x.JPG\" style=\"width: 423px; height: 205px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>4. Hypebol:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/EHTCllZt.JPG\" style=\"width: 410px; height: 223px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>5. Parabol:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/HT7JPfEr.JPG\" style=\"width: 397px; height: 110px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>II. PHƯƠNG PH&Aacute;P TỌA ĐỘ TRONG KH&Ocirc;NG GIAN</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>1. T&iacute;ch c&oacute; hướng hai vecto:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/ytIJLkzh.JPG\" style=\"width: 374px; height: 200px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>2. Mặt phẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/egeMgzTb.JPG\" style=\"width: 382px; height: 326px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Đường thẳng:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/lkrhSYhN.JPG\" style=\"width: 382px; height: 273px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/mPSMfbTj.JPG\" style=\"width: 392px; height: 272px;\" /></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>3. Mặt cầu:</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/D2ulmy59.JPG\" style=\"width: 413px; height: 318px;\" /></p>\r\n',NULL,'2014-06-22','',1,2,''),(93,'Bài tập liên quan đến cực đại cực tiểu 1','btlqđcđct1','<p>\r\n	<span style=\"font-size:16px;\"><strong>T&igrave;m m để &nbsp;<em>f(x)&nbsp;</em>=&nbsp;<em>x<sup>3</sup> +&nbsp;</em><em>mx<sup>2</sup> + 7x + 3</em> c&oacute; đường thẳng đi qua cực đại, cực tiểu vu&ocirc;ng g&oacute;c với đường thẳng y=3x-7.</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/24tYzDbh.JPG\" style=\"width: 600px; height: 90px;\" /></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/e9D7g04m.JPG\" style=\"width: 600px; height: 212px;\" /></p>\r\n',NULL,'2014-06-22','',1,1,''),(94,'Bài tập liên quan đến cực đại cực tiểu hàm số bậc 3','btlqđcđcthsb3','<p>\r\n	<span style=\"font-size:14px;\"><strong>Cho h&agrave;m số&nbsp;<em>y = x<sup>3</sup> - 3x<sup>2</sup> - mx + 2&nbsp;</em>(1) với m l&agrave; tham số thực</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong>T&igrave;m m để h&agrave;m số (1) c&oacute; cực trị, đồng thời đường thẳng đi qua hai điểm cực trị của đồ thị h&agrave;m số tạo với hai trục tọa độ một tam gi&aacute;c c&acirc;n.</strong></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/JmzbDPN5.JPG\" style=\"width: 600px; height: 444px;\" /></p>\r\n',NULL,'2014-06-22','',1,1,''),(95,'Bài tập liên quan đến cực đại cực tiểu hàm số bậc 4','btlqđcđcthsb4','<p>\r\n	<span style=\"font-size:16px;\"><strong>T&igrave;m m để&nbsp;<em>f(x) =&nbsp;</em></strong><em>x<sup>4</sup> - 2mx<sup>2</sup> +2m + m<sup>4</sup>&nbsp;</em><strong>c&oacute; CĐ, CT lập th&agrave;nh tam gi&aacute;c đều</strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong><img alt=\"\" src=\"image/post/uZygGVH7.JPG\" style=\"width: 400px; height: 393px;\" /></strong></span></p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><strong><span style=\"font-size:16px;\">Cho h&agrave;m số&nbsp;</span></strong><span style=\"font-size:16px;\"><em>y = x<sup>4</sup> - 2mx<sup>2</sup> + 2m<sup>2</sup>&nbsp;- 4</em><strong> , m l&agrave; tham số thực. X&aacute;c định m để h&agrave;m số c&oacute; 3 cực trị tạo th&agrave;nh 1 tam gi&aacute;c đều c&oacute; diện t&iacute;ch bằng 1.</strong></span></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/ItTjDJrk.JPG\" style=\"width: 800px; height: 130px;\" /></p>\r\n<p>\r\n	<strong><span style=\"font-size:16px;\">Cho h&agrave;m số&nbsp;</span></strong><span style=\"font-size:16px;\"><em>y = x<sup>4</sup> - 2(1 - m<sup>2</sup>)x<sup>2</sup> + m + 1. <b>T&igrave;m m để h&agrave;m số đ&atilde; cho c&oacute; 3 điểm cực trị v&agrave; 3 điểm cực trị n&agrave;y tạo th&agrave;nh một tam gi&aacute;c c&oacute; diện t&iacute;ch lớn nhất.</b></em></span></p>\r\n<p>\r\n	<img alt=\"\" src=\"image/post/MAtYlHQ5.JPG\" style=\"width: 750px; height: 211px;\" /></p>\r\n',NULL,'2014-06-23','',1,1,''),(96,'Philippines cho Mỹ mượn căn cứ ','pcmmcc','<p>\r\n	dsdsdsdsdsds</p>\r\n',NULL,'2014-06-23','',1,1,'');
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
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

--
-- Table structure for table `tlb_resource`
--

DROP TABLE IF EXISTS `tlb_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlb_resource` (
  `resourceID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpload` date NOT NULL,
  `userID` int(11) NOT NULL,
  `catResourceID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`resourceID`,`userID`,`catResourceID`),
  KEY `fk_tlb_resource_tbl_user1_idx` (`userID`),
  KEY `fk_tlb_resource_tbl_cat_resource1_idx` (`catResourceID`),
  CONSTRAINT `fk_tlb_resource_tbl_cat_resource1` FOREIGN KEY (`catResourceID`) REFERENCES `tbl_cat_resource` (`catResourceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tlb_resource_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlb_resource`
--

LOCK TABLES `tlb_resource` WRITE;
/*!40000 ALTER TABLE `tlb_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlb_resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-23 11:26:27
