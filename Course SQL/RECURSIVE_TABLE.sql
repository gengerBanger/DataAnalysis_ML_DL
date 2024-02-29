WITH RECURSIVE recursive_table AS(
	SELECT l_1.parent_id, cast(NULL as character varying) as parent_name,
			l_1.name as chained_name,
			l_1.id, l_1.name, 1 as depth  -- начало рекурсии
	 FROM music_instrument as l_1
		WHERE l_1.id = 1
	
	UNION ALL
	
	SELECT recursive_alias.id, recursive_alias.name,
			recursive_alias.chained_name || '->' || coalesce(t_next.name, '') as chained_name,
	    	t_next.id as t_next_id, t_next.name as child1_name,
			recursive_alias.depth + 1 as depth  -- спускаемся вниз по иерархии
 	FROM recursive_table as recursive_alias
    LEFT JOIN music_instrument as t_next ON t_next.parent_id = recursive_alias.id 
 
 		WHERE depth <=100 AND t_next IS NOT NULL -- очередной шаг рекурсии
)
SELECT * FROM recursive_table ORDER BY depth, parent_name, name