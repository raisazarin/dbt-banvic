with 

source as (

select * from {{ source('raw_banvic', 'agencias') }}

),

staged as
(
    select
        cod_agencia as id_agencia,
        nome as nome_agencia,
        endereco as endereco_agencia,
        cidade as cidade_agencia,
        uf as uf_agencia,
        data_abertura as data_abertura_agencia,
        tipo_agencia
    from source
)

select * from staged
