---
title: '项目'
date: 2024-05-19
type: landing

sections:
  - block: collection
    content:
      title: 研究亮点
      text: 在主流期刊与会议上发表成果的研究项目。
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
      title: 工程项目
      text: 从样机开发到实验验证的工程实践项目。
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
