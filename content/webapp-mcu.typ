== Webanwendung auf MCU
_Ahmet Emirhan Göktaş_

Die Weboberfläche, die als Konfigurationsportal des Geräts dient, wurde umfassend modernisiert. Dieser Abschnitt beschreibt die Verbesserungen unserer neuen Next.js-basierten Implementierung.

=== Einschränkungen der vorherigen Implementierung
_Ahmet Emirhan Göktaş_

Die ursprüngliche Weboberfläche bestand aus einfachen HTML- und JavaScript-Dateien. Dies führte zu einer rudimentären und schwer navigierbaren Benutzererfahrung, die weder modernen Webstandards noch den Benutzererwartungen entsprach.

=== Framework-Migration
_Ahmet Emirhan Göktaş_

Wir haben Next.js als Framework für die neue Implementierung gewählt. Diese Migration ermöglicht die Entwicklung einer fortschrittlicheren und professionelleren Benutzeroberfläche und bietet gleichzeitig eine solide Grundlage für zukünftige Erweiterungen, einschließlich geplanter Funktionen wie einem Gerätestatistik-Dashboard und einer Live-Log-Ansicht.

=== Verbesserungen der Benutzeroberfläche
_Ahmet Emirhan Göktaş_

Die neu gestaltete Oberfläche verfügt über eine logische Kategorisierung der Einstellungen und Optionen, wodurch die Navigation für Benutzer intuitiver wird. Das professionelle Erscheinungsbild und die verbesserte Reaktionsfähigkeit entsprechen besser den zeitgemäßen Webstandards und schaffen einen überzeugenden ersten Eindruck bei der Interaktion mit unserem Gerät. Diese Verbesserungen werden zusammen mit der geplanten Ergänzung des Statistik-Dashboards und der Log-Ansicht den Benutzern eine umfassende und intuitive Steuerungsoberfläche bieten.

=== Eingabevalidierung
_Ahmet Emirhan Göktaş_

Wir haben eine umfassende clientseitige Eingabevalidierung implementiert, die zwei wesentliche Vorteile bietet:

- Sofortiges Feedback an die Benutzer, was die Gesamtbenutzererfahrung verbessert
- Reduzierte Verarbeitungslast auf dem ESP32 durch Minimierung der serverseitigen Validierung

=== Upload von Bildern
_Mario Wegmann_

Der Upload an das Displaymodul wurde an das neue Design angepasst und auch in Next.js in TypeScript komplett neu geschrieben. Dabei wurden die verschiedenen Möglichkeiten für den Upload von Bildern visuell voneinander getrennt, um die Übersichtlichkeit zu verbessern. Es ist, wie in Version 1 auch schon, weiterhin möglich, ein fertiges PNG hochzuladen, ein PNG aus HTML-Code oder mit vorhandenen HTML-Vorlagen zu erstellen. Die letzten beiden Varianten bieten beim Bearbeiten des HTML-Codes eine Live-Vorschau des Ergebnisses. 

=== Server Modus
_Mario Wegmann_

Da der Servermodus eine Server-URL benötigt, wurde in der Konfigurationsseite die Eingabemaske um den Parameter erweitert. 

=== Display Konfiguration
_Mario Wegmann_

Damit das neue Display vom Hersteller GoodDisplay verwendet werden kann, wurde die Auswahl des Displays auf der Konfigurationsseite der Weboberfläche erweitert. 

=== WLAN Enterprise Konfiguration
_Mario Wegmann_

Bei WPA2 mit EAP werden logischerweise mehr Parameter benötigt, als mit einem PSK. So braucht das TTLS mit PAP Verfahren eine ID, Username und Zertifikat. Die Konfigurationsseite wurde um die entsprechenden Parameter erweitert und es wurde ermöglicht zwischen PSK und EAP zu wählen. 


=== Architekturvorteile
_Ahmet Emirhan Göktaş_

Die modulare Struktur der Next.js-basierten Architektur bietet mehrere Vorteile:

- Vereinfachte Implementierung neuer Funktionen
- Verbesserte Wartung bestehender Funktionalität
- Solide Grundlage für zukünftige Erweiterungen

Die Modernisierung unserer Weboberfläche stellt einen bedeutenden Fortschritt in der Benutzerinteraktion mit dem Gerät dar, mit einer verbesserten Architektur, die eine kontinuierliche Weiterentwicklung zur Erfüllung zukünftiger Anforderungen gewährleistet und dabei hohe Standards für Benutzerfreundlichkeit und Wartbarkeit aufrechterhält.

#pagebreak()