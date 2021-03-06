-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2020 a las 04:04:06
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `runnaticadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_foro` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_competencia` int(10) NOT NULL,
  `mensaje` longtext NOT NULL,
  `tipo_mensaje` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--

CREATE TABLE `competencia` (
  `id_competencia` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_tipo_comp` int(10) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `aval` varchar(200) NOT NULL,
  `coordenadas` varchar(50) NOT NULL,
  `nom_comp` varchar(100) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `colonia` varchar(40) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `resultados` varchar(200) NOT NULL,
  `hora` varchar(8) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `divisa` varchar(50) NOT NULL,
  `reembolso` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_foraneo` int(10) NOT NULL,
  `id_competencia` int(10) NOT NULL,
  `f_inscripciones` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodopago` int(5) NOT NULL,
  `nombre_metodo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comp`
--

CREATE TABLE `tipo_comp` (
  `id_tipo_comp` int(10) NOT NULL,
  `cant_normal` int(5) NOT NULL,
  `cant_foraneos` int(5) NOT NULL,
  `max_edad` int(2) NOT NULL,
  `min_edad` int(2) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` int(4) NOT NULL,
  `kilometros` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuarios` int(10) NOT NULL,
  `id_metodopago` int(5) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `telefono` bigint(24) NOT NULL,
  `terminos` tinyint(1) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `tipo_usr` tinyint(1) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estado` int(50) NOT NULL,
  `pais` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `u_foraneo`
--

CREATE TABLE `u_foraneo` (
  `id_foraneo` int(10) NOT NULL,
  `id_competencia` int(10) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_foro`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `comentarios_ibfk_2` (`id_competencia`);

--
-- Indices de la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD PRIMARY KEY (`id_competencia`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `competencia_ibfk_6` (`id_tipo_comp`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_competencia` (`id_competencia`),
  ADD KEY `id_foraneo` (`id_foraneo`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodopago`);

--
-- Indices de la tabla `tipo_comp`
--
ALTER TABLE `tipo_comp`
  ADD PRIMARY KEY (`id_tipo_comp`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `id_metodopago` (`id_metodopago`);

--
-- Indices de la tabla `u_foraneo`
--
ALTER TABLE `u_foraneo`
  ADD PRIMARY KEY (`id_foraneo`),
  ADD KEY `id_competencia` (`id_competencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_foro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competencia`
--
ALTER TABLE `competencia`
  MODIFY `id_competencia` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodopago` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_comp`
--
ALTER TABLE `tipo_comp`
  MODIFY `id_tipo_comp` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuarios` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `u_foraneo`
--
ALTER TABLE `u_foraneo`
  MODIFY `id_foraneo` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuarios`),
  ADD CONSTRAINT `comentarios_ibfk_4` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id_competencia`);

--
-- Filtros para la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD CONSTRAINT `competencia_ibfk_6` FOREIGN KEY (`id_tipo_comp`) REFERENCES `tipo_comp` (`id_tipo_comp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `competencia_ibfk_7` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuarios`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_3` FOREIGN KEY (`id_foraneo`) REFERENCES `u_foraneo` (`id_foraneo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscripciones_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuarios`),
  ADD CONSTRAINT `inscripciones_ibfk_5` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id_competencia`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_metodopago`) REFERENCES `metodo_pago` (`id_metodopago`);

--
-- Filtros para la tabla `u_foraneo`
--
ALTER TABLE `u_foraneo`
  ADD CONSTRAINT `u_foraneo_ibfk_1` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id_competencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
