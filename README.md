# Youhao Hu · Academic Homepage

胡友豪的中英双语学术个人网站，基于 [Hugo](https://gohugo.io/) + [HugoBlox](https://hugoblox.com/) 构建，部署于 GitHub Pages。

- 🌐 English: https://thingsc.github.io/youhao-HKUST-CV/
- 🌐 中文: https://thingsc.github.io/youhao-HKUST-CV/zh/

## 快速开始

```bash
pnpm install   # 首次：安装 Tailwind / Pagefind 依赖
pnpm dev       # 本地预览 → http://localhost:1313/ （/zh/ 为中文站）
./deploy.sh    # 一键构建并发布到 GitHub Pages
```

## 内容位置

| 内容 | 英文 | 中文 |
| --- | --- | --- |
| 个人简介 / 教育 / 经历 / 奖项 | `data/authors/me.yaml` | `data/zh/authors/me.yaml` |
| 论文（36 篇） | `content/en/publications/` | `content/zh/publications/` |
| 项目（4 个） | `content/en/projects/` | `content/zh/projects/` |
| 主页 / CV 页 | `content/en/` | `content/zh/` |
| CV PDF | `static/uploads/youhao-hu-cv.pdf` | `static/uploads/youhao-hu-cv-zh.pdf` |

## 文档

详见 [`docs/`](docs/README.md)：

- [项目架构](docs/architecture.md) — 技术栈、目录结构、双语机制
- [内容维护指南](docs/content-editing.md) — 加论文/项目、改简介、换照片
- [本地预览与部署](docs/preview-and-deploy.md) — 预览、一键发布、Actions 自动部署、常见问题
