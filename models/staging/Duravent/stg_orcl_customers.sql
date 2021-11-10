--Oracle Customer staging view

with customers as (
    
    select 
        id as customer_id,
        first_name,
        second_name,
        validity_end_date

    from raw.DEMO_ORACLE.CUSTOMER
)

select * from customers