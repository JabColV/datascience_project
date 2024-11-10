-- ¿Cuales son los días donde más solicitudes hay? --
SELECT key_fecha, solicitud_por_dia AS total_solicitudes_por_dia
	FROM public.hecho_servicio_dia
	GROUP BY key_fecha, solicitud_por_dia
	ORDER BY total_solicitudes_por_dia DESC;

-- Número de servicios por mensajero y por dia --
SELECT key_mensajero, 
           key_fecha, 
           cantidad_solicitud_por_dia_mensajero AS total_solicitud_por_dia_mensajero
    FROM public.hecho_servicio_dia
    GROUP BY key_mensajero, key_fecha, cantidad_solicitud_por_dia_mensajero

-- Mensajeros más eficientes (Los que más servicios prestan) --
SELECT key_mensajero, 
       SUM(total_solicitud_por_dia_mensajero) AS total_solicitudes
FROM (
    SELECT key_mensajero, 
           key_fecha, 
           cantidad_solicitud_por_dia_mensajero AS total_solicitud_por_dia_mensajero
    FROM public.hecho_servicio_dia
    GROUP BY key_mensajero, key_fecha, cantidad_solicitud_por_dia_mensajero
) AS subquery
GROUP BY key_mensajero
ORDER BY total_solicitudes DESC;

-- Para saber si hay datos duplicados --
SELECT key_fecha, key_cliente, key_mensajero, solicitud_por_dia_cliente, cantidad_solicitud_por_dia_mensajero, COUNT(*) AS conteo
FROM hecho_servicio_mensual
GROUP BY key_fecha, key_cliente, key_mensajero, solicitud_por_dia_cliente, cantidad_solicitud_por_dia_mensajero
HAVING COUNT(*) > 1;