CREATE TABLE `Categorias` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255),
  `descripcion` TEXT
);

CREATE TABLE `Proveedores` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255),
  `direccion` VARCHAR(255),
  `telefono` VARCHAR(50),
  `email` VARCHAR(255)
);

CREATE TABLE `Productos` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(255),
  `descripcion` TEXT,
  `precio` DECIMAL(10,2),
  `stock` INT,
  `categoria_id` INT,
  `proveedor_id` INT
);

CREATE TABLE `MovimientosInventario` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `producto_id` INT,
  `cantidad` INT,
  `tipo_movimiento` ENUM(entrada,salida),
  `fecha` DATETIME,
  `descripcion` TEXT
);

CREATE TABLE `Clientes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ruc` int,
  `nombre` VARCHAR(255),
  `direccion` VARCHAR(255),
  `telefono` VARCHAR(50),
  `email` VARCHAR(255)
);

CREATE TABLE `Ventas` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `fecha` DATETIME,
  `total` DECIMAL(10,2)
);

CREATE TABLE `DetalleVentas` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `venta_id` INT,
  `producto_id` INT,
  `cantidad` INT,
  `precio_unitario` DECIMAL(10,2)
);

ALTER TABLE `Productos` ADD FOREIGN KEY (`categoria_id`) REFERENCES `Categorias` (`id`);

ALTER TABLE `Productos` ADD FOREIGN KEY (`proveedor_id`) REFERENCES `Proveedores` (`id`);

ALTER TABLE `MovimientosInventario` ADD FOREIGN KEY (`producto_id`) REFERENCES `Productos` (`id`);

ALTER TABLE `Ventas` ADD FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id`);

ALTER TABLE `DetalleVentas` ADD FOREIGN KEY (`venta_id`) REFERENCES `Ventas` (`id`);

ALTER TABLE `DetalleVentas` ADD FOREIGN KEY (`producto_id`) REFERENCES `Productos` (`id`);
