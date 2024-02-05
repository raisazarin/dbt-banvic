with transacoes as (select * from {{ ref('int_transacoes') }})

select

    id_transacao,
    num_conta,
    data_transacao,
    concat(quarter_transacao,' ',ano_transacao) as quarter_transacao,
    nome_transacao,
    valor_transacao
    
from transacoes