{% snapshot adresai_snapshot %}

    {{
        config(
          target_schema='snapshots',
          strategy='timestamp',
          unique_key='id',
          updated_at = 'atnaujinta'
        )
    }}

select * from {{ source('uploaded_crm', 'adresai') }}

{% endsnapshot %}
