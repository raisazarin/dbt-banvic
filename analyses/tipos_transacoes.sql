with transacoes as (select * from {{ ref('stg_transacoes') }})

select
    nome_transacao,
    abs(round(sum(valor_transacao),2)) as total_transacao
from
    transacoes
group by 1