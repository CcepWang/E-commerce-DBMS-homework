-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbms_project
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `C_ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `P_ID` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Number_product` int NOT NULL,
  PRIMARY KEY (`C_ID`,`P_ID`),
  KEY `Cart_P` (`P_ID`),
  CONSTRAINT `Cart_C` FOREIGN KEY (`C_ID`) REFERENCES `consumer` (`Consumer_ID`),
  CONSTRAINT `Cart_P` FOREIGN KEY (`P_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('00','000',1),('00','777',1),('00','888',1),('00','999',1),('11','777',2),('11','888',2),('11','999',2),('22','777',3),('22','888',3),('22','999',3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comsume`
--

DROP TABLE IF EXISTS `comsume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comsume` (
  `C_ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `P_ID` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `O_ID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Number_product` int NOT NULL,
  PRIMARY KEY (`C_ID`,`P_ID`,`O_ID`),
  KEY `Consume_P` (`P_ID`),
  KEY `Consume_O` (`O_ID`),
  CONSTRAINT `Consume_C` FOREIGN KEY (`C_ID`) REFERENCES `consumer` (`Consumer_ID`),
  CONSTRAINT `Consume_O` FOREIGN KEY (`O_ID`) REFERENCES `order` (`Order_ID`),
  CONSTRAINT `Consume_P` FOREIGN KEY (`P_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comsume`
--

LOCK TABLES `comsume` WRITE;
/*!40000 ALTER TABLE `comsume` DISABLE KEYS */;
INSERT INTO `comsume` VALUES ('33','000','00000',4),('33','000','55555',14),('44','111','11111',2),('44','666','66666',2),('55','000','22222',4),('55','666','77777',2),('66','000','88888',14),('66','333','33333',1),('77','333','44444',1),('77','666','99999',2);
/*!40000 ALTER TABLE `comsume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `Consumer_ID` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `First_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Last_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bank account` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Consumer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES ('00','A','a','AA','00AA'),('11','B','b','BB','11BB'),('22','C','c','CC','22CC'),('33','D','d','DD','33DD'),('44','E','e','EE','44EE'),('55','F','f','FF','55FF'),('66','G','g','GG','66GG'),('77','H','h','HH','77HH'),('88','I','i','II','88II'),('99','J','j','JJ','99JJ');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics` (
  `Logistics_ID` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Shipping_cost` int NOT NULL,
  PRIMARY KEY (`Logistics_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES ('000000','A1',1),('111111','B2',2),('222222','C3',3),('333333','D4',4),('444444','E5',5),('555555','F6',6),('666666','G7',7),('777777','H8',8),('888888','I9',9),('999999','J0',10);
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_store`
--

DROP TABLE IF EXISTS `online_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_store` (
  `Store_ID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Store_name` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bank account` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_store`
--

LOCK TABLES `online_store` WRITE;
/*!40000 ALTER TABLE `online_store` DISABLE KEYS */;
INSERT INTO `online_store` VALUES ('0000','ABCDE','00AB'),('1111','BCDEF','11BC'),('2222','CDEFG','22CD'),('3333','DEFGH','33DE'),('4444','EFGHI','44EF'),('5555','FGHIJ','55FG'),('6666','GHIJK','66GH'),('7777','HIJKL','77HI'),('8888','IJKLM','88IJ'),('9999','JKLMN','99JK');
/*!40000 ALTER TABLE `online_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total_cost` int NOT NULL,
  `Time` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `L_ID` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Delivery` (`L_ID`),
  CONSTRAINT `Delivery` FOREIGN KEY (`L_ID`) REFERENCES `logistics` (`Logistics_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('00000',10,'20220210','555555'),('11111',11,'20220315','666666'),('22222',12,'20220316','777777'),('33333',13,'20220401','888888'),('44444',14,'20220417','999999'),('55555',20,'20220710','555555'),('66666',21,'20220816','666666'),('77777',22,'20220915','777777'),('88888',23,'20220930','888888'),('99999',24,'20221001','999999');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `S_ID` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Supply` (`S_ID`),
  CONSTRAINT `Supply` FOREIGN KEY (`S_ID`) REFERENCES `online_store` (`Store_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('000',1,'Aa','0000'),('111',2,'Bb','1111'),('222',3,'Cc','2222'),('333',4,'Dd','3333'),('444',5,'Ee','4444'),('555',6,'Ff','0000'),('666',7,'Gg','1111'),('777',8,'Hh','2222'),('888',9,'Ii','3333'),('999',10,'Jj','4444');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29 14:41:43
