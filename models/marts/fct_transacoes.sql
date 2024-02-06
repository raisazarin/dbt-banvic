with 

transacoes as (select * from {{ ref('int_transacoes') }})

select

    id_transacao,
    num_conta,
    nome_agencia,
    nome_transacao,
    data_transacao,
    concat(ano_transacao,' ',quarter_transacao) as quarter_transacao,
    valor_transacao,
    modulo_valor_transacao,
    entrada_saida,
    total_count_transacoes,
    estado_cliente,
    
from transacoes

