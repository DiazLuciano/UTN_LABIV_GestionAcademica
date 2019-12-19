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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` varchar(10) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=971 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'44422270',1434,'Milton Vega','1998-02-05','Apartado núm.: 387, 746 Nonummy ','Parral','VII','nulla.Integer.urna@elit.co.uk','(229) 641-2337',1),(2,'15633299',1172,'George Alarcón','1996-04-25','768-963 Tincidunt C/','El Bosque','Metropolitana de Santiago','laoreet.lectus.quis@nasceturridiculus.org','(862) 960-9531',1),(3,'10346380',1113,'Zamir Maldonado','1971-07-23','Apdo.:609-6300 Tempus Av.','CABEZA DE CHANCHO','Ciudad Autónoma de Buenos Aires (CABA)','Zmaldo@gmail.com','1134345455',0),(4,'7642981',1659,'Margarita Navarro','2001-01-11','Apartado núm.: 841, 6316 Fusce Av.','Penco','VII','Aliquam@lectuspedeultrices.edu','(666) 173-8671',1),(5,'24088943',1677,'Exzequiel Álvarez','1960-01-20','508-3787 Ullamcorper, ','El Tabo','Valparaíso','eu@maurisipsumporta.org','(854) 328-5836',1),(6,'18475173',1369,'Mariangel Pizarro','1970-11-30','Apartado núm.: 346, 4906 Eu C/','Talca','Maule','aliquet@Vivamussitamet.co.uk','(774) 976-1337',0),(7,'20226722',1173,'Wilson Araya','1954-04-25','6748 Nisi Calle','Puente Alto','Metropolitana de Santiago','orci.sem.eget@Nullamfeugiatplacerat.org','(656) 406-6397',0),(8,'34582723',1081,'Lian Farías','1960-03-29','6245 Nec, Calle','Macul','Metropolitana de Santiago','euismod@fringillaest.com','(253) 699-1258',0),(9,'45773561',1879,'Thiago Castillo','1984-10-04','Apdo.:647-754 Malesuada. Avenida','Lo Prado','RM','vitae.erat@velitjustonec.edu','(643) 791-8290',0),(10,'7739872',1246,'Andrés Espinoza','1972-01-07','696-2766 Felis. C/','Paine','Metropolitana de Santiago','mi.enim@orciin.co.uk','(835) 718-8527',0),(11,'20049725',1188,'Ashlie Farías','1973-06-21','8720 Diam ','Zapallar','V','dolor.sit@euismod.edu','(278) 855-2982',1),(12,'36371440',1899,'Katrina Henríquez','1975-05-05','Apdo.:788-681 Elit, ','Río Bueno','XIV','laoreet.ipsum@Loremipsumdolor.edu','(924) 240-7482',1),(13,'20128291',1118,'Nicolás Olivares','1980-05-22','Apartado núm.: 666, 2081 Aliquet Avenida','Ollagüe','II','Mauris.eu.turpis@Donecluctusaliquet.ca','(778) 701-1871',1),(14,'38473474',1238,'Lucero Rodríguez','1966-08-14','949-502 Laoreet, Calle','Nueva Imperial','Araucanía','gravida.Aliquam@nullaDonecnon.co.uk','(205) 412-2629',1),(15,'46447941',1805,'Jostyn Contreras','1993-03-21','Apdo.:289-1927 Cras Calle','Chillán','Biobío','vel.venenatis@libero.net','(863) 320-3705',1),(16,'48747864',1130,'Derek Silva','1995-11-12','Apartado núm.: 324, 7378 Nulla C.','San Pedro','RM','hendrerit.Donec@sagittis.com','(957) 973-6986',0),(17,'20766286',1665,'Danko Sanhueza','1957-07-03','Apartado núm.: 892, 7954 Semper Calle','San Pedro','RM','tempor.augue@Aeneanegestas.com','(429) 547-3382',0),(18,'29140760',1275,'Juliano Leiva','1969-06-21','Apdo.:455-3821 Nisi. Avda.','Padre Hurtado','Metropolitana de Santiago','Mauris.ut@acfermentum.edu','(312) 516-4334',0),(19,'13770521',1843,'Ervin Reyes','1996-07-28','Apartado núm.: 212, 3235 Ullamcorper, Av.','Puerto Octay','X','Suspendisse.tristique.neque@malesuada.co.uk','(557) 509-8548',0),(20,'6718975',1856,'Zaid Bravo','1966-07-20','9054 Dui. Ctra.','San José de Maipo','Metropolitana de Santiago','molestie@dictummagnaUt.net','(555) 769-4737',0),(21,'39315406',1030,'Thomás Peñaaa','1995-02-02','546-9621 Enim C/','LOA DIAZ','Chaco','elit@nequeet.com','(851) 638-2460',1),(22,'15595110',1999,'Yeison Sepúlveda','1976-04-07','4944 Cursus C.','Camiña','Tarapacá','non.sapien.molestie@auctor.net','(935) 567-8096',1),(23,'38476158',1208,'Dixon Figueroa','1965-03-19','9637 Lobortis Calle','Cerro Navia','RM','massa.Mauris@vestibulumMaurismagna.edu','(489) 257-1455',1),(24,'44337291',1490,'Jhonatan Poblete','1964-06-15','843-3883 Laoreet, ','Villa Alegre','VII','vel@CrasinterdumNunc.org','(217) 913-6562',1),(25,'36533987',1691,'Jan Medina','1976-03-16','Apartado núm.: 364, 4870 Parturient C.','Las Cabras','O\'Higgins','urna@Fuscealiquam.co.uk','(704) 604-7494',1),(26,'14179559',1710,'Dustin Reyes','1955-11-27','Apdo.:886-2660 Ipsum C.','Mariquina','Los Ríos','ipsum@dolorsitamet.org','(647) 337-1505',0),(27,'39105320',2000,'Diaz Luciano','1995-09-10','grousac 2038','TIGRE','Buenos Aires','luchodiaz@gmail.com','1159102957',1),(28,'38987654',2001,'Jose Rodriguez','1994-02-22','yapeyu 767','VILLA MITRE','Buenos Aires','joseR@outlook.com','1134223212',1),(557,'3833322',2002,'Martina juper','1999-01-02','jujuy 267','INDEPENDENCIA','Buenos Aires','martin@gmail.com','1143875746',1),(965,'34666767',2003,'Camila Sol','2000-09-08','habertu 2039','TALARCITO','Buenos Aires','camisol@gmail.com','1576879899',1),(966,'65544433',2004,'Rosalinda jerez','2001-02-02','thompson 2345','TANDIL','Buenos Aires','rosa@outlook.com','1144443333',1),(967,'36789787',1115,'Leonardo Jupert','1980-09-09','jujuy 333','LAS TUNAS','Buenos Aires','leojupert@hotmail.conm','1165768777',1),(969,'11222333',2005,'pedro ramirez','1990-11-01','kiki 22222','FORTIN ALERTA','Ciudad Autónoma de Buenos Aires (CABA)','pedro@gmail.com','645445555555555',1),(970,'22222222',2006,'pedro ramirez 2','1111-03-03','jujuy 233','CABEZA DE CHANCHO','Ciudad Autónoma de Buenos Aires (CABA)','asd@assda','333333333333',1);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
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
