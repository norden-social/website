---
layout: post
title:  "Neue Features für mehr Sicherheit und weniger Spam"
categories: sicherheit
---
Wir möchten über eine neue Funktion informieren, die euch das Login vereinfachen wird.

## Lots of spam
Vermutlich hat jede*r die Spamwellen mitbekommen, die es in den letzten Monaten gegeben hat. Meistens gingen diese von Mastodon-Instanzen aus, die die Accountregistrierung komplett offen gelassen hatten. Zur Registrierung wird dann nur eine Email-Adresse benötigt.

Bei Norden.social ist normalerweise eine weitere Registrierungsstufe dazwischen geschaltet: es muss ein Grund für das Beitreten angegeben werden und der Antrag wird dann von einem Mitglied des Moderationsteams akzeptiert oder abgelehnt. Dieser Extraschritt wird nur selten deaktiviert - etwa, wenn eine große Instanz geschlossen wird und wir Suchenden keine Hürde aufstellen möchten.

Die Registrierungsbegründung ist so einfach und effektiv, dass er jetzt als Antispam-Maßnahme vom Mastodon-Team eingesetzt wird: [mit Patch 4.2.8 wird die offene Registrierung abgeschaltet](https://github.com/mastodon/mastodon/releases/tag/v4.2.8), wenn der Server über einen längeren Zeitraum nicht aktiv moderiert wurde.

Wir begrüßen diese kleine Maßnahme, weil diese Spamwellen auch für uns Moderatorenteam doch recht lästig waren.

## Da geht noch mehr!
Du kannst die Sicherheit auch selber erhöhen, indem du für deinen Account 2FA aktivierst - das steht für 2-Factor-Authentication und beschreibt, dass es neben deinem Passwort einen zweiten Faktor zur Bestätigung deines Logins geben wird.

Bei Mastodon ist dieser zweite Faktor ein Einmalcode - eine 6-stellige Nummer - die von einer mit deinem Account verknüpften App generiert wird. Neben diversen Passwort-Safes (die sind immer eine gute Idee, weil du darin hoch komplizierte Passwörter ablegen kannst) können mittlerweile auch die meisten Handyanbieter solche 2FA-Codes generieren.

Wie auch die Registrierungsbedingung sorgt dieser Extraschritt beim Login für mehr Sicherheit - ist aber auch etwas lästig.

## Vereinfachtes Login durch alternativen 2FA-Faktor
Bei Norden.social haben wir nun weiteren 2FA-Faktor aktiviert: die Lagesensoren, bzw. das Magnetometer werden über die [Web-APIs](https://developer.mozilla.org/en-US/docs/Web/API/Sensor_APIs) ausgelesen.

![Bild eines Smartphones, dass die Ausgabe eines Lagesensors zeigt.](https://live.staticflickr.com/7419/9814327305_701bd2f642_c_d.jpg)
*[Foto via flickr](https://www.flickr.com/photos/janitors/9814327305) [CC-BY 2.0](https://creativecommons.org/licenses/by/2.0/)*

Nach dem Login mit Benutzername oder Email und Passwort wirst du dann aufgefordert, mit deinem Gerät in eine bestimmte Himmelsrichtung zu zeigen. Du musst vorher einmal bestätigen, dass die Webseite "norden.social" auf deinen Standort zugreifen darf - damit erteilst du die Erlaubnis, die Sensorendaten zu verwenden.

**Wir verwenden niemals deinen Standort - nur die X/Y-Werte des Magnetometers werden zur Bestimmung der Himmelsrichtung benutzt.**

Drehst du dein Gerät korrekt nach Norden und hältst diese Position für **3 Sekunden**, wird das als 2FA-Bestätigung gewertet und du wirst eingeloggt. Ein Einmalcode wird nicht mehr benötigt.