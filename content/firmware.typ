== Firmware

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