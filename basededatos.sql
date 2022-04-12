-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2022 a las 01:00:32
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acomertipico_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `tipo_categoria` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `tipo_categoria`) VALUES
(0, 'bebidas'),
(1, 'plato fuerte'),
(2, 'pasabocas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `comentario` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `comentario`, `calificacion`, `id_usuarios`) VALUES
(1, 'excelente servivcio', 5, 1),
(2, 'buen servicio', 4, 2),
(3, 'mal servicio', 3, 3),
(4, 'pesimo servicio', 2, 4),
(5, 'chay servicio', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int(10) NOT NULL,
  `cantidad_compra` int(10) DEFAULT NULL,
  `precio_total` double DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id_detalle_compra`, `cantidad_compra`, `precio_total`, `id_producto`) VALUES
(1, 12, 36000, 1),
(2, 8, 24000, 2),
(3, 5, 4500, 3),
(4, 10, 9000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilios`
--

CREATE TABLE `domicilios` (
  `id_domicilios` int(10) NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `id_detalle_compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `domicilios`
--

INSERT INTO `domicilios` (`id_domicilios`, `direccion`, `id_usuarios`, `id_metodo_pago`, `id_detalle_compra`) VALUES
(1, 'Cr 9 #9N-36', 14, 1, 1),
(2, 'Cr 70 La Paz', 1, 2, 2),
(3, 'CCr 5 3a chapinero', 5, 1, 1),
(4, ' Cll 30 0-9 las guacas', 2, 1, 3),
(5, ' 	\r\n Cll 27 san eduardo', 4, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int(10) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo_pago`, `nombre`) VALUES
(1, 'PSE'),
(2, 'pago en efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Precio_unitario` float NOT NULL,
  `Fotos` blob DEFAULT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `Nit_restaurante` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `Nombre_producto`, `Precio_unitario`, `Fotos`, `Descripcion`, `estado`, `cantidad`, `Nit_restaurante`, `id_categoria`) VALUES
(1, 'empanadas de pipian', 3000, '', 'papas, harina, color,', 'disponible', 10, 20831, 1),
(2, 'champus', 3000, '', 'lulo, agua, maiz, limon', 'disponible', 1, 20832, 0),
(3, 'repollitas', 900, '', 'arequipe, masa', 'disponible', 20, 20839, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `Nit_restaurante` int(11) NOT NULL,
  `Nombres` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(10) NOT NULL,
  `celular` int(10) NOT NULL,
  `Tipo_persona` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Foto` blob DEFAULT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Contraseña` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `restaurante`
--

INSERT INTO `restaurante` (`Nit_restaurante`, `Nombres`, `telefono`, `celular`, `Tipo_persona`, `Foto`, `Descripcion`, `Contraseña`, `id_usuarios`) VALUES
(20831, 'El sabor ', 76909659, 2147483647, 'Natural', '', 'Ven y disfruta del sanor colombiano ', '12233345', 3),
(20832, 'Mora castilla', 76219659, 2147483647, 'Juridica', '', 'sabor y tradicion ', '112456', 3),
(20839, 'Chuleta pobre', 76849659, 2147483647, 'Natural', '', 'Ricas chuletas ', '123456', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(10) NOT NULL,
  `nombre_rol` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'comprador'),
(2, 'administrador'),
(3, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombres` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_id` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_documento` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `celular` bigint(10) DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contraseña` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombres`, `apellidos`, `tipo_id`, `numero_documento`, `direccion`, `telefono`, `celular`, `email`, `contraseña`, `id_rol`) VALUES
(1, 'Daniel', 'Dorado', 'CC', '1061278304', ' Cr 70 La Paz', 8435678, 3147483647, 'Daniel@gmail.com', 'Daniel123', 1),
(2, 'Ana maria', 'Ortiz', 'CC', '1061199304', ' Cll 30 0-9 las guacas', 0, 3147483647, 'ana@gmail.com', 'ana123', 1),
(3, 'Rosa inez', 'Diaz', 'CC', '1022199304', ' Cll 27 69 las guacas', 87098361, 3112983044, 'rosa@gmail.com', 'rosa234', 1),
(4, 'Camila', 'Papamija', 'CC', '1061219330', ' Cll 27 san eduardo', 97008361, 3232983044, 'Camila@gmail.com', 'camila123', 1),
(5, 'Carlos', 'Diaz Diaz', 'CC', '106121800', ' Cr 5 3a chapinero', 97019861, 3221983045, 'Carlos@gmail.com', 'carlos23', 1),
(6, 'Dayana', 'Ordonez Ceron', 'CC', '1061218303', ' Cll 70 3a 02-17', 0, 3122678301, 'Dayan@gmail.com', 'dayana23', 2),
(7, 'Eleny Maritza ', 'Sancho Sancho', 'CC', '1061218303', ' Cll 70 3a 0-9', 0, 3122968243, 'elenymss12@gmail.com', 'eleny2003', 2),
(8, 'Viviana', 'Montilla', 'CC', '1061123280', ' Cll 30b las garzas', 0, 3127638900, 'vivian@gmail.com', 'vivian123', 2),
(9, 'Rodrigo Andres ', 'Papamija', 'CC', '1002968664', ' Cr 30bis #8-47', 0, 3207769460, 'rodrigo@gmail.com', 'rodrigo123', 2),
(10, 'Rosa Maria ', 'Quilindo', 'CC', '1061213489', ' Cr 9 cajete', 0, 3129836674, 'rosa@gmail.com', 'rosa123', 2),
(11, 'Omar', 'Ortiz', 'CC', '1061318303', ' Cll 13 3a 02-17', 0, 3124678301, 'omar@gmail.com', 'omar23', 3),
(12, 'Leonardo', 'Ceron', 'CC', '1061219303', ' Cll 2 0-9 san elena', 0, 3127968243, 'leonardo@gmail.com', 'leonardo2003', 3),
(13, 'Marcela', 'Perez', 'CC', '1061223280', ' Cll 30 bolibar', 0, 3137638900, ' marcela@gmail.com', 'marcela123', 3),
(14, 'Darwin', 'Narvaez', 'CC', '1087243678', '', 0, 3122986738, 'darwin@hotmail.com', 'darwin123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_detalle_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD PRIMARY KEY (`id_domicilios`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `id_detalle_compra` (`id_detalle_compra`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `Nit_restaurante` (`Nit_restaurante`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`Nit_restaurante`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `domicilios_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`),
  ADD CONSTRAINT `domicilios_ibfk_3` FOREIGN KEY (`id_detalle_compra`) REFERENCES `detalle_compra` (`id_detalle_compra`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Nit_restaurante`) REFERENCES `restaurante` (`Nit_restaurante`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD CONSTRAINT `restaurante_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
