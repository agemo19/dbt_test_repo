{% macro get_column_values(table, column, max_records=none) -%}

    {%- call statement('get_column_values_def', fetch_result=True) %}

        select
            {{ column }} as value

        from {{ table }}
        where {{ column }} is not null
        
        group by 1
        order by count(*) desc

        {% if max_records is not none %}
        limit {{ max_records }}
        {% endif %}

    {%- endcall -%}

    {%- set value_list = load_result('get_column_values_def') -%}

    {{ log(value_list['data'], info=true) }}

    {%- if value_list and value_list['data'] -%}
        {%- set values = value_list['data'] | map(attribute=0) | list %}
        {{ return(values) }}
    {%- else -%}
        {{ return([]) }}
    {%- endif -%}


{%- endmacro %}