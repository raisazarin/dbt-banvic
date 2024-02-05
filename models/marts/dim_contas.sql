with contas as (select * from {{ ref('int_contas') }})

    select
        num_conta,
        id_cliente,
        id_agencia,
        id_colaborador,
        data_abertura_conta,
        saldo_total,
        saldo_disponivel,
        data_ultimo_lancamento,
        meses_inatividade,
        case when meses_inatividade between 0 and 6 then 'ativa'
             when meses_inatividade between 7 and 1000 and saldo_total > 200 then 'ativa'
             else 'inativa'
        end as status_conta
        
    from contas