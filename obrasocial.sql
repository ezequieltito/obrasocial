CREATE DATABASE  IF NOT EXISTS `obra_social` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `obra_social`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: obra_social
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `app_correo`
--

DROP TABLE IF EXISTS `app_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_correo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `cuerpo` longtext NOT NULL,
  `dato` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_correo`
--

LOCK TABLES `app_correo` WRITE;
/*!40000 ALTER TABLE `app_correo` DISABLE KEYS */;
INSERT INTO `app_correo` VALUES (1,'Pablo','Hola Pablo','2023-10-23 20:40:57.326496');
/*!40000 ALTER TABLE `app_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Usuario');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add correo',7,'add_correo'),(26,'Can change correo',7,'change_correo'),(27,'Can delete correo',7,'delete_correo'),(28,'Can view correo',7,'view_correo'),(29,'Can add auth group',8,'add_authgroup'),(30,'Can change auth group',8,'change_authgroup'),(31,'Can delete auth group',8,'delete_authgroup'),(32,'Can view auth group',8,'view_authgroup'),(33,'Can add auth group permissions',9,'add_authgrouppermissions'),(34,'Can change auth group permissions',9,'change_authgrouppermissions'),(35,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(36,'Can view auth group permissions',9,'view_authgrouppermissions'),(37,'Can add auth permission',10,'add_authpermission'),(38,'Can change auth permission',10,'change_authpermission'),(39,'Can delete auth permission',10,'delete_authpermission'),(40,'Can view auth permission',10,'view_authpermission'),(41,'Can add auth user',11,'add_authuser'),(42,'Can change auth user',11,'change_authuser'),(43,'Can delete auth user',11,'delete_authuser'),(44,'Can view auth user',11,'view_authuser'),(45,'Can add auth user groups',12,'add_authusergroups'),(46,'Can change auth user groups',12,'change_authusergroups'),(47,'Can delete auth user groups',12,'delete_authusergroups'),(48,'Can view auth user groups',12,'view_authusergroups'),(49,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(50,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(51,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(52,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(53,'Can add cajas',14,'add_cajas'),(54,'Can change cajas',14,'change_cajas'),(55,'Can delete cajas',14,'delete_cajas'),(56,'Can view cajas',14,'view_cajas'),(57,'Can add clientes',15,'add_clientes'),(58,'Can change clientes',15,'change_clientes'),(59,'Can delete clientes',15,'delete_clientes'),(60,'Can view clientes',15,'view_clientes'),(61,'Can add comprobantes',16,'add_comprobantes'),(62,'Can change comprobantes',16,'change_comprobantes'),(63,'Can delete comprobantes',16,'delete_comprobantes'),(64,'Can view comprobantes',16,'view_comprobantes'),(65,'Can add comprobante ventas',17,'add_comprobanteventas'),(66,'Can change comprobante ventas',17,'change_comprobanteventas'),(67,'Can delete comprobante ventas',17,'delete_comprobanteventas'),(68,'Can view comprobante ventas',17,'view_comprobanteventas'),(69,'Can add django admin log',18,'add_djangoadminlog'),(70,'Can change django admin log',18,'change_djangoadminlog'),(71,'Can delete django admin log',18,'delete_djangoadminlog'),(72,'Can view django admin log',18,'view_djangoadminlog'),(73,'Can add django content type',19,'add_djangocontenttype'),(74,'Can change django content type',19,'change_djangocontenttype'),(75,'Can delete django content type',19,'delete_djangocontenttype'),(76,'Can view django content type',19,'view_djangocontenttype'),(77,'Can add django migrations',20,'add_djangomigrations'),(78,'Can change django migrations',20,'change_djangomigrations'),(79,'Can delete django migrations',20,'delete_djangomigrations'),(80,'Can view django migrations',20,'view_djangomigrations'),(81,'Can add django session',21,'add_djangosession'),(82,'Can change django session',21,'change_djangosession'),(83,'Can delete django session',21,'delete_djangosession'),(84,'Can view django session',21,'view_djangosession'),(85,'Can add empleados',22,'add_empleados'),(86,'Can change empleados',22,'change_empleados'),(87,'Can delete empleados',22,'delete_empleados'),(88,'Can view empleados',22,'view_empleados'),(89,'Can add mesas',23,'add_mesas'),(90,'Can change mesas',23,'change_mesas'),(91,'Can delete mesas',23,'delete_mesas'),(92,'Can view mesas',23,'view_mesas'),(93,'Can add pedidos',24,'add_pedidos'),(94,'Can change pedidos',24,'change_pedidos'),(95,'Can delete pedidos',24,'delete_pedidos'),(96,'Can view pedidos',24,'view_pedidos'),(97,'Can add productos',25,'add_productos'),(98,'Can change productos',25,'change_productos'),(99,'Can delete productos',25,'delete_productos'),(100,'Can view productos',25,'view_productos'),(101,'Can add sucursales',26,'add_sucursales'),(102,'Can change sucursales',26,'change_sucursales'),(103,'Can delete sucursales',26,'delete_sucursales'),(104,'Can view sucursales',26,'view_sucursales'),(105,'Can add tipo comprobante',27,'add_tipocomprobante'),(106,'Can change tipo comprobante',27,'change_tipocomprobante'),(107,'Can delete tipo comprobante',27,'delete_tipocomprobante'),(108,'Can view tipo comprobante',27,'view_tipocomprobante'),(109,'Can add tipo empleado',28,'add_tipoempleado'),(110,'Can change tipo empleado',28,'change_tipoempleado'),(111,'Can delete tipo empleado',28,'delete_tipoempleado'),(112,'Can view tipo empleado',28,'view_tipoempleado'),(113,'Can add tipo pedidos',29,'add_tipopedidos'),(114,'Can change tipo pedidos',29,'change_tipopedidos'),(115,'Can delete tipo pedidos',29,'delete_tipopedidos'),(116,'Can view tipo pedidos',29,'view_tipopedidos'),(117,'Can add tipo productos',30,'add_tipoproductos'),(118,'Can change tipo productos',30,'change_tipoproductos'),(119,'Can delete tipo productos',30,'delete_tipoproductos'),(120,'Can view tipo productos',30,'view_tipoproductos'),(121,'Can add ventas',31,'add_ventas'),(122,'Can change ventas',31,'change_ventas'),(123,'Can delete ventas',31,'delete_ventas'),(124,'Can view ventas',31,'view_ventas'),(125,'Can add producto',32,'add_producto'),(126,'Can change producto',32,'change_producto'),(127,'Can delete producto',32,'delete_producto'),(128,'Can view producto',32,'view_producto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$QvWWHiiYNr0VGVuWkx2cTW$o5fyTcbYzfpCaY31FMhyt8nHHwM4G5yfcZ6sKWG5XRI=','2023-11-04 00:19:50.775080',1,'mauro','','','mauro@h.com',1,1,'2023-11-01 16:07:00.192687'),(29,'pbkdf2_sha256$600000$ccDhfksrcmXi6f90REtlHg$pG8NqaMORMcs7mly5g/7uyTA8JmhYfJ5NyTb+q81jTc=','2023-11-03 23:06:10.912057',0,'MauroHoyoos','Mauro','Hoyos','mauroohoyoos@gmail.com',0,1,'2023-11-03 22:05:19.721508'),(30,'pbkdf2_sha256$600000$cc5902bEvMb0JO1RA9UeVP$08vHz89l9RcL6KX+VPekymv6wiW6PP0qKKWqQzC4+Cw=','2023-11-03 23:14:06.342913',0,'asdfg','asdfgh','asdfg','asdf@h.com',0,1,'2023-11-03 23:13:47.895813'),(31,'pbkdf2_sha256$600000$OfJL8y6aLs6DMcfxkP8XZh$QxKEQD8ZPvjkWr941jPQfHle1+jGYTx5teg0AHge5sc=','2023-11-04 00:10:49.779304',0,'soto','tomas','soto','asdsa@k.com',0,1,'2023-11-04 00:10:14.435987');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (26,29,1),(27,30,1),(28,31,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_producto`
--

DROP TABLE IF EXISTS `carritoapp_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `categoria` varchar(32) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_producto`
--

LOCK TABLES `carritoapp_producto` WRITE;
/*!40000 ALTER TABLE `carritoapp_producto` DISABLE KEYS */;
INSERT INTO `carritoapp_producto` VALUES (1,'Ibuprofeno 400','Analgésico',150),(2,'Paracetamol 400','Analgésico',150),(3,'Ibuprofeno 600','Analgésico',200),(4,'Ibuprofeno Plus 600','Analgésico',250),(5,'Tafirol 1g','Analgésico',300),(6,'Tafirol 600','Analgésico',250),(7,'Jarabe Tos','Jarabe',800);
/*!40000 ALTER TABLE `carritoapp_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-11-02 22:01:59.291092','18','aaaaa',3,'',4,1),(2,'2023-11-02 22:02:06.166744','17','aaasafsfa',3,'',4,1),(3,'2023-11-02 22:02:12.305050','16','aasafsfa',3,'',4,1),(4,'2023-11-02 22:02:22.373406','8','adsg',3,'',4,1),(5,'2023-11-02 22:02:27.970281','15','asafsfa',3,'',4,1),(6,'2023-11-02 22:02:35.053187','5','asdasd',3,'',4,1),(7,'2023-11-02 22:02:41.480386','6','asdasds',3,'',4,1),(8,'2023-11-02 22:02:48.022069','2','gggg',3,'',4,1),(9,'2023-11-02 22:02:55.364370','4','maurohys',3,'',4,1),(10,'2023-11-02 22:03:00.544276','12','maurohysa',3,'',4,1),(11,'2023-11-02 22:03:05.822867','9','sadad',3,'',4,1),(12,'2023-11-02 22:03:11.261801','20','sadadc',3,'',4,1),(13,'2023-11-02 22:03:16.996033','19','sadsa',3,'',4,1),(14,'2023-11-02 22:03:22.005325','21','sadsajjj',3,'',4,1),(15,'2023-11-02 22:03:27.205362','10','safafsfs',3,'',4,1),(16,'2023-11-02 22:03:33.085680','11','safafsfsz',3,'',4,1),(17,'2023-11-02 22:03:39.079902','14','safsfa',3,'',4,1),(18,'2023-11-02 22:03:44.341763','7','sdasad',3,'',4,1),(19,'2023-11-02 22:03:54.632783','13','smaurohysa',3,'',4,1),(20,'2023-11-02 22:04:00.628578','3','tito',3,'',4,1),(21,'2023-11-03 04:22:36.697932','1','ibuprofeno -> 50',1,'[{\"added\": {}}]',32,1),(22,'2023-11-03 04:23:09.303785','2','paracetamol -> 55',1,'[{\"added\": {}}]',32,1),(23,'2023-11-03 14:28:53.382841','1','Ibuprofeno 400 -> 150',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Categoria\", \"Precio\"]}}]',32,1),(24,'2023-11-03 14:29:06.704022','3','Ibuprofeno 600 -> 200',1,'[{\"added\": {}}]',32,1),(25,'2023-11-03 14:29:40.730701','4','Ibuprofeno Plus 600 -> 250',1,'[{\"added\": {}}]',32,1),(26,'2023-11-03 14:29:57.243860','5','Tafirol 1g -> 300',1,'[{\"added\": {}}]',32,1),(27,'2023-11-03 14:30:19.962856','6','Tafirol 600 -> 250',1,'[{\"added\": {}}]',32,1),(28,'2023-11-03 14:30:40.875470','2','Paracetamol 400 -> 150',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Categoria\", \"Precio\"]}}]',32,1),(29,'2023-11-03 14:31:01.251410','7','Jarabe Tos -> 800',1,'[{\"added\": {}}]',32,1),(30,'2023-11-03 23:11:48.588263','28','wqaaa',3,'',4,1),(31,'2023-11-03 23:12:00.587884','22','afsdas',3,'',4,1),(32,'2023-11-03 23:12:06.485628','23','q',3,'',4,1),(33,'2023-11-03 23:12:12.319637','24','w',3,'',4,1),(34,'2023-11-03 23:12:18.445192','25','wq',3,'',4,1),(35,'2023-11-03 23:12:26.587865','26','wqa',3,'',4,1),(36,'2023-11-03 23:12:33.138731','27','wqaa',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','correo'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'CarritoApp','authgroup'),(9,'CarritoApp','authgrouppermissions'),(10,'CarritoApp','authpermission'),(11,'CarritoApp','authuser'),(12,'CarritoApp','authusergroups'),(13,'CarritoApp','authuseruserpermissions'),(14,'CarritoApp','cajas'),(15,'CarritoApp','clientes'),(16,'CarritoApp','comprobantes'),(17,'CarritoApp','comprobanteventas'),(18,'CarritoApp','djangoadminlog'),(19,'CarritoApp','djangocontenttype'),(20,'CarritoApp','djangomigrations'),(21,'CarritoApp','djangosession'),(22,'CarritoApp','empleados'),(23,'CarritoApp','mesas'),(24,'CarritoApp','pedidos'),(32,'CarritoApp','producto'),(25,'CarritoApp','productos'),(26,'CarritoApp','sucursales'),(27,'CarritoApp','tipocomprobante'),(28,'CarritoApp','tipoempleado'),(29,'CarritoApp','tipopedidos'),(30,'CarritoApp','tipoproductos'),(31,'CarritoApp','ventas'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-23 19:57:52.689629'),(2,'auth','0001_initial','2023-10-23 19:57:53.424114'),(3,'admin','0001_initial','2023-10-23 19:57:53.631182'),(4,'admin','0002_logentry_remove_auto_add','2023-10-23 19:57:53.639781'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-23 19:57:53.663763'),(6,'app','0001_initial','2023-10-23 19:57:53.710201'),(7,'contenttypes','0002_remove_content_type_name','2023-10-23 19:57:53.864313'),(8,'auth','0002_alter_permission_name_max_length','2023-10-23 19:57:53.955631'),(9,'auth','0003_alter_user_email_max_length','2023-10-23 19:57:54.019574'),(10,'auth','0004_alter_user_username_opts','2023-10-23 19:57:54.043553'),(11,'auth','0005_alter_user_last_login_null','2023-10-23 19:57:54.157091'),(12,'auth','0006_require_contenttypes_0002','2023-10-23 19:57:54.165085'),(13,'auth','0007_alter_validators_add_error_messages','2023-10-23 19:57:54.181073'),(14,'auth','0008_alter_user_username_max_length','2023-10-23 19:57:54.292217'),(15,'auth','0009_alter_user_last_name_max_length','2023-10-23 19:57:54.383836'),(16,'auth','0010_alter_group_name_max_length','2023-10-23 19:57:54.432579'),(17,'auth','0011_update_proxy_permissions','2023-10-23 19:57:54.457513'),(18,'auth','0012_alter_user_first_name_max_length','2023-10-23 19:57:54.567710'),(19,'sessions','0001_initial','2023-10-23 19:57:54.783928'),(20,'CarritoApp','0001_initial','2023-11-03 01:54:18.223440'),(21,'CarritoApp','0002_alter_producto_nombre','2023-11-03 04:16:29.123758'),(22,'CarritoApp','0003_alter_producto_nombre','2023-11-03 04:16:29.232907');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bujqd6kjm2g1rgfdzokyi3ruht5dtwt6','.eJxVjDsOgzAQBe-ydWThv6FMzxks27uOSSIsGagQd0-QaGjfzLwdUmhtWisM-_EAH7a1-G2h5ieEATjcthjSh-YT4DvMr8pSndc2RXYq7KILGyvS93m5t4MSlvKvCSPFQDpHUpm7TpCzCaXjfcrGZBm1dj2X0iidO2UzapGscorLHoWSAo4fPVg8Sw:1qz50E:XNILpdSbAmWAtFgzqmbUMzjum2BkC6K04u48vfony-M','2023-11-18 00:59:06.871318'),('byzdinhg2tegx0q3r8d3jjndoingmz8d','e30:1qyHd8:kU3unH6vv_x9U6xG8QTUg-kV_hdbXeDhB-uaspFBp10','2023-11-15 20:15:58.364907'),('fgn512vbw37yvkwxe2zycf2vpm8e6quq','e30:1qyHbt:J4_MyPk52Bo_MWIVDyswanZ7xIm-HGM4--JRZJlSWHA','2023-11-15 20:14:41.998180'),('xwvh10euxym3rayaw640dtttr1cfmpnz','e30:1qyHcV:SbMJSnKCAjviBBu6AhfmDhVajH5j_3dkiwZwxqDCslc','2023-11-15 20:15:19.571793');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-05 14:50:15
