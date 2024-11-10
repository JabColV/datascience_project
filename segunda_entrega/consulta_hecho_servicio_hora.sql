-- a que hora estan más ocupados los mensajeros
SELECT key_hora, asignacion_por_hora
	FROM public.hecho_servicio_hora
	ORDER BY asignacion_por_hora DESC;

-- Cantidad de solicitudes por hora
SELECT key_servicio_hora, solicitudes_por_hora
	FROM public.hecho_servicio_hora
	ORDER BY solicitudes_por_hora DESC;

