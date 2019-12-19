-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_tp_integrador
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` varchar(8) DEFAULT NULL,
  `legajo` int(11) NOT NULL,
  `nombre_apellido` varchar(90) NOT NULL,
  `fecha_nac` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `legajo_UNIQUE` (`legajo`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'34454454',1113,'matias zidane','1990-05-06','general 876','DON TORCUATO','Buenos Aires','zidane@gmail.com','1132324434',1),(2,'66666778',1114,'carolina herber','1995-08-09','hubert 8888','TIGRE','BUENOS AIRES','carolina@gmai..conm','1132223234',1),(3,'34444345',1115,'Camila Sol','1980-05-05','peru 567','FORTIN TOSTADO','Ciudad Autónoma de Buenos Aires (CABA)','clro@hotmail.com','1112122122',1),(4,'44333222',1116,'Jaqueline Hubert','1992-03-02','nuñez 543','INDEPENDENCIA','Ciudad Autónoma de Buenos Aires (CABA)','jaque@gmail.com','5491122334444',1),(5,'23433433',1117,'Maria perez','1777-09-09','coco 23232','CABEZA DE CHANCHO','Ciudad Autónoma de Buenos Aires (CABA)','maria@gmail.com','1134345456',1),(6,'22333222',1118,'Carlos moreira','1990-02-22','fugert 334','CABEZA DE CHANCHO','Ciudad Autónoma de Buenos Aires (CABA)','carlos@gmail.com','1143434343',1),(7,'33333333',1119,'carolina hubert','1980-02-12','fuget 333','COLONIA MONTEFIORE','Buenos Aires','ddd@ddd','2222221222',1);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 14:52:42
