

CREATE TABLE usuarios(
	usuario_id SERIAL PRIMARY KEY,
	usuario_email VARCHAR(50) NOT NULL,
	usuario_nombre VARCHAR(50) NOT NULL,
	usuario_apellido VARCHAR(50) NOT NULL,
	usuario_rol VARCHAR(50)
);

INSERT INTO usuarios (usuario_email, usuario_nombre, usuario_apellido, usuario_rol)
VALUES
('cnavarrete@flagare.cl', 'Claudio', 'Navarrete', 'Administrador' ),
('vmunoz@flagare.cl', 'Valentina', 'Muñoz', 'Usuario'),
('gdirosa@flagare.cl', 'Giovanni', 'Di Rosa', 'Administrador'),
('vvalera@flagare.cl', 'Violeta', 'Valera', 'Usuario'),
('gfigueroa@flagare.cl', 'Gabriela', 'Figueroa', 'Usuario');


CREATE TABLE posts(
	posts_id SERIAL PRIMARY KEY,
	post_titulo VARCHAR(80),
	post_contenido TEXT,
	post_destacado BOOLEAN,
	fecha_creación TIMESTAMP,
	fecha_actualizacion TIMESTAMP,
	usuario_id INT REFERENCES usuarios(usuario_id)
);


INSERT INTO posts (post_titulo, post_contenido, post_destacado, usuario_id)
VALUES
('Post1', 'loremipsum1', true, 1),
('Post2', 'loremipsum2', true, 3),
('Post3', 'loremipsum3', false, 4),
('Post4', 'loremipsum4', true, 2),
('Post5', 'loremipsum5', false, null);

-- SE CORRIGE EL INGRESO DE LA FECHA 

UPDATE posts
SET fecha_creación = CURRENT_TIMESTAMP, fecha_actualizacion = CURRENT_TIMESTAMP
WHERE postS_id = 1;

UPDATE posts
SET fecha_creación = CURRENT_TIMESTAMP, fecha_actualizacion = CURRENT_TIMESTAMP
WHERE postS_id = 2;

UPDATE posts
SET fecha_creación = CURRENT_TIMESTAMP, fecha_actualizacion = CURRENT_TIMESTAMP
WHERE postS_id = 3;

UPDATE posts
SET fecha_creación = CURRENT_TIMESTAMP, fecha_actualizacion = CURRENT_TIMESTAMP
WHERE postS_id = 4;

UPDATE posts
SET fecha_creación = CURRENT_TIMESTAMP, fecha_actualizacion = CURRENT_TIMESTAMP
WHERE postS_id = 5;


CREATE TABLE comentarios(
	comentarios_id SERIAL PRIMARY KEY,
	fecha_creacion_comentario TIMESTAMP,
	usuario_id INT REFERENCES usuarios(usuario_id),
	posts_id INT REFERENCES posts(posts_id)
);

--practica de ingreso de columna en la tabla.
ALTER TABLE comentarios add contenido TEXT;


INSERT INTO comentarios (fecha_creacion_comentario, usuario_id, posts_id)
VALUES 
(CURRENT_TIMESTAMP, 1, 1),
(CURRENT_TIMESTAMP, 2, 2),
(CURRENT_TIMESTAMP, 3, 3),
(CURRENT_TIMESTAMP, 1, 2),
(CURRENT_TIMESTAMP, 2, 2);

-- consultas: 
-- Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas. nombre e email del usuario junto al título y contenido del post
SELECT *
FROM usuarios AS us
INNER JOIN posts AS pt
ON us.usuario_id = pt.usuario_id;

SELECT us.usuario_nombre, us.usuario_email, pt.post_titulo, pt.post_contenido 
FROM usuarios AS us
FULL JOIN posts AS pt
ON us.usuario_id = pt.usuario_id;

-- Muestra el id, título y contenido de los posts de los administradores. El administrador puede ser cualquier id y debe ser seleccionado dinámicamente

SELECT pt.posts_id, pt.post_titulo, pt.post_contenido, us.usuario_rol
FROM posts as pt
inner JOIN usuarios as us
ON pt.usuario_id = us.usuario_id
WHERE us.usuario_rol = 'Administrador';


-- Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id e email del usuario junto con la cantidad de posts de cada usuario


select u.usuario_id, u.usuario_email  
from usuarios u, posts p, comentarios co
where u.usuario_id = p.usuario_id and co.posts_id = u.usuario_id;


select count(posts_id) as cantidad from comentarios where posts_id = usuario_id;


-- Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene un único registro y muestra solo el email.

select posts_id, usuario_id from comentarios group by posts_id, usuario_id having count(*)>1;

SELECT COUNT(co.posts_id) as cantidad, us.usuario_email, us.usuario_id
FROM comentarios as co
inner join usuarios as us
on co.posts_id = us.usuario_id
group by co.posts_id, us.usuario_email, us.usuario_id;


-- Muestra la fecha del último post de cada usuario.

select max(fecha_creación) as ultima from posts Group by fecha_creación order by ultima desc;

SELECT MAX(pt.fecha_creación) as ultima, us.usuario_nombre
FROM posts as pt
inner join usuarios as us
on pt.posts_id = us.usuario_id
group by pt.posts_id, us.usuario_id, us.usuario_nombre
order by ultima asc;


--Muestra el título y contenido del post (artículo) con más comentarios.

UPDATE comentarios
SET contenido = 'contenido1' 
WHERE comentarios_id = 1;

UPDATE comentarios
SET contenido = 'contenido2' 
WHERE comentarios_id = 2;

UPDATE comentarios
SET contenido = 'contenido3' 
WHERE comentarios_id = 3;

UPDATE comentarios
SET contenido = 'contenido4' 
WHERE comentarios_id = 4;

UPDATE comentarios
SET contenido = 'contenido5' 
WHERE comentarios_id = 5;

-- se rectifica los datos en la tabla comentarios.
--Los comentarios con id 1,2 y 3 deben estar asociado al post 1, a los usuarios 1, 2 y 3 respectivamente.

update comentarios set posts_id = 1 where comentarios_id = 2;  
update comentarios set posts_id = 1 where comentarios_id = 3; 

--Muestra el título y contenido del post (artículo) con más comentarios.

SELECT COUNT(co.posts_id) as comentarios, pt.post_titulo, pt.posts_id
FROM comentarios as co
inner join posts as pt
on co.posts_id = pt.posts_id
group by co.posts_id, pt.post_titulo, pt.posts_id;


--Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
--de cada comentario asociado a los posts mostrados, junto con el email del usuario
--que lo escribió.

select pt.post_titulo, co.contenido, pt.post_contenido, u.usuario_email
from comentarios co, posts pt, usuarios  u
where co.posts_id = pt.posts_id and pt.posts_id = u.usuario_id;

-- Muestra el contenido del último comentario de cada usuario.


select co.contenido, pt.usuario_id 
from comentarios co
inner join posts pt
on co.comentarios_id = pt.posts_id;

select co.contenido, pt.usuario_id 
from comentarios co
left join posts pt
on co.comentarios_id = pt.posts_id
where co.fecha_creacion_comentario = (select max(fecha_creacion_comentario) from comentarios c2 where c2.usuario_id = usuario_id);




--Muestra los emails de los usuarios que no han escrito ningún comentario
-- rectifica la tabla de comentarios

update comentarios set posts_id = 2 where comentarios_id = 5; 
update comentarios set usuario_id = 2 where comentarios_id = 5; 

select u.usuario_email
from usuarios u
left join comentarios co
on u.usuario_id = co.usuario_id
where co.comentarios_id is null;




SELECT * FROM usuarios;
SELECT * FROM posts;
SELECT * FROM comentarios ordeR by comentarios_id ASC;