/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.33 : Database - foodrosif
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`foodrosif` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `foodrosif`;

/*Table structure for table `email-conf` */

DROP TABLE IF EXISTS `email-conf`;

CREATE TABLE `email-conf` (
  `id_email-conf` int(10) NOT NULL,
  `confirmacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_email-conf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `email-conf` */

insert  into `email-conf`(`id_email-conf`,`confirmacion`) values 
(0,'false'),
(1,'true');

/*Table structure for table `empresas` */

DROP TABLE IF EXISTS `empresas`;

CREATE TABLE `empresas` (
  `id_empresa` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` blob,
  `celular` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `empresas` */

insert  into `empresas`(`id_empresa`,`nombre`,`descripcion`,`imagen`,`celular`,`direccion`,`email`) values 
(31,'NO HAY','NO HAY',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(32,'foo','doo',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(33,'foo','doo',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(34,'NO HAY','NO HAY',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(35,'NO HAY','NO HAY',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(36,'NO HAY','NO HAY',NULL,'1234567890','CALLE 10 CARRERA 24',NULL),
(37,'NO HAY','NO HAY',NULL,'1234567890','CALLE 10 CARRERA 24',NULL);

/*Table structure for table `estados` */

DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `id_estado` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `estados` */

insert  into `estados`(`id_estado`,`descripcion`) values 
(0,'falta verificar'),
(1,'verificada');

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT,
  `imagen` blob,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `id_empresa` int(10) DEFAULT NULL,
  `id_estado` int(10) DEFAULT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_estado` (`id_estado`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `contrase??a` varchar(255) DEFAULT NULL,
  `confirmacion` varchar(1) DEFAULT '0',
  `id_empresa` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_email-conf` (`confirmacion`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
