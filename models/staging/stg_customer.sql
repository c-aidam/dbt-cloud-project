{{ config(materialized='table') }}

with customer as (

    select *
    from "raw"."CUSTOMER"

)

select * from customer