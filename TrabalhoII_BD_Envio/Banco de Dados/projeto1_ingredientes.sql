-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto1
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `idIngrediente` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `quantidade` decimal(10,2) DEFAULT NULL,
  `precoUnit` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) DEFAULT NULL,
  `multiplicador` decimal(10,2) DEFAULT NULL,
  `cnpjMarca` varchar(18) DEFAULT NULL,
  `siglaUnidadeMed` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idIngrediente`),
  KEY `cnpjMarca` (`cnpjMarca`),
  KEY `siglaUnidadeMed` (`siglaUnidadeMed`),
  CONSTRAINT `ingredientes_ibfk_1` FOREIGN KEY (`cnpjMarca`) REFERENCES `marcas` (`cnpj`),
  CONSTRAINT `ingredientes_ibfk_2` FOREIGN KEY (`siglaUnidadeMed`) REFERENCES `unidademed` (`sigla`),
  CONSTRAINT `chk_precoUnit` CHECK ((`precoUnit` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Farinha de Trigo',100.00,5.50,6.00,1.10,'12345678000195','KG'),(2,'Açúcar',50.00,4.00,4.50,1.10,'98765432000112','KG'),(3,'Ovos',200.00,0.50,0.60,1.20,'56473829000100','UN'),(4,'Leite',100.00,2.50,3.00,1.20,'19283746500115','L'),(5,'Fermento',30.00,3.00,3.50,1.15,'18273645000125','KG'),(6,'Chocolate',40.00,8.00,9.50,1.20,'01234567890021','KG');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 21:44:26
