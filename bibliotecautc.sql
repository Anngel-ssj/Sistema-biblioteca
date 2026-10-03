-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-10-2026 a las 08:28:35
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bibliotecautc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `grado` varchar(20) DEFAULT NULL,
  `grupo` varchar(10) DEFAULT NULL,
  `matricula` varchar(30) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellido_paterno`, `apellido_materno`, `grado`, `grupo`, `matricula`, `telefono`, `correo`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', 'López', '3°', 'A', 'ALU001', '7221234567', 'juan@gmail.com', '2026-09-19 16:20:01'),
(2, 'María', 'García', 'Sánchez', '2°', 'B', 'ALU002', '7222345678', 'maria@gmail.com', '2026-09-19 16:20:01'),
(3, 'Carlos', 'Hernández', 'Ramírez', '3°', 'A', 'ALU003', '7223456789', 'carlos@gmail.com', '2026-09-19 16:20:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `nombre_libro` varchar(150) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `cantidad` int DEFAULT '1',
  `disponibles` int DEFAULT '1',
  PRIMARY KEY (`id_libro`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `nombre_libro`, `autor`, `categoria`, `cantidad`, `disponibles`) VALUES
(1, 'Introducción a la psicología', 'Fernando Zepeda Herrera', 'Psicolgía', 1, 1),
(2, 'Historia Secreta de la Masoneria', 'Jeremy Harwood', 'Historia', 1, 1),
(3, 'Bicentenario Estado de Mexico', 'Gobierno del Estado de México', 'Historia', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int NOT NULL,
  `id_libro` int NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Prestado',
  PRIMARY KEY (`id_prestamo`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_libro` (`id_libro`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_alumno`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`, `estado`) VALUES
(1, 1, 1, '2026-09-10', '2026-09-12', 'Devuelto'),
(2, 2, 2, '2026-09-12', '2026-09-18', 'Devuelto'),
(3, 3, 3, '2026-09-15', NULL, 'Prestado');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
