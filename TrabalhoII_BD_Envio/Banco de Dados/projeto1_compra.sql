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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idCliente` int NOT NULL,
  `idProduto` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `idCompra` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCompra`),
  KEY `fk_idCliente` (`idCliente`),
  KEY `fk_idProduto` (`idProduto`),
  CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_idProduto` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,2,'2024-11-19',7),(1,2,3,'2024-11-20',8),(2,3,10,'2024-11-20',9),(2,4,2,'2024-11-20',10),(3,5,1,'2024-11-20',11),(3,6,4,'2024-11-20',12),(4,1,1,'2024-11-20',13),(4,2,5,'2024-11-21',14),(5,3,15,'2024-11-22',15),(5,4,3,'2024-11-22',16),(1,4,1,'2024-11-24',19),(2,2,7,'2024-11-24',20),(3,1,3,'2024-11-25',21),(3,3,8,'2024-11-25',22),(4,5,2,'2024-11-26',23),(4,6,4,'2024-11-26',24),(5,1,10,'2024-11-27',25),(5,2,2,'2024-11-27',26),(1,5,4,'2024-11-29',29),(1,6,2,'2024-11-29',30);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 21:44:24
