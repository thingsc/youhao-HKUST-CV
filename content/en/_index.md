---
# Leave the homepage title empty to use the site title
title: ''
summary: ''
date: 2022-10-24
type: landing

sections:
  - block: resume-biography-3
    content:
      # Choose a user profile to display (a folder name within `content/authors/`)
      username: me
      text: ''
      # Show a call-to-action button under your biography? (optional)
      button:
        text: Download CV
        url: https://thingsc.github.io/youhao-HKUST-CV/uploads/youhao-hu-cv.pdf
      headings:
        about: ''
        education: ''
        interests: ''
    design:
      # Use the new Gradient Mesh which automatically adapts to the selected theme colors
      background:
        gradient_mesh:
          enable: true

      # Name heading sizing to accommodate long or short names
      name:
        size: md # Options: xs, sm, md, lg (default), xl

      # Avatar customization
      avatar:
        size: medium # Options: small (150px), medium (200px, default), large (320px), xl (400px), xxl (500px)
        shape: circle # Options: circle (default), square, rounded
  - block: markdown
    content:
      title: '📚 Research'
      subtitle: ''
      text: |-
        My work combines theoretical research with practical engineering development, spanning system modeling, control algorithm design, embedded implementation, hardware prototyping, and experimental validation. Recent research topics include wireless motor systems, high-efficiency WPT systems, adaptive and sliding mode control, and wireless-powered propulsion systems for unmanned vessels.

        I am experienced in MATLAB/Simulink, Python, and C, with strong expertise in automatic code generation, real-time control systems, and embedded deployment. My goal is to bridge advanced control theory and industrial applications by developing efficient, reliable, and intelligent energy conversion systems.
    design:
      columns: '1'
  - block: collection
    id: papers
    content:
      title: Featured Publications
      count: 0
      filters:
        folders:
          - publications
        featured_only: true
    design:
      view: article-grid
      columns: 2
  - block: collection
    content:
      title: Recent Publications
      text: ''
      filters:
        folders:
          - publications
        exclude_featured: false
    design:
      view: citation
---
