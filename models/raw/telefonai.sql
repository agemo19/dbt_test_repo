{{ log("Call your mom!") }}

{{ 
    config(materialized='table') 
}}

with source_telefonai as (
    select *,
        {{ dbt_utils.generate_surrogate_key(['tiekejoNrCSB', 'vadybininkasNr']) }} as surrogate_key
    from {{ source('uploaded_crm', 'telefonai') }}
),

final as (
    select * from source_telefonai
)

select * from final