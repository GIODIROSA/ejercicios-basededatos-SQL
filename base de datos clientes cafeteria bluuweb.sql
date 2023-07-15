DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS ordenes;


CREATE TABLE clientes (
	cliente_id SERIAL PRIMARY KEY,
	cliente_nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
	producto_id SERIAL PRIMARY KEY,
	producto_nombre VARCHAR(80), 
	producto_precio NUMERIC(6,2) CHECK(producto_precio >= 0),
	producto_stock SMALLINT CHECK(producto_stock >= 0) DEFAULT 0,
	producto_tipo VARCHAR(80)
);


CREATE TABLE ordenes(
	orden_id SERIAL PRIMARY KEY,
	cliente_id INT REFERENCES clientes(cliente_id),
	producto_id INT REFERENCES productos(producto_id)
);

INSERT INTO clientes
(cliente_nombre)
VALUES 
('Maria'),
('Carmen'),
('Josefa'),
('Antonio'),
('José'),
('Manuel'),
('David'),
('Daniel');


INSERT INTO productos
(producto_nombre, producto_precio, producto_stock, producto_tipo)
VALUES
	('Latte', 2.50, 100, 'café'),
	('Cappuccino', 1.90, 100, 'café'),
	('Dulce de leche Latte', 20.50, 100, 'café'),
	('Café Americano', 3.50, 100, 'café'),
	('Iced Café Americano', 0.50, 100, 'ice café'),
	('Café Mocha', 50, 100, 'café'),
	('Caramel Macchiato', 3.2, 100, 'café'),
	('Iced Mocha', 2.50, 100, 'ice café'),
	('Mocha Blanco', 2.50, 0, null),
	('Vanilla Latte', 2.50, 100, 'té'),
	('Flat White', 2.50, 100, 'té'),
	('Espresso', 2.50, 100, 'café'),
	('Espresso Macchiato', 0.90, 0, 'café'),
	('Espresso Con Panna', 1.50, 100, 'café'),
	('Café Cortado', 3.50, 100, 'café'),
	('Torta Cuatro Leches', 4.50, 100, 'postre'),
	('Pie de Berries', 5.50, 0, 'postre'),
	('Bagel', 2.50, 100, 'postre'),
	('Donut Rellena', 6.50, 100, 'donut'),
	('Scone de 4 quesos', 7.50, 100, 'sandwich'),
	('Muffin Zanahoria Nuez', 8.50, 100, 'muffin'),
	('Media luna', 9.50, 100, 'donut'),
	('Pan de Queso', 11.50, 100, 'sandwich'),
	('Praline Cake', 12.50, 100, 'sandwich'),
	('Lemon Cake', 22.50, 100, null),
	('Muffin con Chips', 33.50, 100, 'muffin'),
	('Muffin de Arándano', 454.50, 10, 'muffin');
	
	
SELECT producto_nombre FROM productos;

SELECT producto_nombre, producto_precio FROM productos;

SELECT producto_nombre ||  ' el precio es: '  || producto_precio FROM productos;

SELECT producto_nombre ||  ' el precio es: '  || producto_precio AS "nombre y precio" FROM productos;

SELECT producto_nombre ||  ' el precio es: '  || producto_precio AS "nombre y precio", producto_stock FROM productos;

SELECT producto_nombre ||  ' el precio es: '  || producto_precio AS "nombre y precio", 
producto_stock * 100 AS "Valor" FROM productos;

--alias con espacio
SELECT producto_nombre ||  ' el precio es: '  || producto_precio "nombre y precio", 
producto_stock * 100 "Valor" FROM productos;


--order by
SELECT producto_nombre,
		producto_stock,
		producto_precio
FROM productos
ORDER BY producto_precio ASC;

--order by con la longitud del largo del nombre del producto
SELECT producto_nombre, 
		LENGTH (producto_nombre) AS "len"
FROM productos
ORDER BY len DESC;


SELECT
	DISTINCT producto_tipo
	FROM productos;

-- operadores comparativos
SELECT 
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_tipo = 'café';

SELECT
	producto_nombre,
	producto_tipo,
	producto_precio
FROM productos
WHERE producto_tipo = 'café' AND producto_precio > 3
ORDER BY producto_tipo, producto_precio ASC;

SELECT * FROM productos;
SELECT * FROM clientes;




