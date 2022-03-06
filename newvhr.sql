-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: localhost    Database: vhr
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `adjustsalary`
--

DROP TABLE IF EXISTS `adjustsalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `asDate` date DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int(11) DEFAULT NULL COMMENT '调前薪资',
  `afterSalary` int(11) DEFAULT NULL COMMENT '调后薪资',
  `reason` varchar(255) DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustsalary`
--

LOCK TABLES `adjustsalary` WRITE;
/*!40000 ALTER TABLE `adjustsalary` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustsalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraise`
--

DROP TABLE IF EXISTS `appraise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `appDate` date DEFAULT NULL COMMENT '考评日期',
  `appResult` varchar(32) DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraise`
--

LOCK TABLES `appraise` WRITE;
/*!40000 ALTER TABLE `appraise` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baiduImageBed`
--

DROP TABLE IF EXISTS `baiduImageBed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baiduImageBed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `keyword` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baiduImageBed`
--

LOCK TABLES `baiduImageBed` WRITE;
/*!40000 ALTER TABLE `baiduImageBed` DISABLE KEYS */;
INSERT INTO `baiduImageBed` VALUES (2,'清华大学','116.31515,39.999006'),(3,'中国石油大学(北京)','116.24620,40.216746');
/*!40000 ALTER TABLE `baiduImageBed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11) DEFAULT NULL,
  `depPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'股东会',-1,'.1',1,1),(4,'董事会',1,'.1.4',1,1),(5,'总办',4,'.1.4.5',1,1),(8,'财务部',5,'.1.4.5.8',1,0),(78,'市场部',5,'.1.4.5.78',1,1),(81,'华北市场部',78,'.1.4.5.78.81',1,1),(82,'华南市场部',78,'.1.4.5.78.82',1,0),(85,'石家庄市场部',81,'.1.4.5.78.81.85',1,0),(86,'西北市场部',78,'.1.4.5.78.86',1,1),(87,'西安市场',86,'.1.4.5.78.86.87',1,1),(89,'莲湖区市场',87,'.1.4.5.78.86.87.89',1,0),(91,'技术部',5,'.1.4.5.91',1,0),(92,'运维部',5,'.1.4.5.92',1,1),(93,'运维1部',92,'.1.4.5.92.93',1,0),(94,'运维2部',92,'.1.4.5.92.94',1,0),(96,'bbb',1,'.1.96',1,1),(104,'111',96,'.1.96.104',1,0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` varchar(15) DEFAULT NULL,
  `workID` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `store` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES ('Q202101','进站区','RHAC定筒式厚壁筒顶部皮碗固定杆式泵','2'),('Q202102','过滤区','RHBM-AC,双密封杆式抽油泵','3'),('Q201901','调压区','RWBC定筒式薄壁筒底部皮碗固定杆式泵','1'),('Q202001','出站区','TH(B)C厚壁泵筒皮碗支撑管式抽油泵','2'),('Q202103','进站区','阀球阀座','6'),('Q202002','计量区','液压反馈抽稠泵','1'),('Q201801','调压区','卸油器','2'),('Q202201','出站区','抽油泵柱塞','2');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int(8) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politicId` int(8) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int(11) DEFAULT NULL COMMENT '职称ID',
  `posId` int(11) DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int(11) DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `jobId` (`jobLevelId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `politicId` (`politicId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1942 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'江南一点雨','男','1990-01-01','610122199001011256','已婚',1,'陕西',1,'laowang@qq.com','18565558897','深圳市南山区',5,9,29,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000001',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(2,'陈静','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',91,12,29,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000002',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(3,'赵琳浩','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000003',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(4,'鹿存亮','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000004',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(5,'姚森','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000005',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(6,'云星','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000006',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(7,'贾旭明','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000007',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(8,'张黎明','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000008',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(9,'薛磊','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000009',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(10,'张洁','女','1990-10-09','420177199010093652','未婚',1,'海南',5,'zhangjie@qq.com','13695557742','海口市美兰区',92,16,34,'劳动合同','高中','无','海南侨中','2018-01-01','在职','00000010',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(11,'江南一点雨2','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',91,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000011',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(12,'陈静2','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000012',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(13,'赵琳浩2','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000013',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(14,'鹿存亮2','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000014',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(15,'姚森2','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000015',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(16,'云星2','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000016',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(17,'贾旭明2','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000017',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(18,'王一亭','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000018',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(19,'薛磊2','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000019',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(20,'张洁2','女','1990-10-09','420177199010093652','未婚',1,'海南',5,'zhangjie@qq.com','13695557742','海口市美兰区',92,16,34,'劳动合同','高中','无','海南侨中','2018-01-01','在职','00000020',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(21,'江南一点雨3','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000021',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(22,'陈静3','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000022',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(24,'鹿存亮3','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000024',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(25,'姚森3','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000025',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(26,'云星3','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000026',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(27,'贾旭明3','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000027',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(28,'张黎明3','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000028',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(29,'薛磊3','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000029',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(31,'江南一点雨4','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000031',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(32,'陈静4','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000032',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(33,'赵琳浩4','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000033',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(34,'鹿存亮4','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000034',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(35,'姚森4','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000035',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(36,'云星4','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000036',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(37,'贾旭明4','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000037',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(38,'张黎明2','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000038',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(39,'薛磊4','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000039',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(40,'张洁4','女','1990-10-09','420177199010093652','未婚',1,'海南',5,'zhangjie@qq.com','13695557742','海口市美兰区',92,16,34,'劳动合同','高中','无','海南侨中','2018-01-01','在职','00000040',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(41,'江南一点雨5','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000041',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(42,'陈静5','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000042',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(43,'赵琳浩5','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000043',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(44,'鹿存亮5','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000044',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(45,'姚森5','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000045',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(46,'云星5','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000046',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(47,'贾旭明5','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000047',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(48,'张黎明5','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000048',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(49,'薛磊5','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000049',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(50,'张洁5','女','1990-10-09','420177199010093652','未婚',1,'海南',5,'zhangjie@qq.com','13695557742','海口市美兰区',92,16,34,'劳动合同','高中','无','海南侨中','2018-01-01','在职','00000050',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(51,'江南一点雨6','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000051',1,'2018-04-01',NULL,'2018-01-01','2019-01-01',NULL),(52,'陈静6','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000052',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(53,'赵琳浩6','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000053',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(54,'鹿存亮6','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000054',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(55,'姚森6','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000055',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(56,'云星6','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000056',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(1351,'江南一点雨','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000001',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1352,'陈静','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000002',3,NULL,NULL,'2015-06-09','2018-06-08',NULL),(1355,'姚森','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000005',7,NULL,NULL,'2017-01-02','2024-01-17',NULL),(1361,'江南一点雨2','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000011',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1362,'陈静2','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000012',3,NULL,NULL,'2015-06-09','2018-06-08',NULL),(1363,'赵琳浩2','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000013',3.5,NULL,NULL,'2018-01-01','2021-07-14',NULL),(1364,'鹿存亮2','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000014',3.5,NULL,NULL,'2018-01-01','2021-07-14',NULL),(1365,'姚森2','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000015',7,NULL,NULL,'2017-01-02','2024-01-17',NULL),(1366,'云星2','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000016',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1367,'贾旭明2','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000017',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1368,'王一亭','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000018',7,NULL,NULL,'2018-01-01','2025-01-30',NULL),(1369,'薛磊2','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000019',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1370,'张洁2','女','1990-10-09','420177199010093652','未婚',1,'海南',5,'zhangjie@qq.com','13695557742','海口市美兰区',92,16,34,'劳动合同','高中','无','海南侨中','2018-01-01','在职','00000020',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1371,'江南一点雨3','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000021',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1372,'陈静3','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000022',3,NULL,NULL,'2015-06-09','2018-06-08',NULL),(1373,'鹿存亮3','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000024',3.5,NULL,NULL,'2018-01-01','2021-07-14',NULL),(1374,'姚森3','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000025',7,NULL,NULL,'2017-01-02','2024-01-17',NULL),(1375,'云星3','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000026',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1376,'贾旭明3','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000027',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1377,'张黎明3','男','1991-02-01','610144199102014569','已婚',1,'广东',6,'zhangliming@qq.com','18979994478','广东珠海',91,15,33,'劳动合同','高中','考古','清华大学','2018-01-01','在职','00000028',7,NULL,NULL,'2018-01-01','2025-01-30',NULL),(1378,'薛磊3','男','1992-07-01','610144199207017895','已婚',1,'陕西西安',13,'xuelei@qq.com','15648887741','西安市雁塔区',92,14,34,'劳动合同','初中','无','华胥中学','2018-01-01','在职','00000029',6,NULL,NULL,'2018-01-01','2024-01-17',NULL),(1379,'江南一点雨4','男','1990-01-01','610122199001011256','已婚',1,'陕西',13,'laowang@qq.com','18565558897','深圳市南山区',8,9,29,'劳动合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000031',1,NULL,NULL,'2018-01-01','2019-01-01',NULL),(1380,'陈静4','女','1989-02-01','421288198902011234','已婚',1,'海南',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',82,12,30,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000032',3,NULL,NULL,'2015-06-09','2018-06-08',NULL),(1381,'赵琳浩4','男','1993-03-04','610122199303041456','未婚',1,'陕西',3,'zhao@qq.com','15698887795','陕西省西安市莲湖区',91,12,33,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000033',3.5,NULL,NULL,'2018-01-01','2021-07-14',NULL),(1382,'鹿存亮4','男','1990-01-03','610122199001031456','已婚',1,'陕西',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',92,12,34,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000034',3.5,NULL,NULL,'2018-01-01','2021-07-14',NULL),(1383,'姚森4','男','1991-02-05','610122199102058952','已婚',1,'河南',3,'yaosen@qq.com','14785559936','河南洛阳人民大道58号',92,15,34,'劳动合同','初中','室内装修设计','西北大学','2017-01-02','在职','00000035',7,NULL,NULL,'2017-01-02','2024-01-17',NULL),(1384,'云星4','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',1,'yunxing@qq.com','15644442252','陕西西安新城区',92,16,34,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000036',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1385,'贾旭明4','男','1993-11-11','610122199311111234','已婚',1,'广东广州',4,'jiaxuming@qq.com','15644441234','广东省广州市天河区冼村路',78,15,33,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000037',5.25,NULL,NULL,'2018-01-01','2023-04-13',NULL),(1411,'谢工','女','1970-01-01','618177197001011234','离异',1,'江苏',1,'584991843@qq.com','18558887788','北京',91,12,29,'劳动合同','本科','计算机软件','南华大学','2018-01-01','在职','00000038',5,'2019-01-01',NULL,'2018-01-01','2023-01-01',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeec`
--

DROP TABLE IF EXISTS `employeeec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `ecDate` date DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint` int(11) DEFAULT NULL COMMENT '奖罚分',
  `ecType` int(11) DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeec`
--

LOCK TABLES `employeeec` WRITE;
/*!40000 ALTER TABLE `employeeec` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeremove`
--

DROP TABLE IF EXISTS `employeeremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeremove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `afterDepId` int(11) DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int(11) DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date DEFAULT NULL COMMENT '调动日期',
  `reason` varchar(255) DEFAULT NULL COMMENT '调动原因',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeremove`
--

LOCK TABLES `employeeremove` WRITE;
/*!40000 ALTER TABLE `employeeremove` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeremove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetrain`
--

DROP TABLE IF EXISTS `employeetrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeetrain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `trainDate` date DEFAULT NULL COMMENT '培训日期',
  `trainContent` varchar(255) DEFAULT NULL COMMENT '培训内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetrain`
--

LOCK TABLES `employeetrain` WRITE;
/*!40000 ALTER TABLE `employeetrain` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeetrain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empsalary`
--

DROP TABLE IF EXISTS `empsalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid` (`eid`),
  KEY `empsalary_ibfk_2` (`sid`),
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empsalary`
--

LOCK TABLES `empsalary` WRITE;
/*!40000 ALTER TABLE `empsalary` DISABLE KEYS */;
INSERT INTO `empsalary` VALUES (6,4,10),(10,5,9),(11,6,13),(12,7,13),(14,8,10),(15,9,10),(20,10,13),(21,11,9),(22,3,13),(24,2,9),(25,1,13),(26,33,10),(28,34,9),(29,44,10),(30,45,10),(31,43,10),(32,47,10),(33,52,13),(34,53,10),(35,54,10),(36,56,10),(38,21,9);
/*!40000 ALTER TABLE `empsalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','vhr','SQL','V1__vhr.sql',-1039138481,'vhrdev','2022-02-23 10:26:49',907,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr`
--

DROP TABLE IF EXISTS `hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr`
--

LOCK TABLES `hr` WRITE;
/*!40000 ALTER TABLE `hr` DISABLE KEYS */;
INSERT INTO `hr` VALUES (3,'系统管理员','18568887789','029-82881234','深圳南山',1,'admin','$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat1.jpg',NULL),(5,'Cassiel','18568123489','029-82123434','北京',1,'cassiel','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat6.JPG',NULL),(10,'李军贤','18568123666','029-82111555','广州番禺',1,'lijunxian','$2a$10$fzDqQnStUg4ok1I9FZb/E.b5o/q7m1jWFgCcuzXCUMEvBXvNJzccm','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat1.jpg',NULL),(11,'刘梓彤','18568123377','029-82111333','广州天河',1,'liuzitong','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat1.jpg',NULL),(12,'test','18568128888','029-82111222','广州越秀',1,'test','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat1.jpg',NULL),(13,'赵欣冉','19801208194','','',1,'zhaoxinran','$2a$10$SmTW6UVuVQR925iObcSO6ecsqVERS2B4IvJJ9efrzEyP0vBxxTkDW','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/cat3.jpg','');
/*!40000 ALTER TABLE `hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_role`
--

DROP TABLE IF EXISTS `hr_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrid`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_role`
--

LOCK TABLES `hr_role` WRITE;
/*!40000 ALTER TABLE `hr_role` DISABLE KEYS */;
INSERT INTO `hr_role` VALUES (1,3,6),(35,12,4),(36,12,3),(37,12,2),(43,11,3),(44,11,2),(45,11,4),(46,11,5),(48,10,3),(49,10,4),(72,5,1),(73,5,2),(74,5,3);
/*!40000 ALTER TABLE `hr_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageBed`
--

DROP TABLE IF EXISTS `imageBed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageBed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageBed`
--

LOCK TABLES `imageBed` WRITE;
/*!40000 ALTER TABLE `imageBed` DISABLE KEYS */;
INSERT INTO `imageBed` VALUES (6,'中国石油大学(北京)','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/schoolmap.jpg?token=AQD6PBGOZENSWDFQZJFT57DCDLSJE'),(7,'河北省','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/hebei.gif'),(8,'中国地图','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/chinamap.jpeg'),(9,'世界地图','https://raw.githubusercontent.com/ambulGruidae/ImageBed/master/img/worldmap.jpg');
/*!40000 ALTER TABLE `imageBed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(200) DEFAULT NULL,
  `desp` varchar(100) DEFAULT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `hrid` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'http://localhost:8081/info/data/c7fb02dac6bc4a0bbb65537b25d6cd08.pdf','Cnvlutin','Cnvlutin_Ineffectual-Neuron-Free_Deep_Neural_Network_Computing.pdf',3,0),(2,'http://localhost:8081/info/data/73139e40f3b34f738f91c298af331837.pdf','Core','Many-Core vs. Many-Thread Machines_Stay Away From the Valley.pdf',3,0),(3,'http://localhost:8081/info/data/cd4d98a039e048cc84643da5768e9ceb.pdf','SpGEMM','A Systematic Survey of General Sparse Matrix-Matrix Multiplication.pdf',3,0),(4,'http://localhost:8081/info/data/158ba1bebd11456ca921339a0c325d76.pdf','GAMMA','Gamma_Leveraging Gustavson’s Algorithm to Accelerate Sparse Matrix Multiplication.pdf',3,0),(5,'http://localhost:8081/info/data/1e3a0b2bc9c54aa3a740e9873568826f.pdf','SpaceA','SpaceA_Sparse Matrix Vector Multiplication on Processing-in-Memory Accelerator.pdf',3,0),(6,'http://localhost:8081/info/data/0c65ab9f38d64f9b9ae1f80d65075581.pdf','s','Cambricon-S_Addressing Irregularity in Sparse Neural Networks through A Cooperative Software Hardware Approach.pdf',3,1),(7,'http://localhost:8081/info/data/664e578ce4e34e5381c05f95da632340.pdf','Cambricon-S','Cambricon-X_An Accelerator for Sparse Neural Networks.pdf',3,0),(8,'http://localhost:8081/info/data/91ee6c71e7624b67891cc084fa944e74.pdf','Diana','DianNao_A Small-Footprint High-Throughput Accelerator for Ubiquitous Machine-Learning.pdf',3,0),(9,'http://localhost:8081/info/data/c4066267c32d424ea5a7cb37510a891d.pdf','SIGMA','Qin et al_2020_SIGMA.pdf',3,0),(10,'http://localhost:8081/info/data/e424a63c859f4ac2b48fdbb2a3c672c3.pdf','MatRaptor','Srivastava et al_2020_MatRaptor.pdf',3,0),(11,'http://localhost:8081/info/data/7f2a0e6900d446b489c798380cf84a26.pdf','SpArch','Zhang et al_2020_SpArch.pdf',5,0),(12,'http://localhost:8081/info/data/0bb1e36843454e688c2900049a1a2bd9.pdf','ExTensor','Hegde et al_2019_ExTensor.pdf',5,0);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joblevel`
--

DROP TABLE IF EXISTS `joblevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joblevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级','员级') DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joblevel`
--

LOCK TABLES `joblevel` WRITE;
/*!40000 ALTER TABLE `joblevel` DISABLE KEYS */;
INSERT INTO `joblevel` VALUES (9,'教授','正高级','2018-01-10 16:00:00',1),(10,'副教授','副高级','2018-01-11 13:19:20',1),(12,'助教','初级','2018-01-11 13:35:39',1),(13,'讲师','中级','2018-01-10 16:00:00',0),(14,'初级工程师','初级','2018-01-13 16:00:00',1),(15,'中级工程师66','中级','2018-01-13 16:00:00',1),(16,'高级工程师','副高级','2018-01-14 08:19:14',1),(17,'骨灰级工程师','正高级','2018-01-14 08:19:24',1);
/*!40000 ALTER TABLE `joblevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_send_log`
--

DROP TABLE IF EXISTS `mail_send_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_send_log` (
  `msgId` varchar(255) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '0发送中，1发送成功，2发送失败',
  `routeKey` varchar(255) DEFAULT NULL,
  `exchange` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '重试次数',
  `tryTime` date DEFAULT NULL COMMENT '第一次重试时间',
  `createTime` date DEFAULT NULL,
  `updateTime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_send_log`
--

LOCK TABLES `mail_send_log` WRITE;
/*!40000 ALTER TABLE `mail_send_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_send_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'/',NULL,NULL,'所有',NULL,NULL,NULL,NULL,1),(2,'/','/home','Home','员工资料','fa fa-user-circle-o',NULL,1,1,1),(3,'/','/home','Home','人事管理','fa fa-address-card-o',0,1,1,1),(4,'/','/home','Home','薪资管理','fa fa-money',0,1,1,1),(5,'/','/home','Home','统计管理','fa fa-bar-chart',0,1,1,1),(6,'/','/home','Home','用户管理','fa fa-windows',0,1,1,1),(7,'/employee/basic/**','/emp/basic','EmpBasic','基本资料',NULL,NULL,1,2,1),(8,'/employee/advanced/**','/emp/adv','EmpAdv','高级资料',NULL,NULL,1,2,0),(9,'/personnel/emp/**','/per/emp','PerEmp','员工资料',NULL,NULL,1,3,0),(10,'/personnel/ec/**','/per/ec','PerEc','员工奖惩',NULL,NULL,1,3,0),(11,'/personnel/train/**','/per/train','PerTrain','员工培训',NULL,NULL,1,3,0),(12,'/personnel/salary/**','/per/salary','PerSalary','员工调薪',NULL,NULL,1,3,0),(13,'/personnel/remove/**','/per/mv','PerMv','员工调动',NULL,NULL,1,3,0),(14,'/salary/sob/**','/sal/sob','SalSob','工资账套管理',NULL,NULL,1,4,0),(15,'/salary/sobcfg/**','/sal/sobcfg','SalSobCfg','员工账套设置',NULL,NULL,1,4,0),(16,'/salary/table/**','/sal/table','SalTable','工资表管理',NULL,NULL,1,4,0),(17,'/salary/month/**','/sal/month','SalMonth','月末处理',NULL,NULL,1,4,0),(18,'/salary/search/**','/sal/search','SalSearch','工资表查询',NULL,NULL,1,4,0),(19,'/statistics/all/**','/sta/all','StaAll','综合信息统计',NULL,NULL,1,5,0),(20,'/statistics/score/**','/sta/score','StaScore','员工积分统计',NULL,NULL,1,5,0),(21,'/statistics/personnel/**','/sta/pers','StaPers','人事信息统计',NULL,NULL,1,5,0),(22,'/statistics/recored/**','/sta/record','StaRecord','人事记录统计',NULL,NULL,1,5,0),(23,'/system/basic/**','/sys/basic','SysBasic','基础信息设置',NULL,NULL,1,6,0),(24,'/system/cfg/**','/sys/cfg','SysCfg','系统管理',NULL,NULL,1,6,0),(25,'/system/log/**','/sys/log','SysLog','操作日志管理',NULL,NULL,1,6,0),(26,'/system/hr/**','/sys/hr','SysHr','权限管理',NULL,NULL,1,6,1),(27,'/system/data/**','/sys/data','SysData','备份恢复数据库',NULL,NULL,1,6,0),(28,'/system/init/**','/sys/init','SysInit','初始化数据库',NULL,NULL,1,6,0),(29,'/','/home','Home','设备管理','fa fa-briefcase',NULL,1,1,1),(30,'/device/data/**','/dev/data','DevBasic','设备资料',NULL,NULL,1,29,1),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(32,'/','/home','Home','地图管理','fa fa-map-o',NULL,1,1,1),(33,'/map/manage/**','/map/manage','map','地图图片管理','',NULL,1,32,1),(34,'/map/map3d/**','/map/map3d','map3d','3D地图管理',NULL,NULL,1,32,1),(35,'/','/home','Home','资料管理','fa fa-edit',NULL,1,1,1),(36,'/info/data/**','/info/data','Info','资料上传/下载',NULL,NULL,1,35,1),(37,'/','/home','Home','数据监控','fa fa-bell',NULL,1,1,1),(38,'/time/chart/**','/time/chart','TimeChart','数据监控',NULL,NULL,1,37,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_role`
--

DROP TABLE IF EXISTS `menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_role`
--

LOCK TABLES `menu_role` WRITE;
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;
INSERT INTO `menu_role` VALUES (161,7,3),(162,7,6),(163,9,6),(164,10,6),(165,11,6),(166,12,6),(167,13,6),(168,14,6),(169,15,6),(170,16,6),(171,17,6),(172,18,6),(173,19,6),(174,20,6),(175,21,6),(176,22,6),(177,23,6),(178,25,6),(179,26,6),(180,27,6),(181,28,6),(182,24,6),(247,7,4),(248,8,4),(249,11,4),(250,7,2),(251,8,2),(252,9,2),(253,10,2),(254,12,2),(255,13,2),(256,7,1),(257,8,1),(258,9,1),(259,10,1),(260,11,1),(261,12,1),(262,13,1),(263,14,1),(264,15,1),(265,16,1),(266,17,1),(267,18,1),(268,19,1),(269,20,1),(270,21,1),(271,22,1),(272,23,1),(273,24,1),(274,25,1),(275,26,1),(276,27,1),(277,28,1),(280,7,6),(281,8,6),(282,9,6),(313,33,6),(314,34,6),(315,36,6),(316,30,6),(317,38,6),(318,33,1),(319,34,1),(320,36,1),(321,30,1),(322,38,1);
/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgcontent`
--

DROP TABLE IF EXISTS `msgcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgcontent`
--

LOCK TABLES `msgcontent` WRITE;
/*!40000 ALTER TABLE `msgcontent` DISABLE KEYS */;
INSERT INTO `msgcontent` VALUES (14,'2222222222','11111111111111111','2018-02-02 12:46:19'),(15,'22222222','3333333333333333333333','2018-02-02 13:45:57'),(16,'通知标题1','通知内容1','2018-02-03 03:41:39'),(17,'通知标题2','通知内容2','2018-02-03 03:52:37'),(18,'通知标题3','通知内容3','2018-02-03 04:19:41');
/*!40000 ALTER TABLE `msgcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
INSERT INTO `nation` VALUES (1,'汉族'),(2,'蒙古族'),(3,'回族'),(4,'藏族'),(5,'维吾尔族'),(6,'苗族'),(7,'彝族'),(8,'壮族'),(9,'布依族'),(10,'朝鲜族'),(11,'满族'),(12,'侗族'),(13,'瑶族'),(14,'白族'),(15,'土家族'),(16,'哈尼族'),(17,'哈萨克族'),(18,'傣族'),(19,'黎族'),(20,'傈僳族'),(21,'佤族'),(22,'畲族'),(23,'高山族'),(24,'拉祜族'),(25,'水族'),(26,'东乡族'),(27,'纳西族'),(28,'景颇族'),(29,'柯尔克孜族'),(30,'土族'),(31,'达斡尔族'),(32,'仫佬族'),(33,'羌族'),(34,'布朗族'),(35,'撒拉族'),(36,'毛难族'),(37,'仡佬族'),(38,'锡伯族'),(39,'阿昌族'),(40,'普米族'),(41,'塔吉克族'),(42,'怒族'),(43,'乌孜别克族'),(44,'俄罗斯族'),(45,'鄂温克族'),(46,'崩龙族'),(47,'保安族'),(48,'裕固族'),(49,'京族'),(50,'塔塔尔族'),(51,'独龙族'),(52,'鄂伦春族'),(53,'赫哲族'),(54,'门巴族'),(55,'珞巴族'),(56,'基诺族');
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oplog`
--

DROP TABLE IF EXISTS `oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date DEFAULT NULL COMMENT '添加日期',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `hrid` int(11) DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oplog`
--

LOCK TABLES `oplog` WRITE;
/*!40000 ALTER TABLE `oplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `politicsstatus`
--

DROP TABLE IF EXISTS `politicsstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `politicsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `politicsstatus`
--

LOCK TABLES `politicsstatus` WRITE;
/*!40000 ALTER TABLE `politicsstatus` DISABLE KEYS */;
INSERT INTO `politicsstatus` VALUES (1,'中共党员'),(2,'中共预备党员'),(3,'共青团员'),(4,'民革党员'),(5,'民盟盟员'),(6,'民建会员'),(7,'民进会员'),(8,'农工党党员'),(9,'致公党党员'),(10,'九三学社社员'),(11,'台盟盟员'),(12,'无党派民主人士'),(13,'普通公民');
/*!40000 ALTER TABLE `politicsstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (29,'技术总监','2018-01-11 13:13:42',1),(30,'运营总监','2018-01-11 13:13:48',1),(31,'市场总监','2018-01-10 16:00:00',1),(33,'研发工程师','2018-01-13 16:00:00',0),(34,'运维工程师','2018-01-14 08:11:41',1),(36,'Java研发经理','2019-09-30 16:00:00',1);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_manager','部门经理'),(2,'ROLE_personnel','人事专员'),(3,'ROLE_recruiter','招聘主管'),(4,'ROLE_train','培训主管'),(5,'ROLE_performance','薪酬绩效主管'),(6,'ROLE_admin','系统管理员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basicSalary` int(11) DEFAULT NULL COMMENT '基本工资',
  `bonus` int(11) DEFAULT NULL COMMENT '奖金',
  `lunchSalary` int(11) DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary` int(11) DEFAULT NULL COMMENT '交通补助',
  `allSalary` int(11) DEFAULT NULL COMMENT '应发工资',
  `pensionBase` int(11) DEFAULT NULL COMMENT '养老金基数',
  `pensionPer` float DEFAULT NULL COMMENT '养老金比率',
  `createDate` timestamp NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase` int(11) DEFAULT NULL COMMENT '医疗基数',
  `medicalPer` float DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int(11) DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer` float DEFAULT NULL COMMENT '公积金比率',
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (9,9000,4000,800,500,NULL,2000,0.07,'2018-01-23 16:00:00',2000,0.07,2000,0.07,'市场部工资账套'),(10,2000,2000,400,1000,NULL,2000,0.07,'2017-12-31 16:00:00',2000,0.07,2000,0.07,'人事部工资账套'),(13,20000,3000,500,500,NULL,4000,0.07,'2018-01-24 16:00:00',4000,0.07,4000,0.07,'运维部工资账套');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmsg`
--

DROP TABLE IF EXISTS `sysmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '消息id',
  `type` int(11) DEFAULT '0' COMMENT '0表示群发消息',
  `hrid` int(11) DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int(11) DEFAULT '0' COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  KEY `sysmsg_ibfk_1` (`mid`),
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmsg`
--

LOCK TABLES `sysmsg` WRITE;
/*!40000 ALTER TABLE `sysmsg` DISABLE KEYS */;
INSERT INTO `sysmsg` VALUES (57,14,0,3,1),(58,14,0,5,1),(59,14,0,10,1),(60,14,0,11,0),(61,14,0,12,0),(62,15,0,3,1),(63,15,0,5,1),(64,15,0,10,1),(65,15,0,11,0),(66,15,0,12,0),(67,16,0,3,1),(68,16,0,5,1),(69,16,0,10,1),(70,16,0,11,0),(71,16,0,12,0),(72,17,0,3,1),(73,17,0,5,1),(74,17,0,10,1),(75,17,0,11,0),(76,17,0,12,0),(77,18,0,3,1),(78,18,0,5,0),(79,18,0,10,0),(80,18,0,11,0),(81,18,0,12,0);
/*!40000 ALTER TABLE `sysmsg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-06 17:07:30
