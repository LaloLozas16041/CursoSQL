USE world;
show tables;

show columns from city;
show columns from country;
show columns from countrylanguage;

select * from countrylanguage
limit 5;

### Cláusulas avanzadas

### 1. Agregación (SUM, AVG, COUNT, MAX, MIN)
SELECT SUM(Population) AS Total, 
		ROUND(AVG(Population),2) AS Promedio,
		MAX(Population) AS Maximo, 
        MIN(Population) AS Minimo
FROM country;

### 2. GROUP BY - HAVING
### Sintaxis básica
/*SELECT columnas
FROM tabla
GROUP BY columna1, columna2
HAVING condicion;*/

SELECT Continent, AVG(population) AS Poblacion_promedio
FROM country
GROUP BY Continent; 

## Si quisiera saber el continente con mayor población
SELECT Continent, SUM(population) AS Poblacion_total
FROM country
GROUP BY Continent
ORDER BY Poblacion_total Desc
LIMIT 1;

## Población Promedio por continente
SELECT Continent, AVG(population) AS avg_pop
FROM country
GROUP BY Continent
HAVING avg_pop > 20000000;

# WHERE -> Filtrar dentro de columnas que ya existen en la tabla
# HAVING -> Filtrar dentro de agregaciones hechas con el group by 

SELECT Name, Population
FROM country
WHERE Population > 20000000;

### No podemos utilizar HAVING sin antes usar un GROUP BY
SELECT Continent, AVG(population) AS avg_pop
FROM country
GROUP BY Continent
HAVING avg_pop > 20000000;

### Obtener el continente con el país con la esperanza de vida más alta 

SELECT Continent, MAX(LifeExpectancy) AS Esperanza_Maxima
FROM country
GROUP BY Continent
ORDER BY Esperanza_Maxima DESC
LIMIT 1;

SELECT Continent, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

SELECT COUNT(*) 
FROM country;

## Ejercicios
/*
1. Usando count, obtenga el número de ciudades en los EE. UU.
2. Descubra cuál es la población y la esperanza de vida promedio de las personas en Argentina (ARG)
3. Usando IS NOT NULL, ORDER BY, LIMIT, ¿qué país tiene la esperanza de vida más alta?
*/

SELECT COUNT(*) AS ciudades
FROM city
WHERE CountryCode = 'MEX';

## El número de ciudades por país

SELECT CountryCode, count(*) AS ciudades
FROM city
GROUP BY CountryCode;

SELECT * FROM country;

## Obtener una tabla de los continentes y regiones

## DISTINCT mantiene un registro de cada combinación de las columnas y elimina las demás apariciones
SELECT DISTINCT Continent, Region
FROM country
ORDER BY Continent ASC;

# Cuál es la población y la esperanza de vida promedio de las personas en Argentina (ARG)

SELECT Code, AVG(Population), AVG(LifeExpectancy)
FROM country
GROUP BY Code
HAVING Code= 'ARG';

# Usando IS NOT NULL, ORDER BY, LIMIT, ¿qué país tiene la esperanza de vida más alta?
## IS NOT NULL nos sirve para omitir los registros con valor NULL
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy
LIMIT 1;


select count(*) 
from city
where CountryCode = 'USA';

select * from country;

select avg(Population), avg(LifeExpectancy)
from country
where Code = 'ARG';

select *
from country
order by LifeExpectancy DESC
limit 10;

## 3. JOIN

select * from city;
select * from country;
select * from countrylanguage;

# Obtener capitales de los países

SELECT Name, Capital
FROM country
WHERE Name = 'Mexico';

SELECT id, name
FROM city
WHERE id = '2515';

SELECT country.name, city.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode;

SELECT country.name, city.name
FROM country
LEFT JOIN city
ON country.capital=city.ID
AND country.code=city.countryCode
WHERE country.code = 'MEX';

USE tienda;

show tables;
show columns from clientes;
show columns from productos;
show columns from ventas;

## INNER JOIN
### Muestra todos los registros que se repiten en ambas tablas
/* ## SINTAXIS Básica
SELECT columnas_a_mostrar
FROM tabla1
INNER JOIN tabla2
ON tabla1.columna1 = tabla2.columna2;
*/

select * from ventas;

### Queremos pegar a la tabla de ventas los nombres de los clientes
SELECT ventas.id, ventas.id_producto, ventas.cantidad, clientes.nombre
FROM ventas
INNER JOIN clientes
ON ventas.id_cliente = clientes.id;

### Queremos pegar a la tabla de ventas los nombres de los clientes y de los productos
SELECT ventas.id, productos.nombre AS producto, ventas.cantidad, clientes.nombre AS cliente
FROM ventas
INNER JOIN clientes
ON ventas.id_cliente = clientes.id ### Es la llave para unir las tablas
INNER JOIN productos
ON ventas.id_producto = productos.id;

## LEFT JOIN
## Quiero pegar a mi tabla de clientes las compras que han hecho

SELECT clientes.nombre, ventas.id_producto, ventas.cantidad
FROM clientes
LEFT JOIN ventas
ON clientes.id = ventas.id_cliente;

## RIGHT JOIN
SELECT clientes.nombre, ventas.id_producto ,ventas.cantidad
FROM clientes
RIGHT JOIN ventas
ON clientes.id = ventas.id_cliente;

## 3. Subconsultas
/* 	
	1. Se escriben entre paréntesis
	2. Permiten realizar consultas anidadas
	Se utilizan para: 
		- Filtrar datos
        - Cálculo de valores
        - Comprobación de la existencia
*/

USE escuela;

show tables;

## FILTRAR DATOS

## Obtener las calificaciones de un alumno en específico ("Carlos Sánchez")

## Una forma de hacerlo es usando JOINS
SELECT estudiantes.nombre, estudiantes.apellido, calificaciones.curso_id, calificaciones.calificacion
FROM calificaciones
INNER JOIN estudiantes
ON estudiantes.id = calificaciones.estudiante_id
WHERE nombre='Carlos' AND apellido='Sánchez';

## Lo podemos hacer con subconsultas
SELECT *
FROM calificaciones
WHERE estudiante_id IN (
	SELECT id 
	FROM estudiantes
	WHERE nombre = 'Carlos' AND apellido = 'Sánchez'
);

### Expresiones de tablas comunes
### Son tablas temporales que se pueden utilizar en una consulta

WITH tabla_temporal AS (
SELECT *
FROM calificaciones
WHERE estudiante_id IN (
	SELECT id 
	FROM estudiantes
	WHERE nombre = 'Carlos' AND apellido = 'Sánchez'
)
)
SELECT nombre, apellido, curso_id, calificacion
FROM tabla_temporal
INNER JOIN estudiantes
ON tabla_temporal.estudiante_id = estudiantes.id;

WITH tabla_temporal AS (
SELECT *
FROM calificaciones
WHERE estudiante_id IN (
	SELECT id 
	FROM estudiantes
	WHERE nombre = 'Carlos' AND apellido = 'Sánchez'
)
)
SELECT nombre, apellido, curso_id, calificacion
FROM tabla_temporal
INNER JOIN estudiantes
ON tabla_temporal.estudiante_id = estudiantes.id;


