with (

select * from {{ ref('stg_propostas_credito') }}

)

as propostas_credito,

select (

    status_proposta,
    sum(valor_financiamento) as total_finan
)

group by 1
from propostas_credito


