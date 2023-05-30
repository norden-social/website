---
title: Finanzielles
permalink: /finanzielles/
---

Diese Instanz zu betreiben kostet (leider) Geld. Unsere Admins und Moderator:innen erhalten zwar keine Vergütung, wir freuen uns aber dennoch über Unterstützung, um alles weitere wie Domain und Hosting bezahlen zu können.
Wofür wir Geld ausgeben:
- Serverkosten: ~120€ im Monat
- Mailjet: ~40€ im Monat
- DeepL: ~30€ im Monat
- Mastodon Patron: 26€
- Matrix Patron: 15€

Unsere Monatlichen ausgaben sind also ~230€ im Monat.

## Unser Topf im Internet:
    Niklas Barning
    IBAN DE08100110012625 380912
    BIC NTSBDEB1XXX
    Verwendungszweck: nordensocial

Natürlich auch über [Paypal](https://paypal.me/nordensocial) und [Liberapay](https://liberapay.com/norden.social)

**Finanzielle Zuwendungen in Form von Spenden sind freiwillig, nicht erstattbar und werden ordnungsgemäß als Einnahme versteuert. Nach §516 BGB handelt es sich um Schenkungen.**

## Alle Posts über unsere Finanzen
Hier findest eine Liste von Posts, wo wir über unsere Finanzen, oder einfach nur den Monatsbericht schreiben.

{% for post in site.categories.finanzen %}
 <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
