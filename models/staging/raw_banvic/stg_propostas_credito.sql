with 

source as (

    select * from {{ source('raw_banvic', 'propostas_credito') }}

),

renamed as (

    select
        cod_proposta as id_porposta,
        cod_cliente as id_cliente,
        cod_colaborador as id_colaborador,
        data_entrada_proposta,
        taxa_juros_mensal,
        valor_proposta,
        valor_financiamento,
        valor_entrada,
        valor_prestacao,
        quantidade_parcelas,
        carencia,
        status_proposta

    from source

)

select * from renamed
