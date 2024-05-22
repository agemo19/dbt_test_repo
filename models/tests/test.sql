{% set max_nr = 4 %}
{% for i in range(max_nr) %}
  SELECT {{i}} as number
  {% if not loop.last %}
    UNION 
  {% endif %}
{% endfor %}

{{target}}
{{target.project}}