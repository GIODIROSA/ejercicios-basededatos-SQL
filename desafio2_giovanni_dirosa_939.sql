CREATE TABLE inscritos(
	id SERIAL PRIMARY KEY,
	cantidad INT,
	fecha DATE, 
	fuente VARCHAR(50)
);

INSERT INTO inscritos (cantidad, fecha, fuente)
VALUES
	(44,'2023-07-12','página'),
	(44,'2020/01/01','Blog'),
	(56,'2021/01/01','Página'),
	(39,'2021/02/01','Blog'),
	(81,'2021/02/01','Página'),
	(12,'2021/03/01','Blog'),
	(91,'2021/03/01','Página'),
	(48,'2021/04/01','Blog'),
	(45,'2021/04/01','Página'),
	(55,'2021/05/01','Blog'),
	(33,'2021/05/01','Página'),
	(18,'2021/06/01','Blog'),
	(12,'2021/06/01','Página'),
	(34,'2021/07/01','Blog'),
	(24,'2021/07/01','Página'),
	(83,'2021/08/01','Blog'),
	(99,'2021/08/01','Página');
	

-- Preguntas y respuestas:

-- 1 ¿Cuántos registros hay?;
SELECT COUNT(*) FROM inscritos;

-- 2 ¿Cuantos inscritos hay en total?
SELECT SUM(cantidad) as "Total usuarios" FROM inscritos;

-- 3 ¿Cuál o cuáles son los registros de mayor antiguedad?
SELECT * FROM inscritos WHERE fecha = (SELECT min(fecha) FROM inscritos);

-- 4 ¿Cuántos inscritos hay por día?
SELECT fecha, SUM(cantidad) as total from inscritos GROUP BY fecha ORDER BY total DESC;

-- 5 ¿Cuantos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) as total FROM inscritos GROUP BY fuente ORDER BY total DESC;

-- 6 ¿Qué día se inscribió la mayor cantidad de personas? ¿Cuantas personas se inscribieron ese día?
SELECT fecha, SUM(cantidad) as total_persona FROM inscritos GROUP BY fecha ORDER BY total_persona DESC;

-- 7 ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog?¿Cuántas personas fueron?
SELECT fecha, SUM(cantidad) as total FROM inscritos WHERE fuente = 'Blog' GROUP BY fecha ORDER BY total DESC;

-- 8 ¿Cúal es el promedio de personas inscritas por día? 
SELECT fecha, round(AVG(cantidad), 1) FROM inscritos GROUP BY fecha;

-- 9 ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha having SUM(cantidad) > 50 ORDER BY total DESC;

-- 10 ¿Cuál es el promedio diario de personas inscritas a partir del tercer día en adelante, considerando únicamente las fechas posteriores o iguales a la indicada?
SELECT fecha, ROUND(AVG(cantidad),1) from inscritos WHERE fecha BETWEEN '2021-07-01' and '2021-12-31' GROUP BY fecha;












	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

SELECT * FROM inscritos;
