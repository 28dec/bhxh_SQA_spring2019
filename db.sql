-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: bhxh
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ward` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_detail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_insurance_level` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Viettel','','','','','1',0,'2019-03-15 12:53:27'),(2,'SamSung','','','','','2',0,'2019-03-15 12:53:43');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bhxh`.`Company_AFTER_INSERT` AFTER INSERT ON `Company` FOR EACH ROW
BEGIN
	insert into Log(`action`, `action_detail`)
    values('create_company', concat('company_name = ', new.name));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `company_has_customer`
--

DROP TABLE IF EXISTS `company_has_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_has_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_rid` int(11) NOT NULL,
  `customer_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`company_rid`,`customer_code`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Company_has_Customer_Customer1_idx` (`customer_code`),
  KEY `fk_Company_has_Customer_Company1_idx` (`company_rid`),
  CONSTRAINT `fk_Company_has_Customer_Company1` FOREIGN KEY (`company_rid`) REFERENCES `company` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Company_has_Customer_Customer1` FOREIGN KEY (`customer_code`) REFERENCES `customer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_has_customer`
--

LOCK TABLES `company_has_customer` WRITE;
/*!40000 ALTER TABLE `company_has_customer` DISABLE KEYS */;
INSERT INTO `company_has_customer` VALUES (1,1,'DZ1102','2018-11-01 00:00:00','9999-12-01 00:00:00'),(2,2,'DZ6789','2019-01-01 00:00:00','9999-12-01 00:00:00');
/*!40000 ALTER TABLE `company_has_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_of_birth` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_of_insurance` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rid_UNIQUE` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'125111111','DF1234','Tạ Tài Linh','FEMALE','Sinh viên','00/00/0000','Phú Thọ','VOLUNTARY',0,'2019-03-15 12:49:28'),(1,'125627115','DZ1102','Nguyễn Hoàng Long','MALE','Sinh viên','25/08/1996','Bắc Ninh','COMPULSORY',0,'2019-03-15 12:47:11'),(3,'125222222','DZ1235','Cấn Anh Tú','MALE','Sinh viên','00/00/0000','Hà Nội','VOLUNTARY',0,'2019-03-15 12:50:04'),(5,'125444444','DZ6788','Phạm Thị Thảo','FEMALE','Sinh viên','00/00/0000','Bắc Giang','VOLUNTARY',0,'2019-03-15 12:51:16'),(4,'125333333','DZ6789','Hà Thu Thủy','FEMALE','Sinh viên','00/00/0000','Vĩnh Phúc','COMPULSORY',0,'2019-03-15 12:50:34');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bhxh`.`Customer_AFTER_INSERT` AFTER INSERT ON `Customer` FOR EACH ROW
BEGIN
	insert into Log(`action`, `action_detail`)
    values ('create_customer', concat('customer_id = ', new.id));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_of_insurance` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_date` datetime NOT NULL,
  `money` int(11) DEFAULT NULL,
  `is_benefited` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_code`,`pay_date`),
  UNIQUE KEY `rid_UNIQUE` (`rid`),
  KEY `fk_Insurance_Customer1_idx` (`customer_code`),
  CONSTRAINT `fk_Insurance_Customer1` FOREIGN KEY (`customer_code`) REFERENCES `customer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'DZ1102','COMPULSORY','2018-11-01 00:00:00',10000000,0,0,'2019-03-15 13:05:09'),(3,'DZ1102','COMPULSORY','2018-12-01 00:00:00',10000000,0,0,'2019-03-15 13:05:18'),(4,'DZ1102','COMPULSORY','2019-01-01 00:00:00',10000000,0,0,'2019-03-15 13:05:39'),(5,'DZ1102','COMPULSORY','2019-02-01 00:00:00',10000000,0,0,'2019-03-15 13:05:44'),(9,'DZ6788','VOLUNTARY','2019-02-01 00:00:00',8000000,0,0,'2019-03-15 13:07:57'),(7,'DZ6789','COMPULSORY','2019-01-01 00:00:00',5000000,0,0,'2019-03-15 13:06:19'),(8,'DZ6789','COMPULSORY','2019-02-01 00:00:00',5000000,0,0,'2019-03-15 13:06:23');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_detail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_result_ain` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,NULL,NULL,'create_customer','customer_id = 125627115',NULL,0,'2019-03-15 12:47:11'),(2,NULL,NULL,'create_customer','customer_id = 125111111',NULL,0,'2019-03-15 12:49:28'),(3,NULL,NULL,'create_customer','customer_id = 125222222',NULL,0,'2019-03-15 12:50:04'),(4,NULL,NULL,'create_customer','customer_id = 125333333',NULL,0,'2019-03-15 12:50:34'),(5,NULL,NULL,'create_customer','customer_id = 125444444',NULL,0,'2019-03-15 12:51:16'),(6,NULL,NULL,'create_company','company_name = Viettel',NULL,0,'2019-03-15 12:53:27'),(7,NULL,NULL,'create_company','company_name = SamSung',NULL,0,'2019-03-15 12:53:43');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `min_age_to_participant_VSI` int(11) DEFAULT NULL,
  `company_CSI_percentage` int(11) DEFAULT NULL,
  `labor_CSI_percentage` int(11) DEFAULT NULL,
  `labor_VSI_percentage` int(11) DEFAULT NULL,
  `1st_area_min_salary` int(11) DEFAULT NULL,
  `2nd_area_min_salary` int(11) DEFAULT NULL,
  `3rd_area_min_salary` int(11) DEFAULT NULL,
  `4th_area_min_salary` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `salary` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rid`,`customer_code`),
  KEY `fk_Salary_Customer1_idx` (`customer_code`),
  CONSTRAINT `fk_Salary_Customer1` FOREIGN KEY (`customer_code`) REFERENCES `customer` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,10000000,0,'2019-03-15 12:58:04','DZ1102'),(2,5000000,0,'2019-03-15 12:58:56','DZ6789'),(3,6000000,0,'2019-03-15 13:00:15','DF1234'),(5,7000000,0,'2019-03-15 13:01:00','DZ1235'),(6,8000000,0,'2019-03-15 13:01:20','DZ6788');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bhxh'
--

--
-- Dumping routines for database 'bhxh'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_company`(IN _name varchar(50)
								  ,IN _province varchar(50)
								  ,IN _district varchar(50)
                                  ,IN _ward varchar(50)
                                  ,IN _address_detail varchar(50)
                                  ,IN _area_insurance_level varchar(50)
)
BEGIN
	insert into Company(`name`, `province`, `district`, `ward`, `address_detail`, `area_insurance_level`)
    values (_name, _province, _district, _ward, _address_detail, _area_insurance_level);
    select 'SUCCESS' as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_customer`(in _id varchar(50)
								   ,in _code varchar(50)
                                   ,in _full_name varchar(150)
                                   ,in _gender varchar(50)
                                   ,in _job varchar(50)
                                   ,in _date_of_birth varchar(50)
                                   ,in _place_of_birth varchar(50)
)
BEGIN
	insert into Customer(`id`, `code`, `full_name`, `gender`, `job`, `date_of_birth`, `place_of_birth`, `type_of_insurance`)
    values (_id, _code, _full_name, _gender, _job, _date_of_birth, _place_of_birth, 'VOLUNTARY');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_new_rule`(in _min_age_to_participant_VSI int
							 ,in _company_CSI_percentage int
                             ,in _labor_CSI_percentage int
                             ,in _labor_VSI_percentage int
                             ,in _1st_area_min_salary int
                             ,in _2nd_area_min_salary int
                             ,in _3rd_area_min_salary int
                             ,in _4th_area_min_salary int
)
BEGIN
	insert into Rule(`min_age_to_participant_VSI`, `company_CSI_percentage`, `labor_CSI_percentage`, `labor_VSI_percentage`, `1st_area_min_salary`, `2nd_area_min_salary`, `3rd_area_min_salary`, `4th_area_min_salary`)
    values (_min_age_to_participant_VSI, _company_CSI_percentage, _labor_CSI_percentage, _labor_VSI_percentage, _1st_area_min_salary, _2nd_area_min_salary, _3rd_area_min_salary, _4th_area_min_salary);
    select 'SUCCESS' as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_pay_insurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_pay_insurance`(IN _customer_code varchar(50)
										  ,IN _pay_date varchar(50)
)
BEGIN
	declare _type varchar(50);
    declare _money int;
    select `type_of_insurance` into _type from customer where `code` = _customer_code limit 1;
    select `salary` into _money from salary where `customer_code` = _customer_code limit 1;
	insert into Insurance (`customer_code`, `pay_date`, `money`, `type_of_insurance`)
    values(_customer_code, STR_TO_DATE(concat('01/', _pay_date), '%d/%m/%Y'), _money, _type);
    select 'SUCCESS' as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_workin_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_workin_company`(in company_id int
										   ,in customer_code varchar(50)
                                           ,in from_date varchar(50)
)
BEGIN
	declare cus_code varchar(50);
    declare com_id int;
    declare f_date varchar(50);
    declare t_id int;
    
	select `customer_code`, `company_rid`, `from_date`, `id` into cus_code, com_id, f_date, t_id 
    from Company_has_Customer 
    where `to_date` = '99-9999' and `customer_code` = customer_code 
    limit 1;
    
    If cus_code = customer_code then
		select 'FAILURE' as result;
        select cus_code, com_id, f_date, t_id;
	else
		insert into company_has_customer(`company_rid`, `customer_code`, `from_date`, `to_date`) values(company_id, customer_code, STR_TO_DATE(concat('01/',from_date), '%d/%m/%Y'), STR_TO_DATE('01/12/9999', '%d/%m/%Y'));
        update Customer set type_of_insurance = 'COMPULSORY' where `code` = customer_code;
        select 'SUCCESS' as result;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_company`()
BEGIN
	select count(*) from company;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_compulsory_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_compulsory_customer`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select count(*)
    from customer
    where `type_of_insurance` = 'COMPULSORY';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_compulsory_paid_money` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_compulsory_paid_money`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select sum(money)
    from insurance
    where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y') and `type_of_insurance` = 'COMPULSORY';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_compulsory_unpaid_money` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_compulsory_unpaid_money`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select sum(salary) from salary where customer_code in (select customer_code from customer where customer_code not in (select customer_code from insurance where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y') and `type_of_insurance` = 'COMPULSORY'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_current_labor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_current_labor`()
BEGIN
	select count(*)
    from company_has_customer
    where `to_date` = STR_TO_DATE('01/12/9999', '%d/%m/%Y');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_paid_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_paid_company`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select distinct company_rid from company_has_customer where customer_code in (select distinct customer_code from Insurance where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_unpaid_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_unpaid_company`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select distinct company_rid from company_has_customer where customer_code not in (select distinct customer_code from Insurance where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_voluntary_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_voluntary_customer`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select count(*)
    from customer
    where `type_of_insurance` = 'VOLUNTARY';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_voluntary_customer_paid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_voluntary_customer_paid`(IN _f_date varchar(50), IN _t_date varchar(50))
BEGIN
	select count(*) 
    from insurance 
    where pay_date >= STR_TO_DATE(concat('01/',_f_date), '%d/%m/%Y') and pay_date <= STR_TO_DATE(concat('01/',_t_date), '%d/%m/%Y') and `type_of_insurance` = 'VOLUNTARY';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_voluntary_customer_unpaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_voluntary_customer_unpaid`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select count(*) from customer where `type_of_insurance` = 'VOLUNTARY' and code not in (select count(*) from insurance where pay_date >= STR_TO_DATE(concat('01/',_from_date), '%d/%m/%Y') and pay_date <= STR_TO_DATE(concat('01/',_to_date), '%d/%m/%Y') and `type_of_insurance` = 'VOLUNTARY');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_voluntary_paid_money` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_voluntary_paid_money`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select sum(money)
    from insurance
    where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y') and `type_of_insurance` = 'VOLUNTARY';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_total_voluntary_unpaid_money` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_voluntary_unpaid_money`(in _from_date varchar(50), in _to_date varchar(50))
BEGIN
	select sum(salary) from salary where customer_code in (select customer_code from customer where customer_code not in (select customer_code from insurance where STR_TO_DATE(concat('01/', _from_date), '%d/%m/%Y') <= pay_date and pay_date <= STR_TO_DATE(concat('01/', _to_date), '%d/%m/%Y') and `type_of_insurance` = 'VOLUNTARY'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `load_rule`()
BEGIN
	select `min_age_to_participant_VSI`, `company_CSI_percentage`, `labor_CSI_percentage`, `labor_VSI_percentage`, `1st_area_min_salary`, `2nd_area_min_salary`, `3rd_area_min_salary`, `4th_area_min_salary`
    from Rule
    order by rid desc
    limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_salary_of_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_salary_of_customer`(in _customer_code varchar(50), in _salary int)
BEGIN
	insert into Salary(`customer_code`, `salary`) values (_customer_code, _salary);
    select 'SUCCESS' as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-15 20:12:26
