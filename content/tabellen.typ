= Projektübersicht
_Benjamin Klarić_

Das folgende Kapitel bietet Übersicht über die Kosten, wie in @tab:budget ersichtlich, für alle fünf gefertigten Prototypen und eine Auflistung der investierten Stunden aller Projektmitglieder, wie in @tab:stunden einsehbar.


#figure(
  table(
    columns: (auto, auto, auto, auto),
    inset: 4pt,
    align: left,
    table.header( [*Komponente*], [*Einzelpreis $*$ Stückzahl*], [*Lieferung*], [*Summe*]),
    [Display], [- 55,54€ $*$ 5 ], [8,02€], [285,72€],
    [Mikrocontroller:
- erste Bestellung
- zweite Bestellung], [ \
- 8,20€ $*$ 2 \
- 21,80€ $*$ 3], [ \
6,50€ \
5,95€], [94,26€],
    [Reichelt Bestellung:
- JST PH2P Büchsengehäuse, 1x2-polig \
- JST PH CKS Crimpkontakt, Buchse \
- SanDisk Extreme-Speicherkarte 32GB \
- iFixit Polyimid Tape, 12,7 mm, 33 m], [\
- 0,05€ $*$ 14
- 0,03€ $*$ 28
- 8,50€ $*$ 5
- 11,99€ $*$ 1], [5,95€], [61,98€],
    [Akkuteile Bestellung:
- 1S PCB - Keeppower 1S-S530 2MOS
- BAK N21700CD-53E 5300mAh 
- Fuyuang 1S 3,6V - 3,7V Ladegerät
- DC - XH (2 Pin) Adapter / Ladekabel
- Abstandshalter für zwei Zellen 21 mm
- Hiluminband (9 mm breit x 0,15 mm)], [ \
- 2,50€ $*$ 5
- 6,70€ $*$ 5
- 11,99€ $*$ 1
- 1,30€ $*$ 5
- 0,72€ $*$ 5
- 2,60€ $*$ 1], [0,0€], [70,64€],
    [Pogo Pins], [- 22,59€ $*$ 1], [4,62€], [27,21€],
    [Filament], [- 22€ $*$ 2], [0,0€], [44€],
    [Aisler Bestellung:
- Mainboard
- Daughterboard], [ \ 
- 35,08€ $*$ 1
- 21,15€ $*$ 1], [0,0€], [56,23€]
  ), caption: [Projektbudget]
)<tab:budget>

#figure(
  table(
    columns: (auto, auto),
    inset: 10pt,
    align: (left, center),
    table.header( [*Name*], [*Geleistete Stunden*]),
    [Ahmet Emirhan Göktaş], [220 h],
    [Benjamin Klarić], [168 h],
    [Jannis Gröger], [110 h],
    [Mario Wegmann], [168 h]
  ), caption: [Geleistete Stunden pro Person]
)<tab:stunden>

#pagebreak()