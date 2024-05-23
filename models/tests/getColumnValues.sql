{% set value_list = get_column_values('raw.telefonai', 'tiekejoNrCSB', max_records=100) %}
{% set sql_values_set = value_list | join(', ') %}
{{ log(sql_values_set) }}

SELECT * FROM raw.telefonai WHERE 'tiekejoNrCSB' in ({{sql_values_set}})