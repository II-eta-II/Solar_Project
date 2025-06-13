CREATE DATABASE  IF NOT EXISTS `agr_cwa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agr_cwa`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agr_cwa
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_key_CHECKS=@@FOREIGN_key_CHECKS, FOREIGN_key_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basic`
--

DROP TABLE IF EXISTS `basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basic` (
  `key_ID` char(10) NOT NULL COMMENT '測站識別碼',
  `DTIME` datetime NOT NULL COMMENT '測量時間',
  `Station_Status` int DEFAULT NULL COMMENT '站點狀態',
  `Temperature_Status` int DEFAULT NULL COMMENT '溫度計狀態',
  `Precip_Status` int DEFAULT NULL COMMENT '氣壓計狀態',
  `Humidity_Status` int DEFAULT NULL COMMENT '溼度計狀態',
  `Wind_Status` int DEFAULT NULL COMMENT '風速計狀態',
  `Sunshine_Status` int DEFAULT NULL COMMENT '照度計狀態',
  `air_temp` float DEFAULT NULL COMMENT '氣溫',
  `precp_ha` float DEFAULT NULL COMMENT '氣壓',
  `rh` float DEFAULT NULL COMMENT '濕度',
  `wind_speed_mean` float DEFAULT NULL COMMENT '風速',
  `solar_rad` float DEFAULT NULL COMMENT '太陽照度',
  `wind_dir_max` int DEFAULT NULL COMMENT '最大風速風向',
  PRIMARY key (`key_ID`,`DTIME`),
  CONSTRAINT `basic_ibfk_1` FOREIGN key (`key_ID`) REFERENCES `stations` (`key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='測站基本狀態';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geothermal`
--

DROP TABLE IF EXISTS `geothermal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geothermal` (
  `key_ID` char(10) NOT NULL COMMENT '測站識別碼',
  `DTIME` datetime NOT NULL COMMENT '測量時間',
  `soil_temp` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_0cm` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_5cm` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_10cm` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_20cm` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_50cm` float DEFAULT NULL COMMENT '地溫',
  `soil_temp_100cm` float DEFAULT NULL COMMENT '地溫',
  PRIMARY key (`key_ID`,`DTIME`),
  CONSTRAINT `geothermal_ibfk_1` FOREIGN key (`key_ID`) REFERENCES `stations` (`key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='測站地溫';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rain`
--

DROP TABLE IF EXISTS `rain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rain` (
  `key_ID` char(10) NOT NULL COMMENT '測站識別碼',
  `DTIME` datetime NOT NULL COMMENT '測量時間',
  `rain10min` float DEFAULT NULL COMMENT '雨量',
  `rain1h` float DEFAULT NULL COMMENT '雨量',
  `rain3h` float DEFAULT NULL COMMENT '雨量',
  `rain6h` float DEFAULT NULL COMMENT '雨量',
  `rain12h` float DEFAULT NULL COMMENT '雨量',
  `rain1d` float DEFAULT NULL COMMENT '雨量',
  `rain_today` float DEFAULT NULL COMMENT '雨量',
  `rain_yesterday` float DEFAULT NULL COMMENT '雨量',
  PRIMARY key (`key_ID`,`DTIME`),
  CONSTRAINT `rain_ibfk_1` FOREIGN key (`key_ID`) REFERENCES `stations` (`key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='測站雨量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soil`
--

DROP TABLE IF EXISTS `soil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soil` (
  `key_ID` char(10) NOT NULL COMMENT '測站識別碼',
  `DTIME` datetime NOT NULL COMMENT '測量時間',
  `H_VMC010` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC020` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC030` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC040` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC050` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC060` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC070` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC080` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC090` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC100` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC110` float DEFAULT NULL COMMENT '土壤水分',
  `H_VMC120` float DEFAULT NULL COMMENT '土壤水分',
  PRIMARY key (`key_ID`,`DTIME`),
  CONSTRAINT `soil_ibfk_1` FOREIGN key (`key_ID`) REFERENCES `stations` (`key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='測站土壤水分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `key_ID` char(10) NOT NULL,
  `Cname` char(20) DEFAULT NULL COMMENT '測站名稱',
  `Address` char(80) DEFAULT NULL COMMENT '測站地址',
  `Latitude` float DEFAULT NULL COMMENT '測站緯度',
  `Longitude` float DEFAULT NULL COMMENT '測站經度',
  `StnEndTime` datetime DEFAULT NULL COMMENT '測站終止時間',
  `City` char(3) DEFAULT NULL COMMENT '所在縣市',
  `level` char(10) DEFAULT NULL COMMENT '測站等級',
  PRIMARY key (`key_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='測站基本資料';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_key_CHECKS=@OLD_FOREIGN_key_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 16:43:49
