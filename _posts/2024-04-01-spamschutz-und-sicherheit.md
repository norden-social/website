---

title:  "Neue Features für mehr Sicherheit und weniger Spam"
categories: sicherheit
author: Marius
---
Wir möchten über eine neue Funktion informieren, die den Login vereinfachen wird.

## Lots of Spam
Vermutlich hat jede*r die Spamwellen mitbekommen, die es in den letzten Monaten gegeben hat. Meistens gingen diese von Mastodon-Instanzen aus, die die Accountregistrierung komplett offen gelassen hatten. Zur Registrierung wird dann nur eine Email-Adresse benötigt.

Die zusätzliche Registrierungsbestätigung ist so einfach und effektiv, dass er jetzt als Antispam-Maßnahme vom Mastodon-Team eingesetzt wird: [mit Patch 4.2.8 wird die offene Registrierung eingeschränkt](https://github.com/mastodon/mastodon/releases/tag/v4.2.8), wenn der Server über einen längeren Zeitraum nicht aktiv moderiert wurde. Auch bei Norden.social muss eine Begründung für den Beitritt angegeben werden.

Wir begrüßen diese kleine Maßnahme, weil die Spamwellen für uns Moderatorenteam doch recht lästig sind.

## Da geht noch mehr!
Du kannst die Sicherheit auch selber erhöhen, indem du für deinen Account 2FA aktivierst - das steht für 2-Factor-Authentication und bedeutet, dass es neben deinem Passwort ein zweiten Faktor zur Bestätigung deines Logins erforderlich ist . Bei Mastodon ist dieser zweite Faktor ein Einmalcode - eine 6-stellige Nummer - die von einer mit deinem Account verknüpften App generiert wird.

Wie auch die Registrierungsbedingung sorgt dieser Extraschritt beim Login für mehr Sicherheit - ist aber auch etwas lästig.

## Vereinfachtes Login durch alternativen 2FA-Faktor
Bei Norden.social haben wir nun einen anderen 2FA-Faktor aktiviert: die Lagesensoren, bzw. das Magnetometer werden über die [Web-APIs](https://developer.mozilla.org/en-US/docs/Web/API/Sensor_APIs) ausgelesen und zur Anmeldung benutzt.

![Bild eines Smartphones, dass die Ausgabe eines Lagesensors zeigt.](https://live.staticflickr.com/7419/9814327305_701bd2f642_c_d.jpg)
*[Foto via flickr](https://www.flickr.com/photos/janitors/9814327305) [CC-BY 2.0](https://creativecommons.org/licenses/by/2.0/)*

Nach dem Login mit Email und Passwort wirst du dann aufgefordert, mit deinem Gerät in eine bestimmte Himmelsrichtung zu zeigen. Du musst vorher einmal bestätigen, dass die Webseite "norden.social" auf deinen Standort zugreifen darf - damit erteilst du die Erlaubnis, die Sensorendaten zu verwenden.

**Wir verwenden niemals deinen Standort - nur die X/Y-Werte des Magnetometers werden zur Bestimmung der Himmelsrichtung benutzt.**

> {% octicon globe height:24 class:"left" aria-label:documentation %} Drehst du dein Gerät korrekt nach Norden und hältst diese Position für **3 Sekunden**, wird das als 2FA-Bestätigung gewertet und du wirst eingeloggt. Ein Einmalcode wird nicht mehr benötigt.

Das funktioniert auch mit einem Laptop - sogar unter Linux. Wenn du einen Desktop-PC benutzt, kannst du die Drehung mit deiner Maus machen. Die hat zwar keine Lagesensoren, aber durch die Rotation der Erde ergibt sich eine geringe Trägheit, die der optischer Sensor der Maus nicht zu 100% ausgleichen kann. Das reicht, um die richtige Himmelsrichtung zu bestimmen.

*Hinweis: Nur für optische Mäuse. Bitte achte auf eine saubere Auflage. Lautsprecher oder Force-Feedback-Motoren können die Messung stören.*

## Ab wann geht es los?
Wir werden die Anpassung im Laufe des Tages einspielen. Solange musst du noch die bisherige 2FA-Anmeldung nutzen.

Spätestens ab morgen, Dienstag, 2. April 2024, sollte die neue 2FA-Methode für alle Accounts bei Norden.social verfügbar sein.