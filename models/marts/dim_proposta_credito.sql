with 

credito as (select * from {{ ref('stg_propostas_credito') }}),

agencia as (select * from {{ ref('stg_colaborador_agencia') }})


  SELECT
    id_proposta,
    id_cliente,
    id_colaborador,
    agencia.id_agencia,
    date(data_entrada_proposta) as data_entrada_proposta,
    status_proposta,
    round(valor_financiamento,0) as valor_financiamento,
    round(valor_proposta,0) as valor_proposta,
    round(valor_entrada,0) as valor_entrada,
    taxa_juros_mensal,
    carencia,
    quantidade_parcelas,
    round((quantidade_parcelas * valor_prestacao) - valor_proposta,0) as lucro_simplificado_previsto
  FROM credito
  left join agencia using (id_colaborador)