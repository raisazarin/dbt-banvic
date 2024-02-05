with 

clientes as (select * from {{ ref('int_clientes') }}),

estados as (select * from {{ ref('estados') }})

select

    id_cliente,
    nome_cliente,
    estados.nome_estado as estado_cliente,
    data_incl_cliente,
    round((1/total_clientes) * 100,5) as percent_cliente,
    idade,
    case when idade between 0 and 25 then 'até 25 anos'
         when idade between 26 and 40 then 'de 26 a 40 anos'
         when idade between 41 and 60 then 'de 41 a 60 anos'
         else 'mais de 60 anos'
    end as faixa_etaria,
    tempo_cliente,
    case when tempo_cliente between 0 and 4 then 'até 4 anos'
         when tempo_cliente between 5 and 9 then 'de 5 a 9 anos'
         else 'mais de 10 anos'
    end as faixa_tempo_cliente

from clientes
left join estados using (estado_cliente)