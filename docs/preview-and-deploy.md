# 本地预览与部署

## 本地预览

```bash
# 仅首次需要：安装 Node 依赖（Tailwind CLI、Pagefind）
pnpm install

# 启动开发服务器
pnpm dev          # 等价于 hugo server --disableFastRender
```

- 英文站：http://localhost:1313/
- 中文站：http://localhost:1313/zh/
- 改内容/配置自动热重载；按 `Ctrl+C` 停止。

环境要求：`hugo`（extended 版）、`pnpm`、`go`（Hugo Modules 拉取主题用，已装好）。

## 部署（当前方式：本地构建 + gh-pages 分支）

### 一键发布

```bash
./deploy.sh
```

脚本做的事：`hugo --minify` 构建 → `pagefind` 生成搜索索引 → 把 `public/` 提交并 push 到 `gh-pages` 分支。约 1 分钟后线上生效。

### 原理

- 仓库 `github.com/thingsc/youhao-HKUST-CV` 有两个分支：
  - `main`：源码（content/、config/、data/ 等）
  - `gh-pages`：构建产物（`public/` 的内容，内含 `.nojekyll`）
- GitHub Pages 设置：Source = *Deploy from a branch*，分支 = `gh-pages` / 根目录。
- `.nojekyll` 文件让 Pages 直接按静态文件发布，不执行 Jekyll 构建——因此**不依赖 GitHub Actions**，账号 Actions 不可用也能发布。
- `public/` 目录内部是一个独立的小 git 仓库（`.gitignore` 已忽略它，不会影响 main 分支），`deploy.sh` 就是在里面提交并强推 `gh-pages`。

### 日常流程

1. 改内容（见 [content-editing.md](content-editing.md)）
2. `pnpm dev` 本地预览确认
3. `./deploy.sh` 发布网站
4. （建议）把源码改动也提交到 main：`git add -A && git commit -m "..." && git push`

## 备选方式：GitHub Actions 自动部署（可选升级）

仓库里已内置 HugoBlox 官方工作流（`.github/workflows/deploy.yml`），可实现"push 到 main 即自动构建发布"，免去本地跑 `deploy.sh`。

启用条件与步骤：

1. 账号 GitHub Actions 可用（2026-07 时该账号曾因 billing 问题被锁定，需先在 [Settings → Billing](https://github.com/settings/billing) 解除）
2. 仓库 Settings → Pages → Source 改为 **GitHub Actions**
3. 仓库 Settings → Actions 设为 *Allow all actions and reusable workflows*
4. push 任意改动到 main 触发首次部署

启用后建议删除 `gh-pages` 分支和 `deploy.sh` 改用 Actions 流程（也可两者并存，互不影响）。

## 常见问题

**Q: `hugo` 命令报错模块下载失败？**
A: 需要 `go` 在 PATH 中；首次构建会下载 HugoBlox 模块到 `~/Library/Caches/hugo_cache`，保持网络畅通。

**Q: 构建后样式全乱？**
A: 多半是 `node_modules` 缺失或 Tailwind CLI 没装上，重新 `pnpm install`。

**Q: push 后线上没更新？**
A: 先确认 `gh-pages` 分支已更新（`git -C public log --oneline -1`），再等 1-2 分钟；仍不更新查仓库 Pages 设置的 Source 是否还是 `gh-pages`。

**Q: Actions 运行全部秒失败？**
A: 检查账号是否被 billing 锁定（Actions 运行记录里的 annotation 会写明）。锁定不影响当前的 gh-pages 发布方式。

**Q: 想换域名/改 baseURL？**
A: 改 `config/_default/hugo.yaml` 的 `baseURL`（注意结尾 `/`），重新 `./deploy.sh`。绑定自定义域名还需在 Pages 设置里填 CNAME 并在 `static/` 放 `CNAME` 文件。
