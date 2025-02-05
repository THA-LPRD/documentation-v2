== Hardware
=== Weiterentwicklungen im PCB-Layout
_Benjamin Klarić_

In Version 2 wurde das PCB-Design komplett überarbeitet, wobei nur wenige Elemente unverändert geblieben sind. Das Design bleibt ein Zwei-Lagen-Board, ist jedoch deutlich komplexer geworden und auf zwei separate PCBs aufgeteilt: Mainboard und Daughterboard.

Das Daughterboard enthält die Frontknöpfe, deren Entprellungsschaltungen sowie den Verbindungsstecker zur Verbindung mit dem Mainboard.

Das Mainboard hingegen umfasst den Rest der Schaltung: die Verbindung zum ePaper-Display mit der dazugehörigen Booster-Schaltung, falls das Display mit 5V angesteuert werden muss, sowie eine Erweiterung in Form eines MicroSD-Kartenadapters.

Zudem wurde ein neuer Mikrocontroller verwendet: der Adafruit ESP32-S3 Feather mit 4 MB Flash und 2 MB PSRAM.

Die Gründe für die Änderungen und Erweiterungen werden in den folgenden Unterkapiteln erläutert.

==== Adafruit ESP32-S3 Feather Mikrocontroller
_Benjamin Klarić_

Im Vergleich zum Mikrocontroller aus Version 1 hat der Adafruit ESP32-S3 Feather zwar etwas weniger Speicher (4 MB & 2 MB im Vergleich zu 8 MB & 8 MB), verfügt jedoch über deutlich mehr GPIO-Pins (20 statt 11). Der kleinere Speicher wurde hier nicht als Nachteil betrachtet, da die Einführung einer MicroSD-Karte als zusätzliche Speicheroption diesen Nachteil ausgleicht.

Die höhere Anzahl an GPIO-Pins ermöglicht die Integration des bereits erwähnten MicroSD-Adapters, die Verwendung zusätzlicher Knöpfen, wodurch die Bedienung des Display-Moduls flexibler wird, sowie den Einsatz des integrierten Battery-Monitoring-Chips zur Akkuüberwachung. Trotz der erweiterten Ausstattung bleibt der Mikrocontroller weiterhin energieeffizient.

Der Adafruit ESP32-S3 Feather Mikrocontroller nutzt den MAX17048-Chip, um die Akkuspannung und den Ladezustand (State of Charge) aktiv zu überwachen. Der Battery-Monitoring-Chip verwendet den ModelGauge-Algorithmus, der durch die interne Architektur des Chips in der Lage ist, das nichtlineare dynamische Verhalten des Akkus zu berücksichtigen. Dabei werden auch die Impedanz sowie die langsame Reaktionsgeschwindigkeit der chemischen Prozesse im Akku einbezogen. Dies ermöglicht es dem MAX17048-Chip, die Akkuspannung und den Ladezustand zuverlässig und fehlerfrei zu erfassen. Mit einem äußerst niedrigen Stromverbrauch von 23 µA im aktiven Modus und nur 3 µA im Hibernation-Modus ist der Chip ideal für Low-Power-Anwendungen geeignet @max2016.

Der Stromverbrauch des neuen Moduls bleibt weiterhin in einem sehr niedrigen Bereich - zwischen 100 mA und 160 mA im aktiven Modus und zwischen 21 µA und 25 µA im Deep-Sleep-Modus. Geht man von einem durchschnittlichen Verbrauch von 130 mA im aktiven Modus (was in der Praxis für die meiste Zeit zutrifft) und 23 µA im Deep-Sleep-Modus aus, sowie von einer Wachzeit von 7,5 Minuten - wie in Version 1 -, ergibt sich theoretisch eine Akkulaufzeit von etwa 15-16 Monaten. Dies wäre eine Verbesserung gegenüber Version 1, die eine Laufzeit von etwas mehr als einem Jahr erreichte.

==== Mainboard
_Benjamin Klarić_

Die gesamte Schaltung des Mainboards ist in @fig:mainboard_schaltung dargestellt.

#figure(
  image("/figures/Hardware/Mainboard_Schaltung.png", width: 100%),
  caption: [
    Übersicht der gesamten Mainboard Schaltung
  ],
)<fig:mainboard_schaltung>

\

Die Displayanschlüsse, die Booster-Schaltung sowie die Switch- und Display-Enable-Schaltungen sind unverändert geblieben.

Die vier Knöpfe sind über einen Stecker mit dem Daughterboard verbunden.

Der Reset-Pin mit der dazugehörigen Entprellungsschaltung wird über zwei Dupont-Pins (Reset-Pin und GND) nach außen geführt. Dies ermöglicht es, den Reset-Knopf an einer beliebigen Stelle im Modul zu platzieren, da die Position des integrierten Reset-Knopfs am Mikrocontroller ungünstig ist.

Die $I^2C$-Schaltung wurde im Vergleich zu Version 1 lediglich um zwei Serienwiderstände mit jeweils 33 $ohm$ ergänzt.

Zusätzlich wurden Mounting Holes hinzugefügt.

Die MikroSD-Adapter-Schaltung ist eine neue Erweiterung gegenüber Version 1. Sie ist auf @fig:adapter_schaltung dargestellt.

#figure(
  image("/figures/Hardware/Adapter_Schaltung.png", width: 90%),
  caption: [
    Die MikroSD Adapter Schaltung
  ],
)<fig:adapter_schaltung>

\

Der microSD-Adapter verfügt über eine modulare Funktionalität, die einen Wechsel zwischen zwei Modi ermöglicht. Das Design wurde überarbeitet, um den Wechsel von der 4-Draht-Verbindung (SD-Modus) zur 1-Draht-Verbindung (SPI-Modus) zu ermöglichen, falls mehr GPIO-Pins für andere Zwecke benötigt werden.

Die Pull-ups werden im SD-Modus für die Datenleitungen und die Kommandoleitung benötigt @espressif2024. Der Pull-up-Widerstand am CD-Pin (Card Detect) verhindert, dass die Leitung im undefinierten Zustand (Floating) bleibt, und sorgt stattdessen für ein stabiles Signal. Wenn die SD-Karte eingesteckt ist, wird dieser mechanische Schalter mit Ground verbunden. Daher ist es sinnvoll, einen Pull-Up-Widerstand zu verwenden.

Der Entkopplungskondensator (100 nF) filtert hochfrequentes Rauschen aus der Stromversorgung heraus und dient als lokale Energiequelle für kurze Stromspitzen. Der Bulk-Kondensator (10 µF) funktioniert als größerer Energiespeicher zur Dämpfung niederfrequenter Spannungsschwankungen und stabilisiert die Versorgungsspannung bei längeren Lastwechseln.

Die Kombination beider Kondensatortypen ist effektiv, da der Entkopplungskondensator schnell auf hochfrequente Störungen reagiert, während der Bulk-Kondensator für die längerfristige Spannungsstabilität sorgt. Sie ergänzen sich in ihren jeweiligen Frequenzbereichen und decken dadurch ein breites Frequenzspektrum ab.

Die Widerstände sind mit der $"SD_"V_"CC"$-Leitung verbunden. Dies ist besonders wichtig, da eine direkte Verbindung zur $V_"CC"$-Leitung des Mikrocontrollers eine parasitäre Rückkopplung ins System verursacht wurde.

Das geroutete Mainboard ist in @fig:routed_mainboard dargestellt.

#figure(
  image("/figures/Hardware/Routed_Mainboard.png", width: 100%),
  caption: [
    Geroutetes Mainboard-Layout
  ],
)<fig:routed_mainboard>

\

Die 3D-Ansicht des Mainboards ist in @fig:mainboard zu sehen. Das 3D-Modell des Mikrocontrollers fehlt, da kein passendes Modell gefunden werden konnte.

#figure(
  image("/figures/Hardware/Mainboard.png", width: 100%),
  caption: [
    3D-Ansicht des Mainboards
  ],
)<fig:mainboard>

\

Vielleicht fällt auf, dass beide Stecker über 10 Pins verfügen, obwohl nicht alle verwendet wurden. Das liegt daran, dass diese Stecker hinsichtlich Größe und Funktionalität am besten zu den Anforderungen passen. Deswegen wurde dieser Stecker verwendet, und die nicht genutzten Pins wurden nicht verbunden. Die genutzten Pins wurden auf der Unterseite beschriftet.

==== Daughterboard
_Benjamin Klarić_

Die gesamte Daughterboard-Schaltung ist in @fig:daughterboard_schaltung zu sehen.

#figure(
  image("/figures/Hardware/Daughterboard_Schaltung.png", width: 80%),
  caption: [
    Übersicht der gesamten Daughterboard Schaltung
  ],
)<fig:daughterboard_schaltung>

\

Wie bereits erklärt, enthält das Daughterboard die Frontpanel-Knöpfe für die Benutzerinteraktion. Jeder Knopf verfügt über eine eigene Entprellschaltung, die aus zwei Widerständen und einem Kondensator besteht. Diese Schaltung dient dazu, unerwünschte elektrische Störungen (Prellen) zu unterdrücken. Das Funktionsprinzip sowie die Werte der Komponenten wurden gemäß @wurth2020 berechnet.

Die Knöpfe mit ihren Entprellschaltungen sind in @fig:knoepfe_schaltung sichtbar.

#figure(
  image("/figures/Hardware/Knoepfe_Schaltung.png", width: 100%),
  caption: [
    Entprellungsschaltungen der Knöpfe
  ],
)<fig:knoepfe_schaltung>

\

Das geroutete Daughterboard ist in @fig:routed_daughterboard dargestellt.

#figure(
  image("/figures/Hardware/Routed_Daughterboard.png", width: 100%),
  caption: [
    Geroutetes Daughterboard-Layout
  ],
)<fig:routed_daughterboard>

\

Die 3D-Ansicht des Daughterboards ist in @fig:daughterboard zu sehen.

#figure(
  image("/figures/Hardware/Daughterboard.png", width: 100%),
  caption: [
    3D-Ansicht des Daughterboards
  ],
)<fig:daughterboard>

#pagebreak()