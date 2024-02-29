SELECT *
FROM band as b
INNER JOIN album as a
	ON a.band_id = b.band_id
WHERE b.name = 'Led Zeppelin' -- обязательно укакзать из какой таблицы мы берем колонку name тк их у нас 2
