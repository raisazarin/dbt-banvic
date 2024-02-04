select
    tempo_cliente,
    count(tempo_cliente)
from {{ ref('int_clientes') }}
group by 1
order by 1




