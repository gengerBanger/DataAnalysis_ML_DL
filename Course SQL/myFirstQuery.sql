 
SELECT band_id, name, year
FROM band
WHERE name = 'Led Zeppelin'
;
SELECT *
FROM album
WHERE band_id = 388
;
SELECT * 
FROM album
WHERE band_id in (SELECT band_id FROM band WHERE name = 'Led Zeppelin')