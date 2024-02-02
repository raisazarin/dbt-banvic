with payments as

(
    
    select * from {{ ref('stg_payments') }}

),

staged as (

    select
        status,
        sum(amount) as total_revenue
    from payments
    group by 1
)

select * from staged


    

    

