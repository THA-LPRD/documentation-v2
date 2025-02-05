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
  image("../figures/MCU-Website-Home.png"),
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
  image("../figures/MCU-Website-Upload-PNG.png"),
  caption: [Bereich für den PNG-Direktupload]
)

So laden Sie eine PNG-Datei direkt hoch:
1. Wählen Sie "PNG Upload"
2. Klicken Sie auf die Uploadfläche und wählen Sie Ihre PNG-Datei aus
3. Bestätigen Sie mit "Upload", um das Bild auf dem Display anzuzeigen

==== HTML zu PNG Konvertierung
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Upload-HTML2PNG.png"),
  caption: [HTML-Editor mit Vorschaufunktion]
)

Wenn Sie eine individuelle Anzeige mittels HTML erstellen möchten:
1. Geben Sie Ihren HTML-Code in den Editor ein
2. Überprüfen Sie das Ergebnis in der Vorschau
3. Klicken Sie auf "Upload", um die Anzeige auf das Display zu übertragen

==== Template Editor
[Platzhalter - Dokumentation folgt]

=== Konfigurationsmöglichkeiten
_Ahmet Emirhan Göktaş_

Die Einstellungen gliedern sich in drei Bereiche:

==== Grundeinstellungen
_Ahmet Emirhan Göktaş_

#figure(
  image("../figures/MCU-Website-Settings-DeviceConf.png"),
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
  image("../figures/MCU-Website-Settings-HTTP.png"),
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
  image("../figures/MCU-Website-Settings-Advanced.png"),
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