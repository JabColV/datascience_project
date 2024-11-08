import nbformat
from nbconvert.preprocessors import ExecutePreprocessor
import os
import time  

# Crear la carpeta outputs si no existe
output_dir = "outputs"
os.makedirs(output_dir, exist_ok=True)

# Lista de notebooks que quieres ejecutar
notebooks = [
    "dim_cliente.ipynb",
    "dim_mensajero.ipynb",
    "dim_hora.ipynb",
    "dim_fecha.ipynb",
    "dim_descripcion_novedad.ipynb",
    "dim_fase_servicio.ipynb",
    "hecho_novedades_servicio.ipynb",
    "hecho_servicio_dia.ipynb",
    "hecho_servicio_mensual.ipynb",
    "hecho_servicio_fase.ipynb"
]

# Iniciar el temporizador
start_time = time.time()

for notebook in notebooks:
    with open(notebook) as f:
        nb = nbformat.read(f, as_version=4)
        ep = ExecutePreprocessor(timeout=600, kernel_name='python3')
        ep.preprocess(nb)

        # Guardar el notebook ejecutado en la carpeta outputs
        output_path = os.path.join(output_dir, f"output_{notebook}")
        with open(output_path, 'w') as f:
            nbformat.write(nb, f)

# Calcular el tiempo total de ejecución
end_time = time.time()
elapsed_time = end_time - start_time

print(f"Todos los notebooks han sido ejecutados y los outputs se han guardado en la carpeta 'outputs'.")
print(f"Tiempo total de ejecución: {elapsed_time:.2f} segundos.")
