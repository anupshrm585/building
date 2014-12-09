-- MySQL dump 10.13  Distrib 5.1.33, for Win32 (ia32)
--
-- Host: localhost    Database: building
-- ------------------------------------------------------
-- Server version	5.1.33-community

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
-- Table structure for table `build_group`
--

DROP TABLE IF EXISTS `build_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_group`
--

LOCK TABLES `build_group` WRITE;
/*!40000 ALTER TABLE `build_group` DISABLE KEYS */;
INSERT INTO `build_group` VALUES (1,'Admin','N','Y'),(2,'Normal User','N','Y'),(3,'Chief Executive Officer','N','N'),(4,'Manager','N','Y'),(5,'Superviser','N','Y'),(6,'Chief Associate','N','N'),(7,'Chief Technical Officer','N','N'),(8,'Head Master','N','N');
/*!40000 ALTER TABLE `build_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_rights`
--

DROP TABLE IF EXISTS `build_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_rights`
--

LOCK TABLES `build_rights` WRITE;
/*!40000 ALTER TABLE `build_rights` DISABLE KEYS */;
INSERT INTO `build_rights` VALUES (1,'/admin','N','Y'),(2,'/user','N','Y');
/*!40000 ALTER TABLE `build_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_sequences`
--

DROP TABLE IF EXISTS `build_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_sequences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_sequences`
--

LOCK TABLES `build_sequences` WRITE;
/*!40000 ALTER TABLE `build_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `build_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_user`
--

DROP TABLE IF EXISTS `build_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `is_deleted` enum('N','Y') NOT NULL DEFAULT 'N',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_user`
--

LOCK TABLES `build_user` WRITE;
/*!40000 ALTER TABLE `build_user` DISABLE KEYS */;
INSERT INTO `build_user` VALUES (1,'Anup Sharma','anupshrm','anupshrm','N','Y'),(2,'Vikrant Rai','vik','vik','N','Y'),(3,'Soura  Bhattacharya','soura','soura','N','Y'),(4,'Chayan Chatterjee','chayan','chayan','N','Y');
/*!40000 ALTER TABLE `build_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'building'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-09  7:18:08
