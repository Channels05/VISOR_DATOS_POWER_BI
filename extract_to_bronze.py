import pandas as pd
import os
import glob

def run_extraction():
    input_path = './data/input/'
    bronze_path = './data/bronze/'
    
    # Asegurar que existan los directorios
    os.makedirs(bronze_path, exist_ok=True)
    
    # Buscar todos los archivos CSV en input
    archivos_csv = glob.glob(os.path.join(input_path, "*.csv"))
    
    if not archivos_csv:
        print(f"⚠️ No se encontraron archivos CSV en {input_path}")
        return

    for archivo in archivos_csv:
        nombre_archivo = os.path.basename(archivo)
        print(f"🔄 Procesando: {nombre_archivo}...")
        
        df = pd.read_csv(archivo)
        
        # Guardar en formato JSON con el prefijo 'raw_' que espera dbt
        base_name = nombre_archivo.replace('.csv', '.json')
        nombre_json = f"raw_{base_name}" if not base_name.startswith("raw_") else base_name
        
        df.to_json(os.path.join(bronze_path, nombre_json), orient='records', date_format='iso', indent=4)
        print(f"✅ Guardado en bronce: {nombre_json}")

if __name__ == "__main__":
    run_extraction()