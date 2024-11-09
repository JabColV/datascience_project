-- ¿Cuales son los días donde más solicitudes hay? --
SELECT key_tiempo, solicitud_por_dia AS total_solicitudes_por_dia
	FROM public.hecho_servicio_dia
	GROUP BY key_tiempo, solicitud_por_dia
	ORDER BY total_solicitudes_por_dia DESC;