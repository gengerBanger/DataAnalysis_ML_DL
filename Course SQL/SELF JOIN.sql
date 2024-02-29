SELECT *
 FROM music_instrument as t1
;

SELECT t1.id, t1.name
	   ,t2.id as chilad1_id, t2.name as child1_name  -- спускаемся вниз по иерархии
	   ,t3.id as chilad2_id, t3.name as child2_name
	   ,t4.id as chilad3_id, t4.name as child3_name
	   ,t5.id as chilad4_id, t5.name as child4_name
	   ,t6.id as chilad5_id, t6.name as child5_name
 FROM music_instrument as t1
 LEFT JOIN music_instrument as t2 ON t2.parent_id = t1.id 
 LEFT JOIN music_instrument as t3 ON t3.parent_id = t2.id
 LEFT JOIN music_instrument as t4 ON t4.parent_id = t3.id
 LEFT JOIN music_instrument as t5 ON t5.parent_id = t4.id 
 LEFT JOIN music_instrument as t6 ON t6.parent_id = t5.id 
 WHERE t1.id = 1
;
