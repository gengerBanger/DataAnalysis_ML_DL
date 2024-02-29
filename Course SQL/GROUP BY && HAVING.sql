
SELECT * 
FROM album
WHERE band_id IN(93,192)
;

SELECT COUNT(*) -- Подсчет количесва строк
FROM album
;

SELECT COUNT(*)-- Получили 25 альбомов от 2-х групп 
FROM album
WHERE band_id IN(93,192)
;

SELECT band_id, COUNT(*) -- 11+14 == 25
FROM album
WHERE band_id IN(93,192)
GROUP BY band_id
;

SELECT band_id, COUNT(*) -- COUNT(*) появляется в результате агрегации (т.е. на 26 строчке)
FROM album
WHERE band_id IN(93,192) AND COUNT(*) = 11 -- ОШИБКА:  агрегатные функции нельзя применять в конструкции WHERE
GROUP BY band_id
;

SELECT band_id, COUNT(*)
FROM album
WHERE band_id IN(93,192)
GROUP BY band_id
HAVING COUNT(*) = 11 -- накладываем фильтр после агрегации с помощью HAVING
;

SELECT band_id, COUNT(*) -- ищем группы с одним альбомом
FROM album
GROUP BY band_id
HAVING COUNT(*) = 1