CREATE TABLE tareas (
	id_tareas SERIAL PRIMARY KEY,
	titulo VARCHAR(50) NOT NULL,
	fecha DATE DEFAULT CURRENT_DATE,
	estado BOOLEAN DEFAULT false,
	id_usuario int,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)	
);

ALTER TABLE tareas
ADD descripcion TEXT;

ALTER TABLE tareas
ALTER COLUMN descripcion SET DATA TYPE VARCHAR(255);

ALTER TABLE tareas
RENAME COLUMN titulo TO cabecera;

INSERT INTO tareas(cabecera, id_usuario )
VALUES
('Creación y Planificación de Biologia', 1),
('Estudiar SQL', 2),
('Atender Pacientes', 3);


UPDATE tareas
	SET cabecera = 'Comprar un Microscopio', descripcion ='Microscopio para magnetismo molecular'
	WHERE  id_tareas = 1;
	

DELETE FROM tareas
WHERE id_tareas = 4;




SELECT * FROM tareas;



