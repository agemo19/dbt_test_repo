{{ 
    config(materialized='table') 
}}

with source_vadybininkai as (
    select * from {{ source('uploaded_crm', 'vadybininkai') }}
),

final as (
    select * from source_vadybininkai
)

select * from final