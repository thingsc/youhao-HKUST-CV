#!/usr/bin/env bash
# 一键部署：构建网站并发布到 GitHub Pages（gh-pages 分支）
# 用法：修改内容后运行 ./deploy.sh
set -e
cd "$(dirname "$0")"

echo "==> 构建站点..."
hugo --minify
pnpm exec pagefind --site public

echo "==> 发布到 gh-pages 分支..."
cd public
git add -A
if git -c user.name="thingsc" -c user.email="thingsc@users.noreply.github.com" \
    commit -qm "Deploy: $(date '+%Y-%m-%d %H:%M')"; then
  git push -q origin gh-pages
  echo "==> 已发布：https://thingsc.github.io/youhao-HKUST-CV/ （约 1 分钟后生效）"
else
  echo "==> 内容无变化，跳过发布"
fi
