#import "/layout/proposal_template.typ": *
#import "/metadata.typ": *
#import "/utils/todo.typ": *
#import "/utils/print_page_break.typ": *

#set document(title: titleEnglish, author: author)

#show: proposal.with(
  title: titleEnglish,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  university: university,
  description: description,
  bib_path: bib_path,
  logo_path: logo_path,
  startDate: startDate,
  submissionDate: submissionDate,
)


#set heading(numbering: none)

#outline(
  indent: 1.5em
)

#pagebreak()

#set heading(numbering: "1.1")

#include "content/einleitung.typ"
#include "content/hardware.typ"
#include "content/firmware.typ"
#include "content/webapp-mcu.typ"
#include "content/webapp-server.typ"
#include "content/gehaeuse.typ"
#pagebreak()
#include "content/bedienung.typ"
#pagebreak()
#set heading(numbering: none)
#heading("Abbildungsverzeichniss")
#outline(
  title: none,
  target: figure.where(kind: image)
)
#pagebreak()

#set heading(numbering: none)
#heading("Tabellenverzeichniss")
#outline(
  title: none,
  target: figure.where(kind: table)
) 
