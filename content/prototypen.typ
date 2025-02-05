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

= Prototypenfertigung
_Jannis Gröger_

\
Die Prototypenfertigung in diesem Projekt bestand hauptsächlich aus dem Bestücken der Platinen, dem Verlöten der Akkupacks und dem 3D-Drucken der Gehäuse. 

== Platinenbestückung und Akkupacks
\
Zum Bestücken der Platinen wurde zum einen eine Pick-and-Place-Maschine in einem Elektrotechnik-Labor der Hochschule genutzt, um die kleineren Bauteile auf der Platine zu platzieren. Die Größeren wurden später von Hand auf die Platine gesetzt und verlötet. 

\
#figure(
  image("../figures/pickandplace.jpg", height: 50%),
  caption:[Die Pick-and-Place-Maschine im Labor der Hochschule.]
)<pickandplace>
\
Zum Verlöten der kleineren Bauteile wurde ein Dampfphasenlötofen genutzt, nachdem die Platine vor dem Platzieren der Bauteile mit einer Lötpaste bestrichen wurde. Per Hand wurde ebenso das Battery Management System der Akkupacks verlötet. Die beiden Akkuzellen wurden mit Hilfe eines Punktschweißgeräts verschweißt und dann in die gedruckte Hülle eingesetzt.  

\
#figure(
  image("../figures/loetofen.jpg", height: 50%),
  caption:[Eine Platine im Dampfphasenlötofen der Hochschule.]
)<loetofen>
\

== Gehäusefertigung 
\
Um die Bestandteile des Gehäuses und Hülle der Akkupacks zu fertigen wurden 3D-Ducker der Firma Ultimaker genutzt, welche von der Hochschule im Fabrication Laboratory bereitgestellt werden. Die Drucker arbeiten nach dem sogenannten Fused Deposition Modelling Verfahren und es wurde ein schwarzes Filament aus Polyactid verwendet. Es wurden mehrere Versionen des Gehäuses gedruckt, um Probleme zu beheben und das Design auf die Einstellungen des Druckers anzupassen. 

\
#figure(
  image("../figures/3ddruck.jpg"),
  caption:[Fertigen der Front und der Platinenhalterung auf einem Ultimaker S5.]
)<3ddruck>

\
Zum Schluss wurden die einzelnen Bestandteile des Geräts verschraubt, per Kabel verbunden und so insgesamt fünf Prototypen hergestellt, @version2 zeigt einen davon. 

#TODO([richtiges Bild einfügen])

#figure(
  image("../figures/3ddruck.jpg"),
  caption:[Prototyp der Version 2.]
)<version2>