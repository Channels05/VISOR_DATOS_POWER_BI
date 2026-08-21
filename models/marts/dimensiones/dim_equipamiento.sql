{{ config(materialized='table') }}

select 
    id_equipamiento,
    tipo_equipo,
    marca_modelo
from {{ ref('stg_equipamiento') }}