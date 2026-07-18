# 内容维护指南

改任何内容后：`pnpm dev` 本地预览确认 → `./deploy.sh` 发布。

## 修改个人简介 / 教育经历 / 技能 / 奖项

全部在作者档案数据文件里，不需要碰页面文件：

- 英文：`data/authors/me.yaml`
- 中文：`data/zh/authors/me.yaml`（只写需要中文化的字段，未写的字段沿用英文版）

主页简介区块、CV 页的教育/经历/技能/奖项全部自动从这里渲染。

## 添加一篇论文

1. 在 `content/en/publications/` 下新建目录（建议用 BibTeX key 命名，如 `hu-new-paper-2026`），创建 `index.md`：

```yaml
---
title: "论文标题"
authors: ["me", "Wei Han"]        # 本人一律写 "me"（自动关联到你的档案），其他人写全名
date: "2026-01-01T00:00:00Z"      # 发表年份，月日补 01
publishDate: "2026-01-01T00:00:00Z"
publication_types: ["article-journal"]   # 期刊: article-journal / 会议: paper-conference / 书章节: chapter
publication:
  name: "IEEE Transactions on Power Electronics"   # 期刊/会议全名
  volume: 41        # 可选
  issue: 1          # 可选
abstract: 摘要文本（可选）
featured: true      # 可选：在主页"精选论文"中展示，不需要就删掉这行
hugoblox:
  ids:
    doi: 10.xxxx/xxxxx    # 可选
projects: []
---
```

2. 同目录放 `cite.bib`（该篇的 BibTeX 条目，访客可一键引用）。
3. **同步中文版**：把整个目录复制到 `content/zh/publications/`（论文标题和摘要保持英文，两语言共用相同内容即可）。
4. 有 PDF 全文就把文件放进该目录，并在 front matter 加 `links: [{type: pdf, url: 文件名.pdf}]`。

精选论文（`featured: true`）会显示在首页精选卡片区（数量不限）。建议给精选论文放一张 `featured.png` 封面图（可复用对应项目的配图），并在 front matter 用 `projects: [项目slug]` 关联到项目页，读者可从论文页跳到详细介绍。

删除论文：同时删掉 `en` 和 `zh` 下的对应目录。

## 添加一个项目

1. `content/en/projects/<项目名>/index.md`：

```yaml
---
title: 项目标题
date: 2026-01-01      # 同组内按 date 倒序排列，用它控制显示顺序
summary: 一句话简介（显示在卡片上）
tags:
  - research-highlight   # 分组标签：研究亮点用 research-highlight，工程项目用 engineering-project（中英两版都用英文标签）
  - 其他主题标签
links: []    # 可选：[{type: site, url: https://github.com/...}]
---

项目详细介绍（Markdown，可放图片、公式）。
```

2. 配图命名为 `featured.png`（或 `.jpg`）放进同一目录，作为卡片封面。
3. 中文版：在 `content/zh/projects/<项目名>/` 建对应的中文 `index.md` 并复制配图。

**分组机制**：项目页分「Research Highlights / 研究亮点」和「Engineering Projects / 工程项目」两组，按 front matter 里的分组标签自动归入对应 section。标签必须用英文（`research-highlight` / `engineering-project`），中文标签会导致主题的 tag 查找失败、分组失灵。

## 换头像

替换 `assets/media/authors/me.jpg`（文件名保持 `me.jpg`，或改成 `me.png` 也行——`me.*` 任意图片格式都会被识别）。建议方形、≥400px。

## 换 CV PDF

直接替换文件，保持文件名不变即可，全站链接无需改动：

- 英文 CV → `static/uploads/youhao-hu-cv.pdf`
- 中文 CV → `static/uploads/youhao-hu-cv-zh.pdf`

注意：站内静态文件的链接必须写**完整绝对地址**（如 `https://thingsc.github.io/youhao-HKUST-CV/uploads/xxx.pdf`），不能用 `/uploads/xxx.pdf` 这种根相对路径——本站部署在子路径 `/youhao-HKUST-CV/` 下，根相对路径会被浏览器解析到域名根目录导致 404。

## 改导航菜单

- 英文：`config/_default/menus.en.yaml`
- 中文：`config/_default/menus.zh.yaml`

`weight` 控制顺序。新增菜单项时确保对应页面在两种语言下都存在。

## 改站名 / 描述 / 配色

- 站名：`config/_default/params.yaml` 的 `hugoblox.identity.name`；中文站名在 `config/_default/languages.yaml` 的 zh 段
- 深浅色默认模式、主题色：`params.yaml` 的 `hugoblox.theme` 段
- 访客手动切换深浅色/主题色的按钮默认已开启

## 注意事项

- **双语同步是手动的**：`en` 和 `zh` 内容互相独立，改了记得改另一边（论文除外，两边保持一致即可）。
- 日期别写成未来太远的时间，Hugo 默认不发布 `date` 在未来的页面。
- 图片别超过几 MB，Hugo 会自动压缩生成多尺寸，但原图过大会拖慢构建。
