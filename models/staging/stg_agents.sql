{{ config(materialized='table') }}

with agents as (

    select *
    from "raw"."AGENTS"

)

select * from agents