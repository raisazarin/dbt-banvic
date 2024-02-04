select
    nome_cliente,
    estado_cliente,
    idade,
    case when idade between 0 and 25 then 'até 25 anos'
         when idade between 26 and 40 then 'de 26 a 40 anos'
         when idade between 41 and 60 then 'de 41 a 60 anos'
         else 'acima de 60 anos'
    end as faixa_etaria_cliente
from {{ ref('dim_clientes') }}


