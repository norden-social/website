---
title: Autoren
permalink: /autoren/
layout: single
---

<ul class="profiles">
{% for entry in site.data.authors %}
  {% assign author_key = entry[0] %}
  {% assign author = entry[1] %}
  <li>
    <a href="/autor/{{ author_key | downcase }}/">
      {% if author.avatar %}
      <img src="{{ author.avatar }}" alt="{{ author.name | default: author_key }}" />
      {% endif %}
      <h3>{{ author.name | default: author_key }}</h3>
    </a>
  </li>
{% endfor %}
</ul>


