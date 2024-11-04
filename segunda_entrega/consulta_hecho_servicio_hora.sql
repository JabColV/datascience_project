-- a que hora estan más ocupados los mensajeros
SELECT hora, COUNT(*) AS cantidad_solicitudes
FROM public.hecho_servicio_hora
GROUP BY hora
ORDER BY cantidad_solicitudes DESC, hora;


--agrupando por solicitudes y horas

SELECT hora, SUM(cantidad_solicitudes) AS total_solicitudes
FROM (
    SELECT hora, key_mensajero, COUNT(*) AS cantidad_solicitudes
    FROM public.hecho_servicio_hora
    GROUP BY hora, key_mensajero
) AS subquery
GROUP BY hora
ORDER BY hora;
