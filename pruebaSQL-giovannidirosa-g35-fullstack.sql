CREATE TABLE peliculas(
	pelicula_id SERIAL PRIMARY KEY, 
	titulo varchar(255) not null
);

CREATE TABLE tags(
 	tag_id SERIAL PRIMARY KEY,
	nombre varchar(255) not null
);

CREATE TABLE peluculas_tags(
	pelicula_id INT REFERENCES peliculas(pelicula_id),
    tag_id INT REFERENCES tags(tag_id)
);


--por equivocación cambio el nombre de la tabla.
ALTER TABLE peluculas_tags RENAME TO peliculas_tags;

--insertar una columna mas en tabla peliculas
ALTER TABLE peliculas ADD COLUMN anno varchar(50);

INSERT INTO peliculas (titulo, anno) VALUES
    ('Pelicula 1', 2020),
    ('Pelicula 2', 2019),
    ('Pelicula 3', 2021),
    ('Pelicula 4', 2018),
    ('Pelicula 5', 2022);
	
INSERT INTO tags (nombre) VALUES
    ('Tag 1'),
    ('Tag 2'),
    ('Tag 3'),
    ('Tag 4'),
    ('Tag 5');
	
-- Insertar relaciones muchos a muchos entre películas y tags
INSERT INTO peliculas_tags (pelicula_id, tag_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2),
    (2, 3);
	
	
-- Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0
SELECT p.titulo, count(pt.tag_id) as numero_tags
FROM peliculas p
LEFT JOIN peliculas_tags pt on p.pelicula_id = pt.pelicula_id
GROUP BY p.titulo;
	
	
SELECT * FROM peliculas;
SELECT * FROM tags;
SELECT * FROM peliculas_tags;


-- ///////////////////////////////////////////
-- inicio con el ejercicio 2. 

--4. Crea las tablas correspondientes respetando los nombres, tipos, claves primarias y foráneas y tipos de datos.

CREATE TABLE preguntas (
    pregunta_id SERIAL PRIMARY KEY,
    pregunta VARCHAR(255),
    respuesta_correcta VARCHAR(255)
);

CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    edad INTEGER
);

CREATE TABLE respuestas (
    respuesta_id SERIAL PRIMARY KEY,
    respuesta VARCHAR(255),
    usuario_id INT REFERENCES usuarios(usuario_id),
    pregunta_id INT REFERENCES preguntas(pregunta_id)
);


-- Agregar 5 usuarios
INSERT INTO usuarios (nombre, edad) VALUES
    ('Usuario 1', 25),
    ('Usuario 2', 30),
    ('Usuario 3', 28),
    ('Usuario 4', 22),
    ('Usuario 5', 35);
	
INSERT INTO preguntas (pregunta, respuesta_correcta) VALUES
    ('¿Cuál es la capital de Francia?', 'París'),
    ('¿Cuál es el río más largo del mundo?', 'Nilo'),
    ('¿En qué año comenzó la Segunda Guerra Mundial?', '1939'),
    ('¿Cuál es el símbolo químico del oro?', 'Au'),
    ('¿Cuál es la montaña más alta del mundo?', 'Monte Everest');
	

INSERT INTO respuestas (respuesta, usuario_id, pregunta_id) 
VALUES 
	('Paris', 1, 1), --Respuesta correcta por Usuario 1
	('Paris', 2, 1); --Respuesta correcta por Usuario 2
	
INSERT INTO respuestas (respuesta, usuario_id, pregunta_id) VALUES
    ('Nilo', 3, 2); -- Respuesta correcta por Usuario 3
	
	
-- Respuestas incorrectas para las otras tres preguntas
-- Pregunta 3 incorrecta para Usuario 1
INSERT INTO respuestas (respuesta, usuario_id, pregunta_id) VALUES
    ('1945', 1, 3);	
	
-- Pregunta 4 incorrecta para Usuario 4
INSERT INTO respuestas (respuesta, usuario_id, pregunta_id) VALUES
    ('Ag', 4, 4);
	
-- Pregunta 5 incorrecta para Usuario 5
INSERT INTO respuestas (respuesta, usuario_id, pregunta_id) VALUES
    ('K2', 5, 5);
	
SELECT * FROM usuarios;
SELECT * FROM preguntas;
SELECT * FROM respuestas;


-- Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta)
SELECT u.usuario_id AS usuario_id, u.nombre AS usuario_nombre, COUNT(r.respuesta_id) AS respuestas_correctas_totales
FROM usuarios u
LEFT JOIN respuestas r ON u.usuario_id = r.usuario_id
JOIN preguntas p ON r.pregunta_id = p.pregunta_id
WHERE r.respuesta = p.respuesta_correcta
GROUP BY u.usuario_id, u.nombre;


--Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios respondieron correctamente.
SELECT p.pregunta_id AS pregunta_id, p.pregunta, COUNT(r.respuesta_id) AS usuarios_correctos
FROM preguntas p
LEFT JOIN respuestas r ON p.pregunta_id = r.pregunta_id
WHERE r.respuesta = p.respuesta_correcta
GROUP BY p.pregunta_id, p.pregunta;

--Implementa un borrado en cascada de las respuestas al borrar un usuario. Prueba la implementación borrando el primer usuario.
ALTER TABLE respuestas
ADD CONSTRAINT usuario_id
FOREIGN KEY (usuario_id)
REFERENCES usuarios(usuario_id)
ON DELETE CASCADE;

DELETE FROM usuarios WHERE usuario_id = 1;

--Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.
ALTER TABLE usuarios
ADD CONSTRAINT edad CHECK (edad >= 18);


--Altera la tabla existente de usuarios agregando el campo email. Debe tener la restricción de ser único.
ALTER TABLE usuarios
ADD COLUMN email VARCHAR(255) UNIQUE;


SELECT * FROM usuarios;
SELECT * FROM preguntas;
SELECT * FROM respuestas;


