CREATE TABLE clientes (
cliente_id SERIAL PRIMARY KEY,
cliente_nombre VARCHAR (50) NOT NULL,
cliente_telefono VARCHAR(16),
cliente_email VARCHAR(50),
cliente_empresa VARCHAR(50),
cliente_prioridad SMALLINT CHECK(cliente_prioridad >= 0) DEFAULT 0
);


INSERT INTO clientes (cliente_nombre, cliente_telefono, cliente_email, cliente_empresa, cliente_prioridad)
VALUES
('Felipe Diaz', '930786798', 'fdiaz@gmail.com', 'Flagare', 5),
('Claudio Navarrete', '930781876', 'cnavarrete@gmail.com', 'Flagare', 10),
('Giovanni Di Rosa', '930781873', 'gdirosa@gmail.com', 'Universo SPA', 10),
('David Martinez', '930781878', 'dmartinez@gmail.com', 'Municipalidad de Quilicura', 10),
('Gabriela Figueroa', '930782879', 'gfigueroa@gmail.com', 'Mar del sur', 3),
('Andrea Vidal', '930782886', 'avidal@gmail.com', 'Colegio Belen O´Higgins', 2),
('Dino Di Rosa', '930782883', 'ddirosa@gmail.com', 'Cendit', 6);

SELECT cliente_prioridad, cliente_nombre FROM clientes WHERE cliente_prioridad = 10 ORDER BY cliente_nombre DESC LIMIT 3;

SELECT * FROM clientes WHERE cliente_prioridad = 10;

INSERT INTO clientes (cliente_nombre, cliente_telefono, cliente_email, cliente_empresa, cliente_prioridad)
VALUES
('Valentina Muñoz', '931786788', 'vmunoz@gmail.com', 'Flagare', 5),
('Claudio Navarrete', '930781876', 'cnavarrete@gmail.com', 'Universo SPA', 10);


DELETE FROM clientes WHERE cliente_id = 9;

SELECT * FROM clientes WHERE cliente_prioridad = 10 or cliente_empresa = 'Flagare' LIMIT 2; 

SELECT * FROM CLIENTES;

