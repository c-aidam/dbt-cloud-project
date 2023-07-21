{{ config(materialized='table') }}

with customer as (

    select *
    from {{ ref('stg_customer') }}

)

    -- Exclude "PHONE_NO" column because data not reliable
    select
        "CUST_CODE"
        , "CUST_NAME"
        , "CUST_CITY"
        , "WORKING_AREA"
        , "CUST_COUNTRY"
        , "GRADE"
        , "OPENING_AMT"
        , "RECEIVE_AMT"
        , "PAYMENT_AMT"
        , "OUTSTANDING_AMT"
        , "AGENT_CODE" 
    from customer