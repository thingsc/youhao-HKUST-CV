---
title: 'Projects'
date: 2024-05-19
type: landing

# Page sections
sections:
  - block: collection
    content:
      title: Research Highlights
      text: Research projects with published results in leading journals and conferences.
      filters:
        folders:
          - projects
        tags:
          - research-highlight
    design:
      view: article-grid
      columns: 2
      show_date: false
      show_read_time: false
      show_read_more: false
  - block: markdown
    content:
      title: ''
      text: |-
        ---
    design:
      columns: '1'
      spacing:
        padding: [0, 0, 0, 0]
  - block: collection
    content:
      title: Engineering Projects
      text: Hands-on engineering development from prototyping to experimental validation.
      filters:
        folders:
          - projects
        tags:
          - engineering-project
    design:
      view: article-grid
      columns: 2
      show_date: false
      show_read_time: false
      show_read_more: false
---
