import subprocess
import sys

def ejecutar_paso(comando, descripcion):
    print(f"\n🚀 {descripcion}...")
    resultado = subprocess.run(comando, shell=True)
    if resultado.returncode != 0:
        print(f"❌ Error durante: {descripcion}")
        sys.exit(1)

if __name__ == "__main__":
    ejecutar_paso("python extract_to_bronze.py", "1. Ingesta a Capa Bronce")
    ejecutar_paso("dbt run", "2. Modelado y Transformación con dbt")
    ejecutar_paso("dbt test", "3. Pruebas de Calidad de Datos")
    ejecutar_paso("python export_to_bi.py", "4. Exportación para Power BI")
    print("\n✅ ¡Pipeline ejecutado con éxito! Abre Power BI y presiona 'Actualizar'.")