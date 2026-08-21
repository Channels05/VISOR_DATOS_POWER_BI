{{ config(materialized='table') }}

with actividades as (
    select * from {{ ref('stg_actividades') }}
),

nutricion as (
    select * from {{ ref('stg_nutricion') }}
)

select
    a.id_fecha,
    a.id_actividad,
    n.id_fecha as id_nutricion,
    a.id_equipamiento,
    a.distancia_km as distancia_recorrida_km,
    a.tiempo_minutos,
    a.calorias_quemadas as calorias_quemadas_activas
from actividades a
left join nutricion n 
    on a.id_fecha = n.id_fecha