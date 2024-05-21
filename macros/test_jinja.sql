{% set max_nr = 10 %}
{% for i in range(max_nr) %}
    select {{ i }} as number
    {% if not loop.last %}
        union
    {% endif %}
{% endfor %}
