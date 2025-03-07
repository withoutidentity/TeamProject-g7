-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: team-project
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `team-project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `team-project` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `team-project`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` varchar(50) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `categories_category_id_key` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('1','โครงสร้างหมวดรายวิชาทั่วไป'),('2','หมวดวิชาพื้นฐานทางคณิตศาสตร์และวิศวกรรม'),('3','หมวดวิชาพื้นฐานทางวิศวกรรมคอมพิวเตอร์'),('4','กลุ่มวิชาเฉพาะด้าน'),('5','กลุ่มวิชาเลือกเฉพาะสาขา');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_subcategory`
--

DROP TABLE IF EXISTS `course_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_subcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(50) NOT NULL,
  `subcategory_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_code` (`course_code`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `course_subcategory_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `courses` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `course_subcategory_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_subcategory`
--

LOCK TABLES `course_subcategory` WRITE;
/*!40000 ALTER TABLE `course_subcategory` DISABLE KEYS */;
INSERT INTO `course_subcategory` VALUES (1,'90591019','1'),(2,'90591002','1'),(3,'90595001','5'),(4,'90595002','5'),(5,'90595003','5'),(6,'11716001','17'),(7,'11716002','17'),(8,'11716003','17'),(9,'11716004','17'),(10,'11256001','17'),(11,'11256002','17'),(12,'11256003','17'),(13,'11256004','17'),(14,'11256005','17'),(15,'11256016','6'),(16,'11256017','7'),(17,'11256018','7'),(18,'11256019','7'),(19,'11256020','8'),(20,'11256021','8'),(21,'11256022','8'),(22,'11256023','8'),(23,'11256024','9'),(24,'11256025','9'),(25,'11256026','9'),(26,'11256027','9'),(27,'11256047','13'),(28,'11256048','13'),(29,'11256049','13'),(30,'11256050','13'),(31,'11256051','13'),(32,'11256052','14'),(33,'11256053','14'),(34,'11256054','14'),(35,'11256055','14'),(36,'11256056','14'),(37,'11256057','15'),(38,'11256058','15'),(39,'11256059','15'),(40,'11256060','15'),(41,'11256061','16'),(42,'11256062','16'),(43,'11256063','16'),(44,'11256064','16'),(45,'11256065','16'),(46,'11256066','16'),(47,'11256067','16'),(48,'11256042','12'),(49,'11256043','12'),(50,'11256044','12'),(51,'11256045','12'),(52,'11256046','12'),(53,'11256034','11'),(54,'11256035','11'),(55,'11256036','11'),(56,'11256037','11'),(57,'11256038','11'),(58,'11256039','11'),(59,'11256040','11'),(60,'11256041','11'),(61,'11256028','10'),(62,'11256029','10'),(63,'11256030','10'),(64,'11256031','10'),(65,'11256032','10'),(66,'11256033','10'),(67,'11256006','18'),(68,'11256007','18'),(69,'11256008','18'),(70,'11256009','18'),(71,'11256010','18'),(72,'11256011','18'),(73,'11256012','18'),(74,'11256013','18'),(75,'11256014','18'),(76,'11256015','18');
/*!40000 ALTER TABLE `course_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_code` varchar(50) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `credits` varchar(50) NOT NULL,
  PRIMARY KEY (`course_code`),
  UNIQUE KEY `courses_course_code_key` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('11256001','พื้นฐานการเขียนโปรแกรมคอมพิวเตอร์ PROGRAMMING FUNDAMENTAL ','3'),('11256002','วงจรไฟฟ้าและอิเล็กทรอนิกส์ CIRCUITS AND ELECTRONICS ','3'),('11256003','โครงสร้างแบบดิสครีต DISCRETE STRUCTURE ','3'),('11256004','ทฤษฎีการคำนวณ THEORY OF COMPUTATION ','3'),('11256005',' เขียนแบบวศวกรรม ENGINEERING DRAWING ','3'),('11256006','วิศวกรรมคอมพิวเตอร์เบื้องต้น (Introduction to Computer Engineering)','3'),('11256007','การเขียนโปรแกรมเชิงวัตถุ (Object Oriented Programming)','3'),('11256008','โครงสร้างข้อมูลและอัลกอริทึม (Data Structures and Algorithms)','3'),('11256009','พื้นฐานระบบดิจิทัล (Digital System Fundamentals)','3'),('11256010','การสื่อสารข้อมูล (Data Communications)','3'),('11256011','กระบวนการพัฒนาซอฟต์แวร์ (Software Development Processes)','3'),('11256012','ระบบปฏิบัติการ (Operating Systems)','3'),('11256013','การเตรียมโครงงานวิศวกรรมคอมพิวเตอร์ (Computer Engineering Project Preparation)','1'),('11256014','การพัฒนาทักษะทางวิชาชีพวิศวกรรมคอมพิวเตอร์ (Computer Engineering Professional Development)','2'),('11256015','การฝึกงานอุตสาหกรรม (Industrial Training)','0'),('11256016 ','ระบบฐานข้อมูล DATABASE SYSTEMS  ','3'),('11256017','สถาปัตยกรรมและการออกแบบซอฟต์แวร์ SOFTWARE ARCHITECTURE AND DESIGN','3'),('11256018','สตูดิโอซอฟต์แวร์ SOFTWARE STUDIO','3'),('11256019','การออกแบบส่วนปฏิสัมพันธ์กับมนุษย์และแนวคิดการออกแบบนวัตกรรม HUMAN INTERFACE AND INNOVATIVE DESIGN CONCEPT','3'),('11256020','เครือข่ายคอมพิวเตอร์ COMPUTER NETWORKS ','3'),('11256021','มาตรฐานและเทคโนโลยีเครือข่าย INTERNETWORKING STANDARDS AND TECHNOLOGIES ','3'),('11256022','ความมั่นคงข้อมูลและคอมพิวเตอร์ INFORMATION AND COMPUTER SECURITY ','3'),('11256023','การดูแลแพลทฟอร์มระบบ SYSTEM PLATFORM ADMINISTRATION','3'),('11256024','องค์ประกอบคอมพิวเตอร์ COMPUTER ARCHITECTURE','3'),('11256025','สถาปัตยกรรมคอมพิวเตอร์ ENGLISH FOR ACADEMIC PURPOSES ','3'),('11256026','การประยุกต์และพัฒนาไมโครคอนโทรลเลอร์ MICROCONTROLLER APPLICATION AND DEVELOPMENT ','3'),('11256027','การออกแบบทางฮาร์ดแวร์คอมพิวเตอร์ COMPUTER HARDWARE DESIGN ','3'),('11256028','การพัฒนาหุ่นยนต์ขนาดเล็ก (Micro Robot Development)','3'),('11256029','การประมวลผลสมรรถนะสูง (High Performance Computing)','3'),('11256030','อินเทอร์เน็ตในทุกสิ่งและระบบอัจฉริยะ (Internet of Things and Smart Systems)','3'),('11256031','การออกแบบดิจิทัลขั้นสูงโดยใช้เฮชดีแอล (Advanced Digital Design Using HDL)','3'),('11256032','การออกแบบระบบสมองกลฝังตัว (Embedded System Design)','3'),('11256033','หัวข้อพิเศษทางฮาร์ดแวร์และสถาปัตยกรรมคอมพิวเตอร์ (Special Topics in Hardware and Computer Architecture)','3'),('11256034','การสร้างคอมไพเลอร์ (Compiler Construction)','3'),('11256035','เว็บเทคโนโลยี (Web Technology)','3'),('11256036','การออกแบบและวิเคราะห์อัลกอริทึม (Design and Analysis of Algorithms)','3'),('11256037','ระบบฐานข้อมูลขั้นสูง (Advanced Database Systems)','3'),('11256038','การประมวลผลคลาวด์ (Cloud Computing)','3'),('11256039','การทดสอบและการประกันคุณภาพซอฟต์แวร์ (Software Testing and Quality Assurance)','3'),('11256040','วิศวกรรมความต้องการของระบบ (System Requirements Engineering)','3'),('11256041','หัวข้อพิเศษทางการพัฒนาซอฟต์แวร์ (Special Topics in Software Development)','3'),('11256042','ดาต้าแวร์เฮาส์ Data Warehouse','3'),('11256043','เหมืองข้อมูล Data Mining','3'),('11256044','สถาปัตยกรรมข้อมูลขนาดใหญ่ Big Data Architecture','3'),('11256045','การวิเคราะห์ข้อมูลเบื้องต้น Introduction to Data Analytics','3'),('11256046','หัวข้อพิเศษทางข้อมูลขนาดใหญ่และธุรกิจอัจฉริยะ Special Topics in Big Data and Smart Business','3'),('11256047','การประมวลผลภาพ Image Processing','3'),('11256048','ระบบสื่อผสม Multimedia Systems','3'),('11256049','คอมพิวเตอร์กราฟิกส์ Computer Graphics','3'),('11256050','โลกเสมือนผสานโลกจริง Augmented Reality','3'),('11256051','หัวข้อพิเศษทางการประมวลผลมัลติมีเดีย Special Topics in Multimedia Computing','3'),('11256052','การเรียนรู้ของเครื่อง Machine Learning','3'),('11256053','ปัญญาประดิษฐ์ Artificial Intelligence','3'),('11256054','การสืบค้นสารสนเทศและการค้นหาเว็บ Information Storage and Web Search','3'),('11256055','การเรียนรู้เชิงลึก Deep Learning','3'),('11256056','หัวข้อพิเศษทางเครื่องจักรอัจฉริยะ Special Topics in Intelligent Machines','3'),('11256057','สถาปัตยกรรมและการบริหารความมั่นคงไอซีที ICT Security Architecture and Management','3'),('11256058','การประเมินความมั่นคงเทคโนโลยีสารสนเทศ Information Technology Security Assessment','3'),('11256059','การทดสอบเจาะระบบและการแฮกแบบมีจริยธรรมเบื้องต้น Basic Penetration Testing and Ethical Hacking','3'),('11256060','หัวข้อพิเศษทางความปลอดภัยไซเบอร์ Special Topics in Cyber Security','3'),('11256061','การจัดการศูนย์ข้อมูล Data Center Management','3'),('11256062','การวิเคราะห์เครือข่ายเชิงปฏิบัติ Practical Network Analysis','3'),('11256063','ซอฟต์แวร์กำหนดเครือข่าย Software Defined Networking','3'),('11256064','เทคโนโลยีเครือข่ายไร้สาย Wireless Network Technology','3'),('11256065','ระบบและการบริการเสมือน Service and System Virtualization','3'),('11256066','การจำลองระบบด้วยคอมพิวเตอร์ Computer Simulation','3'),('11256067','หัวข้อพิเศษทางโครงสร้างพื้นฐานของระบบ Special Topics in System Infrastructure','3'),('11716001','แคลคูลัส 1 CALCULUS 1 ','3'),('11716002','แคลคูลัส 2 CALCULUS 2 ','3'),('11716003','สมการอนุพันธ์และพีชคณิตเชิงเส้นพื้นฐาน ELEMENTARY DIFFERENTIAL EQUATIONS AND LINEAR ALGEBRA ','3'),('11716004','ความน่าจะเป็นและสถิต PROBABILITY AND STATISTICS ','3'),('90591002','กีฬาและนันทนาการ SPORTS AND RECREATIONAL ACTIVITIES','1'),('90591019','โรงเรียนสร้างเสน่ห์ Charm SCHOOL','2'),('90595001','ภาษาอังกฤษพื้นฐาน FOUNDATION ENGLISH','3'),('90595002','ภาษาอังกฤษเพื่อการสื่อสาร ENGLISH FOR COMMUNICATION','3'),('90595003','ภาษาอังกฤษเชิงวิชาการ ENGLISH FOR ACADEMIC PURPOSES ','3');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `subcategory_id` varchar(50) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `subcategories_subcategory_id_key` (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES ('1','กลุ่มคุณค่าแห่งชีวิต','1'),('10','กลุ่มวิชาเลือกฮาร์ดแวร์และสถาปัตยกรรมคอมพิวเตอร์','5'),('11','กลุ่มวิชาเลือกการพัฒนาซอฟต์แวร์','5'),('12','กลุ่มวิชาเลือกข้อมูลขนาดใหญ่และธุรกิจอัจฉริยะ','5'),('13','กลุ่มวิชาเลือกการประมวลผลมัลติมีเดีย (Multimedia Computing)','5'),('14','กลุ่มวิชาเลือกเครื่องจักรอัจฉริยะ (Machine Intelligence)','5'),('15','กลุ่มวิชาเลือกความปลอดภัยไซเบอร์ (Cyber Security)','5'),('16','กลุ่มวิชาเลือกโครงสร้างพื้นฐานของระบบ (System Infrastructure)','5'),('17','กลุ่มพื้นฐานทางคณิตศาสตร์และวิศวกรรม','2'),('18','กลุ่มพื้นฐานทางวิศวกรรมคอมพิวเตอร์','3'),('2','กลุ่มวิถีแห่งสังคม','1'),('3','กลุ่มศาสตร์แห่งการคิด','1'),('4','กลุ่มศิลปะแห่งการจัดการ','1'),('5','กลุ่มภาษาและการสื่อสาร','1'),('6','กลุ่มเทคโนโลยีเพื่องานประยุกต์','4'),('7','กลุ่มวิชาการพัฒนาซอฟต์แวร์','4'),('8','กลุ่มวิชาโครงสร้างพื้นฐานของระบบ','4'),('9','กลุ่มวิชาฮาร์ดแวร์และสถาปัตยกรรมคอมพิวเตอร์','4');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07  1:15:15
