with 

source as (

    select * from {{ source('raw_banvic', 'colaborador_agencia') }}

),

renamed as (

    select
        cod_colaborador as id_colaborador,
        cod_agencia as id_agencia

    from source

)

select * from renamed
