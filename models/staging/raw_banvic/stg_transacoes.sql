with 

source as (

    select * from {{ source('raw_banvic', 'transacoes') }}

),

renamed as (

    select
        cod_transacao as id_transacao,
        num_conta,
        data_transacao,
        nome_transacao,
        valor_transacao

    from source

)

select * from renamed
