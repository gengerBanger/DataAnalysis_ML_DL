SELECT * 
 FROM band
	WHERE lower(name) LIKE '%magic%'
	ORDER BY name
;

SELECT substring(name, 1, position(' ' in name) - 1), COUNT(*)
 FROM person
	WHERE substring(name,1,1) = upper(substring(name,1,1))
		  AND name LIKE '% %'
	GROUP BY 1
	ORDER BY COUNT(*) DESC
;