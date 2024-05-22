{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE
    -- adapter.get_columns_in_relation(model) function returns a list of columns in the model.
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}
