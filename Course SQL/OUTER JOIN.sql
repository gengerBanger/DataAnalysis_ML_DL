SELECT c.year, COUNT(a.album_id)
 FROM(
	SELECT year
	 FROM calendar_year
		WHERE year BETWEEN 1969 AND 1982
	) as c 
	LEFT JOIN album as a -- LEFT указывает на то, что таблица выше у нас 
						 --основеая и мы не хотим терять строки из нее
	ON a.year = c.year AND band_id = 388
	GROUP BY c.year
 ;

