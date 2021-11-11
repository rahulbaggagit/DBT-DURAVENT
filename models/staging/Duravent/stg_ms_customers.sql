--SQL Server Customer staging

with customers as (
    
    select 
        id as customer_id,
        first_name,
        second_name,
        validity_to

    from raw.DEMO_SQLSERVER.CUSTOMER_LIST
)

select * from customers