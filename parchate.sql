-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2025 a las 05:08:35
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
-- Base de datos: `parchate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia_de_servicio`
--

CREATE TABLE `dia_de_servicio` (
  `id_dia_de_servicio` bigint(20) UNSIGNED NOT NULL,
  `dias_de_servicios` enum('dia de semana','fin de semana','toda la semana','lunes','martes','miercoles','jueves','viernes','sabado','domingo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id_evento` bigint(20) UNSIGNED NOT NULL,
  `nombre_evento` varchar(255) DEFAULT NULL,
  `descripcion_evento` varchar(255) DEFAULT NULL,
  `fecha_inicio_evento` date DEFAULT NULL,
  `hora_inicio_evento` time DEFAULT NULL,
  `presupuesto_evento` int(11) DEFAULT NULL,
  `id_usuario_negocio` bigint(20) UNSIGNED DEFAULT NULL,
  `estado_evento` enum('rechazado','en espera','aceptado') NOT NULL DEFAULT 'en espera',
  `fecha_de_creacion` datetime DEFAULT NULL,
  `ubicacion_dada_evento` varchar(255) DEFAULT NULL,
  `longitud` decimal(10,6) DEFAULT NULL,
  `latitud` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos_eventos_usuarios`
--

CREATE TABLE `favoritos_eventos_usuarios` (
  `id_favoritos_eventos_usuarios` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `id_evento` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos_sucursales_usuarios`
--

CREATE TABLE `favoritos_sucursales_usuarios` (
  `id_favoritos_sucursales_usuarios` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `id_sucursales` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guardados_sucursales_usuario`
--

CREATE TABLE `guardados_sucursales_usuario` (
  `id_guardados_sucursales_usuarios` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_guardado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_de_apertura`
--

CREATE TABLE `horarios_de_apertura` (
  `id_horarios` bigint(20) UNSIGNED NOT NULL,
  `horario` enum('Madrugada: de 00:00 a 5:00','Mañana: de 5:00 a 12:00','Tarde: de 12:00 a 18:00','Noche: de 18:00 a 00:00','24 horas') DEFAULT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_sucursal`
--

CREATE TABLE `horario_sucursal` (
  `id_horario_sucursal` bigint(20) UNSIGNED NOT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL,
  `id_horarios` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_evento`
--

CREATE TABLE `imagenes_evento` (
  `id_imagen` bigint(20) UNSIGNED NOT NULL,
  `ruta_imagen_evento` varchar(255) DEFAULT NULL,
  `id_evento` bigint(20) UNSIGNED DEFAULT NULL,
  `imagen_evento_orden` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_sucursal`
--

CREATE TABLE `imagenes_sucursal` (
  `id_imagen_sucursal` bigint(20) UNSIGNED NOT NULL,
  `ruta_imagen_sucursal` varchar(255) DEFAULT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL,
  `imagen_sucursal_orden` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_eventos`
--

CREATE TABLE `productos_eventos` (
  `id_producto_evento` bigint(20) UNSIGNED NOT NULL,
  `nombre_producto_evento` varchar(255) DEFAULT NULL,
  `precio_producto_evento` int(11) DEFAULT NULL,
  `id_evento` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_sucursal`
--

CREATE TABLE `productos_sucursal` (
  `id_producto_sucursal` bigint(20) UNSIGNED NOT NULL,
  `nombre_producto_sucursal` varchar(255) DEFAULT NULL,
  `precio_producto_sucursal` int(11) DEFAULT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguir_eventos_usuario`
--

CREATE TABLE `seguir_eventos_usuario` (
  `id_seguidos_evento_usuarios` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `id_evento` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_de_seguir` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` bigint(20) UNSIGNED NOT NULL,
  `nombre_sucursal` varchar(255) DEFAULT NULL,
  `descripcion_sucursal` varchar(255) DEFAULT NULL,
  `ubicacion_dada_sucursal` varchar(255) DEFAULT NULL,
  `longitud` decimal(10,6) DEFAULT NULL,
  `latitud` decimal(10,6) DEFAULT NULL,
  `promedio_productos` int(11) DEFAULT NULL,
  `id_dia_de_servicio` bigint(20) UNSIGNED DEFAULT NULL,
  `id_usuario_negocio` bigint(20) UNSIGNED DEFAULT NULL,
  `estado_sucursal` enum('rechazado','en espera','aceptado') NOT NULL DEFAULT 'en espera',
  `fecha_de_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_evento`
--

CREATE TABLE `tipo_de_evento` (
  `id_tipo_evento` bigint(20) UNSIGNED NOT NULL,
  `tipo_de_evento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_evento_que_tiene_evento`
--

CREATE TABLE `tipo_de_evento_que_tiene_evento` (
  `id_tipo_de_evento_que_tiene_evento` bigint(20) UNSIGNED NOT NULL,
  `id_evento` bigint(20) UNSIGNED DEFAULT NULL,
  `id_tipo_evento` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_sucursal`
--

CREATE TABLE `tipo_de_sucursal` (
  `id_tipo_de_sucursal` bigint(20) UNSIGNED NOT NULL,
  `tipo_de_sucursal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_sucursal_que_tiene_sucursal`
--

CREATE TABLE `tipo_de_sucursal_que_tiene_sucursal` (
  `id_tipo_de_sucursal_que_tiene_sucursal` bigint(20) UNSIGNED NOT NULL,
  `id_sucursal` bigint(20) UNSIGNED DEFAULT NULL,
  `id_tipo_sucursal` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador`
--

CREATE TABLE `usuario_administrador` (
  `correo_electronico_administrador` varchar(255) NOT NULL,
  `contraseña_administrador` varchar(255) DEFAULT NULL,
  `rol_del_administrador` enum('admin','lider') DEFAULT 'admin',
  `nombre_usuario_administrador` varchar(255) DEFAULT NULL,
  `numero_documentos_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_natural`
--

CREATE TABLE `usuario_natural` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `tipo_de_cuenta` enum('negocio','usuario') NOT NULL,
  `codigo_de_recuperacion_usuario_natural` varchar(255) DEFAULT NULL,
  `codigo_de_confirmacion_correo_electronico` varchar(255) DEFAULT NULL,
  `ruta_img_perfil` varchar(255) DEFAULT NULL,
  `longitud` decimal(10,6) DEFAULT NULL,
  `latitud` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_negocio`
--

CREATE TABLE `usuario_negocio` (
  `id_negocio` bigint(20) UNSIGNED NOT NULL,
  `correo_electronico_negocios` varchar(255) DEFAULT NULL,
  `codigo_confirmacion_correo_negocio` varchar(255) DEFAULT NULL,
  `nombre_negocio` varchar(255) DEFAULT NULL,
  `contraseña_negocio` varchar(255) DEFAULT NULL,
  `descripcion_negocio` varchar(255) DEFAULT NULL,
  `ruta_imagne_logo` varchar(255) DEFAULT NULL,
  `ruta_documentos_negocios` varchar(255) DEFAULT NULL,
  `tipo_de_cuenta` enum('negocio','usuario') NOT NULL,
  `codigo_recoperacion_contraseña_usuario_negocio` varchar(255) DEFAULT NULL,
  `estado_de_cuenta_negocio` enum('rechazada','en espera','aceptada') NOT NULL DEFAULT 'en espera'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tipo_evento`
--

CREATE TABLE `usuario_tipo_evento` (
  `id_usuario_tipo_evento` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `id_tipo_de_evento` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tipo_sucursal`
--

CREATE TABLE `usuario_tipo_sucursal` (
  `id_usuario_tipo_sucursal` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `id_tipo_de_sucursal` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dia_de_servicio`
--
ALTER TABLE `dia_de_servicio`
  ADD PRIMARY KEY (`id_dia_de_servicio`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_usuario_negocio` (`id_usuario_negocio`);

--
-- Indices de la tabla `favoritos_eventos_usuarios`
--
ALTER TABLE `favoritos_eventos_usuarios`
  ADD PRIMARY KEY (`id_favoritos_eventos_usuarios`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `favoritos_sucursales_usuarios`
--
ALTER TABLE `favoritos_sucursales_usuarios`
  ADD PRIMARY KEY (`id_favoritos_sucursales_usuarios`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_sucursales` (`id_sucursales`);

--
-- Indices de la tabla `guardados_sucursales_usuario`
--
ALTER TABLE `guardados_sucursales_usuario`
  ADD PRIMARY KEY (`id_guardados_sucursales_usuarios`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `horarios_de_apertura`
--
ALTER TABLE `horarios_de_apertura`
  ADD PRIMARY KEY (`id_horarios`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `horario_sucursal`
--
ALTER TABLE `horario_sucursal`
  ADD PRIMARY KEY (`id_horario_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_horarios` (`id_horarios`);

--
-- Indices de la tabla `imagenes_evento`
--
ALTER TABLE `imagenes_evento`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `imagenes_sucursal`
--
ALTER TABLE `imagenes_sucursal`
  ADD PRIMARY KEY (`id_imagen_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `productos_eventos`
--
ALTER TABLE `productos_eventos`
  ADD PRIMARY KEY (`id_producto_evento`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `productos_sucursal`
--
ALTER TABLE `productos_sucursal`
  ADD PRIMARY KEY (`id_producto_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `seguir_eventos_usuario`
--
ALTER TABLE `seguir_eventos_usuario`
  ADD PRIMARY KEY (`id_seguidos_evento_usuarios`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_evento` (`id_evento`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `id_dia_de_servicio` (`id_dia_de_servicio`),
  ADD KEY `id_usuario_negocio` (`id_usuario_negocio`);

--
-- Indices de la tabla `tipo_de_evento`
--
ALTER TABLE `tipo_de_evento`
  ADD PRIMARY KEY (`id_tipo_evento`);

--
-- Indices de la tabla `tipo_de_evento_que_tiene_evento`
--
ALTER TABLE `tipo_de_evento_que_tiene_evento`
  ADD PRIMARY KEY (`id_tipo_de_evento_que_tiene_evento`),
  ADD KEY `id_evento` (`id_evento`),
  ADD KEY `id_tipo_evento` (`id_tipo_evento`);

--
-- Indices de la tabla `tipo_de_sucursal`
--
ALTER TABLE `tipo_de_sucursal`
  ADD PRIMARY KEY (`id_tipo_de_sucursal`);

--
-- Indices de la tabla `tipo_de_sucursal_que_tiene_sucursal`
--
ALTER TABLE `tipo_de_sucursal_que_tiene_sucursal`
  ADD PRIMARY KEY (`id_tipo_de_sucursal_que_tiene_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `id_tipo_sucursal` (`id_tipo_sucursal`);

--
-- Indices de la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD PRIMARY KEY (`correo_electronico_administrador`);

--
-- Indices de la tabla `usuario_natural`
--
ALTER TABLE `usuario_natural`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- Indices de la tabla `usuario_negocio`
--
ALTER TABLE `usuario_negocio`
  ADD PRIMARY KEY (`id_negocio`),
  ADD UNIQUE KEY `correo_electronico_negocios` (`correo_electronico_negocios`),
  ADD UNIQUE KEY `uq_correo_negocio_usuario` (`correo_electronico_negocios`);

--
-- Indices de la tabla `usuario_tipo_evento`
--
ALTER TABLE `usuario_tipo_evento`
  ADD PRIMARY KEY (`id_usuario_tipo_evento`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_de_evento` (`id_tipo_de_evento`);

--
-- Indices de la tabla `usuario_tipo_sucursal`
--
ALTER TABLE `usuario_tipo_sucursal`
  ADD PRIMARY KEY (`id_usuario_tipo_sucursal`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_de_sucursal` (`id_tipo_de_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dia_de_servicio`
--
ALTER TABLE `dia_de_servicio`
  MODIFY `id_dia_de_servicio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos_eventos_usuarios`
--
ALTER TABLE `favoritos_eventos_usuarios`
  MODIFY `id_favoritos_eventos_usuarios` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos_sucursales_usuarios`
--
ALTER TABLE `favoritos_sucursales_usuarios`
  MODIFY `id_favoritos_sucursales_usuarios` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guardados_sucursales_usuario`
--
ALTER TABLE `guardados_sucursales_usuario`
  MODIFY `id_guardados_sucursales_usuarios` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios_de_apertura`
--
ALTER TABLE `horarios_de_apertura`
  MODIFY `id_horarios` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario_sucursal`
--
ALTER TABLE `horario_sucursal`
  MODIFY `id_horario_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_evento`
--
ALTER TABLE `imagenes_evento`
  MODIFY `id_imagen` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes_sucursal`
--
ALTER TABLE `imagenes_sucursal`
  MODIFY `id_imagen_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_eventos`
--
ALTER TABLE `productos_eventos`
  MODIFY `id_producto_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_sucursal`
--
ALTER TABLE `productos_sucursal`
  MODIFY `id_producto_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguir_eventos_usuario`
--
ALTER TABLE `seguir_eventos_usuario`
  MODIFY `id_seguidos_evento_usuarios` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_evento`
--
ALTER TABLE `tipo_de_evento`
  MODIFY `id_tipo_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_evento_que_tiene_evento`
--
ALTER TABLE `tipo_de_evento_que_tiene_evento`
  MODIFY `id_tipo_de_evento_que_tiene_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_sucursal`
--
ALTER TABLE `tipo_de_sucursal`
  MODIFY `id_tipo_de_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_de_sucursal_que_tiene_sucursal`
--
ALTER TABLE `tipo_de_sucursal_que_tiene_sucursal`
  MODIFY `id_tipo_de_sucursal_que_tiene_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_natural`
--
ALTER TABLE `usuario_natural`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_negocio`
--
ALTER TABLE `usuario_negocio`
  MODIFY `id_negocio` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_tipo_evento`
--
ALTER TABLE `usuario_tipo_evento`
  MODIFY `id_usuario_tipo_evento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_tipo_sucursal`
--
ALTER TABLE `usuario_tipo_sucursal`
  MODIFY `id_usuario_tipo_sucursal` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_usuario_negocio`) REFERENCES `usuario_negocio` (`id_negocio`);

--
-- Filtros para la tabla `favoritos_eventos_usuarios`
--
ALTER TABLE `favoritos_eventos_usuarios`
  ADD CONSTRAINT `favoritos_eventos_usuarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `favoritos_eventos_usuarios_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `favoritos_sucursales_usuarios`
--
ALTER TABLE `favoritos_sucursales_usuarios`
  ADD CONSTRAINT `favoritos_sucursales_usuarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `favoritos_sucursales_usuarios_ibfk_2` FOREIGN KEY (`id_sucursales`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `guardados_sucursales_usuario`
--
ALTER TABLE `guardados_sucursales_usuario`
  ADD CONSTRAINT `guardados_sucursales_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `guardados_sucursales_usuario_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `horarios_de_apertura`
--
ALTER TABLE `horarios_de_apertura`
  ADD CONSTRAINT `horarios_de_apertura_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `horario_sucursal`
--
ALTER TABLE `horario_sucursal`
  ADD CONSTRAINT `horario_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `horario_sucursal_ibfk_2` FOREIGN KEY (`id_horarios`) REFERENCES `horarios_de_apertura` (`id_horarios`);

--
-- Filtros para la tabla `imagenes_evento`
--
ALTER TABLE `imagenes_evento`
  ADD CONSTRAINT `imagenes_evento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `imagenes_sucursal`
--
ALTER TABLE `imagenes_sucursal`
  ADD CONSTRAINT `imagenes_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `productos_eventos`
--
ALTER TABLE `productos_eventos`
  ADD CONSTRAINT `productos_eventos_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `productos_sucursal`
--
ALTER TABLE `productos_sucursal`
  ADD CONSTRAINT `productos_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `seguir_eventos_usuario`
--
ALTER TABLE `seguir_eventos_usuario`
  ADD CONSTRAINT `seguir_eventos_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `seguir_eventos_usuario_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_dia_de_servicio`) REFERENCES `dia_de_servicio` (`id_dia_de_servicio`),
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`id_usuario_negocio`) REFERENCES `usuario_negocio` (`id_negocio`);

--
-- Filtros para la tabla `tipo_de_evento_que_tiene_evento`
--
ALTER TABLE `tipo_de_evento_que_tiene_evento`
  ADD CONSTRAINT `tipo_de_evento_que_tiene_evento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`),
  ADD CONSTRAINT `tipo_de_evento_que_tiene_evento_ibfk_2` FOREIGN KEY (`id_tipo_evento`) REFERENCES `tipo_de_evento` (`id_tipo_evento`);

--
-- Filtros para la tabla `tipo_de_sucursal_que_tiene_sucursal`
--
ALTER TABLE `tipo_de_sucursal_que_tiene_sucursal`
  ADD CONSTRAINT `tipo_de_sucursal_que_tiene_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `tipo_de_sucursal_que_tiene_sucursal_ibfk_2` FOREIGN KEY (`id_tipo_sucursal`) REFERENCES `tipo_de_sucursal` (`id_tipo_de_sucursal`);

--
-- Filtros para la tabla `usuario_tipo_evento`
--
ALTER TABLE `usuario_tipo_evento`
  ADD CONSTRAINT `usuario_tipo_evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `usuario_tipo_evento_ibfk_2` FOREIGN KEY (`id_tipo_de_evento`) REFERENCES `tipo_de_evento` (`id_tipo_evento`);

--
-- Filtros para la tabla `usuario_tipo_sucursal`
--
ALTER TABLE `usuario_tipo_sucursal`
  ADD CONSTRAINT `usuario_tipo_sucursal_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_natural` (`id_usuario`),
  ADD CONSTRAINT `usuario_tipo_sucursal_ibfk_2` FOREIGN KEY (`id_tipo_de_sucursal`) REFERENCES `tipo_de_sucursal` (`id_tipo_de_sucursal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
