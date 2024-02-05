with contas as (select * from {{ ref('stg_contas') }})

    select
        num_conta,
        id_cliente,
        id_agencia,
        id_colaborador,
        (select count(*) from {{ ref('stg_contas') }}) as total_contas,
        date(data_abertura_conta) as data_abertura_conta,
        saldo_total,
        saldo_disponivel,
        date(data_ultimo_lancamento) as data_ultimo_lancamento,
        extract (month from data_ultimo_lancamento) - EXTRACT(month FROM CURRENT_DATE) as meses_inatividade,

    from contas