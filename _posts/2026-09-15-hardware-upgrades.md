---
title:  "norden.social Hardware Upgrades"
categories: technik
author: Tofuknacker
---
norden.social ist in den vergangenen Jahren gelegentlich auf neue Hardware umgezogen. Mal, um gestiegenen Accountzahlen Rechnung zu tragen, Mal weil mehr Speicherplatz benötigt wurde. In der aktuell angespannten Lage auf dem Hardware-Markt fällt uns die Auswahl der Upgrades diesmal etwas schwerer.

---

## Warum so viele Umzüge? 

Mit der massenhaften Abwanderung vieler Menschen von Twitter (2022) kam der damalige Server stark unter Druck. Da wir bei vaultr bereits das größte Paket gebucht hatten und wir das Setup so simpel wie möglich halten wollten, haben wir uns dann für einen Umzug auf einen Leistungsstarken dedicated Server von Hetzner entschieden. Der Umzug war vergleichsweise unkompliziert und nach kurzer Downtime konnten wir norden.social wieder mit entsprechend mehr Leistung für alle bereitstellen. 

Ende 2024/Anfang 2025 sind wir dann auf einen Server mit etwas weniger Leistung/Festplattenspeicher umgezogen und haben unseren Cache und die Uploads auf einen S3 Bucket ausgelagert. Dadurch mussten wir nicht mehr Festplattenspeicher für Dateien und Datenbank bereitstellen und hatten etwas weniger administrativen Aufwand. Zusätzliche Festplatten hätten wir jederzeit für einen überschaubaren Aufpreis nachrüsten können. 

In diesem Herbst wäre es nun an der Zeit gewesen, die besagten Festplatten zu bestellen, um mehr Speicherplatz für die Datenbank zur Verfügung zu stellen. Leider ist dies aktuell nicht mehr möglich. 

Durch den massiven ausbau von KI-Rechenzentren ist die Hardware teurer und die Verfügbarkeit gleichzeitig geringer. Deshalb musste Hetzner nicht nur die Preise anheben, sondern auch die Verfügbarkeit von Zusatzhardware für dedicated Server stark einschränken. 

Für unser aktuelles Servermodell gibt es keine Erweiterungsoptionen mehr. Ein Umzug auf einen größeren Server oder die Erweiterung unserer Infrastruktur ist also unumgänglich, wenn wir nicht zu einem anderen Anbieter wechseln wollen, mit dem wir bisher keine Erfahrungen sammeln konnten. 


## Was läuft eigentlich bei norden.social? 

Unsere aktuelle "Infrastruktur" ist recht überschaubar. Neben einem Dedicated Root Server bei Hetzner haben wir einen weiteren Dedicated Server mit großen Festplatten, den wir für Backups und Grafana nutzen. Außerdem nutzen wir 2 Cloud-Server, um den norden.social Matrix-Chat bereitzustellen, und ein paar Dienste, die unserem Team die Arbeit erleichtern. Komplettiert wird das Ganze aktuell von einem S3 Bucket, in dem hochgeladene Dateien von unserem und anderen Servern gespeichert werden. 

Grundsätzlich funktioniert dieses recht einfache Setup für uns gut, stößt jetzt allerdings langsam an seine Kapazitätsgrenzen.

## Unsere gewachsenen Anforderungen

Für die Daten, die auf unseren (aber auch andere Server) hochgeladen werden, ist ein S3 Bucket grundsätzlich die perfekte Lösung. Der Speicherplatz wächst einfach mit unserem Bedarf dynamisch an, berechnet wird, was wir tatsächlich nutzen.

Unser Backupserver ist ausreichend groß, um die Backups zu halten, die wir mehrmals am Tag durchführen. 

Die beiden Cloud-Server befinden sich ebenfalls im grünen Bereich und könnten auf Wunsch schnell vergrößert werden. 

Bleibt also noch unsere Mastodon-Instanz. Diese hat ausreichend Rechenkapazität, Arbeitsspeicher und aktuell noch genug Platz auf der Festplatte, um die Mastodon-Datenbank und unseren Volltext-Suchindex zu beheimaten. 
Allerdings wird dieser Platz zunehmend knapp. Alleine die Datenbank-Tabelle mit unseren und Euren Beiträgen ist aktuell 141GB groß. 

```
                table_name                 | pg_size_pretty | pg_total_relation_size 
-------------------------------------------+----------------+------------------------
 statuses                                  | 141 GB         |           151862059008
 preview_cards                             | 22 GB          |            23114964992
 conversations                             | 17 GB          |            18309586944
 media_attachments                         | 14 GB          |            14813175808
 tombstones                                | 11 GB          |            11671519232
```

Zusammen mit unserem Suchindex und anderen Daten auf dem Server, sind nun noch knapp 90GB frei.
Um einen Cleanup der Datenbank laufen lassen zu können, benötigen wir aber mindestens die 141 GB der größten Tabelle, damit diese parallel zum Live-Betrieb neu geschrieben werden könnte, um den Speicherplatz optimal zu nutzen.

Unser Backup-Server wäre dafür zwar groß genug, aber dem mangelt es an Rechenleistung und schnellen Festplatten.
Die Auslagerung des Suchindex alleine würde uns nicht genug Platz schaffen. 

## Welche Optionen wir haben

Um weiterhin einen stabilen Betrieb gewährleisten zu können, müssen wir uns nun also - auch mit Blick auf die Zukunft - neu aufstellen. 
Dass wir dabei immer auch ein Auge auf die Finanzen des Vereins haben, hat der [Thread des Leuchtturm](https://norden.social/@leuchtturm/117212067019039116) kürzlich ja bereits angeschnitten. Eine stabile Finanzierung unserer Instanz ist für gewöhnlich immer für mindestens ein Jahr gesichert, aber durch die drastisch gestiegenen Hardwarepreise wäre das für die Zukunft unter Umständen nicht mehr der Fall. 

### Umzug auf einen größeren Hetzner Server

Da Zusatzhardware keine Option ist, könnten wir akuell nur auf einen neuen Dedicated Server umziehen, der mindestens 1TB Festplattenspeicher zur Verfügung stellt, damit wir bei sonst gleicher Leistungsfähigkeit wieder für einige Zeit ausreichend Platz haben. 
Hierfür wäre unsere günstigste Option ein EX63, der mit 177€/Monat aktuell so viel Kosten würde wie unsere gesamte Infrastruktur bisher im Schnitt, bzw. fast drei Mal so viel wie der bisherige Server.
Hinzu kämen dann immernoch die Kosten für Backup/Monitoring und die anderen Dienste.

### Hardware von der Serverbörse

Die [Hetzner Serverbörse](https://www.hetzner.com/de/sb/) bietet immer wieder gebrauchte Server für etwas günstigere Preise an. Mit etwas Glück könnten wir hier zwischen 75€ - 120€/Monat einen Server finden, der ausreichend Rechenkapazität und Speicherplatz hat. 
Mit etwas Pech warten wir darauf aber so lange, dass uns in der Zwischenzeit der Platz wirklich zu eng wird. 

### Migration einiger Dienste in die Hetzner Cloud

Der aktuelle Server ist für uns ein "All-in-one" Server. Grundsätzlich könnten wir also überlegen, ob wir einzelne Dienste auf Hetzner Cloud Server auslagern. 

Da unser Hauptproblem aktuell der mangelnde Speicherplatz für die Datenbank ist, wäre diese auch als einziger Service für einen Umzug insteressant. Die anderen Komponenten könnte auf dem aktuellen Server verbleiben. Das würde bedeuten: 

```
Postgres-Datenbank:
1x CPX32 (4 Kerne, 8GB RAM, 160GB SSD) 42,83€/Monat
 -> 800GB Volume (Postgres-Daten)      54,45€/Monat
```

Der Migrationsaufwand wäre vergleichsweise Überschaubar, die Absicherung der Kommunikation wäre mit geringem Mehraufwand möglich. 

Die Gesamtkosten für beide Server (alt +neu) wären mit ~170€ in etwa so teuer wie ein EX63, bei dem wir nur eine Maschine administrieren müssten.


### Migration auf mehrere Hetzner Cloud Server

Um uns keine Gedanken mehr über Hardwarelimits zu machen, wäre eine weitere Option die Migration in die Hetzner Cloud. 
Mit den Cloud Servern haben wir bereits gute Erfahrungen gesammelt, die Uptime ist gut und die Hardware-Verfügbarkeit ist in der Regel ebenfalls gut.
Automatische Backups der Maschinen wären ein weiterer Vorteil, auch wenn wir weiterhin dedizierte Datanbank-Backups machen würden. 

Ein neues Server-Setup könnte wie folgt aussehen: 

```
Postgres-Datenbank:
1x CPX32 (4 Kerne, 8GB RAM, 160GB SSD) 42,83€/Monat
 -> 800GB Volume (Postgres-Daten)      54,45€/Monat

ElasticSearch/Redis: 
1x CPX32 (4 Kerne, 8GB RAM, 160GB SSD) 42,83€/Monat

Mastodon:
1x CPX32 (4 Kerne, 8GB RAM, 160GB SSD) 42,83€/Monat
```

Dieses Setup hätte für die jeweiligen Services ausreichend Speicherplatz und würde im Normalbetrieb voraussichtlich auch in Punkto Rechenleistung ausreichen. Alle Komptonenten könnten bei Bedarf einzeln Skaliert werden.
Gleichzeitig ist es aber auch Wartungsintensiver und erfordert mehr Monitoring und Konfiguration um nicht nur stabil, sondern auch sicher betrieben zu werden. Preislich wären die Kosten mit ~180€/Monat ähnlich denen des EX63 Servers.

### Wechsel zu einem anderen Anbieter

Den Wechsel zu einem anderen Anbieter möchten wir aktuell gerne vermeiden. 
Zwar gibt es akutell Anbieter, die virtuelle Root-Server zu günstigeren Preisen anbieten (auch mit entsprechend großen Festplatten), aber uns ist das Risiko aktuell zu groß, dort nicht den gleichen Support und die gleiche Zuverlässigkeit wie bei Hetzner zu haben. 
Vielleicht kommt dies in Zukunft nochmal in Frage. 

## Fazit

Für den zukunftssicheren Umbau unserer Instanz stehen uns einige Optionen zur Verfügung, die bis auf eine Ausname (Serverbörse) in etwa die gleichen Kosten bei unterschiedlichem Arbeitsaufwand bedeuten. 
Steigende Kosten lassen sich nicht ganz vermeiden, insbesondere weil der Speicherplatz für Uploads und externe Inhalte im Laufe der Zeit weiter anwachsen wird und die Datenbank ja auch in Zukunft weiter Tröts und Antworten abspeichern muss.

Unsere aktuelle finanzielle Situation lässt diese Upgrades zu, insbesondere weil nach unserem Post zur aktuellen Situation nochmals einige Spenden eingegangen sind. Dennoch machen wir uns die Entscheidung nicht leicht, weil wir die Spenden nicht mit vollen Händen zum Fenster rauswerfen wollen. 

Auch wenn wir noch keine finale Entscheidung getroffen haben, hoffen wir dass Euch dieser Roman ein wenig hilft, die Hintergründe besser zu verstehen. 
