with 

source as (

    select * from {{ source('raw_banvic', 'contas') }}

),

renamed as (

    select
        num_conta,
        cod_cliente as id_cliente,
        cod_agencia as id_agencia,
        cod_colaborador as id_colaborador,
        tipo_conta,
        data_abertura as data_abertura_conta,
        round(saldo_total,3) as saldo_total,
        round(saldo_disponivel,3) as saldo_disponivel,
        data_ultimo_lancamento

    from source

)

select * from renamed
