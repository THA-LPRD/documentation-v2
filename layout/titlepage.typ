#let titlepage(
  title: "",
  titleGerman: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  university: "",
  bib_path: "",
  logo_path: "",
  description: "",
  startDate: datetime,
  submissionDate: datetime,
) = {

  
  set page(
    margin: (left: 20mm, right: 20mm, top: 30mm, bottom: 30mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )

  set par(leading: 0.5em)

  
  // --- Title Page ---
  v(5mm)
  align(center, image(logo_path, width: 26%))

  v(3mm)
  align(center, text(font: sans-font, 2em, weight: 700, university))

  v(1mm)
  align(center, text(font: sans-font, 1.5em, weight: 100, description))
  
  v(20mm)

  align(center, text(font: sans-font, 2em, weight: 700, title))

  align(center, text(font: sans-font, 2em, weight: 500, titleGerman))

  let entries = ()
   v(45mm)
  entries.push(("Autoren: ", author))
  entries.push(("Betreuer: ", supervisor))
  // Only show advisors if there are any
  if advisors.len() > 0 {
    entries.push(("Advisors: ", advisors.join(", ")))
  }
  entries.push(("Startdatum: ", startDate.display("[day].[month].[year]")))
  entries.push(("Einreichungsdatum: ", submissionDate.display("[day].[month].[year]")))

  v(1cm)
  align(
    center,
    grid(
      columns: 2,
      gutter: 1em,
      align: left,
      ..for (term, desc) in entries {
        (strong(term), desc)
      }
    )
  )
}
