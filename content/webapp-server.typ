== Webapplikation auf Server

=== Dynamische Assets
_Mario Wegmann_

In Version 1 war es nur möglich, statische Assets zu erstellen oder hochzuladen und diesen dann Displaymodulen fest zuzuordnen. Pro statischen Asset konnte zudem eine Gültigkeitsdauer in Sekunden angegeben werden. Der Servermodus gleicht somit sehr dem Netzwerkmodus, nur dass eine 1:n Beziehung zwischen Assets und Displaymodulen komfortable über eine Weboberfläche gesteuert werden konnte. In Version 2 ist es nun auch möglich, dynamische Assets zu generieren, deren Inhalt sich automatisch anhand von JSON-Daten ändert. Diese JSON-Daten können entweder manuell durch Benutzer oder per API-Zugriff angepasst werden. Dies ermöglicht unter anderem die Darstellung von externen Daten, wie zum Beispiel Stundenpläne von WebUntis. Dabei kommt eine Library namens Handlebars zum Einsatz. Diese Library ermöglicht es, HTML-Code mithilfe der Handlebars-Syntax und JSON-Daten programmatisch zu erzeugen und zu modifizieren. Zum Beispiel kann eine HTML-Tabelle erzeugt werden, in der jede Zeile einen Eintrag aus einem JSON-Array enthält, oder HTML-Elemente können ein- oder ausgeblendet werden, abhängig davon, wie der Wert einer JSON-Variable ist. 

=== Datenbankschema
_Mario Wegmann_

Um dynamische Assets zu unterstützen, wurde das Datenbankschema angepasst, während in Version 1 ein Asset alle Informationen enthielt, um ein PNG für das Displaymodul zu generieren, dient in Version 2 ein Asset nur noch als Hülle. Das Layout eines Assets wird über ein Template in HTML, CSS und Handlebars-Syntax festgelegt und der Inhalt des Assets wird über das JSON von einer oder mehreren Daten. Zwischen Asset und Template gibt es eine 1:1 Beziehung, während es zwischen Asset und Data eine 1:n Beziehung gibt. Dieser Aufbau ermöglicht es zusätzlich, ein Asset zu erstellen, welches Daten von mehreren Schnittstellen kombiniert. 

=== Neue Unterseiten
_Mario Wegmann_

Neben den bisherigen Unterseiten `Displays` und `Assets` sind die zwei Unterseiten `Templates` und `Datas` hinzugekommen. Unter `Templates` lassen sich die dynamischen HTML-Vorlagen anpassen, welche später mit der Hilfe von Handlebars mit dem dynamischen Inhalt befüllt werden. Unter der Seite `Datas` können Daten der Datenbank von Worker gelesen, als auch eigene Daten im JSON-Format abgespeichert werden. 

=== Worker
_Mario Wegmann_

Neben der eigentlichen Webapplikation wurden zusätzliche Worker Skripte erstellt. Die Skripte sind auch in TypeScript verfasst und können unabhängig von der Hauptanwendung aufgerufen werden. Ein Worker wird dabei regelmäßig über Cron gestartet, um die neuesten Stundenplan-Daten aus WebUntis abzufragen und diese Daten in der Datenbank der Hauptanwendung zu speichern. Ein weiterer Worker liest die Stundenplan-Daten von der Datenbank aus und erstellt daraus passende Assets für Displaymodule. Der dritte Worker liest JSON-Daten aus der Datenbank aus und erstellt daraus ebenso Assets für Displaymodule. 

=== WebUntis Anbindung
_Mario Wegmann_

Bereits in Version 1 wurde eine Möglichkeit gefunden, die WebUntis Daten der THA auszulesen. Mithilfe der Node-Library #link("https://www.npmjs.com/package/webuntis")[webuntis] können die WebUntis Daten programmatisch ausgelesen werden. Der WebUntis Worker kann dabei alle Räume abfragen, die in WebUntis vorhanden sind, und für einen spezifischen Raum den Wochenplan abfragen. Die Daten werden aufbereitet und in der PostgreSQL-Datenbank der Hauptanwendung abgespeichert. 

=== Betrieb auf Linux Server
_Mario Wegmann_

Bereits für Version 1 wurde vom Rechenzentrum eine virtuelle Maschine zum Testen der Webapplikation bereitgestellt. Diese VM wurde nun für Version 2 mit den neuesten Updates versorgt und die neueste Version der Webapplikation installiert und produktiv geschaltet. 

#pagebreak()