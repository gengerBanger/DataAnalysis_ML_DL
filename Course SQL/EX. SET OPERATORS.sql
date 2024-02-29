SELECT name FROM band
	WHERE band_id in (
		SELECT band_id FROM album
			WHERE name = 'Now'
		INTERSECT ALL
		SELECT band_id FROM album
			WHERE name = 'The Collection'
	)
;