-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: cems
-- ------------------------------------------------------
-- Server version	5.5.59

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
-- Current Database: `cems`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cems` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cems`;

--
-- Table structure for table `cemetery`
--

DROP TABLE IF EXISTS `cemetery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(150) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_name` (`name`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery`
--

LOCK TABLES `cemetery` WRITE;
/*!40000 ALTER TABLE `cemetery` DISABLE KEYS */;
INSERT INTO `cemetery` VALUES ('NEW','ACTIVE','NEW CEMETERY','LIGAO CITY'),('OLD','ACTIVE','OLD CEMETERY','LIGAO CITY');
/*!40000 ALTER TABLE `cemetery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery_section`
--

DROP TABLE IF EXISTS `cemetery_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery_section` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_name` (`parentid`,`name`),
  UNIQUE KEY `ux_parentid_code` (`parentid`,`code`),
  KEY `ix_state` (`state`),
  KEY `ix_parentid` (`parentid`),
  CONSTRAINT `FK_cemetery_section_section` FOREIGN KEY (`parentid`) REFERENCES `cemetery` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section`
--

LOCK TABLES `cemetery_section` WRITE;
/*!40000 ALTER TABLE `cemetery_section` DISABLE KEYS */;
INSERT INTO `cemetery_section` VALUES ('NEW-L1','ACTIVE','NEW','L1','LAYER 1'),('NEW-L2','ACTIVE','NEW','L2','LAYER 2'),('OLD-L1','ACTIVE','OLD','L1','LAYER 1');
/*!40000 ALTER TABLE `cemetery_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery_section_resource`
--

DROP TABLE IF EXISTS `cemetery_section_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery_section_resource` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `resourcetypeid` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `areasqm` decimal(16,2) NOT NULL,
  `ui` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_resourcetypeid_code` (`parentid`,`resourcetypeid`,`code`),
  UNIQUE KEY `ux_parentid_resourcetypeid_name` (`parentid`,`resourcetypeid`,`name`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_resourcetypeid` (`resourcetypeid`),
  KEY `ix_code` (`code`),
  KEY `ix_name` (`name`),
  CONSTRAINT `FK_cemetery_section_resource_resource_type` FOREIGN KEY (`resourcetypeid`) REFERENCES `resource_type` (`objid`),
  CONSTRAINT `FK_cemetery_section_resource_cemetery_section` FOREIGN KEY (`parentid`) REFERENCES `cemetery_section` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section_resource`
--

LOCK TABLES `cemetery_section_resource` WRITE;
/*!40000 ALTER TABLE `cemetery_section_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `cemetery_section_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type`
--

DROP TABLE IF EXISTS `resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type`
--

LOCK TABLES `resource_type` WRITE;
/*!40000 ALTER TABLE `resource_type` DISABLE KEYS */;
INSERT INTO `resource_type` VALUES ('CHAPEL','CHAPEL'),('CREMATORIUM','CREMATORIUM'),('MAUSOLEUM','MAUSOLEUM'),('NICHE','NICHE'),('OSSUARY','OSSUARY'),('TOMB','TOMB');
/*!40000 ALTER TABLE `resource_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-15 14:39:28
