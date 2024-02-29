SELECT	b.band_id,			-- Здесь мы хотим объединить между собой 2 таблицы со связью М:М
		b.name as band_name,
		p.person_id,
		p.name as person_name
 FROM
 		band as b
 INNER JOIN band_person as b_p -- У нас есть таблица, соединяющая эти две таблицы (Получаем 2 связи: 1:М и М:1)
		ON b.band_id = b_p.band_id
 INNER JOIN person as p
		ON p.person_id = b_p.person_id


		