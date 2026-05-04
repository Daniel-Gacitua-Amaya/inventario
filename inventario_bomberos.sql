-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2026 a las 01:05:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_bomberos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajoneras`
--

CREATE TABLE `cajoneras` (
  `id` int(11) NOT NULL,
  `carro_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `posicion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cajoneras`
--

INSERT INTO `cajoneras` (`id`, `carro_id`, `nombre`, `numero`, `posicion`) VALUES
(46, 10, NULL, 4, 'Delante Derecha Abajo'),
(47, 10, NULL, 2, 'Cabina'),
(48, 11, NULL, 1, 'Delante Izquierda Arriba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `id` int(11) NOT NULL,
  `nombre_unidad` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `patente` varchar(20) DEFAULT NULL,
  `compania` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carros`
--

INSERT INTO `carros` (`id`, `nombre_unidad`, `tipo`, `patente`, `compania`) VALUES
(10, 'B-2', 'Agua', '', '2° Compañía'),
(11, 'R-2', 'Rescate', '', '2° Compañía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `carro_id` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `nombre_item` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `cajonera_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `carro_id`, `categoria`, `nombre_item`, `cantidad`, `estado`, `observaciones`, `cajonera_id`) VALUES
(16, 2, 'Trauma', 'Férula Adulto', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(17, 2, 'Herramienta', 'Generador Electrico Honda', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(18, 2, 'Herramienta', 'Motobomba Robin Pump PTG307', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(19, 2, 'Cajonera Vacía', 'N/A', 0, 'En reparacion', 'Cajonera Izq. 2', NULL),
(20, 2, 'Trauma', 'Tabla Espinal Larga', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(21, 2, 'Trauma', 'Laterales', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(22, 2, 'Trauma', 'Pulpo', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(23, 2, 'Trauma', 'Bolso de Trauma', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(24, 2, 'Herramienta', 'Ventilador', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(26, 2, 'Herramienta', 'Bidón de Mezcla', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(27, 2, 'Herramienta', 'Motoamoladora K970', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(28, 2, 'Herramienta', 'Motosierra STIHL MS361', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(29, 2, 'Agua', 'Linea 50mm tipo cama', 4, 'Operativo', 'Cajonera Izq. 4', NULL),
(30, 2, 'Agua ', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Izq. 4', NULL),
(31, 2, 'Agua', 'Gemelo', 1, 'Operativo', 'Compartimiento trasero', NULL),
(32, 2, 'Agua', 'Llave de copla', 2, 'Operativo', 'Compartimiento trasero', NULL),
(33, 2, 'Agua', 'Llave de grifo', 2, 'Operativo', 'Compartimiento trasero', NULL),
(34, 2, 'Herramienta', 'Cinta Ratchet', 1, 'Operativo', 'Compartimiento trasero', NULL),
(35, 2, 'Herramienta', 'Trinquete', 2, 'Operativo', 'Compartimiento Trasero', NULL),
(36, 2, 'Agua', 'Reducción 70mm a 50mm', 2, 'Operativo', 'Compartimiento Trasero', NULL),
(37, 2, 'Agua', 'Reducción 110mm a 70mm', 1, 'Operativo', 'Compartimiento trasero', NULL),
(38, 2, 'Agua ', 'Linea 38mm', 5, 'Operativo', 'Cajonera Dere. 1', NULL),
(39, 2, 'Herramienta', 'Hacha de Bomberos', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(40, 2, 'Herramienta', 'Simón 8', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(41, 2, 'Herramienta', 'Halligan', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(42, 2, 'Herramienta', 'Mazo', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(43, 2, 'Herramienta ', 'Napoleón', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(44, 2, 'Agua', 'Pitón forestal', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(45, 2, 'Herramienta', 'Gancho', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(46, 2, 'EPP', 'Cilindro ERA MSA 2216 psi', 7, 'Operativo', 'Cajonera Dere. 2', NULL),
(47, 2, 'Agua', 'Linea 70mm', 3, 'Operativo', 'Cajonera Dere. 3', NULL),
(48, 2, 'Agua', 'Linea 50mm', 8, 'Operativo', 'Cajonera Dere. 3', NULL),
(49, 2, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(50, 2, 'Agua', 'Pitón 70mm con Reducción', 2, 'Operativo', 'Cajonera Dere. 3', NULL),
(51, 2, 'Agua', 'Linea 38mm', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(52, 2, 'Agua ', 'Linea 50mm tipo cama', 4, 'Operativo', 'Cajonera Dere. 4', NULL),
(53, 2, 'Agua', 'Pitón tipo Smothbore', 1, 'Operativo', 'Cajonera Dere. 4', NULL),
(54, 1, 'Agua', 'Linea 50mm', 3, 'Operativo', 'Cajonera Izq. 1', NULL),
(55, 1, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(56, 1, 'Agua', 'Pitón 70mm', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(57, 1, 'Trauma', 'Bolso de Trauma', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(58, 1, 'Trauma', 'Férula Pélvica', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(59, 1, 'EPP', 'ERA MSA 4500psi', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(60, 1, 'Rescate', 'Cojínes de levante neumático (KIT COMPLETO)', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(61, 1, 'Trauma', 'Férula Adulto', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(62, 1, 'Trauma', 'Chaleco de Extricación', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(63, 1, 'EPP', 'Guantes Dielectricos', 2, 'Operativo', 'Cajonera Izq. 1', NULL),
(64, 1, 'Herramienta', 'Bastón Dielectrico', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(65, 1, 'EPP', 'Snorkel', 2, 'Operativo', 'Cajonera Izq. 1', NULL),
(66, 1, 'EPP', 'Chalecos Salvavidas', 4, 'Operativo', 'Cajonera Izq. 1', NULL),
(67, 1, 'Herramienta', 'Generador a Gasolina Bauker', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(68, 1, 'Herramienta', 'Motobomba Loncin', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(69, 1, 'Trauma', 'Tabla Espinal Larga', 6, 'Operativo', 'Cajonera Izq. 3', NULL),
(70, 1, 'Trauma', 'Tabla Espinal Pediátrica', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(71, 1, 'Trauma', 'Chaleco de Extricación', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(72, 1, 'Trauma', 'Laterales', 7, 'Operativo', 'Cajonera Izq. 3', NULL),
(73, 1, 'Trauma', 'Parche DEA Pediátrico', 4, 'Operativo', 'Cajonera Izq. 3', NULL),
(74, 1, 'Trauma', 'Pulpo', 4, 'Operativo', 'Cajonera Izq. 3', NULL),
(75, 1, 'Herramienta', 'Arnés de Asiento Ligero', 3, 'Operativo', 'Cajonera Izq. 3', NULL),
(76, 1, 'Agua', 'Linea 50mm tipo cama', 4, 'Operativo', 'Cajonera Izq. 4', NULL),
(77, 1, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Izq. 4', NULL),
(78, 1, 'Agua', 'Reducción 110mm a 70mm', 1, 'Operativo', 'Compartimiento Trasero ', NULL),
(83, 1, 'Agua', 'Llave de copla', 2, 'Operativo', 'Compartimiento trasero', NULL),
(84, 1, 'Agua', 'Reducción 70mm a 50mm', 3, 'Operativo', 'Compartimiento trasero', NULL),
(85, 1, 'Agua', 'Reducción 50mm a 38mm', 1, 'Operativo', 'Compartimiento trasero', NULL),
(86, 1, 'Agua', 'Linea 70mm tipo cama', 2, 'Operativo', 'Compartimiento trasero', NULL),
(87, 1, 'EPP', 'Guantes Anticortes', 4, 'Operativo', 'Cajonera Dere. 1', NULL),
(88, 1, 'Herramienta', 'Martillo Rompe Vidrios y Corta Cinturón', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(89, 1, 'Herramienta', 'Cinta para Manejo de Vidrio', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(90, 1, 'Extricación', 'Cadenas Equipo Hidraulico', 6, 'Operativo', 'Cajonera Dere. 1', NULL),
(91, 1, 'Herramienta', 'Cuerdas', 4, 'Operativo', 'Cajonera Dere. 1', NULL),
(92, 1, 'Herramienta', 'Cinta Ratchet', 10, 'Operativo', 'Cajonera Dere. 1', NULL),
(93, 1, 'Extricación', 'Lonas Cubre Corte', 4, 'Operativo', 'Cajonera Dere. 1', NULL),
(94, 1, 'Estabilización', 'Cuñas Tipo Biceladas', 24, 'Operativo', 'Cajonera Dere. 1', NULL),
(95, 1, 'Extricación', 'Protección Dura pvc ', 6, 'Operativo', 'Cajonera Dere. 1', NULL),
(96, 1, 'Estabilización', 'Cuñas Tipo Planas', 24, 'Operativo', 'Cajonera Dere. 1', NULL),
(97, 1, 'Estabilización', 'Cuñas Tipo Biceladas Cortas', 6, 'Operativo', 'Cajonera Dere. 1', NULL),
(98, 1, 'Estabilización', 'Estabilizadores Holmatro', 3, 'Operativo', 'Cajonera Dere. 1', NULL),
(99, 1, 'Herramienta', 'Sierra Sable Inalambrica', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(100, 1, 'Estabilización', 'Cuñas Tipo Cuartones', 37, 'Operativo', 'Cajonera Dere. 2', NULL),
(101, 1, 'Estabilización', 'Kit Estabilización Rápida', 2, 'Operativo', 'Cajonera Dere. 3', NULL),
(102, 1, 'Trauma', 'Bolso de Trauma', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(103, 1, 'Herramienta', 'Esmeril Inalámbrico ', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(104, 1, 'Herramienta', 'Taladro de Impacto', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(105, 1, 'Herramienta', 'Lona para Herramientas', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(106, 1, 'Extricación', 'Equipo Completo de Extricación (Ram Cizalla, Expansor y sus accesorios)', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(107, 1, 'Herramienta', 'Mazo', 2, 'Operativo', 'Cajonera Dere. 3', NULL),
(108, 1, 'Herramienta', 'Hacha de Bomberos', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(109, 1, 'Herramienta', 'Hacha Pequeña', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(110, 1, 'Herramienta', 'Mazo de Goma Pequeño', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(111, 1, 'Herramienta', 'Halligan', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(112, 1, 'Herramienta', 'Barretilla Diablo ', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(113, 1, 'Herramienta', 'Napoleón', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(114, 1, 'Estabilización', 'Cuña Tipo Escalonada ', 8, 'Operativo', 'Cajonera Dere. 4', NULL),
(115, 1, 'Agua', 'Chorizo 70 mm', 1, 'Operativo', 'Compartimiento Supe.', NULL),
(116, 1, 'Herramienta', 'Conos', 7, 'Operativo', 'Compartimiento Supe.', NULL),
(117, 1, 'Herramienta', 'Escalas de techo', 2, 'Operativo', 'Compartimiento Supe.', NULL),
(118, 1, 'Herramienta', 'Escala Plegable', 1, 'Operativo', 'Compartimiento Supe.', NULL),
(119, 1, 'Trauma', 'Canastillo', 1, 'Operativo', 'Compartimiento Supe.', NULL),
(120, 1, 'Herramienta', 'Equipo de iluminacion', 1, 'Operativo', 'Compartimiento Supe.', NULL),
(121, 1, 'Agua', 'Chorizo 110', 2, 'Operativo', 'Compartimiento Supe.', NULL),
(122, 1, 'Estabilización', 'Estabilizadores ', 2, 'Operativo', 'Compartimiento Supe.', NULL),
(123, 1, 'Trauma ', 'Collar Cervical Adulto', 3, 'Operativo', 'Cabina Móvil', NULL),
(124, 1, 'Trauma', 'Collar Cervical Pediátrico', 1, 'Operativo', 'Cabina Móvil', NULL),
(125, 1, 'EPP', 'ERA Scott 4500psi', 2, 'Operativo', 'Cabina Móvil', NULL),
(126, 1, 'EPP', 'Cilindro ERA SCOTT 4500psi', 2, 'Operativo', 'Cabina Móvil', NULL),
(127, 1, 'Herramienta', 'Paletas de dirección del tránsito pvc', 2, 'Operativo', 'Cabina Móvil', NULL),
(128, 1, 'Trauma', 'DEA', 1, 'Operativo', 'Cabina Móvil', NULL),
(129, 1, 'Trauma', 'Bolso de Trauma de intervención Rápida', 1, 'Operativo', 'Cabina Móvil', NULL),
(130, 1, 'Herramienta', 'Linterna', 1, 'Operativo', 'Cabina Móvil', NULL),
(131, 1, 'Herramienta', 'Binoculares', 1, 'Operativo', 'Cabina Móvil', NULL),
(132, 1, 'Trauma', 'Caja Multisensorial', 1, 'Operativo', 'Cabina Móvil', NULL),
(133, 1, 'Herramienta', 'Radios Motorola Dep450 (con sus accesorios)', 2, 'Operativo', 'Cabina Móvil', NULL),
(134, 1, 'EPP', 'Chalecos STEX', 4, 'Operativo', 'Cabina Móvil', NULL),
(135, 2, 'Herramienta', 'Bicheros', 6, 'Operativo', 'Compartimiento Super.', NULL),
(136, 2, 'Agua ', 'Chorizo 110mm', 3, 'Operativo', 'Compartimiento Super.', NULL),
(137, 2, 'Herramienta', 'Escala de Techo', 2, 'Operativo', 'Compartimiento Super.', NULL),
(138, 2, 'Herramienta', 'Escala Doble', 1, 'Operativo', 'Compartimiento Super.', NULL),
(139, 2, 'Agua', 'Monitor', 1, 'Operativo', 'Compartimiento Super.', NULL),
(140, 2, 'Herramienta', 'Conos ', 4, 'Operativo', 'Compartimiento Super.', NULL),
(141, 2, 'Agua', 'Bomba de Espalda', 5, 'Operativo', 'Compartimiento Super.', NULL),
(142, 2, 'Agua', 'Chorizo 70mm', 1, 'Operativo', 'Compartimiento Super.', NULL),
(143, 2, 'Agua', 'Extensión Chorizo 70mm', 1, 'Operativo', 'Compartimiento Super.', NULL),
(144, 2, 'Agua', 'Alcachofa', 2, 'Operativo', 'Compartimiento Supe.', NULL),
(145, 2, 'Herramienta', 'Macleod ', 3, 'Operativo', 'Compartimiento Supe.', NULL),
(146, 2, 'Herramienta', 'Pala', 2, 'Operativo', 'Compartimiento Supe.', NULL),
(147, 2, 'Herramienta', 'Tripode de iluminación', 1, 'Dañado', 'Compartimiento Supe.', NULL),
(148, 2, 'EPP', 'ERA Scott 4500psi', 1, 'Operativo', 'Cabina Móvil', NULL),
(149, 2, 'EPP', 'ERA MSA 2216psi', 2, 'Operativo', 'Cabina Móvil', NULL),
(150, 2, 'Trauma', 'Chaleco de Extricación ', 1, 'Operativo', 'Cabina Móvil', NULL),
(151, 2, 'Herramienta', 'Linterna', 2, 'Operativo', 'Cabina Móvil', NULL),
(152, 4, 'Trauma', 'Tabla Espinal Larga', 1, 'Operativo', 'Compartimiento Trasero', NULL),
(153, 4, 'Trauma', 'Laterales', 1, 'Operativo', 'Compartimiento Trasero', NULL),
(154, 4, 'Pulpo', 'Pulpo', 1, 'Operativo', 'Compartimiento Trasero', NULL),
(155, 5, 'Agua', 'Linea 70mm', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(156, 5, 'Trauma', 'Férula Adulto', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(157, 5, 'Herramienta', 'Generador Electrico Honda', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(158, 5, 'Herramienta', 'Motobomba Robin Pump PTG307', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(159, 5, 'Cajonera Vacía', 'N/A', 0, 'En reparacion', 'Cajonera Izq. 2', NULL),
(160, 5, 'Trauma ', 'Tabla Espinal Larga', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(161, 5, 'Trauma', 'Laterales', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(162, 5, 'Trauma', 'Pulpo', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(163, 5, 'Trauma', 'Bolso de Trauma', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(164, 5, 'Herramienta', 'Ventilador', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(165, 5, 'Herramienta', 'Bidón de Mezcla', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(166, 5, 'Herramienta', 'Motoamoladora K970', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(167, 5, 'Herramienta', 'Motosierra STIHL MS361', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(168, 5, 'Agua ', 'Linea 50mm tipo cama', 4, 'Operativo', 'Cajonera Izq. 4', NULL),
(169, 5, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Izq. 4', NULL),
(170, 5, 'Agua', 'Gemelo', 1, 'Operativo', 'Compartimiento trasero', NULL),
(171, 5, 'Agua', 'Llave de copla', 2, 'Operativo', 'Compartimiento trasero', NULL),
(172, 5, 'Agua', 'Llave de grifo', 2, 'Operativo', 'Compartimiento trasero', NULL),
(173, 5, 'Herramienta', 'Cinta Ratchet', 1, 'Operativo', 'Compartimiento trasero', NULL),
(174, 5, 'Herramienta', 'Trinquete', 2, 'Operativo', 'Compartimiento trasero', NULL),
(175, 5, 'Agua', 'Reducción 70mm a 50mm', 2, 'Operativo', 'Compartimiento trasero', NULL),
(176, 5, 'Agua', 'Reducción 110mm a 70mm', 1, 'Operativo', 'Compartimiento trasero', NULL),
(177, 5, 'Agua', 'Linea 38mm', 5, 'Operativo', 'Cajonera Dere. 1', NULL),
(178, 5, 'Herramienta', 'Hacha de Bomberos', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(179, 5, 'Herramienta', 'Simón 8', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(180, 5, 'Herramienta', 'Barretilla Diablo', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(181, 5, 'Herramienta', 'Halligan', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(182, 5, 'Herramienta', 'Mazo', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(183, 5, 'Herramienta', 'Napoleón', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(184, 5, 'Agua', 'Pitón forestal', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(185, 5, 'Herramienta', 'Gancho', 2, 'Operativo', 'Cajonera Dere. 1', NULL),
(186, 5, 'EPP', 'Cilindro ERA MSA 2216 psi', 7, 'Operativo', 'Cajonera Dere. 2', NULL),
(187, 5, 'Agua', 'Linea 70mm', 3, 'Operativo', 'Cajonera Dere. 3', NULL),
(188, 5, 'Agua', 'Linea 50mm', 8, 'Operativo', 'Cajonera Dere. 3', NULL),
(189, 5, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(190, 5, 'Agua', 'Pitón 70mm con Reducción', 2, 'Operativo', 'Cajonera Dere. 3', NULL),
(191, 5, 'Agua', 'Linea 38mm', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(192, 5, 'Agua', 'Linea 50mm tipo cama', 4, 'Operativo', 'Cajonera Dere. 4', NULL),
(193, 5, 'Agua', 'Pitón tipo Smothbore', 1, 'Operativo', 'Cajonera Dere. 4', NULL),
(194, 5, 'Herramienta', 'Bicheros', 6, 'Operativo', 'Compartimiento Superior', NULL),
(195, 5, 'Agua', 'Chorizo 110mm', 3, 'Operativo', 'Compartimiento Superior', NULL),
(196, 5, 'Herramienta', 'Escalas de techo', 2, 'Operativo', 'Compartimiento Superior', NULL),
(197, 5, 'Herramienta', 'Escala Doble', 1, 'Operativo', 'Compartimiento Superior', NULL),
(198, 5, 'Agua', 'Monitor', 1, 'Operativo', 'Compartimiento Superior', NULL),
(199, 5, 'Herramienta', 'Conos', 4, 'Operativo', 'Compartimiento Superior', NULL),
(200, 5, 'Agua', 'Bomba de Espalda', 5, 'Operativo', 'Compartimiento Superior', NULL),
(201, 5, 'Agua', 'Chorizo 70 mm', 1, 'Operativo', 'Compartimiento Superior', NULL),
(202, 5, 'Agua', 'Extensión Chorizo 70mm', 1, 'Operativo', 'Compartimiento Superior', NULL),
(203, 5, 'Agua', 'Alcachofa', 2, 'Operativo', 'Compartimiento Superior', NULL),
(204, 5, 'Herramienta', 'Macleod ', 3, 'Operativo', 'Compartimiento Superior', NULL),
(205, 5, 'Herramienta', 'Pala', 2, 'Operativo', 'Compartimiento Superior', NULL),
(206, 5, 'Herramienta', 'Tripode de iluminación', 1, 'Dañado', 'Compartimiento Superior', NULL),
(207, 5, 'EPP', 'ERA Scott 4500psi', 1, 'Operativo', 'Cabina Móvil', NULL),
(208, 5, 'EPP', 'ERA MSA 2216psi', 2, 'Operativo', 'Cabina Móvil', NULL),
(209, 5, 'Trauma', 'Chaleco de Extricación', 1, 'Operativo', 'Cabina Móvil', NULL),
(210, 5, 'Herramienta', 'Linterna', 2, 'Operativo', 'Cabina Móvil', NULL),
(211, 3, 'Agua', 'Sifón Jet', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(212, 3, 'Herramienta', 'Hacha de Bomberos', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(213, 3, 'Herramienta', 'Motosierra HUSQBARNA 576XP', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(214, 3, 'Agua', 'Motobomba Honda WB30XT', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(215, 3, 'Herramienta', 'Halligan', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(216, 3, 'Agua', 'Reducción con hilo de 70mm', 1, 'Operativo', 'Cajonera Izq. 1', NULL),
(217, 3, 'Agua', 'Alcachofa', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(218, 3, 'Agua', 'Reducción 70mm a 50mm', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(219, 3, 'Agua', 'Reducción 70mm a 50mm con hilo', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(220, 3, 'Agua', 'Flotador', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(221, 3, 'Agua', 'Filtro', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(222, 3, 'Agua', 'Linea 70mm ', 5, 'Operativo', 'Cajonera Izq. 2', NULL),
(223, 3, 'Herramienta', 'Bidón de Combustible ', 1, 'Operativo', 'Cajonera Izq. 2', NULL),
(224, 3, 'Agua', 'Trifulca', 2, 'Operativo', 'Cajonera Izq. 3', NULL),
(225, 3, 'Agua', 'Gemelo', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(226, 3, 'Agua', 'Reducción 110mm a 70mm', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(227, 3, 'Agua', 'Llave de copla', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(228, 3, 'Agua', 'Sifón Hechizo 110mm a 50mm', 1, 'Operativo', 'Cajonera Izq. 3', NULL),
(229, 3, 'Agua', 'Piscina tipo pera 8000L', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(230, 3, 'Agua', 'Motobomba flotadora', 1, 'Operativo', 'Cajonera Dere. 1', NULL),
(231, 3, 'Agua ', 'Linea 50mm', 2, 'Operativo', 'Cajonera Dere. 2', NULL),
(232, 3, 'Agua', 'Linea 38mm', 3, 'Operativo', 'Cajonera Dere. 2', NULL),
(233, 3, 'Agua', 'Pitón 50mm', 2, 'Operativo', 'Cajonera Dere. 2', NULL),
(234, 3, 'Agua', 'Linea 70mm', 1, 'Operativo', 'Cajonera Dere. 2', NULL),
(235, 3, 'Agua', 'Linea 50mm tipo cama', 2, 'Operativo', 'Cajonera Dere. 3', NULL),
(236, 3, 'Agua', 'Pitón 50mm', 1, 'Operativo', 'Cajonera Dere. 3', NULL),
(237, 3, 'Agua', 'Monitor', 1, 'Operativo', 'Compartimiento Superior', NULL),
(238, 3, 'Agua', 'Chorizo 70 mm', 2, 'Operativo', 'Compartimiento Superior', NULL),
(239, 3, 'Agua', 'Piscina 9400L', 1, 'Operativo', 'Compartimiento Superior', NULL),
(240, 3, 'Herramienta', 'Cono', 2, 'Operativo', 'Compartimiento Superior', NULL),
(241, 3, 'Trauma', 'Tabla Espinal Larga', 1, 'Operativo', 'Compartimiento Superior', NULL),
(242, 3, 'Trauma', 'Laterales', 1, 'Operativo', 'Compartimiento Superior', NULL),
(243, 3, 'Trauma', 'Pulpo', 1, 'Operativo', 'Compartimiento Superior', NULL),
(291, NULL, 'Extinción', 'Llave Storz', 2, 'Operativo', '', 46),
(303, NULL, 'Herramientas', 'Llave Inglesa', 2, 'Operativo', '', 46),
(304, NULL, 'Herramientas', 'Martillo', 1, 'Operativo', '', 46),
(305, NULL, 'Herramientas', 'Destornillador Plano', 3, 'Operativo', '', 46),
(306, NULL, 'Herramientas', 'Destornillador Cruz', 3, 'Operativo', '', 46),
(307, NULL, 'Herramientas', 'Alicate Universal', 2, 'Operativo', '', 46),
(308, NULL, 'Herramientas', 'Alicate de Corte', 2, 'Operativo', '', 46),
(309, NULL, 'Herramientas', 'Llave Francesa', 1, 'Operativo', '', 46),
(310, NULL, 'Herramientas', 'Serrucho', 1, 'Operativo', '', 46),
(311, NULL, 'Herramientas', 'Nivel', 1, 'Operativo', '', 46),
(312, NULL, 'Herramientas', 'Cinta Métrica', 2, 'Operativo', '', 46),
(313, NULL, 'Rescate', 'Cizalla', 1, 'Operativo', '', 46),
(366, NULL, 'Herramientas', 'Llave Allen', 2, 'Operativo', '', 46),
(367, NULL, 'Rescate', 'Cuerda auxiliar', 1, 'Operativo', '', 46),
(368, NULL, 'EPP', 'Guantes de trabajo', 3, 'Operativo', '', 46),
(369, NULL, 'Extinción', 'Boquilla', 1, 'Operativo', '', 46),
(370, NULL, 'Herramientas', 'Linterna portátil', 2, 'Operativo', '', 46),
(374, NULL, 'Agua', 'Manguera', 1, 'Operativo', '', 46),
(375, NULL, 'Agua', 'Manguera', 1, 'Operativo', '', 46),
(376, NULL, 'Agua', 'Manguera', 1, 'Operativo', '', 46),
(377, NULL, 'Agua', 'Manguera', 1, 'Operativo', '', 46);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajoneras`
--
ALTER TABLE `cajoneras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajoneras_ibfk_1` (`carro_id`);

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carro_id` (`carro_id`),
  ADD KEY `inventario_ibfk_1` (`cajonera_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajoneras`
--
ALTER TABLE `cajoneras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `carros`
--
ALTER TABLE `carros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajoneras`
--
ALTER TABLE `cajoneras`
  ADD CONSTRAINT `cajoneras_ibfk_1` FOREIGN KEY (`carro_id`) REFERENCES `carros` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`cajonera_id`) REFERENCES `cajoneras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`cajonera_id`) REFERENCES `cajoneras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
