# 📘 Instrucciones para la Ejecución del Proyecto

## Pasos para Configurar y Ejecutar el Proyecto

### 1. Ir a la Carpeta del Proyecto  
Accede a la carpeta de la segunda entrega utilizando el siguiente comando:

```bash
cd segunda_entrega
```

### 2.  Instalar Dependencias
Instala todas las dependencias especificadas en requirements.txt con:

```bash
pip install -r requirements.txt
```
### 3.  Instalar Jupyter y el Kernel de Python
Para garantizar la compatibilidad con Jupyter Notebook, instala Jupyter y el kernel de Python ejecutando:

```bash
pip install jupyter ipykernel
python -m ipykernel install --user --name=python3
```

### 4.  Verificar el Kernel de Python
Confirma que el kernel python3 está correctamente instalado. Deberías ver la ruta de instalación en la salida de este comando:

```bash
jupyter kernelspec list
```

### 5.  Ejecutar el Script Principal para Procesar Notebooks
Ejecuta el siguiente comando para correr todos los notebooks y cargar la base de datos ETL configurada en config.yml:

```bash    
python main.py 
```

### 6.  Ver Resultados
Una vez que se haya ejecutado main.py, se generará una carpeta llamada outputs. Dentro de esta carpeta, encontrarás los archivos de Jupyter Notebook ya procesados y ejecutados.




