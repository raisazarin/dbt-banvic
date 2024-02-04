with clientes as (select * from {{ ref('stg_clientes') }})

select
id_cliente,
prim_nome_cliente || ' ' || ult_nome_cliente AS nome_cliente,
right(endereco_cliente,2) as estado_cliente,
tipo_cliente,
date(data_incl_cliente) as data_incl_cliente,
extract (year from CURRENT_DATE) - EXTRACT(YEAR FROM data_incl_cliente) as tempo_cliente,
extract (year from CURRENT_DATE) - EXTRACT(YEAR FROM data_nasc_cliente) as idade
from clientes