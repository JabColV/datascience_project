-- ¿Cuales son los días donde más solicitudes hay? --
SELECT key_fecha, solicitud_por_dia AS total_solicitudes_por_dia
	FROM public.hecho_servicio_dia
	GROUP BY key_fecha, solicitud_por_dia
	ORDER BY total_solicitudes_por_dia DESC;

-- Número de servicios solicitados por mensajero y por dia --
SELECT key_mensajero, 
           key_fecha, 
           cantidad_solicitud_por_dia_mensajero AS total_solicitud_por_dia_mensajero
    FROM public.hecho_servicio_dia
    GROUP BY key_mensajero, key_fecha, cantidad_solicitud_por_dia_mensajero