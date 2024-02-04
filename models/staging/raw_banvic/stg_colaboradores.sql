with 

source as (

    select * from {{ source('raw_banvic', 'colaboradores') }}

),

renamed as (

    select
        cod_colaborador as id_colaborador,
        primeiro_nome as prim_nome_colaborador,
        ultimo_nome as ult_nome_colaborador,
        email as email_colaborador,
        cpf as cpf_colaborador,
        data_nascimento as data_nasc_colaborador,
        endereco as endereco_colaborador,
        cep as cep_colaborador

    from source

)

select * from renamed
