-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mercaflask
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ID_admin` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cc` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Pedro Gómez','78901234'),(2,'Sara Ramírez','56789012'),(3,'alejandro admin','1026061502');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_producto` (
  `ID_categoria_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_categoria_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,'Bebidas'),(2,'Snacks'),(3,'Lácteos'),(4,'Carnes'),(5,'Verduras'),(6,'Frutas'),(7,'Cereales'),(8,'Limpieza'),(9,'Higiene'),(10,'Panadería'),(11,'Bebidas'),(12,'Snacks'),(13,'Lácteos'),(14,'Carnes'),(15,'Verduras'),(16,'Frutas'),(17,'Cereales'),(18,'Limpieza'),(19,'Higiene'),(20,'Panadería');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `ID_compra` int NOT NULL AUTO_INCREMENT,
  `fecha_compra` date DEFAULT NULL,
  `valor_compra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2023-01-01',50.00),(2,'2023-01-02',60.00),(3,'2023-01-03',70.00),(4,'2023-01-04',50.00),(5,'2023-01-05',100.00),(6,'2023-01-01',7.50),(7,'2023-01-02',16.00),(8,'2023-01-03',100.00),(9,'2023-01-04',50.00),(10,'2024-07-12',12.60),(11,'2024-07-14',1.50),(12,'2024-07-15',1.50),(13,'2024-07-16',1.50),(14,'2024-07-20',2037.80);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `ID_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `ID_compra` int NOT NULL,
  `ID_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `ID_proveedor` int NOT NULL,
  `valor_compra_producto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_detalle_compra`),
  KEY `ID_compra` (`ID_compra`),
  KEY `ID_producto` (`ID_producto`),
  KEY `ID_proveedor` (`ID_proveedor`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`ID_compra`) REFERENCES `compras` (`ID_compra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`),
  CONSTRAINT `detalle_compra_ibfk_3` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedores` (`ID_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,1,1,5,1,7.50),(2,2,2,8,2,16.00),(3,3,3,6,3,50.00),(4,3,4,5,4,50.00),(5,4,5,10,5,100.00),(6,1,1,5,1,7.50),(7,2,2,8,2,16.00),(8,3,3,6,3,50.00),(9,3,4,5,4,50.00),(10,4,5,10,5,100.00),(11,10,21,1,1,1.50),(12,10,7,1,7,1.80),(13,10,17,1,7,1.80),(14,10,15,3,5,22.50),(15,11,1,1,1,1.50),(16,12,1,1,1,1.50),(17,13,1,1,1,1.50),(18,14,21,1,1,1.50),(19,14,23,1,1,2000.00),(20,14,7,1,7,1.80),(21,14,8,1,8,4.50),(22,14,4,3,4,90.00);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_devolucion`
--

DROP TABLE IF EXISTS `detalle_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_devolucion` (
  `ID_devolucion` int NOT NULL,
  `ID_detalle_devolucion` int NOT NULL AUTO_INCREMENT,
  `ID_producto` int NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `cantidad` int NOT NULL,
  `retorno_inventario` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_detalle_devolucion`),
  KEY `ID_producto` (`ID_producto`),
  KEY `ID_devolucion` (`ID_devolucion`),
  CONSTRAINT `detalle_devolucion_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`),
  CONSTRAINT `detalle_devolucion_ibfk_2` FOREIGN KEY (`ID_devolucion`) REFERENCES `devoluciones` (`ID_devolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_devolucion`
--

LOCK TABLES `detalle_devolucion` WRITE;
/*!40000 ALTER TABLE `detalle_devolucion` DISABLE KEYS */;
INSERT INTO `detalle_devolucion` VALUES (7,1,2,'tenia insectos',1,0),(1,9,1,'Producto defectuoso',1,0),(2,10,2,'Producto vencido',2,0),(3,11,3,'Embalaje dañado',1,0),(4,12,1,'Producto vencido',2,0),(5,13,4,'Embalaje dañado',1,0),(6,14,2,'Cliente cambió de opinión',3,0);
/*!40000 ALTER TABLE `detalle_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `ID_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `ID_venta` int NOT NULL,
  `ID_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `valor_venta_producto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_detalle_venta`),
  KEY `ID_venta` (`ID_venta`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`ID_venta`) REFERENCES `ventas` (`ID_venta`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,1,1,5,25.00),(2,2,3,10,30.00),(3,3,4,5,50.00),(4,1,1,3,4.50),(5,1,2,5,10.00),(6,2,3,2,2.40),(7,2,4,1,10.00),(8,3,5,8,20.00),(9,4,6,6,18.00),(10,5,7,10,18.00),(11,5,7,10,18.00),(12,5,7,10,18.00),(13,5,7,10,18.00),(14,20,1,2,1.50),(15,20,24,1,1.50),(16,20,21,9,1.50),(17,20,21,9,1.50);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `ID_devolucion` int NOT NULL AUTO_INCREMENT,
  `fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`ID_devolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
INSERT INTO `devoluciones` VALUES (1,'2024-07-13'),(2,'2024-07-13'),(3,'2024-07-13'),(4,'2024-07-13'),(5,'2024-07-13'),(6,'2024-07-13'),(7,'2024-07-13');
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion_producto` text,
  `valor_producto` decimal(10,2) NOT NULL,
  `ID_categoria_producto` int DEFAULT NULL,
  `stock` int NOT NULL,
  `ID_proveedor` int NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`ID_producto`),
  KEY `ID_categoria_producto` (`ID_categoria_producto`),
  KEY `ID_proveedor` (`ID_proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_categoria_producto`) REFERENCES `categoria_producto` (`ID_categoria_producto`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`ID_proveedor`) REFERENCES `proveedores` (`ID_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Coca-Cola','Bebida gaseosa de 500ml.',1.50,1,101,1,'2023-01-01'),(2,'Papas Fritas','Bolsa de papas fritas de 150g.',2.00,2,50,2,'2023-01-02'),(3,'Leche Entera','Litro de leche entera.',1.20,3,80,3,'2023-01-03'),(4,'Filete de Res','Filete de res de 1kg.',10.00,4,33,4,'2023-01-04'),(5,'Tomates','Tomates frescos por kg.',2.50,5,40,5,'2023-01-05'),(6,'Manzanas','Manzanas frescas por kg.',3.00,6,60,6,'2023-01-06'),(7,'Avena','Avena en hojuelas de 500g.',1.80,7,72,7,'2023-01-07'),(8,'Detergente','Detergente en polvo de 1kg.',4.50,8,21,8,'2023-01-08'),(9,'Jabón','Jabón de tocador de 125g.',0.90,9,100,9,'2023-01-09'),(11,'Coca-Cola','Bebida gaseosa de 500ml.',1.50,1,100,1,'2023-01-01'),(12,'Papas Fritas','Bolsa de papas fritas de 150g.',2.00,2,50,2,'2023-01-02'),(13,'Leche Entera','Litro de leche entera.',1.20,3,80,3,'2023-01-03'),(14,'Filete de Res','Filete de res de 1kg.',10.00,4,30,4,'2023-01-04'),(15,'Tomates','Tomates frescos por kg.',2.50,5,43,5,'2023-01-05'),(16,'Manzanas','Manzanas frescas por kg.',3.00,6,60,6,'2023-01-06'),(17,'Avena','Avena en hojuelas de 500g.',1.80,7,71,7,'2023-01-07'),(18,'Detergente','Detergente en polvo de 1kg.',4.50,8,20,8,'2023-01-08'),(19,'Jabón','Jabón de tocador de 125g.',0.90,9,100,9,'2023-01-09'),(20,'Pan Integral','Pan integral de 500g.',2.20,10,50,10,'2023-01-10'),(21,'agua ','agua para la cara',1.50,1,4,1,NULL),(22,'papitas raja tripas','papitas picapollo',1.50,2,20,12,NULL),(23,'poni malta','ponimalta mini',2000.00,1,8,1,NULL),(24,'gaseosa pool','cuidado daña las tripas',1.50,1,6,1,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre_empresa` varchar(100) NOT NULL,
  `Nombre_representante_legal` varchar(100) NOT NULL,
  `tipo_proveedor` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Bebidas y Más','Carlos Lópe','Bebidas','Calle 123, Ciudad','123-456-7890','contacto@bebidasymas.com','http://www.bebidasymas.com'),(2,'Snacks Felices','Ana Martínez','Snacks','Avenida 456, Ciudad','123-456-7891','contacto@snacksfelices.com','http://www.snacksfelices.com'),(3,'Lácteos Deliciosos','Laura Gómez','Lácteos','Calle 789, Ciudad','123-456-7892','contacto@lacteosdeliciosos.com','http://www.lacteosdeliciosos.com'),(4,'Carnes Premium','Juan Pérez','Carnes','Avenida 101, Ciudad','123-456-7893','contacto@carnespremium.com','http://www.carnespremium.com'),(5,'Verduras Frescas','María Rodríguez','Verduras','Calle 202, Ciudad','123-456-7894','contacto@verdurasfrescas.com','http://www.verdurasfrescas.com'),(6,'Frutas Exóticas','Luis Hernández','Frutas','Avenida 303, Ciudad','123-456-7895','contacto@frutasexoticas.com','http://www.frutasexoticas.com'),(7,'Cereales Ricos','Carmen Sánchez','Cereales','Calle 404, Ciudad','123-456-7896','contacto@cerealesricos.com','http://www.cerealesricos.com'),(8,'Limpieza Total','Ricardo García','Limpieza','Avenida 505, Ciudad','123-456-7897','contacto@limpiezatotal.com','http://www.limpiezatotal.com'),(9,'Higiene Personal','Patricia Jiménez','Higiene','Calle 606, Ciudad','123-456-7898','contacto@higienepersonal.com','http://www.higienepersonal.com'),(10,'Panadería Casera','Santiago López','Panadería','Avenida 707, Ciudad','123-456-7899','contacto@panaderiacasera.com','http://www.panaderiacasera.com'),(11,'Bebidas y Más','Carlos López','Bebidas','Calle 123, Ciudad','123-456-7890','contacto@bebidasymas.com','http://www.bebidasymas.com'),(12,'Snacks Felices','Ana Martínez','Snacks','Avenida 456, Ciudad','123-456-7891','contacto@snacksfelices.com','http://www.snacksfelices.com'),(13,'Lácteos Deliciosos','Laura Gómez','Lácteos','Calle 789, Ciudad','123-456-7892','contacto@lacteosdeliciosos.com','http://www.lacteosdeliciosos.com'),(14,'Carnes Premium','Juan Pérez','Carnes','Avenida 101, Ciudad','123-456-7893','contacto@carnespremium.com','http://www.carnespremium.com'),(15,'Verduras Frescas','María Rodríguez','Verduras','Calle 202, Ciudad','123-456-7894','contacto@verdurasfrescas.com','http://www.verdurasfrescas.com'),(16,'Frutas Exóticas','Luis Hernández','Frutas','Avenida 303, Ciudad','123-456-7895','contacto@frutasexoticas.com','http://www.frutasexoticas.com'),(17,'Cereales Ricos','Carmen Sánchez','Cereales','Calle 404, Ciudad','123-456-7896','contacto@cerealesricos.com','http://www.cerealesricos.com'),(18,'Limpieza Total','Ricardo García','Limpieza','Avenida 505, Ciudad','123-456-7897','contacto@limpiezatotal.com','http://www.limpiezatotal.com'),(19,'Higiene Personal','Patricia Jiménez','Higiene','Calle 606, Ciudad','123-456-7898','contacto@higienepersonal.com','http://www.higienepersonal.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `rol` enum('empleado','administrador') NOT NULL,
  PRIMARY KEY (`ID_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Péres','12345678','2023-01-01','empleado'),(2,'María López','87654321','2023-01-02','empleado'),(3,'Carlos García','11223344','2023-01-03','empleado'),(4,'Ana Rodríguez','44332211','2023-01-04','administrador'),(5,'Luis Martínez','55667788','2023-01-05','empleado'),(6,'Sofía González','99887766','2023-01-06','empleado'),(7,'Miguel Sánchez','66778899','2023-01-07','empleado'),(8,'Laura Díaz','22334455','2023-01-08','administrador'),(9,'Daniela Fernández','33445566','2023-01-09','empleado'),(10,'Jorge Ramírez','44556677','2023-01-10','empleado'),(11,'Juan Pérez','12345678','2023-01-01','empleado'),(12,'María López','87654321','2023-01-02','empleado'),(13,'Carlos García','11223344','2023-01-03','empleado'),(14,'Ana Rodríguez','44332211','2023-01-04','administrador'),(15,'Luis Martínez','55667788','2023-01-05','empleado'),(16,'Sofía González','99887766','2023-01-06','empleado'),(17,'Miguel Sánchez','66778899','2023-01-07','empleado'),(18,'Laura Díaz','22334455','2023-01-08','administrador'),(19,'Daniela Fernández','33445566','2023-01-09','empleado'),(20,'Jorge Ramírez','44556677','2023-01-10','empleado'),(21,'luis martinez','102598532','2024-07-16','empleado'),(22,'daniel','1026061502','2024-08-08','empleado');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ID_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date DEFAULT NULL,
  `ID_usuario` int NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_venta`),
  KEY `ID_usuario` (`ID_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2023-01-01',1,25.00),(2,'2023-01-02',2,30.00),(3,'2023-01-03',3,45.00),(4,'2023-01-04',4,20.00),(5,'2023-01-05',5,50.00),(6,'2023-01-01',1,15.00),(7,'2023-01-02',2,40.00),(8,'2023-01-03',3,30.00),(9,'2023-01-04',4,25.00),(10,'2023-01-05',5,60.00),(20,'2024-08-08',22,31.50);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-10 10:49:33
