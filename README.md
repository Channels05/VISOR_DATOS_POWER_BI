# 📊 Pipeline ELT & Data Warehouse de Rendimiento Deportivo y Nutrición

Pipeline integral de ingeniería de datos y modelado dimensional para el seguimiento de métricas deportivas y nutricionales. Transforma datos crudos en un modelo de esquema en estrella (*Star Schema*) optimizado para análisis en Power BI.

---

## 🛠️ Stack Tecnológico
* **Lenguaje:** Python 3.x (Ingesta, automatización y exportación)
* **Transformación y Modelado:** dbt Core (vistas `staging`, tablas dimensionales y hechos)
* **Motor OLAP / Data Warehouse:** DuckDB
* **Visualización:** Power BI Desktop
* **Testing de Datos:** dbt test (validación de unicidad, nulos y claves foráneas)

---

## 🏗️ Arquitectura de Datos (Medallion Architecture)

[ data/input/.csv ]
│
▼ (extract_to_bronze.py)
[ data/bronze/.json ] (Capa Bronce: Datos crudos ingestados)
│
▼ (dbt run - Staging)
[ stg_actividades / stg_nutricion / stg_equipamiento ] (Capa Plata: Limpieza y tipado)
│
▼ (dbt run - Marts / Star Schema)
[ dim_actividad, dim_nutricion, dim_equipamiento, dim_tiempo ]
[ fact_rendimiento_diario ] (Capa Oro en DuckDB)
│
▼ (export_to_bi.py)
[ data/bi_exports/*.csv ] ──▶ [ Power BI Dashboard ]


---

## 📐 Modelo Dimensional (Star Schema)

* **Fact Table:**
  * `fact_rendimiento_diario`: Métricas de distancia, tiempo, calorías quemadas y consumo nutricional.
* **Dimension Tables:**
  * `dim_actividad`: Tipo de entrenamiento y ritmos promedio.
  * `dim_nutricion`: Detalle de macronutrientes (proteínas, carbohidratos, grasas).
  * `dim_equipamiento`: Material utilizado.
  * `dim_tiempo`: Calendario granular para análisis temporal.

---

## 🚀 Guía de Ejecución Rápida

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/Channels05/VISOR_DATOS_POWER_BI.git](https://github.com/Channels05/VISOR_DATOS_POWER_BI.git)
   cd VISOR_DATOS_POWER_BI