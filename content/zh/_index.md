---
# 主页标题留空则使用站点标题
title: ''
summary: ''
date: 2022-10-24
type: landing

sections:
  - block: resume-biography-3
    content:
      # 选择要展示的用户档案（对应 `data/authors/` 中的文件名）
      username: me
      text: ''
      # 在简介下方显示按钮（可选）
      button:
        text: 下载简历
        url: https://thingsc.github.io/youhao-HKUST-CV/uploads/youhao-hu-cv-zh.pdf
      headings:
        about: '关于我'
        education: ''
        interests: '研究方向'
    design:
      background:
        gradient_mesh:
          enable: true
      name:
        size: md
      avatar:
        size: medium
        shape: circle
  - block: collection
    id: papers
    content:
      title: 精选论文
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
      title: 近期论文
      text: ''
      filters:
        folders:
          - publications
        exclude_featured: false
    design:
      view: citation
---
