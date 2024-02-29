SELECT COUNT(*)

FROM band_extended_backup

;
SELECT SUM(n_albums) FROM band_extended;

SELECT COUNT(*) FROM album;

UPDATE band_extended SET n_albums = NULL WHERE name = 'Metallica';

INSERT INTO band_extended VALUES(-100, 'My Test Music Group',2000, 'My Comment', 
								25,54);
								
SELECT * FROM band_extended WHERE band_id = -100;

DELETE FROM band_extended WHERE name ='Queen';

SELECT * FROM band_extended WHERE name ='Queen';