-- Crear la base de datos
CREATE DATABASE escuela;

-- Usar la base de datos
USE escuela;

-- Crear la tabla estudiantes
CREATE TABLE estudiantes (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  email VARCHAR(50)
);

-- Crear la tabla maestros
CREATE TABLE maestros (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  email VARCHAR(50)
);

-- Crear la tabla cursos
CREATE TABLE cursos (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  descripcion VARCHAR(200),
  maestro_id INT,
  FOREIGN KEY (maestro_id) REFERENCES maestros(id)
);

-- Crear la tabla calificaciones
CREATE TABLE calificaciones (
  id INT PRIMARY KEY,
  estudiante_id INT,
  curso_id INT,
  calificacion DECIMAL(4,2),
  FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
  FOREIGN KEY (curso_id) REFERENCES cursos(id)
);


INSERT INTO estudiantes (id, nombre, apellido, fecha_nacimiento, email) VALUES
  (1, 'Juan', 'Pérez', '1999-03-20', 'juan.perez@example.com'),
  (2, 'María', 'García', '1998-06-12', 'maria.garcia@example.com'),
  (3, 'Carlos', 'Sánchez', '2000-01-01', 'carlos.sanchez@example.com'),
  (4, 'Ana', 'Rodríguez', '1997-12-15', 'ana.rodriguez@example.com'),
  (5, 'Pedro', 'Martínez', '1996-09-30', 'pedro.martinez@example.com'),
  (6, 'Lucía', 'Hernández', '1999-05-10', 'lucia.hernandez@example.com'),
  (7, 'Jorge', 'González', '1998-11-23', 'jorge.gonzalez@example.com'),
  (8, 'Sofía', 'Pérez', '2001-07-05', 'sofia.perez@example.com'),
  (9, 'Diego', 'Martínez', '1999-02-28', 'diego.martinez@example.com'),
  (10, 'Laura', 'García', '1997-04-03', 'laura.garcia@example.com'),
  (11, 'Manuel', 'Fernández', '2000-09-15', 'manuel.fernandez@example.com'),
  (12, 'Luisa', 'Sánchez', '1996-12-28', 'luisa.sanchez@example.com'),
  (13, 'Javier', 'García', '1998-08-01', 'javier.garcia@example.com'),
  (14, 'Marta', 'Pérez', '1997-03-14', 'marta.perez@example.com'),
  (15, 'Alejandro', 'Martínez', '1999-06-22', 'alejandro.martinez@example.com'),
  (16, 'Isabel', 'Hernández', '1998-11-12', 'isabel.hernandez@example.com'),
  (17, 'Daniel', 'González', '2001-02-17', 'daniel.gonzalez@example.com'),
  (18, 'Clara', 'García', '1997-09-05', 'clara.garcia@example.com'),
  (19, 'Marcos', 'Fernández', '2000-05-20', 'marcos.fernandez@example.com'),
  (20, 'Elena', 'Sánchez', '1999-01-08', 'elena.sanchez@example.com');
  
 INSERT INTO maestros (id, nombre, apellido, email) VALUES
  (1, 'Ana', 'Martínez', 'ana.martinez@example.com'),
  (2, 'Pedro', 'García', 'pedro.garcia@example.com'),
  (3, 'María', 'Sánchez', 'maria.sanchez@example.com'),
  (4, 'Luis', 'Pérez', 'luis.perez@example.com'),
  (5, 'Laura', 'Hernández', 'laura.hernandez@example.com');
 
 -- Insertar 5 registros en la tabla cursos
INSERT INTO cursos (id, nombre, descripcion, maestro_id) VALUES
  (1, 'Matemáticas', 'Curso de matemáticas avanzadas', 2),
  (2, 'Historia', 'Curso de historia antigua', 3),
  (3, 'Biología', 'Curso de biología molecular', 1),
  (4, 'Inglés', 'Curso de inglés avanzado', 5),
  (5, 'Programación', 'Curso de programación en Python', 4);

 -- Insertar 100 registros en la tabla calificaciones
 INSERT INTO calificaciones (id, estudiante_id, curso_id, calificacion) values
(1,1,1,9),
(2,1,2,9.4),
(3,1,3,5.6),
(4,1,4,10),
(5,1,5,9.7),
(6,2,1,9.4),
(7,2,2,6.9),
(8,2,3,9.1),
(9,2,4,9.3),
(10,2,5,9.9),
(11,3,1,6.9),
(12,3,2,8.1),
(13,3,3,8.8),
(14,3,4,10),
(15,3,5,9.6),
(16,4,1,5.1),
(17,4,2,6.7),
(18,4,3,6.2),
(19,4,4,6.9),
(20,4,5,10),
(21,5,1,10),
(22,5,2,5.6),
(23,5,3,7.5),
(24,5,4,5.2),
(25,5,5,10),
(26,6,1,9.3),
(27,6,2,7.6),
(28,6,3,5.3),
(29,6,4,7.3),
(30,6,5,7.1),
(31,7,1,6.4),
(32,7,2,9.1),
(33,7,3,6.6),
(34,7,4,7),
(35,7,5,8.8),
(36,8,1,9.2),
(37,8,2,9.2),
(38,8,3,6.8),
(39,8,4,10),
(40,8,5,7.8),
(41,9,1,9.5),
(42,9,2,10),
(43,9,3,5.8),
(44,9,4,7.1),
(45,9,5,10),
(46,10,1,8.5),
(47,10,2,8.3),
(48,10,3,9.5),
(49,10,4,6.7),
(50,10,5,9.8),
(51,11,1,7.6),
(52,11,2,6.4),
(53,11,3,8.3),
(54,11,4,6),
(55,11,5,10),
(56,12,1,7.5),
(57,12,2,8.4),
(58,12,3,5.1),
(59,12,4,5.6),
(60,12,5,10),
(61,13,1,10),
(62,13,2,8.4),
(63,13,3,9),
(64,13,4,7.8),
(65,13,5,6.8),
(66,14,1,9.7),
(67,14,2,10),
(68,14,3,10),
(69,14,4,10),
(70,14,5,7.6),
(71,15,1,6.1),
(72,15,2,5.9),
(73,15,3,9.9),
(74,15,4,8.7),
(75,15,5,5.1),
(76,16,1,7.7),
(77,16,2,7),
(78,16,3,9.3),
(79,16,4,7),
(80,16,5,5.3),
(81,17,1,7.4),
(82,17,2,10),
(83,17,3,9),
(84,17,4,10),
(85,17,5,5.9),
(86,18,1,9.4),
(87,18,2,6.7),
(88,18,3,8),
(89,18,4,6.9),
(90,18,5,8.5),
(91,19,1,10),
(92,19,2,10),
(93,19,3,5.2),
(94,19,4,7),
(95,19,5,5.6),
(96,20,1,7.4),
(97,20,2,9.6),
(98,20,3,5.7),
(99,20,4,8.4),
(100,20,5,9.4);