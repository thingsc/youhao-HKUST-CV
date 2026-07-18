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
        about: ''
        education: ''
        interests: ''
    design:
      background:
        gradient_mesh:
          enable: true
      name:
        size: md
      avatar:
        size: medium
        shape: circle
  - block: markdown
    content:
      title: '📚 研究方向'
      subtitle: ''
      text: |-
        在博士期间，我长期从事无线电机系统、高效率无线电能传输系统及先进控制算法研究，研究内容涵盖系统建模、控制器设计、嵌入式实现、硬件开发与实验验证等完整研发流程。相关成果发表于 IEEE Transactions on Power Electronics、IEEE Transactions on Vehicular Technology 等国际期刊，并在无线电机系统、动态无线电能传输及智能控制等方向积累了较为丰富的研究与工程实践经验。

        熟练使用 MATLAB/Simulink、Python 和 C 语言开展算法开发与工程实现，具备 MATLAB/Simulink 自动代码生成、实时控制系统开发以及嵌入式平台部署经验。能够独立完成从理论建模、控制算法设计到样机开发、系统集成和实验验证的全过程研发工作，兼具理论研究能力与工程落地能力。
    design:
      columns: '1'
  - block: collection
    id: papers
    content:
      title: 精选论文
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
