SELECT COUNT(*) FROM album; -- 121918

SELECT SUM(n_albums) FROM band_extended; -- 121918

SELECT COUNT(*) FROM album WHERE band_id = -100; -- 0

SELECT SUM(n_albums) FROM band_extended WHERE band_id = -100; -- 75

SELECT COUNT(*) FROM album WHERE band_id = 93; -- 11

SELECT SUM(n_albums) FROM band_extended WHERE band_id = 93; -- null

SELECT COUNT(*) FROM album WHERE band_id = 192; -- 14

SELECT SUM(n_albums) FROM band_extended WHERE band_id = 192; -- null
--------------------------
--несовпадения таблиц
-- BAND_ID : -100, 93, 192
--------------------------

SELECT band_id, COUNT(*) as album_count 
 FROM album
	GROUP BY 1
	
EXCEPT

SELECT band_id, n_albums as album_count
 FROM band_extended
	WHERE n_albums > 0
; -- способ хороший, однако для получения всех разхождений придется вычетать еще и 2го запрос из 1го

SELECT *
 FROM (
	 SELECT band_id, COUNT(*) as album_count 
 	  FROM album
		GROUP BY 1
 ) as table_1
FULL OUTER JOIN(
	SELECT band_id, n_albums as album_count
     FROM band_extended
		WHERE n_albums > 0 or n_albums IS NULL
 ) as table_2
ON table_1.band_id = table_2.band_id
WHERE table_1.album_count <> table_2.album_count
	  OR (table_1.album_count IS NULL AND table_2.album_count IS NOT NULL)
	  OR (table_2.album_count IS NULL AND table_1.album_count IS NOT NULL)
;


 