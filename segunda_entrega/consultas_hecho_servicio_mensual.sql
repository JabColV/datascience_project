-- ¿En qué meses del año los clientes solicitan más servicios de mensajería? --
SELECT key_fecha, solicitud_por_mes AS total_solicitudes_por_mes
	FROM public.hecho_servicio_mensual
	GROUP BY key_fecha, solicitud_por_mes
	ORDER BY total_solicitudes_por_mes DESC;

-- Número de servicios solicitados por cliente y por mes --
SELECT key_cliente, key_fecha, solicitud_por_mes_cliente 
FROM public.hecho_servicio_mensual
GROUP BY key_cliente, key_fecha, solicitud_por_mes_cliente;

-- Número de servicios solicitados por X cliente en los diversos meses --
SELECT key_cliente, key_fecha, solicitud_por_mes_cliente
FROM public.hecho_servicio_mensual
WHERE key_cliente=8
GROUP BY key_cliente, key_fecha, solicitud_por_mes_cliente;

-- Mensajeros más eficientes (Los que más servicios prestan) --
SELECT key_mensajero, 
       SUM(total_solicitud_por_mes_mensajero) AS total_solicitudes
FROM (
    SELECT key_mensajero, 
           key_fecha, 
           cantidad_solicitud_por_mes_mensajero AS total_solicitud_por_mes_mensajero
    FROM public.hecho_servicio_mensual
    GROUP BY key_mensajero, key_fecha, cantidad_solicitud_por_mes_mensajero
) AS subquery
GROUP BY key_mensajero
ORDER BY total_solicitudes DESC;

-- Para saber si hay datos duplicados --
SELECT key_fecha, key_cliente, key_mensajero, solicitud_por_mes_cliente, cantidad_solicitud_por_mes_mensajero, COUNT(*) AS conteo
FROM hecho_servicio_mensual
GROUP BY key_fecha, key_cliente, key_mensajero, solicitud_por_mes_cliente, cantidad_solicitud_por_mes_mensajero
HAVING COUNT(*) > 1;

