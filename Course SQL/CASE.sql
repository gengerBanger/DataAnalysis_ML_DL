SELECT person_id, name, position(' ' in name) as space,
		substring(name, 1, position(' ' in name) - 1) as first_name
 FROM person
	WHERE name LIKE '% %'
UNION ALL
SELECT person_id, name, position(' ' in name) as space,
		name as first_name
 FROM person
	WHERE NOT (name LIKE '% %')
;


SELECT person_id, name, position(' ' in name) as space,
		CASE WHEN name LIKE '% %' THEN substring(name, 1, position(' ' in name) - 1)
			 ELSE name
		END
 FROM person
;

SELECT * 
 FROM album
	WHERE band_id in (93,192)
--25
;

SELECT band_id, COUNT(*)
 FROM album
	WHERE band_id in (93,192)
GROUP BY 1
;
--93	11
--192	14
SELECT SUM(b_93),SUM(b_192),SUM(total) 
 FROM 
	(
		SELECT COUNT(*) as b_93, NULL as b_192, cast(NULL as bigint)  as total
	 FROM album
		WHERE band_id in (93)
	UNION ALL
	SELECT NULL as b_93, COUNT(*) as b_192, NULL as total
	 FROM album
		WHERE band_id in (192)
	UNION ALL
	SELECT NULL as b_93, NULL as b_192, COUNT(*) as total
	 FROM album
		WHERE band_id in (93,192)
	)
;
-- 93	192	total
-- 11	14	25

SELECT SUM(b_93) as b_93,SUM(b_192)as b_192,SUM(total)as total 
 FROM (
	 SELECT CASE WHEN band_id = 93 THEN 1 ELSE 0 END as b_93,
		CASE WHEN band_id = 192 THEN 1 ELSE 0 END as b_192 ,
		CASE WHEN band_id in(93,192)THEN 1 ELSE 0 END as total
	 FROM album
		WHERE band_id in (93,192)
 )
;
-- 93	192	total
-- 11	14	25
SELECT band_category, COUNT(*)
 FROM(
	 SELECT CASE WHEN band_id = 93 THEN '1. band_93'
		WHEN band_id = 192 THEN '2. band_192'
		ELSE 					'3. all other bands'
		END as band_category,
		a.*
 FROM album as a
 )
	GROUP BY 1
	ORDER BY 1
 ;

SELECT *, CASE WHEN a = b THEN 'a=b'
				WHEN a > b THEN 'a>b'
				WHEN a < b THEN 'a<b'
				ELSE 'UNKNOWN'
			END as comparison
 FROM mytable_int as my_t
;
 