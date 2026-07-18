# 项目架构

## 技术栈

| 组件 | 说明 |
| --- | --- |
| Hugo (extended) | 静态网站生成器，本地版本 v0.161.1，`hugo` 命令直接使用 |
| HugoBlox Kit | 学术网站主题/模块（`github.com/HugoBlox/kit`），通过 Hugo Modules 引入，见 `go.mod` |
| Tailwind CSS v4 | 样式系统，通过 `package.json` 的 `@tailwindcss/cli` 提供（Hugo 构建时调用） |
| pnpm | Node 包管理（`pnpm install` 装 Tailwind 和 Pagefind） |
| Pagefind | 全站搜索索引，构建后对 `public/` 生成索引 |
| GitHub Pages | 托管平台，从 `gh-pages` 分支直接发布静态文件 |

## 目录结构（需要关心的）

```
onlineCV_kimi/
├── config/_default/        # 站点配置
│   ├── hugo.yaml           #   主配置：baseURL、语言、分页、分类法等
│   ├── languages.yaml      #   双语定义：en（根路径）+ zh（/zh/）
│   ├── menus.en.yaml       #   英文导航菜单
│   ├── menus.zh.yaml       #   中文导航菜单
│   ├── params.yaml         #   主题参数：站名、配色、深浅色、SEO 等
│   └── module.yaml         #   Hugo 模块引入（HugoBlox）
├── content/
│   ├── en/                 # 英文内容（默认语言，部署在根路径）
│   │   ├── _index.md       #   主页（landing 页，由多个"区块"组成）
│   │   ├── cv.md           #   CV 页（教育/经历/技能/奖项 + PDF 下载）
│   │   ├── projects/       #   项目：每个子目录是一个项目（index.md + featured.png）
│   │   ├── publications/   #   论文：每个子目录是一篇（index.md + cite.bib）
│   │   └── authors/        #   作者 taxonomy（无需改动）
│   └── zh/                 # 中文内容，目录结构与 en 完全镜像（部署在 /zh/）
├── data/
│   ├── authors/me.yaml     # 英文作者档案：姓名、bio、教育、经历、技能、奖项
│   └── zh/authors/me.yaml  # 中文覆盖：只需写与英文不同的字段（深合并）
├── assets/media/
│   └── authors/me.jpg      # 头像（文件名必须是 me.<扩展名>）
├── static/uploads/         # 静态文件原样发布：CV PDF 等
│   ├── youhao-hu-cv.pdf
│   └── youhao-hu-cv-zh.pdf
├── docs/                   # 本文档
├── deploy.sh               # 一键部署脚本
└── hugoblox.yaml           # HugoBlox 元配置（CI 用的 Hugo 版本、部署目标）
```

## 不需要关心的（生成物 / 依赖）

`public/`（构建输出，也是 gh-pages 分支内容）、`resources/`（Hugo 缓存）、`node_modules/`、`go.sum`、`hugo_stats.json`、`netlify.toml`。这些都已被 `.gitignore` 忽略或无需手动编辑。

## 本地模板覆盖（layouts/）

本地有两处对 HugoBlox 模板的**覆盖**（同路径文件优先于模块内文件），主题升级时不会自动跟进；删除对应文件即可还原原版行为：

1. `layouts/_partials/hbx/blocks/resume-biography-3/block.html` — 主页简介区块：
   - 区块顺序：About → Research Interests → Education（原版是 About → Education → Interests）
   - `links` 里带 `popup` 字段的项渲染为点击弹出气泡的按钮（邮箱、电话），支持 `emoji` 字段代替图标，鼠标移出自动隐藏
2. `layouts/_partials/views/article-grid--start.html` — 卡片网格视图：移除了"单卡片时容器限宽 500px"的规则，单卡片与多卡片同宽（如 Engineering Projects 组）

## 双语机制（重要）

1. **内容镜像**：`content/en/` 与 `content/zh/` 目录结构一一对应。英文站部署在根路径 `/`，中文站在 `/zh/`。新增页面时**两边都要建**。
2. **作者数据覆盖**：`data/authors/me.yaml` 是英文完整档案；`data/zh/authors/me.yaml` 只写需要中文化的字段（姓名、职位、bio、教育等），构建时深合并到英文数据上，没写的字段（如邮箱、GitHub 链接）自动沿用英文版。注意：**列表字段（如 `links`、`interests`）是整体替换**，在中文文件里写 `links` 时必须列全。
3. **菜单分语言**：`menus.en.yaml` 和 `menus.zh.yaml` 各自定义导航。
4. **语言切换器**：导航栏右侧的地球图标，由 `params.yaml` 中 `header.language_switcher: true` 开启。
5. **界面文案**（按钮、"阅读更多"等）：HugoBlox 自带 zh 翻译，无需配置。

## 页面组织方式

- **主页** `content/{en,zh}/_index.md`：`type: landing`，由若干 `sections` 区块拼成：
  - `resume-biography-3`：头像 + 姓名 + bio + 教育/兴趣（数据来自 `data/authors/`）
  - `markdown`：自由 Markdown 文本（"研究方向"段）
  - `collection`：自动列出 `publications/` 下的论文（精选 = front matter 里 `featured: true`）
- **论文/项目列表页**：`publications/_index.md`、`projects/_index.md` 控制列表样式（`view: citation` 引用格式 / `article-grid` 卡片网格）。
- **CV 页** `cv.md`：也是 landing 页，用 `resume-experience`、`resume-skills`、`resume-awards`、`resume-languages` 区块，全部渲染自 `data/authors/` —— **改 CV 只需改 data 里的作者档案，不用动 cv.md**。

## 构建流程

```
content/ + data/ + config/ + assets/
        │  hugo --minify        （渲染页面、处理图片、编译 Tailwind）
        ▼
     public/                     （纯静态文件）
        │  pagefind --site public
        ▼
     public/ + 搜索索引
        │  git push 到 gh-pages 分支（deploy.sh 自动完成）
        ▼
  GitHub Pages 直接发布（.nojekyll，无构建步骤）
```
