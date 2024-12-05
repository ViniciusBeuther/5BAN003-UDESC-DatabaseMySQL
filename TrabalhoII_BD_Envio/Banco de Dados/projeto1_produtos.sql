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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `tipo` varchar(50) DEFAULT NULL,
  `siglaUnidadeMed` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_unidadeMed` (`siglaUnidadeMed`),
  CONSTRAINT `fk_unidadeMed` FOREIGN KEY (`siglaUnidadeMed`) REFERENCES `unidademed` (`sigla`),
  CONSTRAINT `chk_tipo_produto` CHECK ((`tipo` in (_utf8mb4'doces',_utf8mb4'bebidas'))),
  CONSTRAINT `chk_unidade_medidade` CHECK ((`siglaUnidadeMed` in (_utf8mb4'G',_utf8mb4'KG',_utf8mb4'L',_utf8mb4'ML',_utf8mb4'UN')))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Cuque','Produto típico da Alemanha.','doces','G'),(2,'Coca Cola','Refrigerante mais famoso do mundo.','bebidas','ML'),(3,'Refrigerante','Bebida gaseificada','bebidas','L'),(4,'Suco Natural','Suco de frutas orgânicas','bebidas','L'),(5,'Café','Café torrado e moído','bebidas','ML'),(6,'Chocolate','Chocolate ao leite','doces','G'),(7,'Bolo','Bolo de cenoura','doces','KG'),(8,'Balas','Balas de frutas','doces','G'),(9,'Água Mineral','Água mineral sem gás','bebidas','L'),(10,'Sorvete','Sorvete de creme','doces','KG'),(11,'Pão de Mel','Doce com mel e chocolate','doces','G'),(12,'Chá Gelado','Chá com limão','bebidas','L'),(13,'Orelha de Gato','Doce tipico do sul do Brasil','doces','G'),(14,'Pastel','Pastel de morango com chocolate','doces','UN'),(15,'Cafe Catarinense','Produzido em Santa Catarina','bebidas','G'),(16,'Suco de Jaca','Suco feito da fruta de Jaca','bebidas','ML'),(21,'Capuccino Amargo','Capuccino amargo','bebidas','ML');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
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
