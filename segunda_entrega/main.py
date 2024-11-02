import nbformat
from nbconvert.preprocessors import ExecutePreprocessor
import os

# Crear la carpeta outputs si no existe
output_dir = "outputs"
os.makedirs(output_dir, exist_ok=True)

# Lista de notebooks que quieres ejecutar
notebooks = ["dim_cliente.ipynb", 
             "dim_mensajero.ipynb", 
             "dim_tiempo.ipynb", 
             "dim_descripcion_novedad.ipynb",
             "hecho_novedades_servicio.ipynb",
             "hecho_servicio_mensual.ipynb"]

for notebook in notebooks:
    with open(notebook) as f:
        nb = nbformat.read(f, as_version=4)
        ep = ExecutePreprocessor(timeout=600, kernel_name='python3')
        ep.preprocess(nb)

        # Guardar el notebook ejecutado
        output_path = os.path.join(output_dir, f"output_{notebook}")
        with open(output_path, 'w') as f:
            nbformat.write(nb, f)