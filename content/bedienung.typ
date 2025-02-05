= Bedienungsanleitung

== Verwendung der Webapp auf dem E-Paper-Modul
_Ahmet Emirhan Göktaş_

Diese Dokumentation erläutert Ihnen die Nutzung der Weboberfläche des E-Paper-Anzeigemoduls und führt Sie durch die verschiedenen Konfigurationsmöglichkeiten.

=== Zugriff auf die Weboberfläche
_Ahmet Emirhan Göktaş_

Um auf die Weboberfläche zuzugreifen, müssen Sie die IP-Adresse des Moduls in Ihrem Webbrowser eingeben. Die Adresse hängt vom gewählten Betriebsmodus ab:

- Im Standalone-Modus: 192.168.4.1
- Im Netzwerk-Modus: Die vom Router zugewiesene IP-Adresse (auffindbar in Ihren Router-Einstellungen)

Nach Eingabe der IP-Adresse werden Sie zur Authentifizierung aufgefordert. Verwenden Sie hierfür:
- Benutzername: admin
- Passwort: admin

=== Startseite und Gerätestatus
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Home.png", width: 90%),
  caption: [Übersicht des Gerätestatus auf der Startseite]
)

Auf der Startseite finden Sie eine Übersicht wichtiger Geräteinformationen:
- Name Ihres Geräts
- Aktueller Batteriestand
- Eingestellter Betriebsmodus
- Informationen zum Display-Modell
- Aktuelle IP-Adresse

Bitte beachten Sie: Aktuell werden hier noch Beispieldaten angezeigt, da sich diese Funktion in der Implementierungsphase befindet.

=== Bildanzeige und Upload-Optionen
_Ahmet Emirhan Göktaş_

Sie haben drei Möglichkeiten, Bilder auf Ihrem Display anzuzeigen. Diese erreichen Sie über den Menüpunkt "Image Upload":

==== PNG-Direktupload
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Upload-PNG.png", width: 90%),
  caption: [Bereich für den PNG-Direktupload]
)

So laden Sie eine PNG-Datei direkt hoch:
1. Wählen Sie "PNG Upload"
2. Klicken Sie auf die Uploadfläche und wählen Sie Ihre PNG-Datei aus
3. Bestätigen Sie mit "Upload", um das Bild auf dem Display anzuzeigen

==== HTML zu PNG Konvertierung
_Ahmet Emirhan Göktaş_

Sie haben zwei Möglichkeiten, HTML-basierte Anzeigen zu erstellen:

===== Eigener HTML-Code

#figure(
  image("../figures/MCU-Website-Upload-HTML2PNG.png", width: 90%),
  caption: [HTML-Editor mit Vorschaufunktion]
)

1. Wählen Sie "HTML to PNG"
2. Geben Sie Ihren HTML-Code in den Editor ein
3. Überprüfen Sie das Ergebnis in der Vorschau
4. Klicken Sie auf "Upload" zum Übertragen

===== Vorgefertigte Templates

1. Wählen Sie "Template Editor"
2. Wählen Sie eine Vorlage aus der Liste
3. Passen Sie die Inhalte nach Bedarf an
4. Bestätigen Sie mit "Upload"

=== Konfigurationsmöglichkeiten
_Ahmet Emirhan Göktaş_

Die Einstellungen gliedern sich in drei Bereiche:

==== Grundeinstellungen
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Settings-DeviceConf.png", width: 90%),
  caption: [Einstellungen für den Betriebsmodus]
)

Im Bereich "Device Configuration" können Sie:
1. Den Betriebsmodus auswählen (Standalone/Network/Server)
2. Die WLAN-Einstellungen konfigurieren:

  - Im Standalone-Modus: Legen Sie die Zugangsdaten für den Geräte-Access-Point fest
  - Im Netzwerk/Server-Modus: Geben Sie die Zugangsdaten Ihres WLAN-Netzwerks ein

3. Im Server-Modus: Zusätzlich die Server-URL eintragen

==== HTTP-Server-Einstellungen
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Settings-HTTP.png", width: 90%),
  caption: [Konfiguration der HTTP-Server-Parameter]
)

Hier können Sie folgende Parameter anpassen:

- Ihre Zugangsdaten für die Authentifizierung
- Den HTTP-Port
- HTTPS aktivieren oder deaktivieren
- Den HTTPS-Port festlegen
- SSL-Zertifikate und Schlüssel hochladen

==== Erweiterte Einstellungen
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Settings-Advanced.png", width: 90%),
  caption: [Erweiterte Systemeinstellungen]
)

In diesem Bereich können Sie:

- Die Ausführlichkeit der Systemprotokolle für die Fehlersuche einstellen
- Den passenden Treiber für Ihr E-Paper-Display auswählen

=== Neustart des Geräts
_Ahmet Emirhan Göktaş_

Nach Änderung der Einstellungen ist ein Neustart erforderlich:

1. Klicken Sie auf das Neustart-Symbol in der oberen rechten Ecke
2. Warten Sie, bis das Gerät neu gestartet ist
3. Bei unverändertem Betriebsmodus können Sie die Weboberfläche direkt wieder aufrufen
4. Bei geändertem Betriebsmodus müssen Sie sich über die neue IP-Adresse verbinden

Wichtiger Hinweis: Notieren Sie sich vor einem Moduswechsel alle notwendigen Zugangsdaten und IP-Adressen, um nach dem Neustart wieder auf das Gerät zugreifen zu können.

== Serverbetrieb
_Mario Wegmann_

Mehrere Displaymodule können auch komfortabel über eine einzige Weboberfläche gesteuert werden, dafür wird die LPRD Webapplikation eingesetzt. Die Displaymodule verbinden sich im Servermodus mit dem spezifizierten Server und fragen nach dem aktuellen Bild an. Falls absehbar ist, wie lange das Bild gültig sein soll, dann gibt der Server dem Displaymodul die Information weiter, wie lange das Displaymodul im Schlaf verweilen soll. Falls keine Gültigkeitsdauer absehbar ist, kann das Displaymodul per Knopfdruck, am Displaymodul selber, aufgeweckt und somit der Aktualisierungsprozess gestartet werden. Die LPRD Webapplikation bietet auch die Möglichkeit, Bilder per API-Schnittstelle automatisiert erstellen zu lassen, somit können zum Beispiel Raumbelegungsdaten über WebUntis vollautomatisch an ein Displaymodul gesendet werden. 

=== Serverinstallation
_Mario Wegmann_

Es wird empfohlen, die LPRD Webapplikation auf einem Linux-Server zu installieren. Benötigt wird auf dem Server unter anderem Node.js und Docker. Zusätzlich empfiehlt es sich, vor der Webapplikation einen Reverse Proxy für HTTPS-Verschlüsselung und gegebenenfalls auch Authentifizierungsschutz zu verwenden. Nachdem die Anforderungen installiert wurden, kann das [Repository](https://www.github.com/THA-LPRD/web) von der Webapplikation auf den Server geklont werden. Die Webapplikation verwendet eine PostgreSQL Datenbank, welche sich am einfachsten als Docker Container installiert werden kann mit:

\
 `sudo docker run --name lprd-postgres -v pgdata:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=<SicherersDatenbankPasswort> -d postgres`
\
Die Verbindung zur Datenbank muss der Webapplikation über die `.env` Datei mit 
\
`DATABASE_URL="postgresql://<PostgresUser>:<PostgresUserPassword>@<PostgresServerIP/Hostname>:5432"` 
\
bekannt gemacht werden. Danach kann das Datenbankschema über
\
`npx prisma migrate dev --name init`
\
erstellt werden. Für die Konvertierung von HTML zu PNG wird die Library node-html-to-image verwendet. Diese nutzt Puppeteer als Basis für die Konvertierung. Beim direkten Testen auf dem Server kann es vorkommen, dass Puppeteer nicht startet, da es weitere Abhängigkeiten hat. Diese fehlenden Abhängigkeiten können mit dem folgenden Befehl herausgefunden werden:
\
`ldd /home/<USER>/.cache/puppeteer/chrome/linux-<VERSION>/chrome-linux64/chrome | grep not`
\
Bei einer Installation auf dem Debian-Betriebssystem kann es notwendig sein, die folgenden Pakete zu installieren: 
\
`sudo apt-get install libgbm1 libasound2 libxkbcommon0 libatk-bridge2.0-0 libnss3`
\
Die Vorbereitungen sind somit abgeschlossen und der Development-Server kann gestartet werden.
\
`npm run dev`
\
Damit wird der Server auf Port 3000 gestartet und kann über einen Reverse proxy freigegeben werden, der Development-Server ist blockierend und kann über `CTRL+C` beendet werden. 


=== Hinzufügen von Displaymodulen
_Mario Wegmann_

Um ein neues Displaymodul hinzuzufügen, muss das Displaymodul gestartet werden und in der DeviceConfig der Servermodus aktiviert werden. Für den Servermodus wird ein bestehendes WLAN und die Server-URL benötigt. Nachdem der Servermodus aktiviert und das Displaymodul neu gestartet wurde, versucht dieses sich an dem Server anzumelden. Zuerst wird geprüft, ob das Displaymodul bei dem Server bereits bekannt ist, falls dies nicht der Fall ist, registriert sich das Displaymodul neu. In @APP-AlleDisplays ist die Übersicht aller bekannten Displaymodule gezeigt. 

#figure(
  image("../figures/APP-AlleDisplays.png", width: 80%),
  caption: [Die Übersicht über alle verbundenen Displaymodule. ]
) <APP-AlleDisplays>

=== Zuweisen von Assets zu Displays
_Mario Wegmann_

Ein Displaymodul kann wie in @APP-DetailDisplays gezeigt ausgewählt werden und neben einem Namen kann auch das anzuzeigende Bild, im weiteren Asset genannt, zugewiesen werden.  

#figure(
  image("../figures/APP-DetailDisplay.png", width: 80%),
  caption: [Die Detailinformationen über ein Displaymodul. ]
) <APP-DetailDisplays>

=== Erstellen von Assets
_Mario Wegmann_

In der Webapplikation sind Assets, wie Hüllen für fertige Bilder, zu verstehen. Ein Asset kann genau ein Template haben, welches das Layout des Assets bestimmt und mehrere Daten zugewiesen bekommt, die das Template-Layout mit Inhalt befüllen. In @APP-AlleAssets ist die Übersicht aller erstellten Assets erkennbar, wird ein Asset ausgewählt, dann öffnet sich die Detailansicht wie in @APP-DetailAsset, in der ein Template und Daten ausgewählt werden können. 

#figure(
  image("../figures/APP-AlleAssets.png", width: 80%),
  caption: [Die Übersicht über alle verbunden Assets. ]
) <APP-AlleAssets>


#figure(
  image("../figures/APP-DetailAsset.png", width: 70%),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailAsset>


=== Erstellen von Templates
_Mario Wegmann_

Ein Template kann wie in @APP-DetailTemplate auch aus der Übersicht für alle Templates ausgewählt werden. In dieser Detailansicht kann der Name des Templates und das HTML verändert werden, dabei wird bei jeder Änderung am HTML eine live Vorschau generiert, damit das Ergebnis gleichzeitig geprüft werden kann. 

#figure(
  image("../figures/APP-DetailTemplate.png", width: 65%),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailTemplate>


=== Erstellen von Daten
_Mario Wegmann_

Analog zu Templates verhalten sich auch die Daten, wie in @APP-DetailData erkennbar. Anstatt HTML werden hierbei die Daten jedoch als JSON abgespeichert. Wird ein Datum abgespeichert, werden in der Datenbank alle damit verbundenen Assets automatisch neu generiert. 

#figure(
  image("../figures/APP-DetailData.png", width: 80%),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailData>
