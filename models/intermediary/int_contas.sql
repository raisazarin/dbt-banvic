with 

contas as (select * from {{ ref('stg_contas') }}),

clientes as (select * from {{ ref('int_clientes') }}),

agencias as (select * from {{ ref('stg_agencias') }})

    select
        num_conta,
        id_cliente,
        id_agencia,
        agencias.nome_agencia,
        agencias.tipo_agencia,
        agencias.uf_agencia as estado_agencia,
        id_colaborador,
        clientes.estado_cliente,
        (select count(*) from {{ ref('stg_contas') }}) as total_contas,
        date(data_abertura_conta) as data_abertura_conta,
        saldo_total,
        saldo_disponivel,
        date(data_ultimo_lancamento) as data_ultimo_lancamento,
        extract (month from CURRENT_DATE) - EXTRACT(month from date(data_ultimo_lancamento)) + 
            (extract (year from CURRENT_DATE) - EXTRACT(year from date(data_ultimo_lancamento))) * 12 - 11 as meses_inatividade

    from contas
    left join clientes using (id_cliente)
    left join agencias using (id_agencia)
