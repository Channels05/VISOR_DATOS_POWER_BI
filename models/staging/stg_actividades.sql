with source as (
    select * from read_json_auto('./data/bronze/raw_actividades.json')
),

renamed as (
    select
        cast(id_actividad as varchar) as id_actividad,
        cast(fecha_registro as date) as id_fecha,
        cast(tipo_actividad as varchar) as tipo_actividad,
        cast(tiempo_minutos as integer) as tiempo_minutos,
        cast(calorias_quemadas as integer) as calorias_quemadas,
        cast(distancia_km as double) as distancia_km,
        cast(equipamiento_id as varchar) as id_equipamiento
    from source
    where fecha_registro is not null
)

select * from renamed