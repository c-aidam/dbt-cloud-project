{{ config(materialized='table') }}

with orders as (

    select *
    from "raw"."ORDERS"

)

select * from orders