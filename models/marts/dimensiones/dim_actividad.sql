{{ config(materialized='table') }}

with stg_actividades as (
    select * from {{ ref('stg_actividades') }}
)

select
    id_actividad,
    tipo_actividad,
    case 
        when distancia_km > 0 then (tiempo_minutos / distancia_km)
        else null 
    end as ritmo_min_km
from stg_actividades