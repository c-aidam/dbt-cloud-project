{{ config(materialized='table') }}

with agents as (

    select *
    from {{ ref('stg_agents') }}

)

-- Country column values are missing in agents staging table, get value by mapping with customer staging table
, country_mapping as(

    select "WORKING_AREA", "CUST_COUNTRY" as "COUNTRY"
    from {{ ref('stg_customer') }}
    group by "WORKING_AREA", "CUST_COUNTRY"

)

    select
        "AGENT_CODE"
        , "AGENT_NAME"
        , agents."WORKING_AREA"
        , country_mapping."COUNTRY"
        , "COMMISSION"
        , "PHONE_NO"
    from agents
    left join country_mapping on agents."WORKING_AREA"=country_mapping."WORKING_AREA"