-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: education
-- ------------------------------------------------------
-- Server version	5.5.36-log

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
-- Table structure for table `edu_codes_master`
--

DROP TABLE IF EXISTS `edu_codes_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_codes_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_codes_master`
--

LOCK TABLES `edu_codes_master` WRITE;
/*!40000 ALTER TABLE `edu_codes_master` DISABLE KEYS */;
INSERT INTO `edu_codes_master` VALUES (1,'USER','USR'),(2,'GROUP','GRP'),(3,'ROLE','ROLE'),(4,'EMPLOYEE',NULL),(5,'UNIVERSITY',NULL),(6,'SCHOOL',NULL),(7,'COLLEGE',NULL);
/*!40000 ALTER TABLE `edu_codes_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_sequences`
--

DROP TABLE IF EXISTS `edu_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_sequences` (
  `code_id` int(11) DEFAULT NULL,
  `sequence_name` varchar(100) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_sequences`
--

LOCK TABLES `edu_sequences` WRITE;
/*!40000 ALTER TABLE `edu_sequences` DISABLE KEYS */;
INSERT INTO `edu_sequences` VALUES (1,'USER_SEQ',1),(2,'GROUP_SEQ',1),(3,'ROLE_SEQ',1);
/*!40000 ALTER TABLE `edu_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_setting_master`
--

DROP TABLE IF EXISTS `edu_setting_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_setting_master` (
  `id` varchar(30) NOT NULL,
  `code_id` int(11) DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  `start_value` int(11) DEFAULT NULL,
  `auto_increment` enum('N','Y') NOT NULL,
  `size` int(11) DEFAULT NULL,
  `increment_val` int(11) NOT NULL,
  `current_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_setting_master`
--

LOCK TABLES `edu_setting_master` WRITE;
/*!40000 ALTER TABLE `edu_setting_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_setting_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-19 12:40:49
