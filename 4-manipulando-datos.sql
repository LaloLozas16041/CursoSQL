/* 1. Crear base de datos
CREATE DATABASE nombre_base_de_datos;
*/

DROP DATABASE LIBRERIA;

CREATE DATABASE LIBRERIA;

/* 2. Eliminar base de datos
DROP DATABASE nombre_base_de_datos;
*/

DROP DATABASE LIBRERIA1;

/* 3. Crear tabla dentro de base de datos
No se pueden sobreescribir, en caso de que exista la tabla mandará error

USE nombre_base_de_datos
CREATE TABLE nombre_tabla (
	nombre_columna tipo_dato,
    nombre_columna tipo_dato,
    nombre_columna tipo_dato,
)
*/

USE libreria;

CREATE TABLE AUTORES (
	ID_AUTOR INT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL,
    FECHA_NACIMIENTO DATE
);

CREATE TABLE LIBROS (
	ID_LIBRO INT PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL DEFAULT 'Anonimo',
    FECHA DATE,
    ID_AUTOR INT,
    GENERO VARCHAR(50) DEFAULT 'Sin clasificar',
    foreign key (ID_AUTOR) references AUTORES(ID_AUTOR)
);

CREATE TABLE INVENTARIO (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_LIBRO INT,
    EXISTENCIA INT NOT NULL,
    VENDIDOS INT NOT NULL,
    foreign key (ID_LIBRO) references LIBROS(ID_LIBRO)
);

/*Los tipos de datos disponibles son:
VARCHAR(LENGTH), INT, FLOAT, DATE, BOOLEAN

Algunos otros comandos que se utilizan para definir una tabla son:
* PRIMARY KEY: Ya va implícito que debe ser única y no puede ser nula
* NOT NULL: Los valores no puedan ser nulos
* UNIQUE: No se repitan los valores
* FOREIGN KEY (variable) REFERENCES tabla(variable): Sirve para relacionar una variable con la llave primaria de otra tabla
* DEFAULT: valor en caso de omitir la columna al ingresar información
* AUTO_INCREMENT: Aumentar en una unidad una variable sin necesidad de introducir su valor
*/

/* 4. Modificar estructura de la tabla
ALTER TABLE nombre_tabla
ADD column ## Añadir columnas
DROP column ## Borrar columnas
MODIFY column tipo_de_dato ## Modificar columnas
*/

ALTER TABLE AUTORES
ADD NACIONALIDAD VARCHAR(20);

ALTER TABLE AUTORES
MODIFY NACIONALIDAD VARCHAR(30) DEFAULT "Desconocida";

/* 5. Eliminar una tabla
DROP TABLE nombre_tabla;
*/

CREATE TABLE tabla_error (
	id INT PRIMARY KEY,
    id2 INT
);

DROP TABLE tabla_error;

/* 5. Insertando datos en la tabla

INSERT INTO nombre_tabla (columna1, columna2, ...)
VALUES
(valor1, valor2, ...),
(valor1, valor2, ...);

*/

INSERT INTO AUTORES (ID_AUTOR, NOMBRE, FECHA_NACIMIENTO, NACIONALIDAD)
VALUES
	(1, "Gabriel García Márquez", '1927-03-06', "Colombiano");

INSERT INTO AUTORES
VALUES
	(2, "Octavio Paz", '1914-03-31', "Mexicano");

INSERT INTO AUTORES (Nombre, ID_AUTOR, NACIONALIDAD)
VALUES
	("Sheldon Ross", 3, 'Estadounidense');

INSERT INTO LIBROS (ID_LIBRO, NOMBRE, FECHA, ID_AUTOR, GENERO)
VALUES
	(1, "Cien años de soledad", '1967-05-01', 1, "Novela");
    
INSERT INTO LIBROS (ID_LIBRO, NOMBRE, FECHA, ID_AUTOR, GENERO)
VALUES
	(2, "A first course in probability", '2006-10-01', 3, "Educativo"),
    (3, "El laberinto de la soledad", '1950-01-01', 2, "Narrativo");

INSERT INTO INVENTARIO (ID_LIBRO, EXISTENCIA, VENDIDOS)
VALUES
	(3, 5, 3),
    (2, 10, 4),
    (1, 2, 10);

/* Se puede insertar datos desde una consulta
INSERT INTO nombre_tabla (columna1, columna2, ...)
Consulta;
*/

### Supongamos que tenemos una tabla que se llama "jovenes_promesas"
/*
INSERT INTO autores (id, nombre, nacionalidad, fecha_nacimiento)
SELECT id, nombre, nacionalidad, fecha_nacimiento
FROM escuela.jovenes_promesas
WHERE numero_libros > 10;
*/

/* 6. Actualizar datos en tablas
UPDATE nombre_tabla
SET columna1 = valor1, columna2 = valor2, ...
WHERE condicion;
*/

SELECT * FROM autores;

UPDATE autores
SET FECHA_NACIMIENTO = '1950-01-01'
WHERE ID_AUTOR = 3;

SELECT * FROM autores;

UPDATE autores
SET FECHA_NACIMIENTO = '1960-01-01', Nacionalidad = 'Inglés'
WHERE ID_AUTOR = 3;

SELECT * FROM autores;

UPDATE autores
SET Nacionalidad = 'Mexicano'
WHERE ID_AUTOR = 2;

UPDATE autores
SET Nacionalidad = 'Estadounidense'
WHERE ID_AUTOR = 3;

SELECT * FROM autores;

/* 7. Eliminar datos en tablas 
DELETE FROM nombre_tabla
WHERE condicion;

DELETE FROM nombre_tabla;
*/

SELECT * FROM inventario;

DELETE FROM inventario
WHERE ID = 4;

SELECT * FROM inventario;

DELETE FROM inventario
WHERE ID > 4;

SELECT * FROM inventario;

DELETE FROM inventario
WHERE ID >= 1;

SELECT * FROM inventario;

## Eliminar los registros de una tabla
TRUNCATE TABLE inventario;