-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 17:00:25
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_practica`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_persona` ()   BEGIN
    SELECT codper AS dni, nombre AS nombre, apellidos AS apellidos, 
           telefono AS telefono, correo AS correo, direccion AS direccion, 
           fecha AS fecha, estado, 
           CASE estado 
               WHEN 0 THEN 'fallecido' 
               WHEN 1 THEN 'Saludable' 
               WHEN 2 THEN 'Herido' 
           END AS v10
    FROM persona;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_persona` (IN `v_dni` CHAR(8), IN `v_nombre` VARCHAR(50), IN `v_apellidos` VARCHAR(90), IN `v_telefono` VARCHAR(15), IN `v_correo` VARCHAR(200), IN `v_direccion` TEXT, IN `v_fecha` DATE, IN `v_estado` SMALLINT, OUT `v_res` BOOL)   BEGIN
    declare exit handler for SQLEXCEPTION
    BEGIN
        ROLLBACK;
        set v_res=false;
    END;

    START TRANSACTION;
    INSERT INTO persona
    (dni, nombre, apellidos, telefono, correo, direccion, fecha, estado)
    VALUES (UPPER(v_dni), UPPER(v_nombre), UPPER(v_apellidos), v_telefono, v_correo, UPPER(v_direccion), v_fecha, v_estado);
    COMMIT;
    SET v_res=true;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `dni` char(8) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `dni`, `nombre`, `apellidos`, `telefono`, `correo`, `direccion`, `fecha`, `estado`) VALUES
(6, '46531134', 'Julio ', 'Ropes', 'AH PERU', 'hhdshdh@h.cin', 'Calle 12', '2002-02-15', 'Activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
