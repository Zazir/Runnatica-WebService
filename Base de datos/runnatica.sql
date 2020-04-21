-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2020 a las 23:27:34
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
-- Base de datos: `runnatica`
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
  `foto` varchar(200) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `aval` varchar(200) DEFAULT NULL,
  `coordenadas` varchar(50) NOT NULL,
  `nom_comp` varchar(100) NOT NULL,
  `pais` varchar(60) NOT NULL,
  `colonia` varchar(40) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `fecha` int(11) NOT NULL,
  `resultados` varchar(200) DEFAULT NULL,
  `hora` varchar(8) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `divisa` varchar(50) DEFAULT NULL,
  `reembolso` varchar(2) DEFAULT NULL,
  `precio` int(5) DEFAULT NULL,
  `cant_normal_cat` int(5) NOT NULL,
  `cant_foraneos_cat` int(5) DEFAULT NULL,
  `max_edad_cat` int(2) NOT NULL,
  `min_edad_cat` int(2) NOT NULL,
  `nombre_cat` varchar(150) NOT NULL,
  `descripcion_cat` varchar(200) NOT NULL,
  `kilometros_cat` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `competencia`
--

INSERT INTO `competencia` (`id_competencia`, `id_usuario`, `id_tipo_comp`, `foto`, `descripcion`, `aval`, `coordenadas`, `nom_comp`, `pais`, `colonia`, `calle`, `ciudad`, `fecha`, `resultados`, `hora`, `estado`, `divisa`, `reembolso`, `precio`, `cant_normal_cat`, `cant_foraneos_cat`, `max_edad_cat`, `min_edad_cat`, `nombre_cat`, `descripcion_cat`, `kilometros_cat`) VALUES
(1, 1, 1, '', 'Esta es la descripcion', '', 'uuyd53te5', 'Nombre de competencia', 'Pais', 'Colonia', 'Calle', 'Ciudad', 2122000, '', '34', 'Jalisco', '', 'Si', 5000, 0, 0, 0, 0, '', '', 0);

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

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodopago`, `nombre_metodo`) VALUES
(1, 'Conekta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuarios` int(10) NOT NULL,
  `id_metodopago` int(5) DEFAULT NULL,
  `contrasena` varchar(20) NOT NULL,
  `telefono` bigint(24) NOT NULL,
  `terminos` tinyint(1) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `f_nacimiento` date NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `tipo_usr` tinyint(1) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `pais` varchar(80) NOT NULL,
  `foto_usuario` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuarios`, `id_metodopago`, `contrasena`, `telefono`, `terminos`, `sexo`, `f_nacimiento`, `nombre`, `correo`, `tipo_usr`, `ciudad`, `estado`, `pais`, `foto_usuario`) VALUES
(1, 1, 'fernando', 2233445566, 1, 'hombre', '2020-02-03', 'Ivan Lopez', 'chocosogamer@gmail.com', 1, 'Guadalajara', 'Jalisco', 'México', 'qsdwEFWRFAERFWERSRTG');

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
  MODIFY `id_competencia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodopago` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuarios` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
