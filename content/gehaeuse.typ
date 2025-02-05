#let TODO(body, color: yellow, width: 100%, breakable: true) = {
  block(
    width: width,
    radius: 3pt,
    stroke: 0.5pt,
    fill: color,
    inset: 10pt,
    breakable: breakable,
  )[
    #body
  ]
}


== Gehäuse
_Jannis Gröger_ 

\
Das Gehäuse des Low Power Raum Displays der ersten Version wurde für dieses Projekt noch einmal vollständig überarbeitet, da einige Probleme auftraten und in der Hardware wie auch bei der Bedienung des Displays Änderungen vorgenommen wurden, auf die das Gehäuse angepasst werden musste. Das Gehäuse wurde mit Hilfe der Software Autodesk Fusion 360 CAD-modelliert.


=== Teile des Gehäuses 
\
Das Gehäuse an sich unterteilt sich wie auch die erste Version in drei Hauptbestandteile: 
- Front 
- Platinenhalterung
- Rückseite 

Zusätzlich dazu gibt es noch ein entnehmbares Akkupack. Die Front und die Platinenhalterung werden miteinander verschraubt, um das Displaymodell zu befestigen, und bilden somit eine feste Einheit. Um das Gehäuse einfacher öffnen zu können, wurde sich zudem entschieden, die gesamte Elektronik des Gerätes auf dieser Einheit anzubringen, sodass die Rückseite des Gehäuses ohne Probleme abgenommen werden kann.


=== Platinenhalterung 
\
Die Platinenhalterung bietet Befestigung des Mainboards, sowie der Platine des Displaymodells und der Verbindung zum Akkupack. In der neuen Version wurde eine komplett neue Hauptplatine entwickelt, die nicht nur größer ist, sondern im Gegensatz zur alten Variante auch mit Schraubenlöchern versehen wurde, sodass das Mainboard nun nicht mehr gesteckt sondern verschraubt wird. Die Verbindungsplatine zwischen Mainboard und Displaymodell besitzt jedoch keine Schraubenlöcher und wird deshalb durch das Einschieben in zwei Nuten befestigt. @platinenhalterung zeigt das CAD-Modell der entwickelten Platinenhalterung mit den vier Schraublöchern für das Mainboard (1), dem Einschub für die Displayplatine (2) und einer Halterung für die Verbindung mit dem Akkupack.

\
#figure(
  image("../figures/platinenhalterung.png"),
  caption:[Das CAD-Modell der entwickelten Platinenhalterung.]
)<platinenhalterung>


=== Front
\
In der Front sind das Displaymodell selbst und das Daughterboard angebracht. Die Nebenplatine stellt dem Benutzer vier Knöpfe an der Front zur Verfügung und wurde mit einem Montageloch versehen, sodass es einseitig verschraubt werden kann. Zusätzlich liegt es in einer Kantennut und wird von oben von einer kleinen, verschraubten Halterung fixiert. Die Benutzerknöpfe werden jeweils mit einer Knopfabdeckung bedeckt, die zwischen Daughterboard und Front liegt, sodass die Knöpfe von vorne bedient werden können. Das Displaymodell liegt in einer Vertiefung und wird von hinten durch die mit der Front verschraubten Platinenhalterung fixiert. Die Front selbst wird mit acht Schrauben mit der Rückseite verbunden. @front zeigt das CAD-Modell der Front sowie dem Befestigungsteil der Nebenplatine. 

\
#figure(
  image("../figures/front.png"),
  caption:[Das CAD-Modell der Front.]
)<front>

=== Rückseite
\
Die Rückseite des Gehäuses ist enthält eine Öffnung zum Einsetzen des Akkupacks sowie Ausschnitte, um den SD-Kartenslot der Hauptplatine, den USB-C-Port und den Reset-Knopf des Mikrocontrollers zugänglich zu machen. Zusätzlich sind doch Langlöcher eingefügt, um das Gerät im Hoch- sowie im Querformat an der Wand zu befestigen. Das Gerät steht zudem auch von selbst auf zwei Kanten, sodass eine Wandbefestigung nicht notwendig ist und das Display auch Mobil eingesetzt werden kann. @rückseite zeigt das CAD-Modell des Gehäuses.

\
#figure(
  image("../figures/rueckseite.png"),
  caption:[Das CAD-Modell der Gehäuserückseite.]
)<rückseite>

=== Akkupack 
\
Um das Wechseln und Laden des Akkus deutlich benutzerfreundlicher zu gestalten, wurde in dieser Version ein Akkupack entwickelt, das neben den beiden Akkuzellen auch das Battery Management System enthält. Zur Verbindung mit der Hauptplatine wird auf Pogo Pins gesetzt, die mit Hilfe von Magneten und einer asymmetrischen Bauform eine polrichtige Verbindung herstellt ohne einen Steckkontakt zu nutzen. Dadurch kann das Akkupack einfach in das Gehäuse eingeschoben werden und zum Laden oder beim Austauschen leicht wieder entfernt werden. @akkupackoffen zeigt das CAD-Modell eines aufgeklappten Akkupacks, @akkupackzu zeigt das eines geschlossenen. 


#figure(
  image("../figures/akkupackoffen.png", width: 70%),
  caption:[CAD-Modell eines offenen Akkupacks.]
)<akkupackoffen>

#figure(
  image("../figures/akkupackzu.png",width: 70%),
  caption:[CAD-Modell eines geschlossenen Akkupacks.]
)<akkupackzu>