{{ config(materialized='table') }}

with fechas as (
    select distinct id_fecha from {{ ref('stg_actividades') }}
    union
    select distinct id_fecha from {{ ref('stg_nutricion') }}
)

select
    id_fecha,
    extract(day from id_fecha) as dia,
    extract(month from id_fecha) as mes,
    extract(year from id_fecha) as anio,
    extract(dayofweek from id_fecha) in (1, 7) as es_fin_de_semana
from fechas