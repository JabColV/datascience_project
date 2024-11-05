-- ¿En qué meses del año los clientes solicitan más servicios de mensajería? --
SELECT key_tiempo, solicitud_por_mes AS total_solicitudes_por_mes
	FROM public.hecho_servicio_mensual
	GROUP BY key_tiempo, solicitud_por_mes
	ORDER BY total_solicitudes_por_mes DESC;

-- Número de servicios solicitados por cliente y por mes --
SELECT key_cliente, key_tiempo, solicitud_por_mes_cliente 
FROM public.hecho_servicio_mensual
GROUP BY key_cliente, key_tiempo, solicitud_por_mes_cliente;

-- Número de servicios solicitados por X cliente en los diversos meses --
SELECT key_cliente, key_tiempo, solicitud_por_mes_cliente
FROM public.hecho_servicio_mensual
WHERE key_cliente=8
GROUP BY key_cliente, key_tiempo, solicitud_por_mes_cliente;

-- Mensajeros más eficientes (Los que más servicios prestan) --
SELECT key_mensajero, cantidad_solicitud_por_mensajero AS total_solicitud_por_mes_mensajero
FROM public.hecho_servicio_mensual
GROUP BY key_mensajero, cantidad_solicitud_por_mensajero
ORDER BY cantidad_solicitud_por_mensajero DESC;

-- Para saber si hay datos duplicados --
SELECT key_tiempo, key_cliente, key_mensajero, solicitud_por_mes_cliente, cantidad_solicitud_por_mensajero, COUNT(*) AS conteo
FROM hecho_servicio_mensual
GROUP BY key_tiempo, key_cliente, key_mensajero, solicitud_por_mes_cliente, cantidad_solicitud_por_mensajero
HAVING COUNT(*) > 1;

-- ¿Cuáles son las sedes que más servicios solicitan por cada cliente? --
-- SELECT key_sede, key_cliente, COUNT(solicitud_por_mes_sede) AS total_solicitudes --
--	FROM public.hecho_servicio_mensual --
--	GROUP BY key_sede, key_cliente --
--	ORDER BY total_solicitudes DESC; --