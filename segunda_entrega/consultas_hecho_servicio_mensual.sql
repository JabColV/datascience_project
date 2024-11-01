-- ¿En qué meses del año los clientes solicitan más servicios de mensajería? --
SELECT key_tiempo, COUNT(solicitud_por_mes) AS total_solicitudes
	FROM public.hecho_servicio_mensual
	GROUP BY key_tiempo
	ORDER BY total_solicitudes DESC;

-- Número de servicios solicitados por cliente y por mes --
SELECT key_cliente, key_tiempo, COUNT(solicitud_por_mes_mensajero) AS total_solicitudes
FROM public.hecho_servicio_mensual
GROUP BY key_cliente, key_tiempo;

-- Mensajeros más eficientes (Los que más servicios prestan) --
SELECT key_mensajero, solicitud_por_mes_mensajero AS total_solicitudes
FROM public.hecho_servicio_mensual
GROUP BY key_mensajero, solicitud_por_mes_mensajero
ORDER BY solicitud_por_mes_mensajero DESC;

-- ¿Cuáles son las sedes que más servicios solicitan por cada cliente? --
-- SELECT key_sede, key_cliente, COUNT(solicitud_por_mes_sede) AS total_solicitudes --
--	FROM public.hecho_servicio_mensual --
--	GROUP BY key_sede, key_cliente --
--	ORDER BY total_solicitudes DESC; --