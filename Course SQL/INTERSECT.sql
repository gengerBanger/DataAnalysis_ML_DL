DELETE from album_small WHERE year = -1;

UPDATE album_archive SET year = 1974 WHERE name = 'Queen II';

SELECT * FROM album_small
INTERSECT ALL 
SELECT * FROM album_archive
	ORDER BY name
;

SELECT *
 FROM album_small
	WHERE (album_id, name, band_id, coalesce(year,-1)) IN( -- снова используем coalesce
		SELECT album_id, name, band_id, coalesce(year,-1)
		FROM album_archive
	)
ORDER BY name
;