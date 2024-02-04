with clientes as (select * from {{ ref('stg_clientes') }})

select
endereco_cliente,
right(endereco_cliente,2) as estado,
extract (year from CURRENT_DATE) - EXTRACT(YEAR FROM data_nasc_cliente) as idade,
CASE 
    when idade < 25 THEN '< 25 anos'
    when idade > 25 and < 40 THEN '26 a 40 anos'
    when idade > 40 and < 60 THEN '41 a 60 anos'
    else as '> de 60 anos'
  END as faixa_etaria
from clientes


