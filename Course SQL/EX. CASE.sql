SELECT SUM(coincidence) 
 FROM(
	 SELECT a.album_id, b.band_id, CASE WHEN a.name = b.name THEN 1 ELSE 0 END as coincidence
 FROM album as a
INNER JOIN band as b
 ON a.band_id = b.band_id
 )
;

SELECT SUM(coincidence) 
 FROM(
	 SELECT a.album_id, b.band_id, CASE WHEN a.name in (
		 SELECT name FROM band
	 ) THEN 1 ELSE 0 END as coincidence
 FROM album as a
INNER JOIN band as b
 ON a.band_id = b.band_id
 )
;