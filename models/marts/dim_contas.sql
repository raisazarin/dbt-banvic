with 

contas as (select * from {{ ref('int_contas') }})

    select
        num_conta,
        id_cliente,
        estado_cliente,
        id_agencia,
        nome_agencia,
        estado_agencia,
        tipo_agencia,
        id_colaborador,
        nome_colaborador,
        data_abertura_conta,
        saldo_total,
        saldo_disponivel,
        data_ultimo_lancamento,
        meses_inatividade,
        case when meses_inatividade between 0 and 6 then 'ativa'
             when saldo_total > 200 then 'ativa'
             else 'inativa'
        end as status_conta
        
    from contas
    