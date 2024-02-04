with clientes as (select * from {{ ref('stg_clientes') }})

select
endereco_cliente,
right(endereco_cliente,2) as estado,
{{ dbt.datediff(data_nasc_cliente,data_incl_cliente,year) }} as idade
from clientes


