{{ config(materialized='table') }}

select 
    id_fecha,
    total_calorias_ingeridas,
    gramos_proteina,
    gramos_carbohidratos,
    gramos_grasas,
    meta_proteica_alcanzada
from {{ ref('stg_nutricion') }}