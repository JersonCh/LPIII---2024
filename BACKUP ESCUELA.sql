-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbpractica
CREATE DATABASE IF NOT EXISTS `dbpractica` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `dbpractica`;

-- Volcando estructura para tabla dbpractica.detalle_curso_alumno
CREATE TABLE IF NOT EXISTS `detalle_curso_alumno` (
  `codigo_alu` varchar(50) NOT NULL,
  `id_curso` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_alu`,`id_curso`),
  KEY `FK_detalle_curso_alumno_tbcurso` (`id_curso`),
  CONSTRAINT `FK_detalle_curso_alumno_tbalumno` FOREIGN KEY (`codigo_alu`) REFERENCES `tbalumno` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detalle_curso_alumno_tbcurso` FOREIGN KEY (`id_curso`) REFERENCES `tbcurso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.detalle_curso_alumno: ~5 rows (aproximadamente)
INSERT INTO `detalle_curso_alumno` (`codigo_alu`, `id_curso`) VALUES
	('2017548926', 'C-01'),
	('2021070309', 'C-03'),
	('2021070309', 'C-04'),
	('2021072619', 'C-05'),
	('2021556546', 'C-02');

-- Volcando estructura para tabla dbpractica.tbalumno
CREATE TABLE IF NOT EXISTS `tbalumno` (
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` tinytext NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.tbalumno: ~5 rows (aproximadamente)
INSERT INTO `tbalumno` (`codigo`, `nombre`, `apellido`, `direccion`, `telefono`) VALUES
	('2017548926', 'Andree', 'Melendez', 'bugas', '9415616545'),
	('2021046532', 'Yoel', 'Flores', 'GAL', '9246565645'),
	('2021070309', 'Jaime', 'Flores', 'morro', '9256256265'),
	('2021072619', 'Jerson', 'Chambi', 'bugamvillas', '9921561564'),
	('2021556546', 'Elvis', 'Leyva', 'morro', '9392925161');

-- Volcando estructura para tabla dbpractica.tbcargo
CREATE TABLE IF NOT EXISTS `tbcargo` (
  `idcargo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.tbcargo: ~6 rows (aproximadamente)
INSERT INTO `tbcargo` (`idcargo`, `nombre`) VALUES
	(1, 'Director de Escuela'),
	(2, 'Gerente Acreditacion'),
	(3, 'Jefe de Tutoria'),
	(4, 'Docente a tiempo completo'),
	(5, 'Docente'),
	(23423, 'sdfsdf');

-- Volcando estructura para tabla dbpractica.tbcurso
CREATE TABLE IF NOT EXISTS `tbcurso` (
  `id_curso` varchar(50) NOT NULL,
  `nombre_curso` varchar(50) NOT NULL,
  `dni_doc` varchar(50) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `FK_tbcurso_tbdocente` (`dni_doc`),
  CONSTRAINT `FK_tbcurso_tbdocente` FOREIGN KEY (`dni_doc`) REFERENCES `tbdocente` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.tbcurso: ~5 rows (aproximadamente)
INSERT INTO `tbcurso` (`id_curso`, `nombre_curso`, `dni_doc`) VALUES
	('C-01', 'MATEMATICA', '98652368'),
	('C-02', 'COMUNICACION', '17856325'),
	('C-03', 'EPT', '72883481'),
	('C-04', 'INGLES', '72883481'),
	('C-05', 'TUTORIA', '17856325');

-- Volcando estructura para tabla dbpractica.tbdocente
CREATE TABLE IF NOT EXISTS `tbdocente` (
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `idcargo` int(11) DEFAULT NULL,
  `clave` int(11) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_tbdocente_tbcargo` (`idcargo`),
  CONSTRAINT `FK_tbdocente_tbcargo` FOREIGN KEY (`idcargo`) REFERENCES `tbcargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.tbdocente: ~5 rows (aproximadamente)
INSERT INTO `tbdocente` (`dni`, `nombre`, `apellido`, `direccion`, `celular`, `idcargo`, `clave`) VALUES
	('17856325', 'lanchipa', 'valencia', 'pocollay', 958478963, 5, 159),
	('71448524', 'elard', 'rodriguez', 'pocollay', 924564654, 5, 456),
	('72032563', 'andree', 'flores', 'tacna', 956363224, 5, 789),
	('72883481', 'jaime', 'flores', 'GAL', 924655622, 5, 123),
	('98652368', 'patrick', 'quispe', 'ciudad almej', 958632568, 5, 753);

-- Volcando estructura para tabla dbpractica.tbnota
CREATE TABLE IF NOT EXISTS `tbnota` (
  `id_nota` varchar(50) NOT NULL,
  `nota1` int(11) NOT NULL,
  `nota2` int(11) NOT NULL,
  `nota3` int(11) NOT NULL,
  `id_alumno` varchar(10) NOT NULL,
  `id_curso` varchar(10) NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `FK_tbnota_tbalumno` (`id_alumno`),
  KEY `FK_tbnota_tbcurso` (`id_curso`),
  CONSTRAINT `FK_tbnota_tbalumno` FOREIGN KEY (`id_alumno`) REFERENCES `tbalumno` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbnota_tbcurso` FOREIGN KEY (`id_curso`) REFERENCES `tbcurso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla dbpractica.tbnota: ~2 rows (aproximadamente)
INSERT INTO `tbnota` (`id_nota`, `nota1`, `nota2`, `nota3`, `id_alumno`, `id_curso`) VALUES
	('N01', 15, 20, 11, '2021070309', 'C-01'),
	('N02', 11, 10, 8, '2017548926', 'C-03');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
