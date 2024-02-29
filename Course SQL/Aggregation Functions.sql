SELECT MIN(year), MAX(year) -- Данные некорректны
FROM album
;

SELECT MIN(counter), MAX(counter) -- считаем макс и мин количесво альбомов
FROM(							  -- группы с нулевым значением альбомов просто не попали в album
	SELECT band_id, COUNT(*) as counter
	FROM album
	GROUP BY 1
) as table_1
-- 1
-- 204
;
SELECT COUNT(*), COUNT(DISTINCT band_id)
FROM band
--82928
--82928
-- количество уникальных значений равно количеству строк
;

SELECT COUNT(*), COUNT(DISTINCT album_id), COUNT(DISTINCT band_id)
FROM album
--121918
--121918
--36882, следовательно у нас есть группы, не записавшие ни одного альбома
;

SELECT * --выводим информацию о группах, не записавших ни одного альбома
FROM band
WHERE band_id NOT IN (
	SELECT band_id
	FROM album
	WHERE band_id IS NOT NULL
)
;