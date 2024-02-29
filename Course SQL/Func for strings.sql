SELECT * 
 FROM band
	WHERE lower(name) = 'metallica'
;

SELECT name, character_length(name)
 FROM band
	ORDER BY 2 DESC
;

SELECT name,
	   substring(name, 1, position (' ' in name) - 1) as first_name,
	   substring(name, position (' ' in name) + 1) as last_name,
	   character_length(substring(name, 1, position (' ' in name) - 1)),
	   character_length(substring(name, position (' ' in name) + 1)),
	   character_length(name) - 1
 FROM person
	WHERE position (' ' in name) > 0 

