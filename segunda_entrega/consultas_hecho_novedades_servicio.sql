-- ¿Cuales son las novedades que más se presentan durante la prestación del servicio?
SELECT key_descripcion_novedad, cantidad_por_descripcion_novedad AS total_cantidad
	FROM public.hecho_novedad_servicio
	GROUP BY key_descripcion_novedad, cantidad_por_descripcion_novedad
	ORDER BY total_cantidad DESC;