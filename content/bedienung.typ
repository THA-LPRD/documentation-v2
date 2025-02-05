= Bedienungsanleitung

== Serverbetrieb
_Mario Wegmann_

Mehere Displaymodule können auch komfortabel über eine einzige Weboberfläche gesteuert werden, dafür wird die LPRD Webapplication eingesetz. Die Displaymodule verbinden sich im Servermodus mit dem spezifizierten Server und fragen nach das aktuelle Bild an. Falls absehbar ist, wie lange das Bild gültig sein soll, dann gibt der Server dem Displaymodul die Information weiter, wie lange das Displaymodul im Sleep verweilen soll. Falls nicht keine Gültigkeitsdauer absehbar ist, kann das Displaymodul per Knopfdruck, am Displaymodul selber, aufgeweckt werden und somit der Aktualisierungsprozess gestartet werden. Die LPRD Webapplication bietet auch die Möglichkeit Bilder per API Schnittstelle automatisiert erstellen zu lassen, somit können zum Beispiel Raumbelegungsdaten über WebUntis voll automatisch an ein Displaymodul gesendet werden. 

=== Serverinstallation
_Mario Wegmann_

Es wird empfohlen die LPRD Webapplication auf einem Linux Server zu installieren. Benötigt wird auf dem Server unter anderem Node.js und Docker. Zusätzlich empfiehlt es sich vor der Webapplication ein Reverse proxy für HTTPS Verschlüsselung und gegebenenfalls auch Autentifizierungsschutz zu verwenden. Nachdem die Anforderungen installiert wurden kann das [Repository](https://www.github.com/THA-LPRD/web) von der Webapplication auf den Server geklont werden. Die Webapplication verwendet eine PostgreSQL Datebank, welches sich am einfachsten als Docker Container installiert werden kann mit:
\
 `sudo docker run --name lprd-postgres -v pgdata:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=<SicherersDatenbankPasswort> -d postgres`
\
Die Verbindung zur Datenbank muss der Webapplication über die `.env` Datei mit 
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
Bei einer Installation auf dem Debian Betriebssystem kann es notwendig sein die folgenden Pakete zu installieren: 
\
`sudo apt-get install libgbm1 libasound2 libxkbcommon0 libatk-bridge2.0-0 libnss3`
\
Die Vorbereitungen sind somit abgeschlossen und der Developmentserver kann gestartet werden.
\
`npm run dev`
\
Damit wird der Server auf Port 3000 gestartet und kann über einen Reverse proxy freigegeben werden, der Developmentserver ist blockierend und kann über `CTRL+C` beendet werden. 


=== Hinzufügen von Displaymodulen
_Mario Wegmann_

Um ein neues Displaymodul hinzufügen muss das Displaymodul gestartet werden und in der DeviceConfig der Servermodus aktiviert werden. Für den Servermodus wird ein bestehendes WLAN und die Server URL benötigt. Nachdem der Servermodus aktiviert und das Displaymodul neu gestartet wurde, versucht dieses sich an dem Server anzumelden. Zuerst wird geprüft, ob das Displaymodul bei dem Server bereits bekannt ist, falls dies nicht der Fall ist, registriert sich das Displaymodul neu. In @APP-AlleDisplays ist die Übersicht aller bekannten Displaymodule gezeigt. 

#figure(
  image("../figures/APP-AlleDisplays.png"),
  caption: [Die Übersicht über alle verbunden Displaymodule. ]
) <APP-AlleDisplays>

=== Zuweisen von Assets zu Displays
_Mario Wegmann_

Ein Displaymodul kann wie in @APP-DetailDisplays gezeigt ausgewählt werden und neben einem Namen kann auch das anzuzeigende Bild, im weiteren Asset genannt, zugewiesen werden.  

#figure(
  image("../figures/APP-DetailDisplay.png"),
  caption: [Die Detailinformationen über ein Displaymodul. ]
) <APP-DetailDisplays>

=== Erstellen von Assets
_Mario Wegmann_

In der Webapplication sind Assets, wie Hüllen für fertige Bilder zu verstehen. Ein Asset kann genau ein Template haben, welches das Layout des Assets bestimmt und mehere Daten zugewiesen bekommen, die das Template Layout mit Inhalt befüllen. In @APP-AlleAssets ist die Übersicht aller erstellten Assets erkennbar, wird ein Asset ausgewählt, dann öffnet sich die Detailansicht wie in @APP-DetailAsset , in der ein Template und Daten ausgewählt werden können. 

#figure(
  image("../figures/APP-AlleAssets.png"),
  caption: [Die Übersicht über alle verbunden Assets. ]
) <APP-AlleAssets>


#figure(
  image("../figures/APP-DetailAsset.png"),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailAsset>


=== Erstellen von Templates
_Mario Wegmann_

Ein Template kann wie in @APP-DetailTemplate auch aus der Übersicht für alle Templates ausgewählt werden. In dieser Detailansicht kann der Name des Templates und das HTML verändert werden, dabei wird bei jeder Änderung am HTML eine Live Vorschau generiert, damit das Ergebniss gleichzeitig geprüft werden kann. 

#figure(
  image("../figures/APP-DetailTemplate.png"),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailTemplate>


=== Erstellen von Daten
_Mario Wegmann_

Analog zu Templates verhalten sich auch die Daten, wie in @APP-DetailData erkennbar. Anstatt HTML werden hierbei die Daten jedoch als JSON abgespeichdert. Wird ein Datum abgespeichert, werden in der Datenbank alle damit verbundenen Assets automatisch neu generiert. 

#figure(
  image("../figures/APP-DetailData.png"),
  caption: [Die Detailinformationen über ein Asset. ]
) <APP-DetailData>