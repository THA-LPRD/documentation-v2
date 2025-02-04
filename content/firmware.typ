== Firmware

Die erste Implementierung unseres Firmware basierte auf PlatformIO mit dem Arduino-Framework, was für die Prototypphase ausreichend war. Mit wachsendem Projektumfang wurden jedoch mehrere Einschränkungen deutlich, die eine grundlegende Überarbeitung der Architektur erforderten. Ein wesentliches Problem war die begrenzte Arduino-Stack-Größe, die für unsere erweiterten Anforderungen nicht ausreichte und zu Workarounds führte, die die Codebasis unnötig verkomplizierten. Die eingeschränkte Kontrolle über Systemressourcen und Initialisierungsprozesse erschwerte zudem die Implementierung neuer Funktionen und die Wartung der Codequalität.

Sicherheitsaspekte waren ein weiterer entscheidender Faktor für den Wechsel des Frameworks. Die WiFi-Implementierung von Arduino zeigte problematisches Verhalten, beispielsweise durch unbeabsichtigtes Starten im ungesicherten AP-Modus. Diese Sicherheitslücken ließen sich innerhalb der Arduino-Grenzen nicht angemessen beheben. Zusätzlich traten Stabilitätsprobleme auf, bei denen das System nach kurzer Betriebszeit nicht mehr reagierte und neu gestartet werden musste. Die Abstraktionsschicht von Arduino erschwerte die Analyse dieser Probleme erheblich.

Die Migration zu ESP-IDF wurde bis auf eine verbleibende Arduino-Bibliothek vollständig durchgeführt. Diese Umstellung ermöglicht uns nun präzise Kontrolle über Systeminitialisierung, Ressourcenverwaltung und Task-Management. Gleichzeitig verbessert die höhere Systemtransparenz unsere Debugging-Möglichkeiten. Diese Anpassungen haben die früheren Stabilitäts- und Sicherheitsprobleme effektiv behoben.

Das neue Logging-System stellt eine wesentliche Verbesserung dar. Statt einer Eigenentwicklung nutzen wir jetzt spdlog, eine etablierte Logging-Bibliothek für größere Projekte. Diese bietet Funktionen wie rotierendes Logging, Thread-Sicherheit und anpassbare Log-Ziele. Einige Features wie HTTP-basierte Live-Logs sind für spätere Implementierung vorgesehen, wobei die technische Basis bereits geschaffen wurde.

Das WiFi-Management wurde komplett überarbeitet und verfügt nun über einen dedizierten Management-Task für Verbindungshandling mit Retry-Mechanismus. Das System führt im Station-Modus automatisch NTP-Synchronisation durch und ermöglicht vollständige Kontrolle über AP/Station-Übergänge. Dies behebt die früheren Sicherheitslücken und erhöht die Zuverlässigkeit der Netzwerkkommunikation.

Die Konfigurationsverwaltung wurde auf ein JSON-basiertes System umgestellt. Standard-Konfigurationen werden zur Kompilierzeit eingebettet, Laufzeit-Änderungen im Flash-Speicher gesichert. Dies verbessert die Wartbarkeit und Lesbarkeit des Konfigurationscodes deutlich.

Der Display-Treiber profitiert vom Wechsel von pngdec zu libspng. Der ursprüngliche Decoder erforderte umfangreiche Makros und spezielle Include-Behandlung. Die libspng-Implementierung optimiert die Speichernutzung und vermeidet überflüssige Farbraum-Konvertierungen. Die direkte Umwandlung in passende Farbräume steigert die Präzision der Palette-Konvertierung.

Die architektonischen Verbesserungen schaffen ein besser wartbares und testbares Gesamtsystem. Reduzierte globale Zustandsabhängigkeiten und verbesserte Komponentenisolierung erleichtern Debugging und Feature-Implementierung. Diese Optimierungen bilden zusammen mit dem erweiterten Logging eine solide Basis für die weitere Entwicklung. Durch diese Überarbeitung hat sich das Projekt von einem Prototyp zu einem produktionsreifen System mit verbesserter Stabilität, Sicherheit und Zuverlässigkeit entwickelt.