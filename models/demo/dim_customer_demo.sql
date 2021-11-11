with oracle_customers as (
    select * from {{ref('stg_orcl_customers')}}  --references the staging views


),

mssql_customers as (

select * from {{ref('stg_ms_customers')}}

),

oracle_customers_fix as (

    select
        customer_id,
        first_name,
        second_name,
        date(validity_end_date, 'YYYYMMDD') as validto

    from oracle_customers


),


final as (

    select
        customer_id,
        first_name,
        second_name,
        validto,
        'Oracle' as source
    from oracle_customers_fix

    union

    select
        customer_id,
        first_name,
        second_name,
        validity_to as validto,
        'MSSQL' as source

    from mssql_customers

)

select * from final