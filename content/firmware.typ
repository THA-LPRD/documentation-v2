== Firmware
_Ahmet Emirhan Göktaş_

Die erste Implementierung unseres Firmware basierte auf PlatformIO mit dem Arduino-Framework, was für die Prototypphase ausreichend war. Mit der Erweiterung des Projektumfangs traten jedoch mehrere kritische Einschränkungen auf, die eine Migration zum ESP-IDF-Framework erforderlich machten.

Die folgenden Abschnitte beschreiben die wichtigsten architektonischen Änderungen und Verbesserungen, die während dieser Migration umgesetzt wurden.

=== Systemkontrolle und Ressourcenverwaltung
_Ahmet Emirhan Göktaş_

Das Arduino-Framework zeigte erhebliche Einschränkungen, darunter eine unzureichende Stack-Größe für unsere wachsenden Anforderungen, die verschiedene Workarounds erforderlich machte und unnötige Komplexität in der Codebasis verursachte. Die Migration zu ESP-IDF ermöglicht nun eine präzise Kontrolle über Systeminitialisierung, Ressourcenzuweisung und Task-Management. Mit nur noch einer verbleibenden Arduino-abhängigen Bibliothek hat dieser Übergang durch bessere Systemtransparenz unsere Debugging-Möglichkeiten deutlich verbessert.

=== Sicherheit und Stabilität
_Ahmet Emirhan Göktaş_

Die WiFi-Implementierung des Arduino-Frameworks wies bedenkliche Sicherheitslücken auf, wie beispielsweise das unerwartete Öffnen im ungeschützten AP-Modus. Zusätzlich führten Stabilitätsprobleme dazu, dass das System nach kurzer Betriebszeit nicht mehr reagierte und Neustarts erforderlich waren. Die Ursachenanalyse dieser Probleme wurde durch Arduinos Abstraktionsschicht erheblich erschwert. Die Migration zu ESP-IDF hat diese Sicherheits- und Stabilitätsprobleme direkt adressiert.

=== Logging-System
_Ahmet Emirhan Göktaş_

Wir haben spdlog integriert, eine robuste Logging-Bibliothek, die in großen Projekten weit verbreitet ist, und damit unsere bisherige eigene Logging-Lösung ersetzt. Diese Integration bietet erweiterte Funktionen wie rotierende Dateiunterstützung und Thread-Sicherheit. Während einige Funktionen, wie HTTP-übertragene Live-Logs, noch auf ihre Implementierung warten, ist das Framework nun darauf vorbereitet, diese Fähigkeiten ohne größere architektonische Änderungen zu ergänzen.

=== WiFi-Management
_Ahmet Emirhan Göktaş_

Das WiFi-Management-System wurde vollständig neu gestaltet und verfügt nun über einen speziellen Management-Task, der Verbindungen mit mehreren Wiederholungsversuchen verwaltet. Das neue System initiiert automatisch die NTP-Synchronisation im Station-Modus und bietet vollständige Kontrolle über AP/Station-Modus-Übergänge. Diese Verbesserungen haben frühere Sicherheitslücken beseitigt und gleichzeitig die Gesamtzuverlässigkeit der Netzwerkkommunikation erhöht.

=== Konfigurationssystem
_Ahmet Emirhan Göktaş_

Das Konfigurationssystem wurde grundlegend überarbeitet und der bisherige komplexe Verwaltungsmechanismus durch ein JSON-basiertes System ersetzt. Standardkonfigurationen werden nun zur Kompilierungszeit eingebettet, während Laufzeitänderungen im Flash-Speicher gespeichert werden. Diese Änderung hat sowohl die Wartbarkeit als auch die Lesbarkeit unseres Konfigurationscodes deutlich verbessert und macht ihn zugänglicher für zukünftige Modifikationen und Debugging.

=== Display-Treiber-Optimierung
_Ahmet Emirhan Göktaş_

Der Display-Treiber wurde von pngdec auf libspng aktualisiert, wodurch mehrere Einschränkungen der vorherigen Implementierung behoben wurden. Der ursprüngliche Decoder basierte stark auf Makros und erforderte eine sorgfältige Behandlung von Include-Dateien, wobei sogar Patches für grundlegende Funktionalität notwendig waren. Die neue Implementierung mit libspng hat redundante Farbraumkonversionen eliminiert und die Speichereffizienz durch die Entfernung unnötiger RGB565-Zwischenkonvertierungsschritte verbessert, was potenziell die Genauigkeit unseres Palette-Konvertierungsprozesses steigert.

Diese umfassenden architektonischen Verbesserungen haben unser Projekt von einer Implementierung auf Prototypen-Niveau zu einem produktionsreifen System transformiert. Die Reduzierung von globalen Zustandsabhängigkeiten und die verbesserte Komponentenisolierung haben unsere Fähigkeit zur Fehlersuche und Implementierung neuer Funktionen gesteigert. In Kombination mit unseren erweiterten Logging-Fähigkeiten bieten diese Änderungen eine solide Grundlage für die kontinuierliche Entwicklung und Wartung, die verbesserte Stabilität, Sicherheit und Zuverlässigkeit gewährleistet.