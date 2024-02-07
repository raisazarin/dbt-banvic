with 

source as (

    select * from {{ source('raw_banvic', 'clientes') }}

),

renamed as (

    select
        cod_cliente as id_cliente,
        primeiro_nome as prim_nome_cliente,
        ultimo_nome as ult_nome_cliente,
        email as email_cliente,
        tipo_cliente,
        data_inclusao as data_incl_cliente,
        cpfcnpj as cpf_cnpj,
        data_nascimento as data_nasc_cliente,
        endereco as endereco_cliente,
        cep as cep_cliente

    from source

)

select * from renamed
