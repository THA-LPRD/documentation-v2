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

=== Servermodus
_Mario Wegmann_

Auch der Servermodus wurde in Version 2 komplett neu mit der Espressif-IDF geschrieben. Die bisherige Funktionalität bleibt jedoch gleich. 

=== Treiber für GoodDisplay 7,5 Zoll ePaper
_Mario Wegmann_

Für das neue Display vom Hersteller GoodDisplay wurde in der Firmware entsprechend ein neuer Treiber geschrieben. 

=== WLAN mit WPA 2 Enterprise
_Mario Wegmann_

Neben der bisherigen Möglichkeit, sich mit gewohntem WPA2-WLAN über pre-shared-keys (PSK) zu verbinden, wurde in der neuen Version 2 auch die Möglichkeit eingebaut, eine Verbindung über WPA2 Enterprise, mit dem Extensible Authentication Protocol (EAP) aufzubauen. Dabei wird als Methode TTLS mit PAP unterstützt. So eine Konfiguration wird beispielsweise an der Technischen Hochschule Augsburg (THA) für das eduroam WLAN verwendet. Die Funktionalität wurde dabei sowohl an der THA als auch an der Hochschule Kempten getestet. Ebenso wurden im Rechenzentrum der THA eigenen Eduroam Zugangsdaten für die Prototypen angefragt. 

=== Timeout im Standalone- und Netzwerkmodus
_Mario Wegmann_

Um den unnötigen Akkuverbrauch zu reduzieren, wurde ein 5-Minuten-Timeout im Standalone- und Netzwerkmodus eingebaut. Falls 5 Minuten, nachdem das WLAN-Modul eingeschaltet wurde, noch keine Aktion ausgeführt wurde, schaltet sich das Displaymodul eigenständig ab. Dadurch kann verhindert werden, dass ein unbeabsichtigtes Einschalten des Displaymoduls den kompletten Akku entlädt. 

=== Zusammenfassung
_Ahmet Emirhan Göktaş_

Diese umfassenden architektonischen Verbesserungen haben unser Projekt von einer Implementierung auf Prototypen-Niveau zu einem produktionsreifen System transformiert. Die Reduzierung von globalen Zustandsabhängigkeiten und die verbesserte Komponentenisolierung haben unsere Fähigkeit zur Fehlersuche und Implementierung neuer Funktionen gesteigert. In Kombination mit unseren erweiterten Logging-Fähigkeiten bieten diese Änderungen eine solide Grundlage für die kontinuierliche Entwicklung und Wartung, die verbesserte Stabilität, Sicherheit und Zuverlässigkeit gewährleistet.

#pagebreak()