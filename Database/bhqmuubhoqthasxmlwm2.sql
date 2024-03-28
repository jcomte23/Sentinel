-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: bhqmuubhoqthasxmlwm2-mysql.services.clever-cloud.com:3306
-- Tiempo de generación: 01-03-2024 a las 22:08:02
-- Versión del servidor: 8.0.15-5
-- Versión de PHP: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bhqmuubhoqthasxmlwm2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_vehiculos`
--

CREATE TABLE `historial_vehiculos` (
  `id` int(11) NOT NULL,
  `ingreso` varchar(255) NOT NULL,
  `salida` varchar(255) DEFAULT NULL,
  `vehiculos_id` int(11) NOT NULL,
  `plazas_id` int(11) NOT NULL,
  `comentarios` longtext,
  `usuarios_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazas`
--

CREATE TABLE `plazas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE `tipo_documentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculos`
--

CREATE TABLE `tipo_vehiculos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `tipo_documentos_id` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipos_usuarios_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `tipo_vehiculo_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_vehiculos`
--
ALTER TABLE `historial_vehiculos`
  ADD PRIMARY KEY (`id`,`usuarios_id`),
  ADD KEY `fk_historial_vehiculos_vehiculos1_idx` (`vehiculos_id`),
  ADD KEY `fk_historial_vehiculos_plazas1_idx` (`plazas_id`),
  ADD KEY `fk_historial_vehiculos_usuarios1_idx` (`usuarios_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plazas`
--
ALTER TABLE `plazas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_vehiculos`
--
ALTER TABLE `tipo_vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_USUARIOS_TIPO_DOCUMENTOS1_idx` (`tipo_documentos_id`),
  ADD KEY `fk_usuarios_tipos_usuarios1_idx` (`tipos_usuarios_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_VEHICULOS_TIPO_VEHICULO1_idx` (`tipo_vehiculo_id`),
  ADD KEY `fk_VEHICULOS_COLORES1_idx` (`color_id`),
  ADD KEY `fk_VEHICULOS_MARCAS1_idx` (`marca_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_vehiculos`
--
ALTER TABLE `historial_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plazas`
--
ALTER TABLE `plazas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documentos`
--
ALTER TABLE `tipo_documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculos`
--
ALTER TABLE `tipo_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_vehiculos`
--
ALTER TABLE `historial_vehiculos`
  ADD CONSTRAINT `fk_historial_vehiculos_plazas1` FOREIGN KEY (`plazas_id`) REFERENCES `plazas` (`id`),
  ADD CONSTRAINT `fk_historial_vehiculos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_historial_vehiculos_vehiculos1` FOREIGN KEY (`vehiculos_id`) REFERENCES `vehiculos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_USUARIOS_TIPO_DOCUMENTOS1` FOREIGN KEY (`tipo_documentos_id`) REFERENCES `tipo_documentos` (`id`),
  ADD CONSTRAINT `fk_usuarios_tipos_usuarios1` FOREIGN KEY (`tipos_usuarios_id`) REFERENCES `tipos_usuarios` (`id`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_VEHICULOS_COLORES1` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`),
  ADD CONSTRAINT `fk_VEHICULOS_MARCAS1` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `fk_VEHICULOS_TIPO_VEHICULO1` FOREIGN KEY (`tipo_vehiculo_id`) REFERENCES `tipo_vehiculos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
