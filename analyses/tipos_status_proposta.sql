WITH propostas_credito AS (select * from {{ ref('stg_propostas_credito') }})

SELECT
    status_proposta,
    round(SUM(valor_proposta),2) as total_finan
FROM
    propostas_credito
GROUP BY 1



