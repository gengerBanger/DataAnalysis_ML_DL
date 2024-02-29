SELECT 'album' as col, COUNT(*) FROM album
	UNION ALL
SELECT 'band' as col, COUNT(*) FROM band
	UNION ALL 
SELECT 'person' as col, COUNT(*) FROM person
	ORDER BY col
; 

-- разница между EXCEPT ALL и NOT IN
SELECT *
 FROM album_small
EXCEPT ALL -- отработал верно при добавлении null значения
SELECT * 
 FROM album_archive
	ORDER BY name
;

SELECT *
 FROM album_small
	WHERE (album_id, name, band_id, coalesce(year, -1)) NOT IN( -- для правильной обработки null 
		SELECT album_id, name, band_id, coalesce(year, -1) -- пришлось добавить функцию coalesce
		 FROM album_archive
	)
	ORDER BY name
;

UPDATE album_archive SET year = NULL WHERE name = 'Queen II' 
;

SELECT * FROM album_archive
;

INSERT INTO album_small VALUES(54326, 'Queen II', 192, -1)
;

SELECT * FROM album_small
;



