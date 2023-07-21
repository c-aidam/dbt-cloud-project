{{ config(materialized='table') }}

with orders as (

    select *
    from {{ ref('stg_orders') }}

)

    -- Omitting "ORD_DESCRIPTION" column because not useful in our case
    select
        "ORD_NUM"
        , "ORD_AMOUNT"
        , "ADVANCE_AMOUNT"
        , "ORD_DATE"
        , "CUST_CODE"
        , "AGENT_CODE"
    from orders