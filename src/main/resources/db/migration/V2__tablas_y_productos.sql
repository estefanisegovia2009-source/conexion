-- V2__tablas_y_productos.sql
-- Productos y precios publicados por CasaAmor al 07/11/2026.
-- El stock=10 es de prueba.
-- Fuente: https://casaamor.com.ar/productos?cat=bazar

CREATE TABLE categorias (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias (id, nombre, descripcion) VALUES
    (1, 'Tazas y vajilla', 'Tazas y artículos para servir.'),
    (2, 'Vasos y copas', 'Vasos y copas de vidrio.'),
    (3, 'Botellas y jarras', 'Botellas, jarras y sets para bebidas.'),
    (4, 'Sorbetes y cucharas', 'Sorbetes reutilizables y sets de cucharas.'),
    (5, 'Bandejas y accesorios', 'Accesorios de mesa y organización.');

ALTER TABLE productos
    MODIFY COLUMN nombre VARCHAR(150) NOT NULL,
    ADD COLUMN descripcion TEXT NULL,
    ADD COLUMN categoria_id INT NULL,
    ADD COLUMN imagen VARCHAR(255) NULL,
    ADD CONSTRAINT fk_productos_categorias
        FOREIGN KEY (categoria_id) REFERENCES categorias(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL;

CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NULL,
    direccion VARCHAR(200) NULL,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pedidos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT fk_pedidos_usuarios
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE detalles_pedido (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_detalles_pedido_cantidad CHECK (cantidad > 0),
    CONSTRAINT fk_detalles_pedido_pedidos
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detalles_pedido_productos
        FOREIGN KEY (producto_id) REFERENCES productos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE carrito (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    fecha_agregado DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_carrito_cantidad CHECK (cantidad > 0),
    CONSTRAINT uq_carrito_usuario_producto UNIQUE (usuario_id, producto_id),
    CONSTRAINT fk_carrito_usuarios
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_carrito_productos
        FOREIGN KEY (producto_id) REFERENCES productos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pagos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    estado_pago VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_pagos_monto CHECK (monto >= 0),
    CONSTRAINT fk_pagos_pedidos
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE resenas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    usuario_id INT NOT NULL,
    calificacion INT NOT NULL,
    comentario TEXT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_resenas_calificacion CHECK (calificacion BETWEEN 1 AND 5),
    CONSTRAINT uq_resenas_usuario_producto UNIQUE (usuario_id, producto_id),
    CONSTRAINT fk_resenas_productos
        FOREIGN KEY (producto_id) REFERENCES productos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_resenas_usuarios
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE envios (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL UNIQUE,
    empresa_envio VARCHAR(100) NULL,
    codigo_seguimiento VARCHAR(100) NULL,
    estado_envio VARCHAR(50) NOT NULL DEFAULT 'En preparación',
    CONSTRAINT fk_envios_pedidos
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id, imagen) VALUES
    ('Bandeja Liam', NULL, 13950.00, 10, 5, NULL),
    ('Taza Paraíso', NULL, 7700.00, 10, 1, NULL),
    ('Set x2 vasos vidrio rayado con puntos 250 ml', NULL, 11475.00, 10, 2, NULL),
    ('Set x2 copas champagne rectas vidrio perlado', NULL, 24200.00, 10, 2, NULL),
    ('Set botella y vaso', NULL, 48113.00, 10, 3, NULL),
    ('Copa Shine recta verde set x2', NULL, 21200.00, 10, 2, NULL),
    ('Set sorbete acero plateado/dorado', NULL, 1150.00, 10, 4, NULL),
    ('Azucarera', NULL, 7600.00, 10, 5, NULL),
    ('Taza labrada', NULL, 13600.00, 10, 1, NULL),
    ('Bandeja SeaGrass chica', NULL, 9000.00, 10, 5, NULL),
    ('Lata Vintage Café', NULL, 12250.00, 10, 5, NULL),
    ('Vaso Burbuja 350 ml', NULL, 4400.00, 10, 2, NULL),
    ('Porta taza bambú', NULL, 13250.00, 10, 5, NULL),
    ('Vaso doble vidrio 200 ml', NULL, 9900.00, 10, 2, NULL),
    ('Botella tornasolada ámbar 1 L', NULL, 10700.00, 10, 3, NULL),
    ('Botella de noche ámbar', NULL, 14950.00, 10, 3, NULL),
    ('Botella de noche transparente', NULL, 14950.00, 10, 3, NULL),
    ('Taza Nube 500 ml', NULL, 6950.00, 10, 1, NULL),
    ('Vaso doble vidrio acanalado 450 cc', NULL, 7450.00, 10, 2, NULL),
    ('Vaso doble vidrio 250 cc', NULL, 5500.00, 10, 2, NULL),
    ('Vaso doble vidrio 360 cc', NULL, 6950.00, 10, 2, NULL),
    ('Vasos vidrio rayas transparente x6', NULL, 25100.00, 10, 2, NULL),
    ('Sorbete recto vidrio corazón x2', NULL, 8150.00, 10, 4, NULL),
    ('Sorbete vidrio ondas x4', NULL, 11250.00, 10, 4, NULL),
    ('Sorbete vidrio frutas x4', NULL, 9500.00, 10, 4, NULL),
    ('Sorbete vidrio verano x4', NULL, 9350.00, 10, 4, NULL),
    ('Sorbete vidrio colores x6', NULL, 5850.00, 10, 4, NULL),
    ('Sorbete vidrio limón x4', NULL, 9500.00, 10, 4, NULL),
    ('Sorbete vidrio corazón colores x4', NULL, 7900.00, 10, 4, NULL),
    ('Sorbete recto vidrio bambú verde x4', NULL, 6900.00, 10, 4, NULL),
    ('Sorbete recto vidrio colores x4', NULL, 4400.00, 10, 4, NULL),
    ('Sorbete recto vidrio arcoíris x4', NULL, 7200.00, 10, 4, NULL),
    ('Set cucharas Navidad x4', NULL, 21150.00, 10, 4, NULL),
    ('Set cucharas clásica x6', NULL, 8950.00, 10, 4, NULL),
    ('Set cucharas Loto x6', NULL, 19700.00, 10, 4, NULL),
    ('Set cucharas Abeja x6', NULL, 21600.00, 10, 4, NULL),
    ('Set cucharas Margaritas x6', NULL, 14100.00, 10, 4, NULL),
    ('Set cucharas Frutas x4', NULL, 13750.00, 10, 4, NULL),
    ('Set cucharas Corazón x6', NULL, 12200.00, 10, 4, NULL),
    ('Vaso vidrio rayas chico x6', NULL, 23100.00, 10, 2, NULL),
    ('Botella de vidrio Aqua', NULL, 11600.00, 10, 3, NULL),
    ('Botella vidrio Marino', NULL, 11600.00, 10, 3, NULL),
    ('Jarra cónica con 4 vasos', NULL, 34950.00, 10, 3, NULL),
    ('Taza y plato Corazón', NULL, 34250.00, 10, 1, NULL),
    ('Taza y plato Cookies', NULL, 35850.00, 10, 1, NULL),
    ('Taza Tulipán Lavanda', NULL, 19250.00, 10, 1, NULL),
    ('Taza Corazones Rombo', NULL, 19650.00, 10, 1, NULL),
    ('Taza asa corazón', NULL, 19650.00, 10, 1, NULL),
    ('Taza Flores', NULL, 19250.00, 10, 1, NULL),
    ('Taza Corazoncitos', NULL, 19250.00, 10, 1, NULL);