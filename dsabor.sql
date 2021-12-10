-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ollitape
CREATE DATABASE IF NOT EXISTS `ollitape` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ollitape`;

-- Volcando estructura para tabla ollitape.cabreceta
CREATE TABLE IF NOT EXISTS `cabreceta` (
  `idCabReceta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idCabReceta`),
  UNIQUE KEY `idCabReceta_UNIQUE` (`idCabReceta`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.cabreceta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cabreceta` DISABLE KEYS */;
INSERT INTO `cabreceta` (`idCabReceta`, `nombre`, `idUsuario`, `tipo`, `foto`, `link`, `estado`) VALUES
	(11, 'Carapulcra picanta', 1, 1, '', '', 'P'),
	(13, 'Rabioles', 1, 2, '.', 'https://www.youtube.com/watch?v=PS-scVv9qxQ', 'P'),
	(15, 'Rabioles', 1, 2, '.', 'https://www.youtube.com/watch?v=PS-scVv9qxQ', 'P'),
	(18, 'tallarines', 1, 2, '.', 'asd', 'R');
/*!40000 ALTER TABLE `cabreceta` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.categoria: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idCategoria`, `nombre`) VALUES
	(1, 'carnes, aves y pescados'),
	(2, 'frutas y verduras'),
	(3, 'lacteos y huevos'),
	(4, 'quesos y fiambres'),
	(5, 'abarrotes');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.detreceta
CREATE TABLE IF NOT EXISTS `detreceta` (
  `idCabReceta` int(11) NOT NULL,
  `idDetReceta` int(11) NOT NULL,
  `idInsumo` int(11) NOT NULL,
  `cantidad` decimal(12,2) NOT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`idCabReceta`,`idDetReceta`),
  UNIQUE KEY `idCanReceta_UNIQUE` (`idCabReceta`,`idDetReceta`),
  KEY `FK_detReceta_insumo` (`idInsumo`),
  CONSTRAINT `FK_detReceta_cabReceta` FOREIGN KEY (`idCabReceta`) REFERENCES `cabreceta` (`idCabReceta`),
  CONSTRAINT `FK_detReceta_insumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.detreceta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detreceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detreceta` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.insumo
CREATE TABLE IF NOT EXISTS `insumo` (
  `idInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreInsumo` varchar(50) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idMedida` int(11) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  UNIQUE KEY `idInsumo_UNIQUE` (`idInsumo`),
  KEY `FK_insumo_medida` (`idMedida`),
  KEY `FK_insumo_categoría` (`idCategoria`),
  CONSTRAINT `FK_insumo_categoría` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `FK_insumo_medida` FOREIGN KEY (`idMedida`) REFERENCES `medida` (`idmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.insumo: ~86 rows (aproximadamente)
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` (`idInsumo`, `nombreInsumo`, `idCategoria`, `idMedida`, `precio`) VALUES
	(1, 'aceite vegetal', 5, 3, 9.00),
	(2, 'aceitunas verdes', 4, 1, 12.00),
	(3, 'aceitunas negras', 4, 1, 12.00),
	(4, 'ají colorado molido', 2, 1, 5.00),
	(5, 'Aji de Champiñones', 2, 1, 15.00),
	(6, 'ají mirasol', 2, 1, 5.00),
	(7, 'ají panca', 2, 1, 5.00),
	(8, 'ajíes limo', 2, 1, 5.00),
	(9, 'ajos', 2, 1, 10.00),
	(10, 'albahaca ', 2, 1, 6.00),
	(11, 'alfalfa', 2, 1, 5.00),
	(12, 'Almendras', 5, 1, 40.00),
	(13, 'anís', 5, 1, 20.00),
	(14, 'arroz', 5, 1, 4.00),
	(15, 'arvejas', 5, 1, 5.00),
	(16, 'arvejas partidas', 5, 1, 5.00),
	(17, 'atún ', 5, 1, 30.00),
	(18, 'azúcar', 5, 1, 4.00),
	(19, 'bacon en lonchas', 3, 1, 15.00),
	(20, 'beterragas', 2, 1, 5.00),
	(21, 'bicarbonato de sodio', 5, 1, 20.00),
	(22, 'camarones', 1, 1, 15.00),
	(23, 'carne', 1, 1, 28.00),
	(24, 'cebolla', 1, 1, 3.00),
	(25, 'cerdo', 1, 1, 16.00),
	(26, 'champiñones ', 2, 1, 30.00),
	(27, 'choclos ', 1, 1, 8.00),
	(28, 'chuño', 5, 1, 5.00),
	(29, 'comino', 5, 1, 20.00),
	(30, 'culantro', 2, 1, 10.00),
	(31, 'cuy', 1, 1, 40.00),
	(32, 'espinaca', 2, 1, 3.00),
	(33, 'fideo cabello de ángel', 5, 1, 8.00),
	(34, 'fideos o pastas macarrones', 5, 1, 8.00),
	(35, 'filete de pescado', 5, 1, 10.00),
	(36, 'frijoles verdes', 5, 1, 5.00),
	(37, 'habas', 2, 1, 4.00),
	(38, 'harina sin preparada', 5, 1, 8.00),
	(39, 'harina sin preparar', 5, 1, 8.00),
	(40, 'Hierba buena', 2, 1, 4.00),
	(41, 'hoja de laurel', 2, 1, 20.00),
	(42, 'hongos y laurel', 2, 1, 20.00),
	(43, 'huacatay', 2, 1, 8.00),
	(44, 'huevos', 5, 1, 6.00),
	(45, 'jamón', 3, 1, 40.00),
	(46, 'leche evaporada', 1, 3, 3.50),
	(47, 'lechuga', 2, 1, 4.00),
	(48, 'lentejas', 5, 1, 5.00),
	(49, 'limones', 2, 1, 5.00),
	(50, 'maíz cancha', 5, 1, 10.00),
	(51, 'mantequilla', 5, 1, 35.00),
	(52, 'mayonesa', 5, 3, 20.00),
	(53, 'medallones de pescado', 1, 1, 20.00),
	(54, 'mondongo', 1, 1, 20.00),
	(55, 'nata de leche', 5, 3, 10.00),
	(56, 'nuez moscada', 5, 1, 30.00),
	(57, 'orégano', 5, 1, 20.00),
	(58, 'pallares', 5, 1, 5.00),
	(59, 'pan', 5, 1, 10.00),
	(60, 'papa amarilla', 2, 1, 3.00),
	(61, 'papa blanca', 2, 1, 2.00),
	(62, 'papa seca', 2, 1, 5.00),
	(63, 'pecanas', 5, 1, 50.00),
	(64, 'pechuga de pollo', 1, 1, 15.00),
	(65, 'perejil ', 2, 1, 8.00),
	(66, 'pescado', 1, 1, 20.00),
	(67, 'pimienta', 5, 1, 30.00),
	(68, 'pollo', 1, 1, 10.00),
	(69, 'queso parmesano', 3, 1, 40.00),
	(70, 'Quinua', 5, 1, 15.00),
	(71, 'apio', 2, 1, 10.00),
	(72, 'ricota', 5, 1, 10.00),
	(73, 'rocoto', 2, 1, 20.00),
	(74, 'romero ', 2, 1, 20.00),
	(75, 'sal', 5, 1, 1.50),
	(76, 'sibarita', 5, 1, 10.00),
	(77, 'spaghetti', 5, 1, 10.00),
	(78, 'tocino', 3, 1, 35.00),
	(79, 'tomate', 2, 1, 5.00),
	(80, 'tomillo', 2, 1, 30.00),
	(81, 'vainitas ', 2, 1, 4.00),
	(82, 'vinagre', 5, 3, 8.00),
	(83, 'yuca', 2, 1, 4.00),
	(84, 'yuyo', 2, 1, 5.00),
	(85, 'zanahorias', 2, 1, 2.00),
	(86, 'zapallo macre', 2, 1, 3.00);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.medida
CREATE TABLE IF NOT EXISTS `medida` (
  `idmedida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `prefijo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idmedida`),
  UNIQUE KEY `idmedida_UNIQUE` (`idmedida`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.medida: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `medida` DISABLE KEYS */;
INSERT INTO `medida` (`idmedida`, `nombre`, `prefijo`) VALUES
	(1, 'Kilos', 'KG'),
	(2, 'Gramos', 'GR'),
	(3, 'Litros', 'LT');
/*!40000 ALTER TABLE `medida` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `idDia` int(11) DEFAULT NULL,
  `fecRegistro` date DEFAULT NULL,
  `idDesayuno` int(11) DEFAULT NULL,
  `preDesayuno` decimal(12,2) DEFAULT NULL,
  `totDesayuno` decimal(12,2) DEFAULT NULL,
  `idAlmSopa` int(11) DEFAULT NULL,
  `preAlmSopa` decimal(12,2) DEFAULT NULL,
  `totAlmSopa` decimal(12,2) DEFAULT NULL,
  `idAlmSegundo` int(11) DEFAULT NULL,
  `preAlmSegundo` decimal(12,2) DEFAULT NULL,
  `totAlmSegundo` decimal(12,2) DEFAULT NULL,
  `idCenSopa` int(11) DEFAULT NULL,
  `preCenSopa` decimal(12,2) DEFAULT NULL,
  `totCenSopa` decimal(12,2) DEFAULT NULL,
  `idCenSegundo` int(11) DEFAULT NULL,
  `preCenSegundo` decimal(12,2) DEFAULT NULL,
  `totCenSegundo` decimal(12,2) DEFAULT NULL,
  `totMenu` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`idMenu`),
  UNIQUE KEY `idMenu_UNIQUE` (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.menu: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.parametro
CREATE TABLE IF NOT EXISTS `parametro` (
  `idParametro` int(11) NOT NULL AUTO_INCREMENT,
  `canPersona` int(11) DEFAULT NULL,
  `idTipoComida` int(11) DEFAULT NULL,
  `presupuesto` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`idParametro`),
  UNIQUE KEY `idParametro_UNIQUE` (`idParametro`),
  KEY `FK_parametro_tipoComida` (`idTipoComida`),
  CONSTRAINT `FK_parametro_tipoComida` FOREIGN KEY (`idTipoComida`) REFERENCES `tipocomida` (`idTipoComida`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.parametro: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` (`idParametro`, `canPersona`, `idTipoComida`, `presupuesto`) VALUES
	(1, 4, 1, 40.00),
	(2, 4, 1, 40.00),
	(3, 4, 1, 40.00),
	(4, 4, 1, 40.00),
	(5, 4, 1, 40.00),
	(6, 4, 1, 50.00),
	(7, 4, 1, 50.00);
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `codpro` int(11) NOT NULL AUTO_INCREMENT,
  `nompro` varchar(50) NOT NULL,
  `prepro` double(10,2) NOT NULL,
  `fotpro` varchar(100) NOT NULL,
  `canpro` int(4) NOT NULL,
  PRIMARY KEY (`codpro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.producto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`codpro`, `nompro`, `prepro`, `fotpro`, `canpro`) VALUES
	(2, 'www', 333.00, '/resources/imagenes/foto2.jpg', 10),
	(4, 'aaa', 44.00, '/resources/imagenes/blusa.jpg', 3),
	(5, 'pantalon', 80.00, '/resources/imagenes/foto4.jpg', 0),
	(6, 'aaa', 55.00, '/resources/imagenes/foto3.jpg', 0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.tipocomida
CREATE TABLE IF NOT EXISTS `tipocomida` (
  `idTipoComida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTipoComida`),
  UNIQUE KEY `idTipoComida_UNIQUE` (`idTipoComida`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.tipocomida: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipocomida` DISABLE KEYS */;
INSERT INTO `tipocomida` (`idTipoComida`, `nombre`) VALUES
	(1, 'Criollo'),
	(2, 'Pastas'),
	(3, 'Mariscos');
/*!40000 ALTER TABLE `tipocomida` ENABLE KEYS */;

-- Volcando estructura para tabla ollitape.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `tipoUsuario` varchar(100) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ollitape.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `clave`, `foto`, `tipoUsuario`, `estado`) VALUES
	(1, 'Administrador', '123456', '', 'Administrador', 'P'),
	(6, 'Pepito', '123456', '.', 'Cliente', 'R');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
