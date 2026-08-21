with source as (
    select * from read_json_auto('./data/bronze/raw_nutricion.json')
),

renamed_and_casted as (
    select
        cast(fecha_registro as date) as id_fecha,
        cast(calorias as integer) as total_calorias_ingeridas,
        cast(proteinas_g as integer) as gramos_proteina,
        cast(carbohidratos_g as integer) as gramos_carbohidratos,
        cast(grasas_g as integer) as gramos_grasas,
        
        case 
            when cast(proteinas_g as integer) >= 150 then true 
            else false 
        end as meta_proteica_alcanzada
    from source
    where fecha_registro is not null
)

select * from renamed_and_casted