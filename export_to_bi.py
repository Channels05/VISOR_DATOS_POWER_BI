import duckdb
import os

# Conectarse a la base de datos de DuckDB
con = duckdb.connect('warehouse.duckdb', read_only=True)

# Crear carpeta para los CSV si no existe
os.makedirs('./data/bi_exports', exist_ok=True)

# Lista de tablas de la Capa Oro que creamos con dbt
tablas = [
    'fact_rendimiento_diario',
    'dim_actividad',
    'dim_nutricion',
    'dim_equipamiento',
    'dim_tiempo'
]

# Exportar cada tabla directamente a CSV usando SQL nativo de DuckDB
for tabla in tablas:
    csv_path = f'./data/bi_exports/{tabla}.csv'
    # DuckDB exporta a CSV de forma nativa súper rápido
    con.execute(f"COPY {tabla} TO '{csv_path}' (HEADER, FORMAT CSV)")
    print(f"✅ Tabla exportada: {csv_path}")

con.close()
print("🚀 ¡Todas las tablas listas para Power BI!")