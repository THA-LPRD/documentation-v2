== Webapplication auf MCU

=== Upload von Bildern
_Mario Wegmann_

Der Upload an das Displaymodul wurde an das neue Design angepasst und auch in Next.js in TypeScript komplett neu geschrieben. Dabei wurden die verschieden Möglichkeiten für den Upload von Bildern visuell von einander getrennt, um die Übersichtlichkeit zu verbessern. Es ist, wie in Version 1 auch schon, weiterhin möglich ein fertiges PNG hoch zu laden, ein PNG aus HTML Code, oder mit vorhanden HTML Vorlagen, zu erstellen. Die letzen beiden Varianten bieten beim bearbeiten des HTML Codes eine Live-Vorschau des Ergebnisses. 

=== Server Modus
_Mario Wegmann_

Da der Servermodus eine Server URL benötigt wurde in der Konfigurationsseite die Eingabemaske um den Parameter erweitert. 

=== Display Konfiguration
_Mario Wegmann_

Damit das neue Display vom Hersteller GoodDisplay verwendet werden kann, wurde die Auswahl des Displays auf der Konfigurationsseite der Weboberfläche erweitert. 

=== WLAN Enterprise Konfiguration
_Mario Wegmann_

Bei WPA2 mit EAP werden logischerweise mehr Parameter benötigt, als mit einem PSK. So braucht das TTLS mit PAP Verfahren eine ID, Username und Zertifikat. Die Konfigurationsseite wurde um die entsprechenden Parameter erweitert und es wurde ermöglicht zwischen PSK und EAP zu wählen. 