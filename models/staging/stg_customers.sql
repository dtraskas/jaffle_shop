{{
    config(
        materialized='incremental',
        schema='RAW',
        tags='CUSTOMER'
    )
}}

with source as (
    select * from {{ ref('raw_customers') }}
),

renamed as (
    select
        id as customer_id,
        first_name,
        last_name,
        email
    from source
)

select * from renamed
