---
title: 'CV'
date: 2023-10-24
type: landing

design:
  spacing: '5rem'

# Note: `username` refers to the user's data file in `data/authors/`

# Page sections
sections:
  - block: markdown
    content:
      title: Curriculum Vitae
      text: |-
        [📄 Download CV (PDF)](/uploads/youhao-hu-cv.pdf)
    design:
      columns: '1'
  - block: resume-experience
    content:
      username: me
    design:
      # Hugo date format
      date_format: 'January 2006'
      # Education or Experience section first?
      is_education_first: true
  - block: resume-skills
    content:
      title: Skills
      username: me
  - block: resume-awards
    content:
      title: Awards
      username: me
  - block: resume-languages
    content:
      title: Languages
      username: me
---
