CREATE TABLE album_sales (

album_id INTEGER, name VARCHAR, band_id INTEGER, year SMALLINT, total_sales NUMERIC

);

INSERT INTO album_sales
SELECT album_id, name, band_id, year,

100000/((2015-coalesce(year,1900)) * (2015-coalesce(year,1900)))* character_length(name) as total_sales

FROM album WHERE year<2015
;

SELECT * FROM album_sales;


SELECT year, sales, ROUND(sales / SUM(sales) OVER() * 100, 2) as total_sales
 FROM(
	 SELECT year, SUM(total_sales) as sales
 	  FROM album_sales
	 	GROUP BY year
 )
 ORDER BY 2 DESC
;