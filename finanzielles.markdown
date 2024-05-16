---
title: Finanzielles
permalink: /finanzielles/
---

Diese Instanz zu betreiben kostet Geld. Unsere Admins und Moderator:innen erhalten zwar keine Vergütung, wir freuen uns aber dennoch über Unterstützung, um alles weitere wie Domain und Hosting bezahlen zu können.
Wofür wir Geld ausgeben:
- Serverkosten: ~130€ im Monat
- Mailjet: ~40€ im Monat
- DeepL: ~60€ im Monat
- Mastodon Patron: 26€
- Matrix Patron: 15€

Unsere Monatlichen ausgaben sind also ~271€ im Monat.

## Unser Topf im Internet:
    _Überweisungen per IBAN nehmen wir im Moment nicht an_.

Natürlich auch über [Paypal](https://paypal.me/nordensocial) und [Liberapay](https://liberapay.com/norden.social) <img src="https://img.shields.io/liberapay/patrons/norden.social.svg?logo=liberapay">


## Alle Posts über unsere Finanzen
Hier findest eine Liste von Posts, wo wir über unsere Finanzen, oder einfach nur den Monatsbericht schreiben.

{% for post in site.categories.finanzen %}
 <li><span>{{ post.date | date_to_string }}</span> &nbsp; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
