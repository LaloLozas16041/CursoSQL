USE music_store;

/* P1. Quién es el empleado con mayor antigüedad*/

SELECT * FROM employee;
SELECT HireDate, FirstName, LastName
FROM employee
ORDER BY HireDate ASC
LIMIT 3;

/* P1.1. Cuál es el título de la persona con mayor nivel en la empresa? */

SELECT title, FirstName, LastName, Levels
FROM employee
ORDER BY Levels DESC
LIMIT 1;

/* P2. ¿Cuál es el país con mayor número de facturas? */

SELECT BillingCountry, count(*) as Facturas
FROM invoice
GROUP BY BillingCountry
ORDER BY Facturas DESC
LIMIT 1;

/* ¿Album que vende más? */

SELECT  Album.Title, Artist.Name, sum(InvoiceLine.Quantity) as Facturas
FROM InvoiceLine
LEFT JOIN Track ON invoiceline.TrackId = Track.TrackId
LEFT JOIN Album ON Track.AlbumId = Album.AlbumId
LEFT JOIN artist ON Album.ArtistID = Artist.ArtistID
GROUP BY Album.Title, Artist.Name
HAVING Facturas >= 50
ORDER BY Facturas DESC;

/* La oficina de Marketing quiere hacer un evento de Rock y quiere invitar a sus clientes que escuchan este género
¿Cómo le harían? */

SELECT DISTINCT customer.FirstName, customer.LastName, customer.email, genre.Name
FROM customer
INNER JOIN invoice ON customer.customerid = invoice.customerid
INNER JOIN InvoiceLine ON invoice.InvoiceId = InvoiceLine.InvoiceId
INNER JOIN track ON InvoiceLine.trackid = Track.trackid
INNER JOIN genre ON track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock' AND Customer.City = 'Madrid'
ORDER BY email;

/* Filtrar todas los tracks que duran más de la media */

SELECT name, miliseconds
FROM track
WHERE miliseconds >= (SELECT AVG(miliseconds)
					  FROM track)
ORDER BY miliseconds DESC;

SELECT valor_agregado
FROM tabla
GROUP BY variable_agrupamiento
HAVING condicion_usando_valor_agregado;

## Se quiere obtener la información sobre el género más popular en cada país. 
## El género más popular es el género con mayor número de compras/ventas.

WITH popular_genre AS 
(
    SELECT COUNT(invoiceline.quantity) AS purchases, customer.country, genre.name, genre.genreid, 
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoiceline.quantity) DESC) AS RowNo 
    FROM invoiceline 
	JOIN invoice ON invoice.invoiceid = invoiceline.invoiceid
	JOIN customer ON customer.customerid = invoice.customerid
	JOIN track ON track.trackid = invoiceline.trackid
	JOIN genre ON genre.genreid = track.genreid
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1;

## Seleccionar el cliente que más ha gastado en música para cada país

WITH tabla_temporal AS (SELECT customer.customerid, customer.firstname, customer.lastname, invoice.billingcountry, SUM(total) AS total,
		ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY SUM(total) DESC) AS RowNo 
		FROM customer
		INNER JOIN invoice ON customer.customerid = invoice.customerid
		GROUP BY customer.customerid, invoice.billingcountry
		ORDER BY invoice.billingcountry ASC, total DESC)
SELECT * FROM tabla_temporal WHERE RowNo = 1;

/* Otras funciones ventana:

ROW_NUMBER(): Asigna un número secuencial a cada fila de un conjunto de resultados.
RANK(): Asigna un rango a cada fila en función de una expresión de clasificación, con empates que comparten el mismo rango y saltan al siguiente.
DENSE_RANK(): Asigna un rango a cada fila en función de una expresión de clasificación, con empates que comparten el mismo rango pero no saltan al siguiente.
LAG(): Devuelve el valor de una columna de una fila anterior dentro de la partición actual.
LEAD(): Devuelve el valor de una columna de una fila siguiente dentro de la partición actual.
FIRST_VALUE(): Devuelve el valor de una columna de la primera fila dentro de la partición actual.
LAST_VALUE(): Devuelve el valor de una columna de la última fila dentro de la partición actual.
SUM(), AVG(), MIN(), MAX(): Realizan cálculos agregados en una columna dentro de la partición actual.
*/