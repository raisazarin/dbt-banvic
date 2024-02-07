with 

colaboradores as (select * from {{ ref('stg_colaboradores') }}),
agencias as (select * from {{ ref('stg_agencias') }}),
colaborador_agencia as (select * from {{ ref('stg_colaborador_agencia') }})

select
    colaborador_agencia.id_agencia,
    colaborador_agencia.id_colaborador,
    agencias.nome_agencia,
    concat(colaboradores.prim_nome_colaborador,' ',colaboradores.ult_nome_colaborador) as nome_colaborador
from colaborador_agencia
left join agencias using (id_agencia)
left join colaboradores using (id_colaborador)
