USE escuela; 

-- Revisar contenido de base de datos "escuela"
show tables;

-- Revisar columnas de cada tabla en la base de datos
show columns from estudiantes;
show columns from maestros;
show columns from cursos;
show columns from calificaciones;

-- Visualizar tabla estudiantes

### 1. SELECT
/* Sintaxis básica
SELECT columnas_a_mostrar
FROM tabla;
*/

show columns from calificaciones;

SELECT curso_id, calificacion 
FROM calificaciones;

SELECT nombre, email
FROM estudiantes;

### Seleccionar todas las columnas (variables) de la tabla cursos
SELECT *
FROM cursos;

### Si solo queremos las columnas nombre y descripcion
SELECT nombre, descripcion
FROM cursos;

-- CLAUSULA WHERE
## Nos ayuda a filtrar registros
## Sintaxis básica
/*
SELECT columna1, columna2, ..., columnaN
FROM tabla
WHERE condicion;
*/

SELECT nombre, apellido, fecha_nacimiento 
FROM estudiantes
WHERE fecha_nacimiento >= '2000-01-01';

SELECT nombre, apellido, fecha_nacimiento 
FROM estudiantes
WHERE id = 1;

## Obtener las calificaciones del estudiante con id 1, y del curso 3
SELECT *
FROM calificaciones
WHERE estudiante_id = 1 AND curso_id = 3;

## Calificaciones reprobados (<6) del curso 4
SELECT *
FROM calificaciones
WHERE calificacion < 6 AND curso_id = 4;

## Calificaciones de los alumnos 1 y 6
SELECT *
FROM calificaciones
WHERE estudiante_id = 1 OR estudiante_id = 6;

### 3. ORDER BY
## Nos ayuda a ordenar las consultas de acuerdo a la columna elegida
# Sintáxis básica
/*SELECT columna1, columna2,
FROM tabla
ORDER BY columna1 ASC|DESC, columna2 ASC|DESC; */

## Ordenar las calificaciones de mayor a menor
SELECT *
FROM calificaciones
ORDER BY calificacion DESC;

## Ordenar las calificaciones de menor a mayor
SELECT *
FROM calificaciones
ORDER BY calificacion ASC;

## Ordenar los estudiantes por
## por nombre (en orden alfabético) 
## fecha_nacimiento (mas antiguo a reciente) 

SELECT * 
FROM estudiantes
ORDER BY apellido DESC, nombre DESC;

### LIMIT
## Define el número de registros que queremos ver
# Sintáxis básica
/*SELECT columna1, columna2, ...
FROM tabla
LIMIT numero_filas; */

SELECT *
FROM calificaciones
LIMIT 3;

### Quiero ver el alumno con mayor calificación en el curso 3
SELECT *
FROM calificaciones
WHERE curso_id = 3
ORDER BY calificacion DESC
LIMIT 1;