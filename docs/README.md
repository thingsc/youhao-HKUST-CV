# 项目文档

这是 **Youhao Hu（胡友豪）的中英双语学术个人网站**，基于 Hugo + HugoBlox 构建，部署在 GitHub Pages。

- 线上地址（英文）：https://thingsc.github.io/youhao-HKUST-CV/
- 线上地址（中文）：https://thingsc.github.io/youhao-HKUST-CV/zh/

## 30 秒上手

```bash
# 本地预览（首次先 pnpm install）
pnpm dev
# 浏览器打开 http://localhost:1313/      （英文）
# 浏览器打开 http://localhost:1313/zh/   （中文）

# 改完内容后，一键发布
./deploy.sh
```

## 文档目录

| 文档 | 内容 |
| --- | --- |
| [architecture.md](architecture.md) | 项目架构：技术栈、目录结构、双语机制、构建流程 |
| [content-editing.md](content-editing.md) | 内容维护：改简介、加论文、加项目、换照片、换 CV PDF |
| [preview-and-deploy.md](preview-and-deploy.md) | 本地预览与部署原理、常见问题排查 |

## 最常用的三个位置

- **个人简介/教育/经历/奖项** → `data/authors/me.yaml`（英文）、`data/zh/authors/me.yaml`（中文）
- **论文** → `content/en/publications/` 和 `content/zh/publications/`（各 36 篇，一一对应）
- **项目** → `content/en/projects/` 和 `content/zh/projects/`（各 4 个，一一对应）
