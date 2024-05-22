{{ log("Call your mom!") }}

{{ 
    config(materialized='table') 
}}

with source_telefonai as (
    select * from {{ source('uploaded_crm', 'telefonai') }}
),

final as (
    select * from source_telefonai
)

select * from final