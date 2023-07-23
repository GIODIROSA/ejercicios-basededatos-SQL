

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)
-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares

SELECT producto_nombre, ROUND(producto_precio * 909, 1) AS Euros , producto_precio * 809 as Dolar 
FROM producto 
ORDER bY producto_nombre DESC;


-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula
SELECT (UPPER (producto_nombre)), producto_precio FROM producto ORDER BY producto_nombre;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula

SELECT (LOWER (producto_nombre)), producto_precio FROM producto ORDER BY producto_nombre;

--Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT producto_nombre, SUBSTRING(producto_nombre, 1,3) FROM producto ORDER BY producto_nombre DESC;

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT producto_nombre, round(producto_precio) FROM producto ORDER BY producto_precio DESC;


--Lista el identificador de los fabricantes que tienen productos en la tabla producto 
SELECT id_fabricante as "Id_fabricante" FROM producto ORDER BY id_fabricante DESC;

--Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos
SELECT id_fabricante FROM producto GROUP BY id_fabricante ORDER BY id_fabricante DESC;


--Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre_fabricante FROM fabricante ORDER BY nombre_fabricante ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre_fabricante FROM fabricante ORDER BY nombre_fabricante DESC;

--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente 

SELECT producto_nombre, producto_precio
from producto order by producto_nombre ASC, producto_precio DESC;

--Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante limit 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta

SELECT id_fabricante, nombre_fabricante FROM fabricante WHERE id_fabricante >= 4 limit 2;

SELECT *, ROW_NUMBER() OVER () FROM producto;

SELECT * FROM fabricante FETCH FIRST 4 ROWS ONLY;

SELECT rownum, * from (select row_number() over () rownum, * from fabricante) b where rownum >= 4 limit 2;

--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT producto_nombre, producto_precio FROM producto ORDER BY producto_precio ASC LIMIT 2;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT producto_nombre, producto_precio FROM producto ORDER BY producto_precio DESC LIMIT 2;

--Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT  id_fabricante, nombre_fabricante FROM fabricante WHERE id_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€
SELECT producto_nombre, producto_precio FROM producto WHERE producto_precio <= 120 ORDER BY producto_precio DESC;


-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT producto_nombre, producto_precio FROM producto WHERE producto_precio >= 400 ORDER BY producto_precio ASC;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT producto_nombre, producto_precio FROM producto WHERE producto_precio < 400 ORDER BY producto_precio ASC;


--Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN
SELECT * FROM producto WHERE NOT producto_precio >= 400 ORDER BY producto_precio ASC;
SELECT * FROM producto WHERE NOT producto_precio BETWEEN 80 and 300 ORDER BY producto_precio ASC;



--Lista todos los productos que tengan un precio entre 60€ y 200€. Sin utilizar el operador BETWEEN
SELECT * FROM producto WHERE NOT producto_precio >= 300 Order by producto_precio asc;
SELECT * FROM producto WHERE producto_precio BETWEEN 60 AND 200 Order by producto_precio asc;

--Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT * FROM producto WHERE id_fabricante = 6 and producto_precio > 200;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select id_fabricante from fabricante where mod(id_fabricante, 2) <> 0;


--Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto where id_fabricante in (1,3,5);


--Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos
select producto_nombre, round((producto_precio * 100), 2) as "céntimos" from producto; 


--Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
select nombre_fabricante from fabricante where nombre_fabricante LIKE 'S%';

--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
select nombre_fabricante from fabricante where nombre_fabricante LIKE '%e';

--Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre_fabricante from fabricante where nombre_fabricante like '%w%';

--Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres
select nombre_fabricante, LENGTH(nombre_fabricante) as "lenght nombre" from fabricante Order by "lenght nombre" ASC;

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nom-bre.
select producto_nombre from producto where producto_nombre LIKE 'Portátil %';

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €
select producto_nombre, producto_precio from producto Where producto_nombre LIKE 'Monitor %' and producto_precio < 215;


--Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

select producto_nombre, producto_precio from producto where producto_precio >= 180 order by producto_precio DESC, producto_nombre ASC;







SELECT * FROM fabricante;
SELECT * FROM producto;
