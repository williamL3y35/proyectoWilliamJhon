-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bdllanogrande
CREATE DATABASE IF NOT EXISTS `bdllanogrande` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bdllanogrande`;

-- Volcando estructura para tabla bdllanogrande.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) NOT NULL,
  `precio_producto` int(10) NOT NULL,
  `stock_producto` int(10) NOT NULL,
  `precioventa_producto` int(10) NOT NULL,
  `tipo_producto` varchar(50) NOT NULL,
  `rut_proveedorFK` int(20) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `rut_proveedorFK` (`rut_proveedorFK`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`rut_proveedorFK`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdllanogrande.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(20) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `telefono_proveedor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdllanogrande.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `cc_usuario` int(20) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña_usuario` varchar(50) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`cc_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla bdllanogrande.venta
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_venta` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `cantidad_venta` int(10) NOT NULL,
  `totalpago_venta` int(20) NOT NULL,
  `cc_usuarioFK` int(20) NOT NULL,
  `id_productoFK` int(10) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `cc_usuarioFK` (`cc_usuarioFK`),
  KEY `id_productoFK` (`id_productoFK`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cc_usuarioFK`) REFERENCES `usuario` (`cc_usuario`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_productoFK`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
