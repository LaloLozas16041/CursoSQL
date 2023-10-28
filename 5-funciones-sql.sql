### Funciones en SQL

/*
1. Fecha y hora
CURRENT_DATE()
CURRENT_TIME()
*/

SELECT CURRENT_DATE();  ## Fecha actual del sistema
SELECT CURRENT_TIME();  ## Hora actual del sistema
SELECT NOW(); ## Fecha y hora del sistema

SELECT DATE('2023-01-20 15:30:16'); ## Nos devuelve la fecha

SELECT EXTRACT(DAY FROM '2023-01-20 15:30:16'); ## Extraer valores específicos de una fecha/hora

SELECT DATE_ADD('2023-01-01', INTERVAL 1 MONTH); ## Sumar valores (días, meses, años) a fechas
SELECT DATE_ADD('2023-01-01', INTERVAL 10 DAY);

SELECT DATE_SUB('2023-01-01', INTERVAL 1 MONTH); ## Restar valores (días, meses, años) a fechas

SELECT timestampdiff(YEAR, '1991-10-21', '2023-05-11'); ## Obtener diferencia entre dos fechas

SELECT DATE_FORMAT('2023-03-05 01:10:15', '%d/%m/%Y %H:%i:%s');

SELECT DATE_FORMAT('05-03-2023 13:10:15', '%Y/%m/%d %H:%i:%s');

/*
2. Funciones de cadena

*/

SELECT CONCAT('Hola ', 'mundo', 'hola'); ## Unir dos o más cadenas de texto

SELECT SUBSTRING('Hola mundo', 6, 10); ## Extraer una cadena en particular de acuerdo a su posición

SELECT REPLACE('Hola mundo', 'mundo', 'universo'); ## Reemplaza una cadena de texto por otra

SELECT REPLACE('Hola mundo.', '.', ''); ## Reemplaza una cadena de texto por otra

SELECT UPPER('Hola Mundo'); ## Lleva una cadena de caracteres a mayúsculas
SELECT LOWER('Hola Mundo'); ## Lleva una cadena de caracteres a minúsculas

SELECT TRIM('   Hola mundo   '); ## Elimina espacios en blanco al inicio o final de una cadena

SELECT LENGTH('Hola mundo'); ## Cuenta el número de caracteres

/*
3. Funciones matemáticas
*/

SELECT SQRT(2); ## Calcular la raíz cuadrada de un número o una columna
SELECT *, SQRT(calificacion) AS raiz FROM escuela.calificaciones;

SELECT POWER(2, 3); ## Elevar a una potencia un número
SELECT *, POWER(calificacion,1/3) AS raiz_cub FROM escuela.calificaciones;
SELECT *, POWER(calificacion,4) AS potencia FROM escuela.calificaciones;
SELECT *, POWER(calificacion,-2) AS potencia FROM escuela.calificaciones;

SELECT ROUND(1.324234,2); ## Redondear un número a ciertos decimales
SELECT FLOOR(1.324234); ## Llevar el número al entero inmediato inferior
SELECT RAND(); #Nos ayuda a generar un número aleatorio entre 0 y 1

## Funciones condicionales

## 1. IF

## IF(condicion, valor_si_es_verdadero, valor_si_es_falso)
SELECT *,
IF(calificacion > 6, 'Aprobado', 'Reprobado') AS resultado
FROM escuela.calificaciones;

## CASE
SELECT *,
CASE 
	WHEN calificacion <= 6 THEN 'F'
    WHEN calificacion <= 7 THEN 'D' 
    WHEN calificacion <= 8 THEN 'C'
    WHEN calificacion <= 9 THEN 'B'
    ELSE 'A'
END AS tipo
FROM escuela.calificaciones;