-- MySQL dump 10.13  Distrib 5.5.59, for Win64 (AMD64)
--
-- Host: localhost    Database: comis
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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `resourceinfo_objid` varchar(50) NOT NULL,
  `online` int(10) NOT NULL,
  `apptype` varchar(25) NOT NULL,
  `appno` varchar(25) DEFAULT NULL,
  `dtapplied` date NOT NULL,
  `dtapproved` date DEFAULT NULL,
  `appyear` int(255) NOT NULL,
  `applicant_objid` varchar(50) NOT NULL,
  `applicant_name` varchar(255) NOT NULL,
  `applicant_address` varchar(255) NOT NULL,
  `deceased_objid` varchar(50) NOT NULL,
  `relation_objid` varchar(50) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `dtexpiry` date DEFAULT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `permitid` varchar(50) DEFAULT NULL,
  `renewable` int(255) NOT NULL DEFAULT '0',
  `leaseduration` int(255) DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `amtpaid` decimal(16,2) NOT NULL DEFAULT '0.00',
  `lessor` text,
  `lessee` text,
  `witness1` varchar(255) DEFAULT NULL,
  `witness2` varchar(255) DEFAULT NULL,
  `prevappid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_appno` (`appno`) USING BTREE,
  KEY `ix_state` (`state`) USING BTREE,
  KEY `ix_appyear` (`appyear`) USING BTREE,
  KEY `ix_deceased_objid` (`deceased_objid`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_applicant_name` (`applicant_name`) USING BTREE,
  KEY `fk_application_relation` (`relation_objid`),
  KEY `fk_appplication_resourceinfo` (`resourceinfo_objid`),
  KEY `ix_apptype` (`apptype`) USING BTREE,
  KEY `fk_application_permit` (`permitid`),
  KEY `fk_application_prevapplication` (`prevappid`),
  CONSTRAINT `fk_application_deceassed` FOREIGN KEY (`deceased_objid`) REFERENCES `deceased` (`objid`),
  CONSTRAINT `fk_application_permit` FOREIGN KEY (`permitid`) REFERENCES `permit` (`objid`),
  CONSTRAINT `fk_application_prevapplication` FOREIGN KEY (`prevappid`) REFERENCES `application` (`objid`),
  CONSTRAINT `fk_application_relation` FOREIGN KEY (`relation_objid`) REFERENCES `relation` (`objid`),
  CONSTRAINT `fk_appplication_resourceinfo` FOREIGN KEY (`resourceinfo_objid`) REFERENCES `cemetery_section_block_resource_info` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_fee`
--

DROP TABLE IF EXISTS `application_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_fee` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `item_objid` varchar(50) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_itemid` (`parentid`,`item_objid`),
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_itemid` (`item_objid`) USING BTREE,
  CONSTRAINT `fk_application_fee_application` FOREIGN KEY (`parentid`) REFERENCES `application` (`objid`),
  CONSTRAINT `fk_application_fee_itemaccount` FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_fee`
--

LOCK TABLES `application_fee` WRITE;
/*!40000 ALTER TABLE `application_fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `fileid` varchar(500) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `causeofdeath`
--

DROP TABLE IF EXISTS `causeofdeath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `causeofdeath` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causeofdeath`
--

LOCK TABLES `causeofdeath` WRITE;
/*!40000 ALTER TABLE `causeofdeath` DISABLE KEYS */;
INSERT INTO `causeofdeath` VALUES ('ACCIDENT','ACTIVE','ACCIDENT'),('COVID19','ACTIVE','COVID 19'),('HYPERTENSION','ACTIVE','HYPER-TENSION'),('NATURAL','ACTIVE','NATURAL');
/*!40000 ALTER TABLE `causeofdeath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery`
--

DROP TABLE IF EXISTS `cemetery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(150) NOT NULL,
  `isnew` int(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_name` (`name`) USING BTREE,
  UNIQUE KEY `ux_code` (`code`),
  KEY `ix_state` (`state`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery`
--

LOCK TABLES `cemetery` WRITE;
/*!40000 ALTER TABLE `cemetery` DISABLE KEYS */;
INSERT INTO `cemetery` VALUES ('CEM-NEW','ACTIVE','NEW','NEW CEMETERY','NEW LOCATION',1),('CEM-OLD','DRAFT','OLD','OLD CEMETERY','OLD LOCATION',0);
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
  `ui` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_name` (`parentid`,`name`) USING BTREE,
  UNIQUE KEY `ux_parentid_code` (`parentid`,`code`) USING BTREE,
  KEY `ix_state` (`state`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_cemetery_section_cemetery` FOREIGN KEY (`parentid`) REFERENCES `cemetery` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section`
--

LOCK TABLES `cemetery_section` WRITE;
/*!40000 ALTER TABLE `cemetery_section` DISABLE KEYS */;
INSERT INTO `cemetery_section` VALUES ('CEM-NEW-S01','ACTIVE','CEM-NEW','S-01','SECTION 01',NULL),('CEM-OLD-S02','DRAFT','CEM-OLD','S-01','SECTION 01',NULL);
/*!40000 ALTER TABLE `cemetery_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery_section_block`
--

DROP TABLE IF EXISTS `cemetery_section_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery_section_block` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ui` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_parentid_name` (`parentid`,`name`) USING BTREE,
  UNIQUE KEY `ux_parentid_code` (`parentid`,`code`) USING BTREE,
  KEY `ix_state` (`state`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  CONSTRAINT `fk_cemetery_section_block_cemetery_section` FOREIGN KEY (`parentid`) REFERENCES `cemetery_section` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section_block`
--

LOCK TABLES `cemetery_section_block` WRITE;
/*!40000 ALTER TABLE `cemetery_section_block` DISABLE KEYS */;
INSERT INTO `cemetery_section_block` VALUES ('CEM-NEW-S01-B01','DRAFT','CEM-NEW-S01','B-1','BLOCK 1',NULL);
/*!40000 ALTER TABLE `cemetery_section_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery_section_block_resource`
--

DROP TABLE IF EXISTS `cemetery_section_block_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery_section_block_resource` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `currentinfoid` varchar(50) DEFAULT NULL,
  `currentappid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_code` (`parentid`,`code`),
  UNIQUE KEY `ux_name` (`parentid`,`name`),
  UNIQUE KEY `ux_currentinfoid` (`currentinfoid`),
  UNIQUE KEY `ux_parentid_resourcetypeid_code` (`parentid`,`currentappid`) USING BTREE,
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_currentappid` (`currentappid`),
  CONSTRAINT `fk_cemetery_section_block_resource_currentinfoid` FOREIGN KEY (`currentinfoid`) REFERENCES `cemetery_section_block_resource_info` (`objid`),
  CONSTRAINT `fk_cemetery_section_block_resource_currentappid` FOREIGN KEY (`currentappid`) REFERENCES `application` (`objid`),
  CONSTRAINT `fk_cemetery_section_block_resource_parentid` FOREIGN KEY (`parentid`) REFERENCES `cemetery_section_block` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section_block_resource`
--

LOCK TABLES `cemetery_section_block_resource` WRITE;
/*!40000 ALTER TABLE `cemetery_section_block_resource` DISABLE KEYS */;
INSERT INTO `cemetery_section_block_resource` VALUES ('CEM-NEW-S01-B01-N01','CEM-NEW-S01-B01','N-01','NICHE 01','CEM-NEW-S01-B01-N01',NULL),('CEM-NEW-S01-B01-N02','CEM-NEW-S01-B01','N-02','NICHE-02','CEM-NEW-S01-B01-N02',NULL);
/*!40000 ALTER TABLE `cemetery_section_block_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cemetery_section_block_resource_info`
--

DROP TABLE IF EXISTS `cemetery_section_block_resource_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cemetery_section_block_resource_info` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `resource_objid` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `areasqm` decimal(16,2) NOT NULL,
  `ui` text,
  `length` decimal(16,2) DEFAULT NULL,
  `width` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`) USING BTREE,
  KEY `ix_code` (`code`) USING BTREE,
  KEY `ix_name` (`name`) USING BTREE,
  KEY `fk_cemetery_section_block_resource_info_resourceid` (`resource_objid`),
  CONSTRAINT `fk_cemetery_section_block_resource_info_resourceid` FOREIGN KEY (`resource_objid`) REFERENCES `resource` (`objid`),
  CONSTRAINT `fk_cemetery_section_block_resource_info_parentid` FOREIGN KEY (`parentid`) REFERENCES `cemetery_section_block_resource` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cemetery_section_block_resource_info`
--

LOCK TABLES `cemetery_section_block_resource_info` WRITE;
/*!40000 ALTER TABLE `cemetery_section_block_resource_info` DISABLE KEYS */;
INSERT INTO `cemetery_section_block_resource_info` VALUES ('CEM-NEW-S01-B01-N01','CEM-NEW-S01-B01-N01','DRAFT','NICHE','N01','NICHE 01',7.00,NULL,NULL,NULL),('CEM-NEW-S01-B01-N02','CEM-NEW-S01-B01-N02','DRAFT','NICHE','N02','NICHE 02',7.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cemetery_section_block_resource_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deceased`
--

DROP TABLE IF EXISTS `deceased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deceased` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `age` varchar(25) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `dtdied` date DEFAULT NULL,
  `causeofdeath_objid` varchar(50) DEFAULT NULL,
  `permissiontype` varchar(25) DEFAULT NULL,
  `infectious` varchar(255) DEFAULT NULL,
  `embalmed` varchar(255) DEFAULT NULL,
  `disposition` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`),
  KEY `ix_dtdied` (`dtdied`),
  KEY `ix_state` (`state`),
  KEY `fk_deceased_causeofdeath` (`causeofdeath_objid`),
  CONSTRAINT `fk_deceased_causeofdeath` FOREIGN KEY (`causeofdeath_objid`) REFERENCES `causeofdeath` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deceased`
--

LOCK TABLES `deceased` WRITE;
/*!40000 ALTER TABLE `deceased` DISABLE KEYS */;
/*!40000 ALTER TABLE `deceased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemaccount`
--

DROP TABLE IF EXISTS `itemaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaccount` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `item_objid` varchar(50) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_title` varchar(255) DEFAULT NULL,
  `item_fund_objid` varchar(50) DEFAULT NULL,
  `item_fund_title` varchar(50) DEFAULT NULL,
  `sortorder` int(10) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemaccount`
--

LOCK TABLES `itemaccount` WRITE;
/*!40000 ALTER TABLE `itemaccount` DISABLE KEYS */;
INSERT INTO `itemaccount` VALUES ('BPA','BURIAL PERMIT APPLICATION','ITMACCT4ef44f04:178af8b8c78:-7bbf','BPA','BURIAL PERMIT APPLICATION','GENERAL','GENERAL-PROPER',1),('BPAINT','BURIAL PERMIT APPLICATION - INTEREST',NULL,NULL,NULL,NULL,NULL,3),('BPASUR','BURIAL PERMIT APPLICATION - SURCHARGE',NULL,NULL,NULL,NULL,NULL,2),('BPF','BURIAL PERMIT FEE','ITMACCT-5314e199:178a0cdd2eb:-7ed6','BFE','BURIAL PERMIT FEE','GENERAL','GENERAL-PROPER',1);
/*!40000 ALTER TABLE `itemaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality` (
  `objid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES ('CHINESE'),('FILIPINO'),('JAPANESE');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `objid` varchar(255) NOT NULL,
  `refid` varchar(255) NOT NULL,
  `idx` int(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_refid_idx` (`refid`,`idx`),
  KEY `ix_refid` (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `discount` decimal(16,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `voided` int(11) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `txndate` datetime DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_payment_application` (`appid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  CONSTRAINT `fk_payment_application` FOREIGN KEY (`appid`) REFERENCES `application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_item`
--

DROP TABLE IF EXISTS `payment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_payment_item_payment` (`parentid`),
  CONSTRAINT `fk_payment_item_payment` FOREIGN KEY (`parentid`) REFERENCES `payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_item`
--

LOCK TABLES `payment_item` WRITE;
/*!40000 ALTER TABLE `payment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permit`
--

DROP TABLE IF EXISTS `permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permit` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) NOT NULL,
  `paymentid` varchar(50) DEFAULT NULL,
  `permitno` varchar(25) DEFAULT NULL,
  `permitdate` date DEFAULT NULL,
  `permittype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_permit_application` (`appid`),
  KEY `fk_permit_payment` (`paymentid`),
  CONSTRAINT `fk_permit_application` FOREIGN KEY (`appid`) REFERENCES `application` (`objid`),
  CONSTRAINT `fk_permit_payment` FOREIGN KEY (`paymentid`) REFERENCES `payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permit`
--

LOCK TABLES `permit` WRITE;
/*!40000 ALTER TABLE `permit` DISABLE KEYS */;
/*!40000 ALTER TABLE `permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES ('BROTHER','ACTIVE','BROTHER'),('FATER','ACTIVE','FATHER'),('MOTHER','ACTIVE','MOTHER'),('SISTER','ACTIVE','SISTER');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ux_name` (`name`) USING BTREE,
  UNIQUE KEY `ux_code` (`code`),
  KEY `ix_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES ('MAUSOLEUM','ACTIVE','MAU','MAUSOLEUM'),('NICHE','ACTIVE','NIC','NICHE'),('OSSUARY','ACTIVE','OSS','OSSUARY'),('TOMB','ACTIVE','TOM','TOMB');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_queue`
--

DROP TABLE IF EXISTS `sys_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_queue` (
  `objid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `reportid` varchar(50) DEFAULT NULL,
  `dtsent` datetime DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  `errmsg` varchar(255) DEFAULT NULL,
  `connection` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_queue`
--

LOCK TABLES `sys_email_queue` WRITE;
/*!40000 ALTER TABLE `sys_email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_email_template`
--

DROP TABLE IF EXISTS `sys_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_email_template` (
  `objid` varchar(50) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_email_template`
--

LOCK TABLES `sys_email_template` WRITE;
/*!40000 ALTER TABLE `sys_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_keywords` (`keywords`),
  KEY `ix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fileitem`
--

DROP TABLE IF EXISTS `sys_fileitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fileitem` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `caption` varchar(155) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `filelocid` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `thumbnail` text,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_filelocid` (`filelocid`),
  CONSTRAINT `fk_sys_fileitem_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_file` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fileitem`
--

LOCK TABLES `sys_fileitem` WRITE;
/*!40000 ALTER TABLE `sys_fileitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_fileitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_fileloc`
--

DROP TABLE IF EXISTS `sys_fileloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_fileloc` (
  `objid` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rootdir` varchar(255) DEFAULT NULL,
  `defaultloc` int(11) NOT NULL,
  `loctype` varchar(20) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `info` text,
  PRIMARY KEY (`objid`),
  KEY `ix_loctype` (`loctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_fileloc`
--

LOCK TABLES `sys_fileloc` WRITE;
/*!40000 ALTER TABLE `sys_fileloc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_fileloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_header`
--

DROP TABLE IF EXISTS `sys_report_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_header` (
  `objid` varchar(50) NOT NULL,
  `value` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_header`
--

LOCK TABLES `sys_report_header` WRITE;
/*!40000 ALTER TABLE `sys_report_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_report_tag`
--

DROP TABLE IF EXISTS `sys_report_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_report_tag` (
  `objid` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_report_tag`
--

LOCK TABLES `sys_report_tag` WRITE;
/*!40000 ALTER TABLE `sys_report_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_report_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `name` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `system` int(255) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('ADMIN','ADMIN',1),('ENCODER','ENCODER',1),('ENCODER_APPROVER','ENCODER_APPROVER',1),('LCR','LCR',1),('LCR_APPROVER','LCR APPROVER',1),('LICENSING','LICENSING',1),('MASTER','MASTER',1),('REPORTS','REPORTS',1),('RULE_AUTHOR','RULE AUTHOR',1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `objid` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `object` varchar(25) DEFAULT NULL,
  `permission` varchar(25) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_sys_role_permission_role` (`role`) USING BTREE,
  CONSTRAINT `fk_sys_role_permission_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule`
--

DROP TABLE IF EXISTS `sys_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(25) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `description` longtext,
  `salience` int(11) DEFAULT NULL,
  `effectivefrom` date DEFAULT NULL,
  `effectiveto` date DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `user_objid` varchar(50) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `noloop` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `rulegroup` (`rulegroup`,`ruleset`) USING BTREE,
  KEY `ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `sys_rule_ibfk_1` FOREIGN KEY (`rulegroup`, `ruleset`) REFERENCES `sys_rulegroup` (`name`, `ruleset`),
  CONSTRAINT `sys_rule_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule`
--

LOCK TABLES `sys_rule` WRITE;
/*!40000 ALTER TABLE `sys_rule` DISABLE KEYS */;
INSERT INTO `sys_rule` VALUES ('RUL47c70270:178a108c963:-7d4d','DEPLOYED','FEE_TOMB','burialpermitapplication','feecomputation','Tomb Fee',NULL,50000,NULL,NULL,'2021-04-05 16:01:13','USR5b13925b:17066eb8fad:-7eac','ADMIN',1),('RUL6020185:178a06ffea4:-79ff','DEPLOYED','DEFAULT_RENEWABLE_OPTION','burialpermitapplication','init','DEFAULT RENEWABLE OPTION',NULL,50000,NULL,NULL,'2021-04-05 13:24:53','USR5b13925b:17066eb8fad:-7eac','ADMIN',1),('RUL6020185:178a06ffea4:-7b65','DEPLOYED','DEFAULT_LEASED_DURATION','burialpermitapplication','init','DEFAULT LEASED DURATION',NULL,50000,NULL,NULL,'2021-04-05 13:22:38','USR5b13925b:17066eb8fad:-7eac','ADMIN',1);
/*!40000 ALTER TABLE `sys_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action`
--

DROP TABLE IF EXISTS `sys_rule_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondef_objid` varchar(50) DEFAULT NULL,
  `actiondef_name` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `sys_rule_action_actiondef` (`actiondef_objid`) USING BTREE,
  CONSTRAINT `sys_rule_action_actiondef` FOREIGN KEY (`actiondef_objid`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_rule_action_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action`
--

LOCK TABLES `sys_rule_action` WRITE;
/*!40000 ALTER TABLE `sys_rule_action` DISABLE KEYS */;
INSERT INTO `sys_rule_action` VALUES ('RACT47c70270:178a108c963:-7bf8','RUL47c70270:178a108c963:-7d4d','comis.actions.AddFee','add-fee',0),('RACT6020185:178a06ffea4:-79b2','RUL6020185:178a06ffea4:-79ff','comis.actions.SetRenewable','setrenewable',0),('RACT6020185:178a06ffea4:-7a6b','RUL6020185:178a06ffea4:-7b65','comis.actions.ComputeLeaseDuration','compute-lease-duration',0);
/*!40000 ALTER TABLE `sys_rule_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_action_param`
--

DROP TABLE IF EXISTS `sys_rule_action_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_action_param` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `actiondefparam_objid` varchar(100) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `booleanvalue` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `expr` longtext,
  `exprtype` varchar(25) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `obj_key` varchar(50) DEFAULT NULL,
  `obj_value` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `lov` varchar(50) DEFAULT NULL,
  `rangeoption` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `var_objid` (`var_objid`) USING BTREE,
  KEY `sys_rule_action_param_actiondefparam` (`actiondefparam_objid`) USING BTREE,
  KEY `fk_sys_rule_action_param_objkey` (`obj_key`) USING BTREE,
  CONSTRAINT `fk_sys_rule_action_param_objkey` FOREIGN KEY (`obj_key`) REFERENCES `itemaccount` (`objid`),
  CONSTRAINT `sys_rule_action_param_actiondefparam` FOREIGN KEY (`actiondefparam_objid`) REFERENCES `sys_rule_actiondef_param` (`objid`),
  CONSTRAINT `sys_rule_action_param_parentid` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`),
  CONSTRAINT `sys_rule_action_param_varobjid` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_action_param`
--

LOCK TABLES `sys_rule_action_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_action_param` DISABLE KEYS */;
INSERT INTO `sys_rule_action_param` VALUES ('RULACT47c70270:178a108c963:-7ba8','RACT47c70270:178a108c963:-7bf8','comis.actions.AddFee.expr',NULL,NULL,NULL,NULL,'3000','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT47c70270:178a108c963:-7bc9','RACT47c70270:178a108c963:-7bf8','comis.actions.AddFee.itemaccount',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BPA','BURIAL PERMIT APPLICATION',NULL,NULL,NULL),('RULACT47c70270:178a108c963:-7be4','RACT47c70270:178a108c963:-7bf8','comis.actions.AddFee.application',NULL,NULL,'RCOND47c70270:178a108c963:-7c3a','APP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6020185:178a06ffea4:-798c','RACT6020185:178a06ffea4:-79b2','comis.actions.SetRenewable.renewable',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6020185:178a06ffea4:-79a2','RACT6020185:178a06ffea4:-79b2','comis.actions.SetRenewable.application',NULL,NULL,'RC-2066edb5:178a07da6d9:-7ffe','APP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6020185:178a06ffea4:-7a45','RACT6020185:178a06ffea4:-7a6b','comis.actions.ComputeLeaseDuration.expr',NULL,NULL,NULL,NULL,'7','expression',NULL,NULL,NULL,NULL,NULL,NULL),('RULACT6020185:178a06ffea4:-7a5b','RACT6020185:178a06ffea4:-7a6b','comis.actions.ComputeLeaseDuration.application',NULL,NULL,'RCOND6020185:178a06ffea4:-7b30','APP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_rule_action_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef`
--

DROP TABLE IF EXISTS `sys_rule_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `actionname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `actionclass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef`
--

LOCK TABLES `sys_rule_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef` VALUES ('comis.actions.AddFee','add-fee','Add Fee',3,'add-fee','COMIS','comis.actions.AddFee'),('comis.actions.ComputeLeaseDuration','compute-lease-duration','Compute Lease Duration',1,'compute-lease-duration','COMIS','comis.actions.ComputeLeaseDuration'),('comis.actions.SetRenewable','setrenewable','Set Renewable Flag',2,'setrenewable','COMIS','comis.actions.SetRenewable');
/*!40000 ALTER TABLE `sys_rule_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_actiondef_param`
--

DROP TABLE IF EXISTS `sys_rule_actiondef_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_actiondef_param` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_actiondef_param_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_actiondef_param`
--

LOCK TABLES `sys_rule_actiondef_param` WRITE;
/*!40000 ALTER TABLE `sys_rule_actiondef_param` DISABLE KEYS */;
INSERT INTO `sys_rule_actiondef_param` VALUES ('comis.actions.AddFee.application','comis.actions.AddFee','application',1,'Burial Permit Application',NULL,'var',NULL,NULL,NULL,'comis.facts.BurialPermitApplication',NULL),('comis.actions.AddFee.expr','comis.actions.AddFee','expr',3,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('comis.actions.AddFee.itemaccount','comis.actions.AddFee','itemaccount',2,'Account',NULL,'lookup','comis_itemaccount:lookup','objid','title',NULL,NULL),('comis.actions.ComputeLeaseDuration.application','comis.actions.ComputeLeaseDuration','application',1,'Burial Permit Application',NULL,'var',NULL,NULL,NULL,'comis.facts.BurialPermitApplication',NULL),('comis.actions.ComputeLeaseDuration.expr','comis.actions.ComputeLeaseDuration','expr',2,'Computation',NULL,'expression',NULL,NULL,NULL,NULL,NULL),('comis.actions.SetRenewable.application','comis.actions.SetRenewable','application',1,'Burial Permit Application',NULL,'var',NULL,NULL,NULL,'comis.facts.BurialPermitApplication',NULL),('comis.actions.SetRenewable.renewable','comis.actions.SetRenewable','renewable',2,'Is Renewable?','boolean','boolean',NULL,NULL,NULL,'boolean',NULL);
/*!40000 ALTER TABLE `sys_rule_actiondef_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition`
--

DROP TABLE IF EXISTS `sys_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `fact_name` varchar(50) DEFAULT NULL,
  `fact_objid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `ruletext` longtext,
  `displaytext` longtext,
  `dynamic_datatype` varchar(50) DEFAULT NULL,
  `dynamic_key` varchar(50) DEFAULT NULL,
  `dynamic_value` varchar(50) DEFAULT NULL,
  `notexist` int(11) NOT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fact_objid` (`fact_objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_fact` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_1` FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_rule_condition_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition`
--

LOCK TABLES `sys_rule_condition` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition` DISABLE KEYS */;
INSERT INTO `sys_rule_condition` VALUES ('RC-2066edb5:178a07da6d9:-7ffe','RUL6020185:178a06ffea4:-79ff','comis.facts.BurialPermitApplication','comis.facts.BurialPermitApplication','APP',0,NULL,NULL,NULL,NULL,NULL,0),('RC-2066edb5:178a07da6d9:-8000','RUL6020185:178a06ffea4:-79ff','comis.facts.CemeteryResource','comis.facts.CemeteryResource','RES',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND47c70270:178a108c963:-7c3a','RUL47c70270:178a108c963:-7d4d','comis.facts.BurialPermitApplication','comis.facts.BurialPermitApplication','APP',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND47c70270:178a108c963:-7d1a','RUL47c70270:178a108c963:-7d4d','comis.facts.CemeteryResource','comis.facts.CemeteryResource','RES',0,NULL,NULL,NULL,NULL,NULL,0),('RCOND6020185:178a06ffea4:-7ae6','RUL6020185:178a06ffea4:-7b65','comis.facts.CemeteryResource','comis.facts.CemeteryResource','RES',1,NULL,NULL,NULL,NULL,NULL,0),('RCOND6020185:178a06ffea4:-7b30','RUL6020185:178a06ffea4:-7b65','comis.facts.BurialPermitApplication','comis.facts.BurialPermitApplication','APP',0,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_constraint`
--

DROP TABLE IF EXISTS `sys_rule_condition_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_constraint` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `field_objid` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `operator_caption` varchar(50) DEFAULT NULL,
  `operator_symbol` varchar(50) DEFAULT NULL,
  `usevar` int(11) DEFAULT NULL,
  `var_objid` varchar(50) DEFAULT NULL,
  `var_name` varchar(50) DEFAULT NULL,
  `decimalvalue` decimal(16,2) DEFAULT NULL,
  `intvalue` int(11) DEFAULT NULL,
  `stringvalue` varchar(255) DEFAULT NULL,
  `listvalue` longtext,
  `datevalue` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `var_objid` (`var_objid`) USING BTREE,
  KEY `sys_rule_condition_constraint_fact_field` (`field_objid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_constraint_fact_field` FOREIGN KEY (`field_objid`) REFERENCES `sys_rule_fact_field` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`),
  CONSTRAINT `sys_rule_condition_constraint_ibfk_2` FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_constraint`
--

LOCK TABLES `sys_rule_condition_constraint` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_constraint` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_constraint` VALUES ('RCC-2066edb5:178a07da6d9:-7fff','RC-2066edb5:178a07da6d9:-8000','comis.facts.CemeteryResource.resourceid','resourceid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MAUSOLEUM\",value:\"MAUSOLEUM\"],[key:\"NICHE\",value:\"NICHE\"],[key:\"TOMB\",value:\"TOMB\"]]',NULL,0),('RCONST47c70270:178a108c963:-7cfb','RCOND47c70270:178a108c963:-7d1a','comis.facts.CemeteryResource.resourceid','resourceid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"TOMB\",value:\"TOMB\"]]',NULL,0),('RCONST6020185:178a06ffea4:-7ac7','RCOND6020185:178a06ffea4:-7ae6','comis.facts.CemeteryResource.resourceid','resourceid',NULL,'is any of the ff.','matches',NULL,NULL,NULL,NULL,NULL,NULL,'[[key:\"MAUSOLEUM\",value:\"MAUSOLEUM\"],[key:\"NICHE\",value:\"NICHE\"],[key:\"TOMB\",value:\"TOMB\"]]',NULL,0);
/*!40000 ALTER TABLE `sys_rule_condition_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_condition_var`
--

DROP TABLE IF EXISTS `sys_rule_condition_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_condition_var` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `ruleid` varchar(50) DEFAULT NULL,
  `varname` varchar(50) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_condition_var_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_condition_var`
--

LOCK TABLES `sys_rule_condition_var` WRITE;
/*!40000 ALTER TABLE `sys_rule_condition_var` DISABLE KEYS */;
INSERT INTO `sys_rule_condition_var` VALUES ('RC-2066edb5:178a07da6d9:-7ffe','RC-2066edb5:178a07da6d9:-7ffe','RUL6020185:178a06ffea4:-79ff','APP','comis.facts.BurialPermitApplication',0),('RC-2066edb5:178a07da6d9:-8000','RC-2066edb5:178a07da6d9:-8000','RUL6020185:178a06ffea4:-79ff','RES','comis.facts.CemeteryResource',1),('RCOND47c70270:178a108c963:-7c3a','RCOND47c70270:178a108c963:-7c3a','RUL47c70270:178a108c963:-7d4d','APP','comis.facts.BurialPermitApplication',1),('RCOND47c70270:178a108c963:-7d1a','RCOND47c70270:178a108c963:-7d1a','RUL47c70270:178a108c963:-7d4d','RES','comis.facts.CemeteryResource',0),('RCOND6020185:178a06ffea4:-7ae6','RCOND6020185:178a06ffea4:-7ae6','RUL6020185:178a06ffea4:-7b65','RES','comis.facts.CemeteryResource',1),('RCOND6020185:178a06ffea4:-7b30','RCOND6020185:178a06ffea4:-7b30','RUL6020185:178a06ffea4:-7b65','APP','comis.facts.BurialPermitApplication',0);
/*!40000 ALTER TABLE `sys_rule_condition_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_deployed`
--

DROP TABLE IF EXISTS `sys_rule_deployed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_deployed` (
  `objid` varchar(50) NOT NULL,
  `ruletext` longtext,
  PRIMARY KEY (`objid`) USING BTREE,
  CONSTRAINT `sys_rule_deployed_ibfk_1` FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_deployed`
--

LOCK TABLES `sys_rule_deployed` WRITE;
/*!40000 ALTER TABLE `sys_rule_deployed` DISABLE KEYS */;
INSERT INTO `sys_rule_deployed` VALUES ('RUL47c70270:178a108c963:-7d4d','\npackage burialpermitapplication.FEE_TOMB;\nimport burialpermitapplication.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"FEE_TOMB\"\n	agenda-group \"feecomputation\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		RES: comis.facts.CemeteryResource (  resourceid matches \"TOMB\" ) \n		\n		APP: comis.facts.BurialPermitApplication (   ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"RES\", RES );\n		\n		bindings.put(\"APP\", APP );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"application\", APP );\n_p0.put( \"itemaccount\", new KeyValue(\"BPA\", \"BURIAL PERMIT APPLICATION\") );\n_p0.put( \"expr\", (new ActionExpression(\"3000\", bindings)) );\naction.execute( \"add-fee\",_p0,drools);\n\nend\n\n\n	'),('RUL6020185:178a06ffea4:-79ff','\npackage burialpermitapplication.DEFAULT_RENEWABLE_OPTION;\nimport burialpermitapplication.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"DEFAULT_RENEWABLE_OPTION\"\n	agenda-group \"init\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		APP: comis.facts.BurialPermitApplication (   ) \n		\n		RES: comis.facts.CemeteryResource (  resourceid matches \"MAUSOLEUM|NICHE|TOMB\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"APP\", APP );\n		\n		bindings.put(\"RES\", RES );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"application\", APP );\n_p0.put( \"renewable\", true );\naction.execute( \"setrenewable\",_p0,drools);\n\nend\n\n\n	'),('RUL6020185:178a06ffea4:-7b65','\npackage burialpermitapplication.DEFAULT_LEASED_DURATION;\nimport burialpermitapplication.*;\nimport java.util.*;\nimport com.rameses.rules.common.*;\n\nglobal RuleAction action;\n\nrule \"DEFAULT_LEASED_DURATION\"\n	agenda-group \"init\"\n	salience 50000\n	no-loop\n	when\n		\n		\n		APP: comis.facts.BurialPermitApplication (   ) \n		\n		RES: comis.facts.CemeteryResource (  resourceid matches \"MAUSOLEUM|NICHE|TOMB\" ) \n		\n	then\n		Map bindings = new HashMap();\n		\n		bindings.put(\"APP\", APP );\n		\n		bindings.put(\"RES\", RES );\n		\n	Map _p0 = new HashMap();\n_p0.put( \"application\", APP );\n_p0.put( \"expr\", (new ActionExpression(\"7\", bindings)) );\naction.execute( \"compute-lease-duration\",_p0,drools);\n\nend\n\n\n	');
/*!40000 ALTER TABLE `sys_rule_deployed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact`
--

DROP TABLE IF EXISTS `sys_rule_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `factclass` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `defaultvarname` varchar(25) DEFAULT NULL,
  `dynamic` int(11) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `dynamicfieldname` varchar(50) DEFAULT NULL,
  `builtinconstraints` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `factsuperclass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact`
--

LOCK TABLES `sys_rule_fact` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact` DISABLE KEYS */;
INSERT INTO `sys_rule_fact` VALUES ('comis.facts.BurialPermitApplication','comis.facts.BurialPermitApplication','Burial Permit Application','comis.facts.BurialPermitApplication',3,NULL,'APP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COMIS',NULL),('comis.facts.Cemetery','comis.facts.Cemetery','Cemetery','comis.facts.Cemetery',1,NULL,'CEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COMIS',NULL),('comis.facts.CemeteryResource','comis.facts.CemeteryResource','Cemetery Resource','comis.facts.CemeteryResource',1,NULL,'RES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COMIS',NULL);
/*!40000 ALTER TABLE `sys_rule_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rule_fact_field`
--

DROP TABLE IF EXISTS `sys_rule_fact_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rule_fact_field` (
  `objid` varchar(100) NOT NULL DEFAULT '',
  `parentid` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `handler` varchar(50) DEFAULT NULL,
  `lookuphandler` varchar(50) DEFAULT NULL,
  `lookupkey` varchar(50) DEFAULT NULL,
  `lookupvalue` varchar(50) DEFAULT NULL,
  `lookupdatatype` varchar(50) DEFAULT NULL,
  `multivalued` int(11) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `vardatatype` varchar(50) DEFAULT NULL,
  `lovname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  CONSTRAINT `sys_rule_fact_field_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rule_fact_field`
--

LOCK TABLES `sys_rule_fact_field` WRITE;
/*!40000 ALTER TABLE `sys_rule_fact_field` DISABLE KEYS */;
INSERT INTO `sys_rule_fact_field` VALUES ('comis.facts.BurialPermitApplication.applicantid','comis.facts.BurialPermitApplication','applicantid','Applicant','string',4,'lookup','entity:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('comis.facts.BurialPermitApplication.apptype','comis.facts.BurialPermitApplication','apptype','App Type','string',1,'string','burialpermitapplication:lookup','objid','appno',NULL,NULL,NULL,'string','BURIAL_PERMIT_APP_TYPE'),('comis.facts.BurialPermitApplication.deceasedid','comis.facts.BurialPermitApplication','deceasedid','Deceased','string',5,'lookup','deceased:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('comis.facts.BurialPermitApplication.dtapproved','comis.facts.BurialPermitApplication','dtapproved','Date Approved','date',2,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('comis.facts.BurialPermitApplication.dtexpiry','comis.facts.BurialPermitApplication','dtexpiry','Expiry Date','date',3,'date',NULL,NULL,NULL,NULL,NULL,NULL,'date',NULL),('comis.facts.BurialPermitApplication.leaseduration','comis.facts.BurialPermitApplication','leaseduration','Lease Duration','integer',6,'integer',NULL,NULL,NULL,NULL,NULL,NULL,'integer',NULL),('comis.facts.BurialPermitApplication.renewable','comis.facts.BurialPermitApplication','renewable','Is Renewable?','boolean',7,'boolean',NULL,NULL,NULL,NULL,NULL,NULL,'boolean',NULL),('comis.facts.Cemetery.objid','comis.facts.Cemetery','objid','CemeteryID','string',1,'lookup','cemetery:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('comis.facts.CemeteryResource.areasqm','comis.facts.CemeteryResource','areasqm','Area (sqm)','decimal',3,'decimal',NULL,NULL,NULL,NULL,NULL,NULL,'decimal',NULL),('comis.facts.CemeteryResource.objid','comis.facts.CemeteryResource','objid','Id','string',1,'lookup','cemetery_resource:lookup:lookup','objid','name',NULL,NULL,NULL,'string',NULL),('comis.facts.CemeteryResource.resourceid','comis.facts.CemeteryResource','resourceid','Resource','string',2,'lookup','resource:lookup','objid','name',NULL,NULL,NULL,'string',NULL);
/*!40000 ALTER TABLE `sys_rule_fact_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rulegroup`
--

DROP TABLE IF EXISTS `sys_rulegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_rulegroup` (
  `name` varchar(50) NOT NULL,
  `ruleset` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`ruleset`) USING BTREE,
  KEY `ruleset` (`ruleset`) USING BTREE,
  CONSTRAINT `sys_rulegroup_ibfk_1` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rulegroup`
--

LOCK TABLES `sys_rulegroup` WRITE;
/*!40000 ALTER TABLE `sys_rulegroup` DISABLE KEYS */;
INSERT INTO `sys_rulegroup` VALUES ('after-feecomputation','burialpermitapplication','After Fee Computation',4),('appinfo','burialpermitapplication','Application Info',1),('before-feecomputation','burialpermitapplication','Before Fee Computation',2),('feecomputation','burialpermitapplication','Fee Computation',3),('init','burialpermitapplication','Initial',0);
/*!40000 ALTER TABLE `sys_rulegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset`
--

DROP TABLE IF EXISTS `sys_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset` (
  `name` varchar(50) NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `packagename` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset`
--

LOCK TABLES `sys_ruleset` WRITE;
/*!40000 ALTER TABLE `sys_ruleset` DISABLE KEYS */;
INSERT INTO `sys_ruleset` VALUES ('burialpermitapplication','Burial Permit Application','burialpermitapplication','COMIS','RULE_AUTHOR',NULL);
/*!40000 ALTER TABLE `sys_ruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_actiondef`
--

DROP TABLE IF EXISTS `sys_ruleset_actiondef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_actiondef` (
  `ruleset` varchar(50) NOT NULL,
  `actiondef` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`actiondef`) USING BTREE,
  KEY `actiondef` (`actiondef`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_actiondef_actiondef` FOREIGN KEY (`actiondef`) REFERENCES `sys_rule_actiondef` (`objid`),
  CONSTRAINT `sys_ruleset_actiondef_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_actiondef`
--

LOCK TABLES `sys_ruleset_actiondef` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_actiondef` DISABLE KEYS */;
INSERT INTO `sys_ruleset_actiondef` VALUES ('burialpermitapplication','comis.actions.AddFee'),('burialpermitapplication','comis.actions.ComputeLeaseDuration'),('burialpermitapplication','comis.actions.SetRenewable');
/*!40000 ALTER TABLE `sys_ruleset_actiondef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_ruleset_fact`
--

DROP TABLE IF EXISTS `sys_ruleset_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_ruleset_fact` (
  `ruleset` varchar(50) NOT NULL,
  `rulefact` varchar(50) NOT NULL,
  PRIMARY KEY (`ruleset`,`rulefact`) USING BTREE,
  KEY `rulefact` (`rulefact`) USING BTREE,
  CONSTRAINT `fk_sys_ruleset_fact_rulefact` FOREIGN KEY (`rulefact`) REFERENCES `sys_rule_fact` (`objid`),
  CONSTRAINT `sys_ruleset_fact_ibfk_2` FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_ruleset_fact`
--

LOCK TABLES `sys_ruleset_fact` WRITE;
/*!40000 ALTER TABLE `sys_ruleset_fact` DISABLE KEYS */;
INSERT INTO `sys_ruleset_fact` VALUES ('burialpermitapplication','comis.facts.BurialPermitApplication'),('burialpermitapplication','comis.facts.Cemetery'),('burialpermitapplication','comis.facts.CemeteryResource');
/*!40000 ALTER TABLE `sys_ruleset_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('BURIAL-PERMIT-2021',5),('BURIAL-PERMIT-APP-2021',16);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_signature`
--

DROP TABLE IF EXISTS `sys_signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_signature` (
  `objid` varchar(50) NOT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `signature` mediumblob,
  `tag` varchar(50) DEFAULT NULL,
  `system` int(1) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_signature`
--

LOCK TABLES `sys_signature` WRITE;
/*!40000 ALTER TABLE `sys_signature` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `objid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `jobtitle` varchar(50) DEFAULT NULL,
  `txncode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_username` (`username`) USING BTREE,
  KEY `ix_lastname_firstname` (`lastname`,`firstname`) USING BTREE,
  KEY `ix_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('USR5b13925b:17066eb8fad:-7eac','ADMIN','ADMIN','ADMIN','A.','ADMIN A. ADMIN','ADMIN',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `objid` varchar(50) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `userid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `org_objid` varchar(50) DEFAULT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `securitygroup_objid` varchar(50) DEFAULT NULL,
  `exclude` varchar(255) DEFAULT NULL,
  `uid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_sys_user_role_uid` (`uid`) USING BTREE,
  KEY `fk_sys_user_role_role` (`role`) USING BTREE,
  KEY `fk_sys_user_role_userid` (`userid`) USING BTREE,
  CONSTRAINT `fk_sys_user_role_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`),
  CONSTRAINT `fk_sys_user_role_userid` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('USRROL-3cd32cab:178b53ec895:-7ffb','LICENSING','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac-LICENSING'),('USRROL-3cd32cab:178b53ec895:-7fff','ENCODER_APPROVER','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac-ENCODER_APPROVER'),('USRROL-3cd32cab:178b53ec895:-8000','ENCODER','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac-ENCODER'),('USRROL3e1637f8:178c07f8f03:-8000','REPORTS','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac-REPORTS'),('USRROL4bdf3db1:17891b5a99d:-7ffc','RULE_AUTHOR','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac_RULE_AUTHOR'),('USRROL4bdf3db1:17891b5a99d:-7ffd','MASTER','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac_MASTER'),('USRROL4bdf3db1:17891b5a99d:-7ffe','LCR_APPROVER','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac_LCR_APPROVER'),('USRROL4bdf3db1:17891b5a99d:-7fff','LCR','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac_LCR'),('USRROL4bdf3db1:17891b5a99d:-8000','ADMIN','USR5b13925b:17066eb8fad:-7eac','ADMIN',NULL,NULL,NULL,NULL,'USR5b13925b:17066eb8fad:-7eac_ADMIN');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_usergroup`
--

DROP TABLE IF EXISTS `sys_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_usergroup` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(25) DEFAULT NULL,
  `userclass` varchar(25) DEFAULT NULL,
  `orgclass` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_usergroup`
--

LOCK TABLES `sys_usergroup` WRITE;
/*!40000 ALTER TABLE `sys_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_var`
--

DROP TABLE IF EXISTS `sys_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` longtext,
  `description` varchar(255) DEFAULT NULL,
  `datatype` varchar(15) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_var`
--

LOCK TABLES `sys_var` WRITE;
/*!40000 ALTER TABLE `sys_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf`
--

DROP TABLE IF EXISTS `sys_wf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf` (
  `name` varchar(50) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf`
--

LOCK TABLES `sys_wf` WRITE;
/*!40000 ALTER TABLE `sys_wf` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_node`
--

DROP TABLE IF EXISTS `sys_wf_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_node` (
  `name` varchar(50) NOT NULL,
  `processname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `nodetype` varchar(10) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `salience` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ui` text,
  `properties` text,
  `tracktime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`processname`) USING BTREE,
  KEY `fk_sys_wf_node_role` (`role`) USING BTREE,
  KEY `fk_syw_wf_node_processname` (`processname`) USING BTREE,
  KEY `name` (`name`),
  CONSTRAINT `fk_sys_wf_node_role` FOREIGN KEY (`role`) REFERENCES `sys_role` (`name`),
  CONSTRAINT `fk_syw_wf_node_processname` FOREIGN KEY (`processname`) REFERENCES `sys_wf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_node`
--

LOCK TABLES `sys_wf_node` WRITE;
/*!40000 ALTER TABLE `sys_wf_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_wf_transition`
--

DROP TABLE IF EXISTS `sys_wf_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_wf_transition` (
  `parentid` varchar(50) NOT NULL DEFAULT '',
  `processname` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `idx` int(11) DEFAULT NULL,
  `eval` mediumtext,
  `properties` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `ui` text,
  PRIMARY KEY (`parentid`,`processname`,`to`,`action`) USING BTREE,
  KEY `fk_sys_wf_transition_processname_parentid` (`processname`,`parentid`) USING BTREE,
  CONSTRAINT `fk_sys_wf_transition_processname_parentid` FOREIGN KEY (`processname`, `parentid`) REFERENCES `sys_wf_node` (`processname`, `name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_wf_transition`
--

LOCK TABLES `sys_wf_transition` WRITE;
/*!40000 ALTER TABLE `sys_wf_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_wf_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_application`
--

DROP TABLE IF EXISTS `vw_application`;

-- failed on view `vw_application`: CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_application` AS select `a`.`objid` AS `objid`,`a`.`state` AS `state`,`a`.`online` AS `online`,`a`.`apptype` AS `apptype`,`a`.`appno` AS `appno`,`a`.`dtapplied` AS `dtapplied`,`a`.`dtapproved` AS `dtapproved`,`a`.`appyear` AS `appyear`,`a`.`applicant_name` AS `applicant_name`,`a`.`applicant_address` AS `applicant_address`,`a`.`dtexpiry` AS `dtexpiry`,`a`.`amount` AS `amount`,`d`.`name` AS `deceased_name`,`d`.`nationality` AS `deceased_nationality`,`d`.`age` AS `deceased_age`,`d`.`sex` AS `deceased_sex`,`d`.`dtdied` AS `deceased_dtdied`,`d`.`permissiontype` AS `deceased_permissiontype`,`cd`.`title` AS `deceased_causeofdeath`,`ri`.`objid` AS `resourceinfo_objid`,`ri`.`code` AS `resourceinfo_code`,`ri`.`name` AS `resourceinfo_name`,`ri`.`areasqm` AS `resource_areasqm`,`ri`.`length` AS `resource_length`,`ri`.`width` AS `resource_width`,`r`.`objid` AS `resource_objid`,`r`.`name` AS `resource_type`,`s`.`objid` AS `section_objid`,`s`.`code` AS `section_code`,`s`.`name` AS `section_name`,`c`.`objid` AS `cemetery_objid`,`c`.`code` AS `cemetery_code`,`c`.`name` AS `cemetery_name` from (((((((`application` `a` join `cemetery_section_resource` `sr` on((`a`.`objid` = `sr`.`currentappid`))) join `cemetery_section` `s` on((`sr`.`parentid` = `s`.`objid`))) join `cemetery` `c` on((`s`.`parentid` = `c`.`objid`))) join `cemetery_section_resource_info` `ri` on((`sr`.`currentinfoid` = `ri`.`objid`))) join `resource` `r` on((`ri`.`resource_objid` = `r`.`objid`))) join `deceased` `d` on((`a`.`deceased_objid` = `d`.`objid`))) join `causeofdeath` `cd` on((`d`.`causeofdeath_objid` = `cd`.`objid`)))


--
-- Temporary table structure for view `vw_cemetery_resource`
--

DROP TABLE IF EXISTS `vw_cemetery_resource`;
/*!50001 DROP VIEW IF EXISTS `vw_cemetery_resource`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_cemetery_resource` (
  `objid` tinyint NOT NULL,
  `parentid` tinyint NOT NULL,
  `code` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `currentinfoid` tinyint NOT NULL,
  `currentappid` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `areasqm` tinyint NOT NULL,
  `resource_objid` tinyint NOT NULL,
  `resource_name` tinyint NOT NULL,
  `block_objid` tinyint NOT NULL,
  `block_code` tinyint NOT NULL,
  `block_name` tinyint NOT NULL,
  `section_objid` tinyint NOT NULL,
  `section_code` tinyint NOT NULL,
  `section_name` tinyint NOT NULL,
  `appno` tinyint NOT NULL,
  `apptype` tinyint NOT NULL,
  `applicant_name` tinyint NOT NULL,
  `applicant_address` tinyint NOT NULL,
  `deceased_name` tinyint NOT NULL,
  `deceased_nationality` tinyint NOT NULL,
  `deceased_sex` tinyint NOT NULL,
  `deceased_age` tinyint NOT NULL,
  `deceased_causeofdeath` tinyint NOT NULL,
  `cemetery_objid` tinyint NOT NULL,
  `cemetery_code` tinyint NOT NULL,
  `cemetery_name` tinyint NOT NULL,
  `cemetery_location` tinyint NOT NULL,
  `cemetery_isnew` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_application`
--

/*!50001 DROP TABLE IF EXISTS `vw_application`*/;
/*!50001 DROP VIEW IF EXISTS `vw_application`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_application` AS select `a`.`objid` AS `objid`,`a`.`state` AS `state`,`a`.`online` AS `online`,`a`.`apptype` AS `apptype`,`a`.`appno` AS `appno`,`a`.`dtapplied` AS `dtapplied`,`a`.`dtapproved` AS `dtapproved`,`a`.`appyear` AS `appyear`,`a`.`applicant_name` AS `applicant_name`,`a`.`applicant_address` AS `applicant_address`,`a`.`dtexpiry` AS `dtexpiry`,`a`.`amount` AS `amount`,`d`.`name` AS `deceased_name`,`d`.`nationality` AS `deceased_nationality`,`d`.`age` AS `deceased_age`,`d`.`sex` AS `deceased_sex`,`d`.`dtdied` AS `deceased_dtdied`,`d`.`permissiontype` AS `deceased_permissiontype`,`cd`.`title` AS `deceased_causeofdeath`,`ri`.`objid` AS `resourceinfo_objid`,`ri`.`code` AS `resourceinfo_code`,`ri`.`name` AS `resourceinfo_name`,`ri`.`areasqm` AS `resource_areasqm`,`ri`.`length` AS `resource_length`,`ri`.`width` AS `resource_width`,`r`.`objid` AS `resource_objid`,`r`.`name` AS `resource_type`,`s`.`objid` AS `section_objid`,`s`.`code` AS `section_code`,`s`.`name` AS `section_name`,`c`.`objid` AS `cemetery_objid`,`c`.`code` AS `cemetery_code`,`c`.`name` AS `cemetery_name` from (((((((`application` `a` join `cemetery_section_resource` `sr` on((`a`.`objid` = `sr`.`currentappid`))) join `cemetery_section` `s` on((`sr`.`parentid` = `s`.`objid`))) join `cemetery` `c` on((`s`.`parentid` = `c`.`objid`))) join `cemetery_section_resource_info` `ri` on((`sr`.`currentinfoid` = `ri`.`objid`))) join `resource` `r` on((`ri`.`resource_objid` = `r`.`objid`))) join `deceased` `d` on((`a`.`deceased_objid` = `d`.`objid`))) join `causeofdeath` `cd` on((`d`.`causeofdeath_objid` = `cd`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_cemetery_resource`
--

/*!50001 DROP TABLE IF EXISTS `vw_cemetery_resource`*/;
/*!50001 DROP VIEW IF EXISTS `vw_cemetery_resource`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cemetery_resource` AS select `sr`.`objid` AS `objid`,`sr`.`parentid` AS `parentid`,`sr`.`code` AS `code`,`sr`.`name` AS `name`,`sr`.`currentinfoid` AS `currentinfoid`,`sr`.`currentappid` AS `currentappid`,`sri`.`state` AS `state`,`sri`.`areasqm` AS `areasqm`,`sri`.`resource_objid` AS `resource_objid`,`r`.`name` AS `resource_name`,`b`.`objid` AS `block_objid`,`b`.`code` AS `block_code`,`b`.`name` AS `block_name`,`s`.`objid` AS `section_objid`,`s`.`code` AS `section_code`,`s`.`name` AS `section_name`,`a`.`appno` AS `appno`,`a`.`apptype` AS `apptype`,`a`.`applicant_name` AS `applicant_name`,`a`.`applicant_address` AS `applicant_address`,`d`.`name` AS `deceased_name`,`d`.`nationality` AS `deceased_nationality`,`d`.`sex` AS `deceased_sex`,`d`.`age` AS `deceased_age`,`cd`.`title` AS `deceased_causeofdeath`,`c`.`objid` AS `cemetery_objid`,`c`.`code` AS `cemetery_code`,`c`.`name` AS `cemetery_name`,`c`.`location` AS `cemetery_location`,`c`.`isnew` AS `cemetery_isnew` from ((((((((`cemetery_section_block_resource` `sr` join `cemetery_section_block_resource_info` `sri` on((`sr`.`currentinfoid` = `sri`.`objid`))) join `resource` `r` on((`sri`.`resource_objid` = `r`.`objid`))) join `cemetery_section_block` `b` on((`sr`.`parentid` = `b`.`objid`))) join `cemetery_section` `s` on((`b`.`parentid` = `s`.`objid`))) join `cemetery` `c` on((`s`.`parentid` = `c`.`objid`))) left join `application` `a` on((`sr`.`currentappid` = `a`.`objid`))) left join `deceased` `d` on((`a`.`deceased_objid` = `d`.`objid`))) left join `causeofdeath` `cd` on((`d`.`causeofdeath_objid` = `cd`.`objid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-26 16:43:52
