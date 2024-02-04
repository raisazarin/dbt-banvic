with clientes as (select * from {{ ref('stg_clientes') }})

select
id_cliente,
prim_nome_cliente || ' ' || ult_nome_cliente AS nome_cliente,
right(endereco_cliente,2) as estado_cliente,
tipo_cliente,
date(data_incl_cliente) as data_incl_cliente,
extract (year from CURRENT_DATE) - EXTRACT(YEAR FROM data_incl_cliente) as tempo_cliente,
extract (year from CURRENT_DATE) - EXTRACT(YEAR FROM data_nasc_cliente) as idade,
case when idade between 0 and 25 then 'até 25 anos'
         when idade between 26 and 40 then 'de 26 a 40 anos'
         when idade between 41 and 60 then 'de 41 a 60 anos'
         else 'acima de 60 anos'
    end as faixa_etaria_cliente
from clientes