{{ config(materialized='table') }}

with agents as (

    select *
    from {{ ref('agents') }}

)

, customers as (

    select *
    from {{ ref('stg_customer') }}

)

, orders as (

    select *
    from {{ ref('stg_orders') }}

)

    select
        "ORD_NUM"
        , "ORD_DATE"
        , "ORD_AMOUNT"
        , "ADVANCE_AMOUNT" as "ORD_ADVANCE_AMOUNT"
        , "CUST_NAME"
        , "CUST_CITY"
        , customers."WORKING_AREA" as "CUST_WORKING_AREA"
        , "CUST_COUNTRY"
        , "GRADE" as "CUST_GRADE"
        , "OPENING_AMT" as "CUST_OPENING_AMT"
        , "RECEIVE_AMT" as "CUST_RECEIVE_AMT"
        , "PAYMENT_AMT" as "CUST_PAYMENT_AMT"
        , "OUTSTANDING_AMT" as "CUST_OUTSTANDING_AMT"
        , "AGENT_NAME"
        , agents."WORKING_AREA" as "AGENT_WORKING_AREA"
        , agents."COUNTRY" as "AGENT_COUNTRY"
        , "COMMISSION" as "AGENT_COMMISSION"
        , agents."PHONE_NO" as "AGENT_PHONE_NO"
    from orders
    inner join customers on orders."CUST_CODE" = customers."CUST_CODE"
    inner join agents on orders."AGENT_CODE" = agents."AGENT_CODE"