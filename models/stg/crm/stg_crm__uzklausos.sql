-- sukuriamas modelis 'stg_crm__uzklausos' ir jame bus visi irasai
-- iraso naujus irasus, esamus atnaujina, tam reikia unikalaus id  "unique_key='id'"
{{
    config(
        materialized='incremental',
        target_schema='stg',
        unique_key='id'
    )
}}

-- tik dalis duomenu ant kuriu dar taikomas filtras "WHERE atnaujinta > dateadd(day,-30,current_date)"
-- tada paima lenta 'stg_crm__uzklausos' ir filtruotus irasus is "source('uploaded_crm', 'uzklausos')" ir atlieka insert + update 
select 
    * 
from {{ source('uploaded_crm', 'uzklausos') }}

{% if is_incremental() %}
WHERE atnaujinta > dateadd(day,-30,current_date)
{% endif %}
