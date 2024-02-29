SELECT name, COUNT(*)
 FROM band
 GROUP BY name
 HAVING COUNT(*) >= 2
 ORDER BY COUNT(*) DESC
;

SELECT name
 FROM band
	WHERE band_id in 
		(
			SELECT band_id
		 	 FROM
			(
				SELECT band_id, COUNT(band_id)
				 FROM album
				 	GROUP BY band_id
				 	ORDER BY COUNT(band_id) DESC
		    		LIMIT 1
			)
		)
;
