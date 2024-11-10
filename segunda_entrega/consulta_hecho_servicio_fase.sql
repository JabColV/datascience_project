--tiempo promedio general de entrega
WITH servicio_unico AS (
    SELECT DISTINCT ON (id) 
        id,
        promedio_entrega_general_dias,
        promedio_entrega_general_horas
    FROM 
        hecho_accumulating_snapshot
    ORDER BY 
        id
)
SELECT 
    AVG(promedio_entrega_general_dias) AS promedio_entrega_general_dias,
    AVG(promedio_entrega_general_horas) AS promedio_entrega_general_horas
FROM 
    servicio_unico;


-- Tiempo de promedio de duración por cada fase
WITH servicio_unico AS (
    SELECT DISTINCT ON (id) 
        id,
		dias_mensajero_asignado,
		horas_mensajero_asignado,
		dias_recogido_mensajero,
		horas_recogido_mensajero,
		dias_entregado_destino,
		horas_entregado_destino,
		dias_terminado,
	    horas_terminado
    FROM 
        hecho_accumulating_snapshot
    ORDER BY 
        id
)
SELECT 
    AVG(dias_mensajero_asignado) AS promedio_dias_mensajero_asignado,
	AVG(horas_mensajero_asignado) AS promedio_horas_mensajero_asignado,
	AVG(dias_recogido_mensajero) AS promedio_dias_recogido_mensajero,
	AVG(horas_recogido_mensajero) AS promedio_horas_recogido_mensajero,
	AVG(dias_entregado_destino) AS promedio_dias_entregado_destino,
	AVG(horas_entregado_destino) AS promedio_horas_entregado_destino,
	AVG(dias_terminado) AS promedio_dias_terminado,
    AVG(horas_terminado) AS promedio_horas_terminado
FROM 
    servicio_unico;