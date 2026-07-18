---
title: '简历'
date: 2023-10-24
type: landing

design:
  spacing: '5rem'

# 注意：`username` 对应 `data/authors/` 中的用户数据文件

sections:
  - block: markdown
    content:
      title: 个人简历
      text: |-
        [📄 下载简历（PDF）](https://thingsc.github.io/youhao-HKUST-CV/uploads/youhao-hu-cv-zh.pdf)
    design:
      columns: '1'
  - block: resume-experience
    content:
      username: me
    design:
      date_format: '2006年01月'
      is_education_first: true
  - block: resume-skills
    content:
      title: 技能
      username: me
  - block: resume-awards
    content:
      title: 获奖
      username: me
  - block: resume-languages
    content:
      title: 语言
      username: me
---
