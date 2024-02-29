CREATE TABLE table_comparison_ AS
SELECT table_2.band_id as band_id_band_extended,
	   table_2.album_count as alnum_count_band_extended,
	   table_1.band_id as band_id_album,
	   table_1.album_count as alnum_count_album
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
 
 
SELECT *
 FROM table_comparison_
;

-- будем считать,что в таблице album данные верные
-- Тогда для ID -100 - DELETE, для ID 93 - UPDATE, и для ID 192 - INSERT

UPDATE band_extended as band_alias
 SET n_albums = table_alias.album_count
 FROM(
	 SELECT band_id, COUNT(*) as album_count 
 	  FROM album
		GROUP BY 1
 ) as table_alias
	WHERE band_alias.band_id = table_alias.band_id
		AND band_alias.band_id IN(
			SELECT band_id_band_extended
 			 FROM table_comparison_
				WHERE band_id_band_extended IS NOT NULL
					AND band_id_album IS NOT NULL
		)
; -- for id = 93
DELETE
 FROM band_extended
 WHERE band_id IN(
	 SELECT band_id_band_extended
 FROM table_comparison_
	WHERE band_id_band_extended IS NOT NULL
		AND band_id_album IS NULL
 )
; -- for id = -100


INSERT INTO band_extended
SELECT b.band_id, b.name, b.year, b.comment,
	   COALESCE(albums.album_count, 0) as n_albums,
	   /*COALESCE(songs.songs_count, 0)*/ NULL as n_songs
 FROM band as b
 
 LEFT JOIN(
		 SELECT band_id, COUNT(*) as album_count 
		  FROM album
			GROUP BY 1
	 ) as albums
	 
 ON albums.band_id = b.band_id
 
  /*LEFT JOIN(
		 SELECT band_id, COUNT(*) as songs_count 
		  FROM song
			GROUP BY 1
	 ) as songs
	 
 ON songs.band_id = b.band_id*/  -- это потому что у нас нет таблицы с песнями(
 
	WHERE b.band_id IN(
		SELECT band_id_album
 		 FROM table_comparison_
			WHERE band_id_band_extended IS NULL
				AND band_id_album IS NOT NULL
	)
; -- for id = 192




