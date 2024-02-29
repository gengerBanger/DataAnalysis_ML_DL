SELECT n_albums
	 , n_bands
	 , n_albums / NULLIF(n_bands,0) -- для того, чтобы избежать ошибки деления на нуль
	 , cast(n_albums as numeric) / n_bands
	 , ROUND(cast(n_albums as numeric) / n_bands, 2)
 FROM(
	 SELECT COUNT(*) as n_albums,
	   COUNT(DISTINCT band_id) as n_bands
 FROM album
 ) as table_1
 

