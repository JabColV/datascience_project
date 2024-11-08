-- a que hora estan más ocupados los mensajeros
SELECT hora_solicita, COUNT(*) AS cantidad_solicitudes
FROM public.hecho_servicio_hora
GROUP BY hora_solicita
ORDER BY cantidad_solicitudes DESC, hora_solicita;


