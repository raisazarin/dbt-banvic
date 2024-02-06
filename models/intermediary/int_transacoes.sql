with 

transacoes as (select * from {{ ref('stg_transacoes') }}),

contas as (select * from {{ ref('int_contas') }})


select
        id_transacao,
        num_conta,
        contas.nome_agencia,
        date(data_transacao) as data_transacao,
        nome_transacao,
        valor_transacao,
        abs(valor_transacao) as modulo_valor_transacao,
        CASE 
            WHEN valor_transacao > 0 THEN 'entrada'
            WHEN valor_transacao < 0 THEN 'saida'
            ELSE '0'
        END AS entrada_saida,
        (select count(*) from {{ ref('stg_transacoes') }}) as total_count_transacoes,
        CASE 
            WHEN EXTRACT(MONTH FROM data_transacao) BETWEEN 1 AND 3 THEN 'Q1'
            WHEN EXTRACT(MONTH FROM data_transacao) BETWEEN 4 AND 6 THEN 'Q2'
            WHEN EXTRACT(MONTH FROM data_transacao) BETWEEN 7 AND 9 THEN 'Q3'
            WHEN EXTRACT(MONTH FROM data_transacao) BETWEEN 10 AND 12 THEN 'Q4'
            else 'quarter'
         end as quarter_transacao,
         EXTRACT(year FROM data_transacao) AS ano_transacao,
         contas.estado_cliente

    from transacoes
    left join contas using (num_conta)