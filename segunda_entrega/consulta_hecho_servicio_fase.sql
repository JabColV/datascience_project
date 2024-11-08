--timepo promedio general de entrega
WITH servicio_unico AS (
    SELECT DISTINCT ON (servicio_id) 
        servicio_id,
        tiempo_promedio_dias,
        tiempo_promedio_horas
    FROM 
        hecho_servicio_fase
    ORDER BY 
        servicio_id
)

SELECT 
    AVG(tiempo_promedio_dias) AS tiempo_promedio_entrega_dias,
    AVG(tiempo_promedio_horas) AS tiempo_promedio_entrega_horas
FROM 
    servicio_unico;


